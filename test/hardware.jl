@testset "installation" begin
@test typeof(getproperties()) == Dict{String,Tuple{Any,Bool}}
@test haskey(getproperties(), "NIDAQMajorVersion")
@test (@elapsed getproperties()) < 0.5   # the property table is built at load, not per call
end

@testset "device" begin
    global dev = devices()[1]
    @info("found $(devices()).  testing with $dev")
    let
        @test typeof(getproperties(dev)) == Dict{String,Tuple{Any,Bool}}
        global props = getproperties(dev)

        @test typeof(getproperties(dev)) == Dict{String,Tuple{Any,Bool}}
        @test (@elapsed getproperties(dev)) < 2.0   # dominated by USB round trips, not reflection
        @test props["AICouplings"][1] isa Vector{Symbol}
        @test :Val_Bit_CouplingTypes_DC in props["AICouplings"][1]
        @test props["DITrigUsage"][1] isa Vector{Symbol}
        @test typeof(analog_input_channels(dev)) == Vector{String}
        @test typeof(analog_output_channels(dev)) == Vector{String}
        @test typeof(digital_input_channels(dev)) == Vector{String}
        @test typeof(digital_output_channels(dev)) == Vector{String}
        @test typeof(counter_input_channels(dev)) == Vector{String}
        @test typeof(counter_output_channels(dev)) == Vector{String}
        @test typeof(analog_voltage_input_ranges(dev)) == LinearAlgebra.Adjoint{Float64,Array{Float64,2}}
        @test typeof(analog_voltage_output_ranges(dev)) == LinearAlgebra.Adjoint{Float64,Array{Float64,2}}
        @test typeof(analog_current_input_ranges(dev)) == LinearAlgebra.Adjoint{Float64,Array{Float64,2}}
        @test typeof(analog_current_output_ranges(dev)) == LinearAlgebra.Adjoint{Float64,Array{Float64,2}}
        @test (@test_deprecated analog_input_ranges(dev)) == analog_voltage_input_ranges(dev)
        @test (@test_deprecated analog_output_ranges(dev)) == analog_voltage_output_ranges(dev)
    end
end


@testset "task lifecycle" begin
    if length(props["AIPhysicalChans"][1]) == 0
        @info("$dev does not support AIPhysicalChans")
    else
        ch = dev*"/ai0"

        # clear nulls the handle and is idempotent; close is an alias
        t = analog_input(ch)
        @test isopen(t)
        @test isnothing(clear(t))
        @test !isopen(t)
        @test isnothing(clear(t))
        t = analog_input(ch)
        @test isnothing(close(t))
        @test !isopen(t)

        # the do-block form returns the body's value and clears the task,
        # whether or not the body throws
        local inner
        r = analog_input(ch) do t
            inner = t
            start(t)
            length(read(t, 3))
        end
        @test r == 3
        @test !isopen(inner)
        @test_throws ErrorException analog_input(ch) do t
            inner = t
            error("boom")
        end
        @test !isopen(inner)

        # a started task holds the device, so a second task cannot start until
        # the first is cleared.  the finalizer must release it.
        t1 = analog_input(ch)
        start(t1)
        t2 = analog_input(ch)
        @test_throws ErrorException start(t2)
        finalize(t1)
        @test !isopen(t1)
        @test isnothing(start(t2))
        @test isnothing(clear(t2))
    end
end

