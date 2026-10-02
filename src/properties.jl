"""
`devices() -> Vector{String}`

get a list of available NIDAQ devices
"""
function devices()
    devs = split(getstring(GetSysDevNames), ", ")
    String.(filter(!isempty, devs))
end

for (jfunction, cfunction) in (
        (:analog_input_channels, GetDevAIPhysicalChans),
        (:analog_output_channels, GetDevAOPhysicalChans),
        (:digital_input_channels, GetDevDILines),
        (:digital_output_channels, GetDevDOLines),
        (:counter_input_channels, GetDevCIPhysicalChans),
        (:counter_output_channels, GetDevCOPhysicalChans))
    @eval function $jfunction(device::String)
        String.(split(getstring($cfunction, str2code(device)), ", "))
    end

    @eval function $jfunction()
        d = devices()
        length(d)!=1 && error("NIDAQmx: more than one device")
        $(Symbol(jfunction))(d[1])
    end

    @eval @doc $(string("`", jfunction, """() -> Vector{String}`

    `""", jfunction, """(device) -> Vector{String}`

    get a list of available channels for either the only available NIDAQ device or for the specified NIDAQ device
    """)) $jfunction
end

for (jfunction, cfunction) in (
        (:analog_voltage_input_ranges,  GetDevAIVoltageRngs),
        (:analog_voltage_output_ranges, GetDevAOVoltageRngs),
        (:analog_current_input_ranges,  GetDevAICurrentRngs), 
        (:analog_current_output_ranges, GetDevAOCurrentRngs))
        
    @eval function $jfunction(device::String)
        sz = $cfunction(str2code(device), convert(Ptr{Float64},C_NULL), UInt32(0))
        data=zeros(sz)
        catch_error( $cfunction(str2code(device), Ref(data,1),
                UInt32(sz)) )
        reshape(data,(2,length(data)>>1))'
    end

    @eval function $jfunction()
        d = devices()
        length(d)!=1 && error("NIDAQmx: more than one device")
        $jfunction(d[1])
    end

    @eval @doc $(string("`", jfunction, """() -> Matrix`

    `""", jfunction, """(device) -> Matrix`

    get a list of available ranges for either the only available NIDAQ device or for the specified NIDAQ device
    """)) $jfunction
end

# the driver's codes for a channel's kind and its measurement or output type
function _channel_type(t::Task, channel::String)
    val1 = Cint[0]
    catch_error(
        GetChanType(t.th, str2code(channel), Ref(val1,1)) )

    val2 = Cint[0]
    if val1[1] == Val_AI
        ret = GetAIMeasType(t.th, str2code(channel), Ref(val2,1))
    elseif val1[1] == Val_AO
        ret = GetAOOutputType(t.th, str2code(channel), Ref(val2,1))
    elseif val1[1] == Val_DI || val1[1] == Val_DO
        return val1[1], nothing
    elseif val1[1] == Val_CI
        ret = GetCIMeasType(t.th, str2code(channel), Ref(val2,1))
    elseif val1[1] == Val_CO
        ret = GetCOOutputType(t.th, str2code(channel), Ref(val2,1))
    else
        error("unsupported channel type")
    end
    catch_error(ret)

    val1[1], val2[1]
end

# map raw driver values onto something friendlier: named constants for
# enumerations, Bool for bool32, and a list of strings for comma-separated lists
_decode(x::Bool32) = reinterpret(UInt32, x) != 0
_decode(x::Int32) = get(signed_constants, x, x)
_decode(v::Vector{Int32}) = all(x -> haskey(signed_constants, x), v) ? map(x -> signed_constants[x], v) : v
_decode(v::Vector{<:Union{Int8,UInt8}}) = split(cstring(v), ", ")
_decode(x) = x

# a bitmask becomes the list of flag names whose bits are set
_decode_flags(x::Integer, flags) = [name for (bit, name) in sort(flags, by=first) if x & bit != 0]
_decode_flags(v::AbstractVector, flags) = map(x -> _decode_flags(x, flags), v)

