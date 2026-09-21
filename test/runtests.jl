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


@testset "analog input" begin
    if length(props["AIPhysicalChans"][1]) == 0
        @info("$dev does not support AIPhysicalChans")
    else
        t = analog_input(dev*"/ai0")
        @test typeof(getproperties(t)) == Dict{String,Tuple{Any,Bool}}
        @test typeof(getproperties(t,dev*"/ai0")) == Dict{String,Tuple{Any,Bool}}
        @test typeof(t) == NIDAQ.AITask
        @test start(t) == nothing
        @test length(NIDAQ.read(t, 3)) == 3
        @test stop(t) == nothing
        @test analog_input(t, dev*"/ai1") == nothing
        @test start(t) == nothing
        @test length(NIDAQ.read(t, 6, UInt32)) == 12
        @test stop(t) == nothing
        @test NIDAQ.CfgSampClkTiming(t.th, convert(Ref{Int8},Cchar.(b"")), 100.0, NIDAQ.Val_Rising,
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
        @test NIDAQ.CfgSampClkTiming(t.th, convert(Ref{Int8},Cchar.(b"")), 100.0, NIDAQ.Val_Rising,
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
            @test NIDAQ.CfgSampClkTiming(t.th, convert(Ref{Int8},Cchar.(b"")), 100.0, NIDAQ.Val_Rising,
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
            @test NIDAQ.CfgSampClkTiming(t.th, convert(Ref{Int8},Cchar.(b"")), 100.0, NIDAQ.Val_Rising,
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

