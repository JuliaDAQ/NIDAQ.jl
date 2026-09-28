@enum TerminalConfig::Cuint RSE=Val_RSE NRSE=Val_NRSE Differential=Val_Diff PseudoDifferential=Val_PseudoDiff
@enum InputType::Cuint Voltage=Val_ChannelVoltage Current=Val_ChannelCurrent

analog_input_configs = Dict{AbstractString,TerminalConfig}(  # deprecate
    "referenced single-ended"     => RSE,
    "non-referenced single-ended" => NRSE,
    "pseudo-differential"         => PseudoDifferential,
    "differential"                => Differential)


"""
`analog_input(channel; terminal_config, range, type=Voltage) -> task`

`analog_input(task, channel; terminal_config, range, type=Voltage)`

create an analog input channel, and a new task if one is not specified.

terminal_config can be Default, RSE, NRSE, Differential, PseudoDifferential
range specifies the minimum and maximum value to measure in volt or ampere
type indicates whether it is a voltage or current input. For current inputs, default it is
 the internal shunt resistor.

The measurements are returned in volt or ampere.

For more information see the NI documentation:
https://zone.ni.com/reference/en-XX/help/370471AM-01/daqmxcfunc/daqmxcreateaivoltagechan/
https://zone.ni.com/reference/en-XX/help/370471AM-01/daqmxcfunc/daqmxcreateaicurrentchan/

"""
function analog_input(channel::String;
                      terminal_config::Union{String,TerminalConfig} = Differential,
                      range = nothing, 
                      type  = Voltage
                      )
    if typeof(terminal_config) == String  # deprecate
      Base.depwarn("specifying terminal configurations with Strings is deprecated.  Use the TerminalConfig Enum instead.", :analog_input)
      terminal_config = analog_input_configs[terminal_config]
    end
    t = AITask()
    analog_input(t, channel; terminal_config, range, type)
    t
end

function analog_input(t::AITask, 
                      channel::String;
                      terminal_config::Union{String,TerminalConfig}=Differential, 
                      range=nothing, 
                      type=Voltage)
    if typeof(terminal_config) == String  # deprecate
      Base.depwarn("specifying terminal configurations with Strings is deprecated.  Use the TerminalConfig Enum instead.", :analog_input)
      terminal_config = analog_input_configs[terminal_config]
    end
    if isnothing(range)
        device::String = split(channel,'/')[1]
        if type == Voltage
            range = float(analog_voltage_input_ranges(device)[end,:])
        else
            range = float(analog_current_input_ranges(device)[end,:])
        end
    end
    if type == Voltage # https://zone.ni.com/reference/en-XX/help/370471AM-01/daqmxcfunc/daqmxcreateaivoltagechan/
        catch_error( CreateAIVoltageChan(t.th,
                str2code(channel),
                str2code(""),
                terminal_config,
                range[1], range[2],
                Val_Volts,
                convert(Ptr{UInt8},C_NULL)), "see https://www.ni.com/documentation/en/ni-daqmx/latest/devconsid/defaulttermconfig/" )
    elseif type == Current # https://zone.ni.com/reference/en-XX/help/370471AM-01/daqmxcfunc/daqmxcreateaicurrentchan/
        catch_error( CreateAICurrentChan(t.th,
                str2code(channel),
                str2code(""),
                terminal_config,
                range[1], range[2],
                Val_Amps,
                Val_Default, # shuntResistorLoc
                0 ,
                convert(Ptr{UInt8},C_NULL)), "see https://www.ni.com/documentation/en/ni-daqmx/latest/devconsid/defaulttermconfig/" )
    end

    nothing
end

"""
`acceleration_input(channel, config, range) -> task`

`acceleration_input(task, channel, config, range)`

create an acceleration input channel, and a new task if one is not specified

terminal_config can be Default, RSE, NRSE, Differential, PseudoDifferential
range specifies the minimum and maximum value to measure in g (9.81 m/s^2)
sensitivity specifies the sensor´s sensitivity in mV/g (default is 100mV/g)
currentexcitval is the excitation current in ampere (default 2mA)

The measurements are returned in g.

For more information see the NI documentation:
https://zone.ni.com/reference/en-XX/help/370471AA-01/daqmxcfunc/daqmxcreateaiaccelchan/
"""