function _check(ret::Int32, p::PropertyInfo)
    ret == 0 && return nothing
    ret < 0 && catch_error(ret, string(p.getter) * ": ")   # throws
    # positive codes are warnings, but the value is still not usable
    error("$(p.getter): NIDAQmx warning $ret")
end

# read one property.  `args` are the leading arguments of the getter: nothing
# for system properties, the device name or task handle for those, and the
# task handle plus channel name for channel properties
function _getproperty(args, p::PropertyInfo)
    T = p.eltype
    if p.scalar
        ref = Ref{T}()
        _check(p.getter(args..., ref), p)
        data = ref[]
    else
        sz = p.getter(args..., Ptr{T}(C_NULL), UInt32(0))
        _check(sz < 0 ? sz : Int32(0), p)
        data = Vector{T}(undef, sz)
        _check(p.getter(args..., data, UInt32(sz)), p)
    end
    if p.name in plain_properties
        data
    elseif isnothing(p.flags)
        _decode(data)
    else
        _decode_flags(data, get(bit_flags, p.flags, Pair{Int32,Symbol}[]))
    end
end

function _getproperties(args, group::String, warning::Bool)
    result = Dict{String,Tuple{Any,Bool}}()
    for (name, p) in property_table[group]
        try
            result[name] = (_getproperty(args, p), p.setter !== nothing)
        catch e
            warning && @warn "$(p.getter): $(sprint(showerror, e))"
        end
    end
    result
end

function _property(group::String, name::String)
    p = get(property_table[group], name, nothing)
    p === nothing && throw(ArgumentError("no property \"$name\" for $group"))
    p
end

"""
`getproperties(warning=false) -> Dict`

get the NIDAQ system properties
"""
function getproperties(; warning=false)
    _getproperties((), "Sys", warning)
end

"""
`getproperties(device; warning=false) -> Dict`

get the properties of the specified NIDAQ device
"""
function getproperties(device::String; warning=false)
    _getproperties((str2code(device),), "Dev", warning)
end

"""
`getproperties(task; warning=false) -> Dict`

get the properties of the specified NIDAQ task
"""
function getproperties(t::Task; warning=false)
    _getproperties((t.th,), "Task", warning)
end

const channel_kinds = Dict(Val_AI => "AI", Val_AO => "AO", Val_DI => "DI",
                           Val_DO => "DO", Val_CI => "CI", Val_CO => "CO")
channel_kind(t::Task, channel::String) = channel_kinds[_channel_type(t, channel)[1]]

"""
`channel_type(task, channel) -> kind, measurement_or_output_type`

get the type of the specified NIDAQ channel as a pair of Symbols naming the
driver's constants, for example `(:Val_AI, :Val_Voltage)` or
`(:Val_CI, :Val_CountEdges)`.  digital channels have no measurement type, so
the second element is `nothing` for them.
"""
function channel_type(t::Task, channel::String)
    kind, meas = _channel_type(t, channel)
    _decode(kind), isnothing(meas) ? nothing : _decode(meas)
end

"""
`getproperties(task,channel; warning=false) -> Dict`

get the properties of the specified NIDAQ channel
"""
function getproperties(t::Task, channel::String; warning=false)
    _getproperties((t.th, str2code(channel)), channel_kind(t, channel), warning)
end

"""
`getproperty(task,channel,property) -> value`

get the specified NIDAQ property of a channel
"""
function Base.getproperty(t::Task, channel::String, property::String)
    kind = channel_kind(t, channel)
    _getproperty((t.th, str2code(channel)), _property(kind, property))
end

"""
`setproperty!(task,channel,property,value)`

set the specified NIDAQ property to value
"""
function Base.setproperty!(t::Task, channel::String, property::String, value)
    kind = channel_kind(t, channel)
    p = _property(kind, property)
    p.setter === nothing && throw(ArgumentError("property \"$property\" of $kind channels is read-only"))
    catch_error(p.setter(t.th, str2code(channel), value), "DAQmxSet$kind$property: ")
    nothing
end
