"""
`count_edges(channel; edge=:rising, initial_count=0, direction=:up) -> task`

create a NIDAQ counter input channel which counts edges.  edge is :rising or
:falling, and direction is :up or :down.  a counter task holds a single
channel, so unlike the analog and digital constructors there is no method
which adds a channel to an existing task.
"""
function count_edges(channel::String;
        edge::Symbol=:rising, initial_count::Integer=0, direction::Symbol=:up)
    t = CITask()
    catch_error( CreateCICountEdgesChan(t.th,
        str2code(channel),
        str2code(""),
        _lookup(edges, edge, "edge"),
        UInt32(initial_count),
        _lookup(count_directions, direction, "direction")) )
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
`quadrature_input(channel; decoding=:x4, z_enable=true, z_index_value=0, z_index_phase=:a_high_b_high, units=:ticks, pulses_per_revolution=1, initial_angle=0) -> task`

create a NIDAQ counter input channel which reads an angular encoder.

decoding is :x1, :x2, :x4, or :two_pulse.
z_enable says whether the Z index resets the position to z_index_value when
signals A and B are in the state given by z_index_phase, one of
:a_high_b_high, :a_high_b_low, :a_low_b_high, or :a_low_b_low.
units is :ticks, :degrees, or :radians, and pulses_per_revolution is needed to
convert to the latter two.
initial_angle is the position, in units, before the task starts.

a counter task holds a single channel, so unlike the analog and digital
constructors there is no method which adds a channel to an existing task.
"""
function quadrature_input(channel::String; decoding::Symbol=:x4,
        z_enable::Bool=true, z_index_value::Real=0, z_index_phase::Symbol=:a_high_b_high,
        units::Symbol=:ticks, pulses_per_revolution::Integer=1, initial_angle::Real=0)
    t = CITask()
    catch_error( CreateCIAngEncoderChan(t.th,
            str2code(channel),
            str2code(""),
            _lookup(decodings, decoding, "decoding"),
            reinterpret(Bool32, UInt32(z_enable)),
            Float64(z_index_value),
            _lookup(z_index_phases, z_index_phase, "z_index_phase"),
            _lookup(angle_units, units, "units"),
            UInt32(pulses_per_revolution),
            Float64(initial_angle),
            str2code("")) )
    t
end

"""
`line_to_line(channel; units=:seconds, edge1=:rising, edge2=:rising, range=[1.0, 1000.0]) -> task`

create a NIDAQ counter input channel which measures the separation between two
edges.  units is :seconds or :ticks, edge1 and edge2 are :rising or :falling,
and range is a two-element vector giving the minimum and maximum separation
expected, in units.  a counter task holds a single channel, so unlike the
analog and digital constructors there is no method which adds a channel to an
existing task.
"""
function line_to_line(channel::String;
        units::Symbol=:seconds, edge1::Symbol=:rising, edge2::Symbol=:rising,
        range=[1.0, 1000.0])
    t = CITask()
    catch_error( CreateCITwoEdgeSepChan(t.th,
            str2code(channel),
            str2code(""),
            Float64(range[1]), Float64(range[2]),
            _lookup(time_units, units, "units"),
            _lookup(edges, edge1, "edge1"),
            _lookup(edges, edge2, "edge2"),
            str2code("")) )
    t
end

"""
`generate_pulses(channel; units=:seconds, low=2, high=2, delay=0, idle_state=:low) -> task`

create a NIDAQ counter output channel which generates pulses.  low, high, and
delay are the durations of the low and high phases and of the initial delay,
in seconds if units is :seconds or in timebase ticks if units is :ticks.
idle_state, :low or :high, is the level of the output when no pulse is being
generated.  a counter task holds a single channel, so unlike the analog and
digital constructors there is no method which adds a channel to an existing
task.
"""
function generate_pulses(channel::String; units::Symbol=:seconds,
        low::Real=2, high::Real=2, delay::Real=0, idle_state::Symbol=:low)
    _lookup(time_units, units, "units")
    idle = _lookup(idle_states, idle_state, "idle_state")
    t = COTask()
    if units == :seconds
        ret = CreateCOPulseChanTime(t.th,
                str2code(channel),
                str2code(""),
                Val_Seconds,
                idle,
                Float64(delay),
                Float64(low),
                Float64(high))
    else
        ret = CreateCOPulseChanTicks(t.th,
                str2code(channel),
                str2code(""),
                str2code(""),
                idle,
                Int32(delay),
                Int32(low),
                Int32(high))
    end
    catch_error(ret)
    t
end

"""
`read(task, nsamples=-1) -> Vector[, Vector]`

receive data from a counter input task.  pulse time and pulse tick
measurements yield two vectors, the high and low durations; everything else
yields one.  nsamples is the number of samples to read; -1 reads every sample
of a finite acquisition, everything currently buffered in a continuous one, or
one sample from an on-demand task.
"""
function Base.read(t::CITask, num_samples::Integer = -1)
    channel = only(task_channels(t))   # a counter task holds a single channel
    num_samples == -1 && (num_samples = auto_samples(t))

    #function read_counter_scalar(precision::DataType, cfunction::Function)
    #    data = precision[0]
    #    ret = cfunction(t, 1.0, pointer(data), pointer(C_NULL))
    #    ret>0 && @warn("NIDAQmx: $ret")
    #    ret<0 && error("NIDAQmx: $ret")
    #    data
    #end

    function read_counter_vector(::Type{T}, cfunction::Function) where T
        num_samples_read = Int32[0]
        data = Vector{T}(undef, num_samples)
        catch_error( cfunction(t.th,
            convert(Int32,num_samples),
            1.0,
            Ref(data,1),
            convert(UInt32,num_samples),
            Ref(num_samples_read,1),
            reinterpret(Ptr{Bool32},C_NULL)) )
        resize!(data, num_samples_read[1])
    end

    function read_counter_2vectors(::Type{T}, cfunction::Function) where T
        num_samples_read = Int32[0]
        high = Vector{T}(undef, num_samples)
        low = Vector{T}(undef, num_samples)
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

    tmp = _channel_type(t, channel)
    if tmp[2] == Val_CountEdges
        data = read_counter_vector(UInt32, ReadCounterU32)
    elseif tmp[2] == Val_PulseTime
        data = read_counter_2vectors(Float64, ReadCtrTime)
    elseif tmp[2] == Val_PulseTicks
        data = read_counter_2vectors(UInt32, ReadCtrTicks)
    elseif tmp[2] == Val_Position_AngEncoder
        val = Cint[0]
        catch_error( GetCIAngEncoderUnits(t.th,
                str2code(channel),
                Ref(val,1)) )
        if val[1] == Val_Ticks
            data = read_counter_vector(UInt32, ReadCounterU32)
        else
            data = read_counter_vector(Float64, ReadCounterF64)
        end
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
        else
            error("unsupported two-edge separation units $(val[1])")
        end
    else
        error("unsupported counter measurement type $(tmp[2])")
    end
    data
end