@testset "analog input" begin
    if length(props["AIPhysicalChans"][1]) == 0
        @info("$dev does not support AIPhysicalChans")
    else
        t = analog_input(dev*"/ai0")
        @test typeof(getproperties(t)) == Dict{String,Tuple{Any,Bool}}
        @test typeof(getproperties(t,dev*"/ai0")) == Dict{String,Tuple{Any,Bool}}
        @test typeof(t) == NIDAQ.AITask
        # querying AI.Max returns the value coerced to the device's ranges, so it
        # does not round-trip on devices with a single range; TermCfg does
        @test isnothing(setproperty!(t, dev*"/ai0", "Max", 5.0))
        @test isnothing(setproperty!(t, dev*"/ai0", "TermCfg", NIDAQ.Val_RSE))
        @test getproperties(t, dev*"/ai0")["TermCfg"] == (:Val_RSE, true)
        @test getproperty(t, dev*"/ai0", "TermCfg") == :Val_RSE
        @test getproperty(t, dev*"/ai0", "Max") isa Float64
        @test_throws ArgumentError setproperty!(t, dev*"/ai0", "Maxx", 5.0)
        @test_throws ArgumentError getproperty(t, dev*"/ai0", "Maxx")

        # acceleration inputs require a range, and IEPE hardware for the rest
        @test_throws ArgumentError analog_input(dev*"/ai0"; type=:acceleration)
        if :Val_Accelerometer in props["AISupportedMeasTypes"][1]
            ta = analog_input(dev*"/ai0"; type=:acceleration, range=[-5.0, 5.0], excitation_current=0.004)
            @test channel_type(ta, dev*"/ai0") == (:Val_AI, :Val_Accelerometer)
            @test isnothing(clear(ta))
            ta = @test_deprecated acceleration_input(dev*"/ai0"; range=[-5.0, 5.0])
            @test typeof(ta) == NIDAQ.AITask
            @test channel_type(ta, dev*"/ai0") == (:Val_AI, :Val_Accelerometer)
            @test isnothing(clear(ta))
        else
            @info("$dev does not support accelerometer measurements")
        end
        @test isnothing(start(t))
        @test length(NIDAQ.read(t, 3)) == 3
        # the return type is inferable and does not depend on the channel count
        @test (@inferred NIDAQ.read(t, 3)) isa Matrix{Float64}
        @test (@inferred NIDAQ.read(t, 3, Int16)) isa Matrix{Int16}
        @test size(NIDAQ.read(t, 3)) == (3, 1)
        @test_throws ArgumentError NIDAQ.read(t, 3, Float32)
        buf1 = Vector{Float64}(undef, 3)
        @test read!(buf1, t) === buf1
        @test all(isfinite, buf1)
        @test_throws ArgumentError read!(Matrix{Float64}(undef, 3, 2), t)
        @test isnothing(stop(t))
        @test isnothing(analog_input(t, dev*"/ai1"; terminal_config=:rse))
        @test getproperty(t, dev*"/ai1", "TermCfg") == :Val_RSE
        @test channel_type(t, dev*"/ai1") == (:Val_AI, :Val_Voltage)
        @test NIDAQ.task_channels(t) == [dev*"/ai0", dev*"/ai1"]
        @test_throws ArgumentError analog_input(dev*"/ai0"; terminal_config=:sideways)
        @test_throws ArgumentError analog_input(dev*"/ai0"; type=:resistance)
        @test isnothing(start(t))
        @test length(NIDAQ.read(t, 6, UInt32)) == 12
        buf2 = Matrix{Float64}(undef, 6, 2)
        @test read!(buf2, t) === buf2
        @test all(isfinite, buf2)
        buf3 = Matrix{Int16}(undef, 4, 2)
        @test read!(buf3, t) === buf3
        @test_throws ArgumentError read!(Vector{Float64}(undef, 6), t)
        @test_throws ArgumentError read!(Matrix{Float64}(undef, 6, 3), t)
        @test isnothing(stop(t))
        @test NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 100.0, NIDAQ.Val_Rising,
                NIDAQ.Val_FiniteSamps, UInt64(10)) == 0
        @test isnothing(start(t))
        @test length(NIDAQ.read(t)) == 20
        @test isnothing(stop(t))
        # a finite task larger than any fixed buffer: read(t) must size the
        # buffer from the task, not guess
        @test NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 5000.0, NIDAQ.Val_Rising,
                NIDAQ.Val_FiniteSamps, UInt64(2000)) == 0
        @test isnothing(start(t))
        @test size(NIDAQ.read(t)) == (2000, 2)
        @test isnothing(stop(t))
        @test isnothing(clear(t))
    end
end

@testset "analog output" begin
    if length(props["AOPhysicalChans"][1]) == 0
        @info("$dev does not support AOPhysicalChans")
    else
        t = analog_output(dev*"/ao0")
        @test typeof(t) == NIDAQ.AOTask
        @test isnothing(start(t))
        @test NIDAQ.write(t, rand(3)) == 3
        @test isnothing(stop(t))
        @test isnothing(analog_output(t, dev*"/ao1"))
        @test isnothing(start(t))
        @test NIDAQ.write(t, rand(UInt32,6,2)) == 6
        @test isnothing(stop(t))
        @test NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 100.0, NIDAQ.Val_Rising,
                NIDAQ.Val_FiniteSamps, UInt64(10)) == 0
        @test NIDAQ.write(t, rand(UInt32,10,2)) == 10
        @test isnothing(start(t))
        @test NIDAQ.WaitUntilTaskDone(t.th,10.0) == 0
        @test isnothing(stop(t))
        @test isnothing(clear(t))
    end
