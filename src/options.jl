# enumerated options of the high-level API are lowercase Symbols.  each table
# maps the Symbols a keyword accepts onto the driver's constants

const terminal_configs = (default          = Val_Cfg_Default,
                          rse              = Val_RSE,
                          nrse             = Val_NRSE,
                          differential     = Val_Diff,
                          pseudodifferential = Val_PseudoDiff)

const input_types = (voltage = Val_Voltage, current = Val_Current)

const edges = (rising = Val_Rising, falling = Val_Falling)

const count_directions = (up = Val_CountUp, down = Val_CountDown)

const time_units = (seconds = Val_Seconds, ticks = Val_Ticks)

# translate a user-facing Symbol into the driver constant, naming the keyword
# and listing the choices when it is not one of them
function _lookup(table::NamedTuple, value::Symbol, what::AbstractString)
    haskey(table, value) ||
        throw(ArgumentError("$what must be one of $(join(repr.(keys(table)), ", ")), not $(repr(value))"))
    table[value]
end
