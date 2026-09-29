"""
`count_edges(channel; edge="rising",initial_count=0,direction="up") -> task`

create a NIDAQ counter input channel
"""
function count_edges(channel::String;
        edge::AbstractString="rising", initial_count::Integer=0, direction::AbstractString="up")
    t = CITask()
    if edge ∉ ("rising", "falling")
        error("edge must either be \"rising\" or \"falling\"")
    end
    if direction ∉ ("up", "down")
        error("direction must either be \"up\" or \"down\"")
    end
    catch_error( CreateCICountEdgesChan(t.th,
        str2code(channel),
        str2code(""),
        edge == "rising" ? Val_Rising : Val_Falling,
        UInt32(initial_count),
        direction == "up" ? Val_CountUp : Val_CountDown) )
    t
end

#= broken
function measure_duty_cycle(channel::String;  units::AbstractString="seconds")
    t = CITask()
    if units == "seconds"
        ret = CreateCIPulseChanTime(t.th,
                Ref(str2code(channel),1), Ref(str2code(""),1),
                2.0, 1000.0,
                Val_Seconds)
    elseif units == "ticks"
        ret = CreateCIPulseChanTicks(t.th,
                Ref(str2code(channel),1),
                Ref(str2code(""),1),
                Ref(str2code(""),1),
                2.0, 1000.0)
    else
        error("units must either be \"seconds\" or \"ticks\"")
    end
    catch_error(ret)
    t
end
=#

"""
`quadrature_input(channel; z_enable=true) -> task`

create a NIDAQ counter input channel
"""
function quadrature_input(channel::String; z_enable::Bool=true)
    t = CITask()
    ret = CreateCIAngEncoderChan(t.th,
            str2code(channel),
            str2code(""),
            Val_X4,
            reinterpret(Bool32, UInt32(z_enable)),
            0.0,
            Val_AHighBHigh,
            Val_Ticks,
            UInt32(1), 0.0,
            str2code(""))
    ret==0 || catch_error(ret)
    t
end

"""
`line_to_line(channel; units="seconds",edge1="rising",edge2="rising") -> task`

create a NIDAQ counter input channel
"""
function line_to_line(channel::String;
        units::AbstractString="seconds", edge1::AbstractString="rising", edge2::AbstractString="rising")
    t = CITask()
    if units ∉ ("seconds", "ticks")
        error("units must either be \"seconds\" or \"ticks\"")
    end
    if edge1 ∉ ("rising", "falling")
        error("edge1 must either be \"rising\" or \"falling\"")
    end
    if edge2 ∉ ("rising", "falling")
        error("edge2 must either be \"rising\" or \"falling\"")
    end
    catch_error( CreateCITwoEdgeSepChan(t.th,
            str2code(channel),
            str2code(""),
            1.0, 1000.0, 
            units == "seconds" ? Val_Seconds : Val_Ticks,
            edge1 == "rising" ? Val_Rising : Val_Falling,
            edge2 == "rising" ? Val_Rising : Val_Falling,
            str2code("")) )
    t
end

"""
`generate_pulses(channel; low=2,high=2,delay=0) -> task`

create a NIDAQ counter output channel
"""
function generate_pulses(channel::String; low::T=2, high::T=2, delay::T=0) where T<:Number
    t = COTask()
    if T<:AbstractFloat
        ret = CreateCOPulseChanTime(t.th,
                str2code(channel),
                str2code(""),
                Val_Seconds,
                Val_Low,
                convert(Float64,delay),
                convert(Float64,low),
                convert(Float64,high))
    elseif T<:Integer
        ret = CreateCOPulseChanTicks(t.th,
                str2code(channel),
                str2code(""),
                str2code(""),
                Val_Low,
                convert(Int32,delay),
                convert(Int32,low),
                convert(Int32,high))
    else
        error("low, high, and delay must either be \"FloatingPoint\" or \"Integer\"")
    end
    catch_error(ret)
    t
end

"""`read(task,channel; nsamples=-1) -> Vector[, Vector]`

receive data from the specified counter channel in the specified NIDAQ task
"""
function Base.read(t::CITask, channel::String; num_samples::Integer = -1)
    num_samples == -1 && (num_samples = auto_samples(t))

    #function read_counter_scalar(precision::DataType, cfunction::Function)
    #    data = precision[0]
    #    ret = cfunction(t, 1.0, pointer(data), pointer(C_NULL))
    #    ret>0 && @warn("NIDAQmx: $ret")
    #    ret<0 && error("NIDAQmx: $ret")
    #    data
    #end

    function read_counter_vector(precision::DataType, cfunction::Function)
        num_samples_read = Int32[0]
        data = Vector{precision}(undef, num_samples)
        catch_error( cfunction(t.th,
            convert(Int32,num_samples),
            1.0,
            Ref(data,1),
            convert(UInt32,num_samples),
            Ref(num_samples_read,1),
            reinterpret(Ptr{Bool32},C_NULL)) )
        resize!(data, num_samples_read[1])
    end

    function read_counter_2vectors(precision::DataType, cfunction::Function)
        num_samples_read = Int32[0]
        high = Vector{precision}(undef, num_samples)
        low = Vector{precision}(undef, num_samples)
        catch_error( cfunction(t.th,
            convert(Int32,num_samples),
            1.0,
            Val_GroupByChannel,
            Ref(high,1),
            Ref(low,1),
            convert(UInt32,num_samples),
            Ref(num_samples_read,1),
            reinterpret(Ptr{Bool32},C_NULL)) )
        resize!(high, num_samples_read[1])
        resize!(low, num_samples_read[1])
    end

    tmp = channel_type(t, channel)
    if tmp[2] == Val_CountEdges
        data = read_counter_vector(UInt32, ReadCounterU32)
    elseif tmp[2] == Val_PulseTime
        data = read_counter_2vectors(Float64, ReadCtrTime)
    elseif tmp[2] == Val_PulseTicks
        data = read_counter_2vectors(UInt32, ReadCtrTicks)
    elseif tmp[2] == Val_Position_AngEncoder
        data = read_counter_vector(UInt32, ReadCounterU32)
    elseif tmp[2] == Val_TwoEdgeSep  # might be broken
        val = Cint[0]
        catch_error( GetCITwoEdgeSepUnits(t.th,
                str2code(channel),
                Ref(val,1)) )
        if val[1] == Val_Ticks
            data = read_counter_vector(UInt32, ReadCounterU32)
            #data = read_counter_scalar(UInt32, ReadCounterScalarU32)
        elseif val[1] == Val_Seconds
            data = read_counter_vector(Float64, ReadCounterF64)
            #data = read_counter_scalar(Float64, ReadCounterScalarF64)
        end
    end
    data
end
