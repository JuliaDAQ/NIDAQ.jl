using NIDAQ, Test
import LinearAlgebra

@testset "installation" begin
@test typeof(getproperties()) == Dict{String,Tuple{Any,Bool}}
@test haskey(getproperties(), "NIDAQMajorVersion")
end

@testset "device" begin
    global dev = devices()
    if length(dev) == 0
        @info("no data acquisition devices found")
        exit()
    else
        @info("found $(dev).  testing with $(dev[1])")
        dev=dev[1]
        @test typeof(getproperties(dev)) == Dict{String,Tuple{Any,Bool}}
        global props = getproperties(dev)

        @test typeof(getproperties(dev)) == Dict{String,Tuple{Any,Bool}}
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
        @test clear(t) === nothing
        @test !isopen(t)
        @test clear(t) === nothing
        t = analog_input(ch)
        @test close(t) === nothing
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
        @test start(t2) === nothing
        @test clear(t2) === nothing
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
        @test setproperty!(t, dev*"/ai0", "Max", 5.0) === nothing
        @test setproperty!(t, dev*"/ai0", "TermCfg", NIDAQ.Val_RSE) === nothing
        @test getproperties(t, dev*"/ai0")["TermCfg"] == (:Val_RSE, true)
        @test_throws ArgumentError setproperty!(t, dev*"/ai0", "Maxx", 5.0)
        @test start(t) == nothing
        @test length(NIDAQ.read(t, 3)) == 3
        buf1 = Vector{Float64}(undef, 3)
        @test read!(buf1, t) === buf1
        @test all(isfinite, buf1)
        @test_throws ArgumentError read!(Matrix{Float64}(undef, 3, 2), t)
        @test stop(t) == nothing
        @test analog_input(t, dev*"/ai1") == nothing
        @test start(t) == nothing
        @test length(NIDAQ.read(t, 6, UInt32)) == 12
        buf2 = Matrix{Float64}(undef, 6, 2)
        @test read!(buf2, t) === buf2
        @test all(isfinite, buf2)
        buf3 = Matrix{Int16}(undef, 4, 2)
        @test read!(buf3, t) === buf3
        @test_throws ArgumentError read!(Vector{Float64}(undef, 6), t)
        @test_throws ArgumentError read!(Matrix{Float64}(undef, 6, 3), t)
        @test stop(t) == nothing
        @test NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 100.0, NIDAQ.Val_Rising,
                NIDAQ.Val_FiniteSamps, UInt64(10)) == 0
        @test start(t) == nothing
        @test length(NIDAQ.read(t)) == 20
        @test stop(t) == nothing
        @test clear(t) == nothing
    end
end

@testset "analog output" begin
    if length(props["AOPhysicalChans"][1]) == 0
        @info("$dev does not support AOPhysicalChans")
    else
        t = analog_output(dev*"/ao0")
        @test typeof(t) == NIDAQ.AOTask
        @test start(t) == nothing
        @test NIDAQ.write(t, rand(3)) == 3
        @test stop(t) == nothing
        @test analog_output(t, dev*"/ao1") == nothing
        @test start(t) == nothing
        @test NIDAQ.write(t, rand(UInt32,6,2)) == 6
        @test stop(t) == nothing
        @test NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 100.0, NIDAQ.Val_Rising,
                NIDAQ.Val_FiniteSamps, UInt64(10)) == 0
        @test NIDAQ.write(t, rand(UInt32,10,2)) == 10
        @test start(t) == nothing
        @test NIDAQ.WaitUntilTaskDone(t.th,10.0) == 0
        @test stop(t) == nothing
        @test clear(t) == nothing
    end
end


@testset "digital input" begin
    if length(props["DILines"][1]) == 0
        @info("$dev does not support DILines")
    else
        t = digital_input(dev*"/Port0/Line0")
        @test typeof(t) == NIDAQ.DITask
        @test start(t) == nothing
        @test length(NIDAQ.read(t, 3)) == 3
        @test stop(t) == nothing
        @test digital_input(t, dev*"/Port0/Line1") == nothing
        @test start(t) == nothing
        @test length(NIDAQ.read(t, 6)) == 12
        @test stop(t) == nothing
        rslt = Ref{UInt32}(0)
        NIDAQ.DAQmxGetBufInputOnbrdBufSize(t.th, rslt)
        if rslt[] != 0 #If the device supports buffered digital input
            @test NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 100.0, NIDAQ.Val_Rising,
                                        NIDAQ.Val_FiniteSamps, UInt64(10)) == 0
            if first(props["ProductCategory"]) != :Val_MSeriesDAQ # M Series has no digital onboard clock
            @test start(t) == nothing
            @test length(NIDAQ.read(t)) == 20
            @test stop(t) == nothing
            end
            @test clear(t) == nothing
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
        @test start(t) == nothing
        @test NIDAQ.write(t, round.(UInt32, [1,0,1,0,1,0])) == 6
        @test stop(t) == nothing
        @test digital_output(t, dev*"/Port0/Line1") == nothing
        @test start(t) == nothing
        @test NIDAQ.write(t, round.(UInt32, [1 0; 0 0; 1 0; 0 1; 1 1; 0 1])) == 6
        @test stop(t) == nothing
        rslt = Ref{UInt32}(0)
        NIDAQ.DAQmxGetBufOutputOnbrdBufSize(t.th, rslt)
        if rslt[] != 0 #If the device supports buffered digital output
            @test NIDAQ.CfgSampClkTiming(t.th, NIDAQ.str2code(""), 100.0, NIDAQ.Val_Rising,
                                        NIDAQ.Val_FiniteSamps, UInt64(10)) == 0
            if first(props["ProductCategory"]) != :Val_MSeriesDAQ # M Series has no digital onboard clock
                @test NIDAQ.write(t, rand(UInt32,10,2)) == 10
            @test start(t) == nothing
                @test NIDAQ.WaitUntilTaskDone(t.th,10.0) == 0
            @test stop(t) == nothing
            end
            @test clear(t) == nothing
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
        t = count_edges(ch; initial_count=7)
        @test typeof(t) == NIDAQ.CITask
        @test channel_type(t, ch) == (NIDAQ.Val_CI, NIDAQ.Val_CountEdges)
        @test start(t) == nothing
        data = read(t, ch; num_samples=1)
        @test data isa Vector{UInt32}
        @test length(data) == 1
        @test data[1] >= 7
        data = read(t, ch; num_samples=3)
        @test data isa Vector{UInt32}
        @test length(data) == 3
        @test stop(t) == nothing
        @test clear(t) == nothing

        if :Val_Position_AngEncoder in meas_types
            t = quadrature_input(ch)
            @test typeof(t) == NIDAQ.CITask
            @test channel_type(t, ch) == (NIDAQ.Val_CI, NIDAQ.Val_Position_AngEncoder)
            @test clear(t) == nothing
        else
            @info("$dev does not support angular encoder measurements")
        end

        if :Val_TwoEdgeSep in meas_types
            t = line_to_line(ch)
            @test typeof(t) == NIDAQ.CITask
            @test channel_type(t, ch) == (NIDAQ.Val_CI, NIDAQ.Val_TwoEdgeSep)
            @test clear(t) == nothing
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
        @test start(t) == nothing
        @test stop(t) == nothing
        @test clear(t) == nothing
    end
end

