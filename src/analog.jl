"""
`analog_input(channel; terminal_config=:differential, range=nothing, type=:voltage) -> task`

`analog_input(task, channel; terminal_config=:differential, range=nothing, type=:voltage)`

create an analog input channel, and a new task if one is not specified.

terminal_config can be :rse, :nrse, :differential, :pseudodifferential, or
:default, the last meaning whatever the device defaults to.
range is a two-element vector giving the minimum and maximum value to measure
in volts or amperes, and defaults to the largest range the device supports.
type is :voltage or :current.  Current inputs use the internal shunt resistor.

The measurements are returned in volts or amperes.

For more information see the NI documentation:
https://zone.ni.com/reference/en-XX/help/370471AM-01/daqmxcfunc/daqmxcreateaivoltagechan/
https://zone.ni.com/reference/en-XX/help/370471AM-01/daqmxcfunc/daqmxcreateaicurrentchan/

"""
function analog_input(channel::String;
                      terminal_config::Symbol = :differential,
                      range = nothing,
                      type::Symbol = :voltage)
    t = AITask()
    analog_input(t, channel; terminal_config, range, type)
    t
end

function analog_input(t::AITask,
                      channel::String;
                      terminal_config::Symbol = :differential,
                      range = nothing,
                      type::Symbol = :voltage)
    config = _lookup(terminal_configs, terminal_config, "terminal_config")
    _lookup(input_types, type, "type")
    if isnothing(range)
        device::String = split(channel,'/')[1]
        if type == :voltage
            range = float(analog_voltage_input_ranges(device)[end,:])
        else
            range = float(analog_current_input_ranges(device)[end,:])
        end
    end
    if type == :voltage # https://zone.ni.com/reference/en-XX/help/370471AM-01/daqmxcfunc/daqmxcreateaivoltagechan/
        catch_error( CreateAIVoltageChan(t.th,
                str2code(channel),
                str2code(""),
                config,
                range[1], range[2],
                Val_Volts,
                convert(Ptr{UInt8},C_NULL)), "see https://www.ni.com/documentation/en/ni-daqmx/latest/devconsid/defaulttermconfig/" )
    else # https://zone.ni.com/reference/en-XX/help/370471AM-01/daqmxcfunc/daqmxcreateaicurrentchan/
        catch_error( CreateAICurrentChan(t.th,
                str2code(channel),
                str2code(""),
                config,
                range[1], range[2],
                Val_Amps,
                Val_Default, # shuntResistorLoc
                0 ,
                convert(Ptr{UInt8},C_NULL)), "see https://www.ni.com/documentation/en/ni-daqmx/latest/devconsid/defaulttermconfig/" )
    end

    nothing
end

"""
`acceleration_input(channel; terminal_config=:differential, range, sensitivity=100.0, excitation_current=0.002) -> task`

`acceleration_input(task, channel; terminal_config=:differential, range, sensitivity=100.0, excitation_current=0.002)`

create an acceleration input channel, and a new task if one is not specified

terminal_config can be :rse, :nrse, :differential, :pseudodifferential, or
:default.
range is a required two-element vector giving the minimum and maximum value to
measure in g (9.81 m/s^2).
sensitivity is the sensor's sensitivity in mV/g.
excitation_current is the IEPE excitation current in amperes.

The measurements are returned in g.

For more information see the NI documentation:
https://zone.ni.com/reference/en-XX/help/370471AA-01/daqmxcfunc/daqmxcreateaiaccelchan/
"""
function acceleration_input(channel::String;
                      terminal_config::Symbol = :differential,
                      range = nothing, # in g
                      sensitivity::Real = 100. ,
                      excitation_current::Real = 0.002)
    t = AITask()
    acceleration_input(t, channel; terminal_config, range, sensitivity, excitation_current)
    t
end

function acceleration_input(t::AITask, channel::String;
                      terminal_config::Symbol = :differential,
                      range = nothing, # in g
                      sensitivity::Real = 100. , # mV / g
                      excitation_current::Real = 0.002) # Ampere
    config = _lookup(terminal_configs, terminal_config, "terminal_config")
    isnothing(range) && throw(ArgumentError("specify input ranges"))
    # https://zone.ni.com/reference/en-XX/help/370471AA-01/daqmxcfunc/daqmxcreateaiaccelchan/
    catch_error( CreateAIAccelChan(t.th,
            str2code(channel),
            str2code(""),
            config,
            range[1], range[2],
            Val_AccelUnit_g, # or Val_MetersPerSecondSquared
            sensitivity,
            Val_mVoltsPerG, # or Val_VoltsPerG
            Val_Internal,
            excitation_current,
            convert(Ptr{UInt8},C_NULL)), "see https://www.ni.com/documentation/en/ni-daqmx/latest/devconsid/defaulttermconfig/" )
    @warn("Attention, this channel has input/output values based in g, not SI (m/s2)")
    nothing
end
"""
`analog_output(channel; range=nothing) -> task`

`analog_output(task, channel; range=nothing)`

create an analog output channel, and a new NIDAQ task if one is not specified.

range is a two-element vector giving the minimum and maximum value to generate
in volts, and defaults to the largest range the device supports.
"""
function analog_output(channel::String; range=nothing)
    t = AOTask()
    analog_output(t, channel, range=range)
    t
end

function analog_output(t::AOTask, channel::String; range=nothing)
    if range == nothing
        device::String = split(channel,'/')[1]
        range=float(analog_voltage_output_ranges(device)[end,:])
    end
    catch_error( CreateAOVoltageChan(t.th,
            str2code(channel),
            str2code(""),
            range[1], range[2],
            Val_Volts,
            convert(Ptr{UInt8},C_NULL)) )
    nothing
end

# which driver function reads samples of a given element type.  dispatching on
# the type, rather than looking it up in a Dict, lets the compiler infer the
# return type of read
for (cfunction, T) in (
        (ReadAnalogF64, Float64),
        (ReadBinaryI16, Int16),
        (ReadBinaryI32, Int32),
        (ReadBinaryU16, UInt16),
        (ReadBinaryU32, UInt32))
    @eval read_cfunction(::AITask, ::Type{$T}) = $cfunction
end
read_cfunction(::AITask, ::Type{T}) where T =
    throw(ArgumentError("analog input can be read as Float64, Int16, Int32, UInt16, or UInt32, not $T"))

Base.read(t::AITask, num_samples_per_chan::Integer = -1, ::Type{T} = Float64) where T =
    _read(t, read_cfunction(t, T), T, num_samples_per_chan)


for (cfunction, types) in (
        (WriteAnalogF64, Float64),
        (WriteBinaryI16, Int16),
        (WriteBinaryI32, Int32),
        (WriteBinaryU16, UInt16),
        (WriteBinaryU32, UInt32))
    @eval function Base.write(t::AOTask, data::Matrix{$types})
        num_samples_per_chan::Int32 = size(data, 1)
        data = reshape(data, length(data))
        num_samples_per_chan_written = Int32[0]
        catch_error( $cfunction(t.th,
            num_samples_per_chan,
            reinterpret(Bool32, UInt32(false)),
            1.0,
            reinterpret(Bool32,Val_GroupByChannel),
            Ref(data,1),
            Ref(num_samples_per_chan_written,1),
            reinterpret(Ptr{Bool32},C_NULL)) )
        num_samples_per_chan_written[1]
    end
    @eval Base.write(t::AOTask, data::Vector{$types}) =
        Base.write(t, reshape(data,(length(data),1)))
end

