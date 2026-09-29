@deprecate analog_input_ranges(device::String)  analog_voltage_input_ranges(device::String)
@deprecate analog_output_ranges(device::String) analog_voltage_output_ranges(device::String)
@deprecate acceleration_input(channel::String; kwargs...) analog_input(channel; type=:acceleration, kwargs...)
@deprecate acceleration_input(t::AITask, channel::String; kwargs...) analog_input(t, channel; type=:acceleration, kwargs...)