function acceleration_input(channel::String;
                      terminal_config::TerminalConfig = Differential, 
                      range = nothing, # in g
                      sensitivity::Real = 100. , 
                      currentexcitval::Real = 0.002)
    
    t = AITask()
    acceleration_input(t, channel; terminal_config, range, sensitivity, currentexcitval)
    t
end

function acceleration_input(t::AITask, channel::String;
                      terminal_config::TerminalConfig = Differential, 
                      range = nothing, # in g 
                      sensitivity::Real = 100. , # mV / g
                      currentexcitval::Real = 0.002) # Ampere
    isnothing(range) && throw(ArgumentError("specify input ranges"))
    # https://zone.ni.com/reference/en-XX/help/370471AA-01/daqmxcfunc/daqmxcreateaiaccelchan/
    catch_error( CreateAIAccelChan(t.th,
            str2code(channel),
            str2code(""),
            terminal_config,
            range[1], range[2],
            Val_AccelUnit_g, # or Val_MetersPerSecondSquared
            sensitivity,
            Val_mVoltsPerG, # or Val_VoltsPerG
            Val_Internal,
            currentexcitval,
            convert(Ptr{UInt8},C_NULL)), "see https://www.ni.com/documentation/en/ni-daqmx/latest/devconsid/defaulttermconfig/" )
    @warn("Attention, this channel has input/output values based in g, not SI (m/s2)")
    nothing
end
"""
`analog_output(channel, range) -> task`

`analog_output(task, channel, range)`

create an analog output channel, and a new NIDAQ task if one is not specified
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

read_analog_cfunctions = Dict{Type,Function}(
    Float64 => ReadAnalogF64,
    Int16   => ReadBinaryI16,
    Int32   => ReadBinaryI32,
    UInt16  => ReadBinaryU16,
    UInt32  => ReadBinaryU32 )

function Base.read(t::AITask, num_samples_per_chan::Integer = -1, precision::DataType = Float64)
    outdata_ref = Ref{Cuint}()
    DAQmxGetTaskNumChans(t.th, outdata_ref)
    num_channels = outdata_ref.x
    num_samples_per_chan_read = Int32[0]
    buffer_size = num_samples_per_chan==-1 ? 1024 : num_samples_per_chan
    data = Array{precision}(undef, buffer_size*num_channels)
    catch_error( read_analog_cfunctions[precision](t.th,
        convert(Int32,num_samples_per_chan),
        1.0,
        reinterpret(Bool32,Val_GroupByChannel),
        Ref(data,1),
        convert(UInt32,buffer_size*num_channels),
        Ref(num_samples_per_chan_read,1),
        reinterpret(Ptr{Bool32},C_NULL)) )
    resize!(data, num_samples_per_chan_read[1]*num_channels)
    num_channels==1 ? data : reshape(data, (div(length(data),num_channels), convert(Int64,num_channels)))
end
function Base.read!(data::VecOrMat{T}, t::AITask) where {T}
    outdata_ref = Ref{Cuint}()
    DAQmxGetTaskNumChans(t.th, outdata_ref)
    num_channels = size(data, 2)
    outdata_ref.x == num_channels || throw(ArgumentError("`data` has $num_channels columns but the task has $(outdata_ref.x) channels"))
    num_samples_per_chan = size(data, 1)
    num_samples_per_chan_read = Int32[0]
    catch_error( read_analog_cfunctions[T](t.th,
        convert(Int32, num_samples_per_chan),
        1.0,
        reinterpret(Bool32,Val_GroupByChannel),
        Ref(data,1),
        convert(UInt32,length(data)),
        Ref(num_samples_per_chan_read,1),
        reinterpret(Ptr{Bool32},C_NULL)) )
    n = num_samples_per_chan_read[1]
    n == num_samples_per_chan ||
        error("NIDAQmx: read $n of $num_samples_per_chan samples per channel")
    return data
end


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