end


@testset "digital input" begin
    if length(props["DILines"][1]) == 0
        @info("$dev does not support DILines")
    else
        t = digital_input(dev*"/Port0/Line0")
        @test typeof(t) == NIDAQ.DITask
        @test channel_type(t, dev*"/Port0/Line0") == (:Val_DI, nothing)
        @test isnothing(start(t))
        @test length(NIDAQ.read(t, 3)) == 3
        @test (@inferred NIDAQ.read(t, 3)) isa Matrix{UInt32}
        @test (@inferred NIDAQ.read(t, 3, UInt8)) isa Matrix{UInt8}
        buf1 = Vector{UInt32}(undef, 3)
        @test read!(buf1, t) === buf1
        @test all(x -> x in (0, 1), buf1)
        @test_throws ArgumentError read!(Matrix{UInt32}(undef, 3, 2), t)
        @test isnothing(stop(t))
        @test isnothing(digital_input(t, dev*"/Port0/Line1"))
        @test isnothing(start(t))
        @test length(NIDAQ.read(t, 6)) == 12
        buf2 = Matrix{UInt32}(undef, 6, 2)
        @test read!(buf2, t) === buf2
        buf3 = Matrix{UInt8}(undef, 4, 2)
        @test read!(buf3, t) === buf3
        @test_throws ArgumentError read!(Vector{UInt32}(undef, 6), t)
        @test_throws ArgumentError read!(Matrix{UInt32}(undef, 6, 3), t)
        @test isnothing(stop(t))
        rslt = Ref{UInt32}(0)
        NIDAQ.DAQmxGetBufInputOnbrdBufSize(t.th, rslt)
        if rslt[] != 0 #If the device supports buffered digital input
            @test NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 100.0, NIDAQ.Val_Rising,
                                        NIDAQ.Val_FiniteSamps, UInt64(10)) == 0
            if first(props["ProductCategory"]) != :Val_MSeriesDAQ # M Series has no digital onboard clock
            @test isnothing(start(t))
            @test length(NIDAQ.read(t)) == 20
            @test isnothing(stop(t))
            end
            @test isnothing(clear(t))
        else
            @info("Device does not support clocked (buffered) digital input")
        end
    end
end

@testset "digital output" begin
    if length(props["DOLines"][1]) == 0
        @info("$dev does not support DOLines")
    else
        t = digital_output(dev*"/Port0/Line0")
        @test typeof(t) == NIDAQ.DOTask
        @test isnothing(start(t))
        @test NIDAQ.write(t, round.(UInt32, [1,0,1,0,1,0])) == 6
        @test isnothing(stop(t))
        @test isnothing(digital_output(t, dev*"/Port0/Line1"))
        @test isnothing(start(t))
        @test NIDAQ.write(t, round.(UInt32, [1 0; 0 0; 1 0; 0 1; 1 1; 0 1])) == 6
        @test isnothing(stop(t))
        rslt = Ref{UInt32}(0)
        NIDAQ.DAQmxGetBufOutputOnbrdBufSize(t.th, rslt)
        if rslt[] != 0 #If the device supports buffered digital output
            @test NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 100.0, NIDAQ.Val_Rising,
                                        NIDAQ.Val_FiniteSamps, UInt64(10)) == 0
            if first(props["ProductCategory"]) != :Val_MSeriesDAQ # M Series has no digital onboard clock
                @test NIDAQ.write(t, rand(UInt32,10,2)) == 10
            @test isnothing(start(t))
                @test NIDAQ.WaitUntilTaskDone(t.th,10.0) == 0
            @test isnothing(stop(t))
            end
            @test isnothing(clear(t))
        else
            @info("Device does not support clocked (buffered) digital output")
        end
    end
end

@testset "counter input" begin
    if isempty(props["CIPhysicalChans"][1][1])
        @info("$dev does not support CIPhysicalChans")
    else
        ch = dev*"/ctr0"
        meas_types = props["CISupportedMeasTypes"][1]

        # count edges: on-demand reads return the running count, which with no
        # signal connected stays at initial_count
        @test_throws ArgumentError count_edges(ch; edge=:sideways)
        @test_throws ArgumentError count_edges(ch; direction=:left)
        # option checks precede the driver call, so these hold whether or not
        # the device supports the measurement
        @test_throws ArgumentError quadrature_input(ch; decoding=:x3)
        @test_throws ArgumentError quadrature_input(ch; z_index_phase=:a_high)
        @test_throws ArgumentError quadrature_input(ch; units=:gradians)
        @test_throws ArgumentError line_to_line(ch; units=:minutes)
        @test_throws ArgumentError generate_pulses(ch; idle_state=:middle)
        t = count_edges(ch; edge=:falling, direction=:up, initial_count=7)
        @test typeof(t) == NIDAQ.CITask
        @test channel_type(t, ch) == (:Val_CI, :Val_CountEdges)
        @test getproperty(t, ch, "CountEdgesActiveEdge") == :Val_Falling
        @test getproperty(t, ch, "CountEdgesInitialCnt") === UInt32(7)
        @test isnothing(clear(t))
        # 6240 is also the id of the SelfCal_Supported attribute; a count must stay a count
        t = count_edges(ch; initial_count=6240)
        @test getproperty(t, ch, "CountEdgesInitialCnt") === UInt32(6240)
        @test isnothing(clear(t))
        t = count_edges(ch; edge=:falling, direction=:up, initial_count=7)
        @test isnothing(start(t))
        data = read(t, 1)
        @test data isa Vector{UInt32}
        @test length(data) == 1
        @test data[1] >= 7
        data = read(t, 3)
        @test data isa Vector{UInt32}
        @test length(data) == 3
        @test length(read(t)) == 1   # an on-demand task yields one sample per read
        @test NIDAQ.task_channels(t) == [ch]
        @test isnothing(stop(t))
        @test isnothing(clear(t))

        if :Val_Position_AngEncoder in meas_types
            t = quadrature_input(ch)
            @test typeof(t) == NIDAQ.CITask
            @test channel_type(t, ch) == (:Val_CI, :Val_Position_AngEncoder)
            @test isnothing(clear(t))
        else
            @info("$dev does not support angular encoder measurements")
        end

        if :Val_TwoEdgeSep in meas_types
            t = line_to_line(ch)
            @test typeof(t) == NIDAQ.CITask
            @test channel_type(t, ch) == (:Val_CI, :Val_TwoEdgeSep)
            @test isnothing(clear(t))
        else
            @info("$dev does not support two-edge separation measurements")
        end
    end
end

@testset "counter output" begin
    if isempty(props["COPhysicalChans"][1][1])
        @info("$dev does not support COPhysicalChans")
    else
        t = generate_pulses(dev*"/ctr0")
        @test typeof(t) == NIDAQ.COTask
        @test NIDAQ.CfgImplicitTiming(t.th, NIDAQ.Val_FiniteSamps, UInt64(10)) == 0
        @test isnothing(start(t))
        @test isnothing(stop(t))
        @test isnothing(clear(t))
    end
end


@testset "shipped wrappers" begin
    # every wrapper must work with the current code.  each is loaded in a
    # fresh process against the installed driver, which works because the C
    # API only grows from one driver version to the next
    smoke = """
        using NIDAQ
        string(NIDAQ.wrapper_version) == ENV["NIDAQ_WRAPPER_VERSION"] ||
            error("loaded the \$(NIDAQ.wrapper_version) wrapper instead")
        d = devices()[1]
        p = getproperties(d)
        length(p) > 50 || error("only \$(length(p)) device properties")
        if !isempty(first(p["AIPhysicalChans"][1]))
            t = analog_input(d*"/ai0:1")
            NIDAQ.catch_error(NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 5000.0,
                    NIDAQ.Val_Rising, NIDAQ.Val_FiniteSamps, UInt64(1000)))
            start(t)
            size(read(t)) == (1000, 2) || error("clocked read returned the wrong shape")
            clear(t)
        end
        """
    for f in filter(startswith("functions_V"), readdir(joinpath(@__DIR__, "..", "src")))
        v = f[length("functions_V")+1:end-3]
        # without the precompile cache, so that the environment variable is honoured
        cmd = addenv(`$(Base.julia_cmd()) --startup-file=no --compiled-modules=no --project=$(Base.active_project()) -e $smoke`,
                     "NIDAQ_WRAPPER_VERSION" => v)
        @testset "$v" begin
            @test success(cmd)
        end
    end
end
