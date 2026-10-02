# Changelog

## v0.7.0

This release adds support for NI-DAQmx 26.5 and Julia 1.11 through 1.13, and
makes the high-level API consistent across analog, digital, and counter tasks.
Several of the changes are breaking.  This section walks through everything
that affects existing code, with the v0.6 form on the left and the v0.7 form
on the right.

### Requirements

Julia 1.10 or later is required.  NI-DAQmx 18.6, 19.6, 20.1, 21.3, 23.5, and
26.5 are supported on Windows.  Linux is no longer advertised as supported,
because nobody has been able to test it; the code path remains.

The wrappers for 18.6 through 23.5 did not work with Julia 1.11 or later
before this release, and 23.5 did not work with clocked acquisition on any
Julia.  They are patched to type strings as `Ptr{Cchar}` and 64-bit integers
as 64-bit, and the test suite now loads every shipped wrapper in turn against
the installed driver.  Setting the environment variable
`NIDAQ_WRAPPER_VERSION` overrides which wrapper is loaded, which is what the
tests use; the choice is baked in at precompilation.

### `read` and `write` extend Base

`read`, `read!`, and `write` are now methods of the functions of the same name
in Julia Base, and are no longer exported by NIDAQ.  After `using NIDAQ` the
bare names work, as does the qualified `NIDAQ.read`, and both refer to the same
function.

| v0.6 | v0.7 |
|---|---|
| `NIDAQ.read(t, 10)` | `read(t, 10)` or `NIDAQ.read(t, 10)` |
| `NIDAQ.write(t, data)` | `write(t, data)` or `NIDAQ.write(t, data)` |
| `read(t, Float64, 10)` | `read(t, 10, Float64)`; the old argument order is gone |

### `read` always returns a matrix

Analog and digital reads return a `Matrix` with one column per channel, even
for a single channel, where they used to return a `Vector`.  Index a
single-channel result with `data[:, 1]` or `vec(data)` if you need a vector.

Reading with no sample count, or with `-1`, used to be capped at 1024 samples
per channel.  It now returns every sample of a finite acquisition, everything
currently buffered in a continuous one, or one sample from an on-demand task.

Unsupported element types raise an `ArgumentError` listing the valid ones
instead of a `KeyError`.

### `read!` sizes itself from the buffer

`read!` takes only the buffer and the task, and works for digital as well as
analog input.  The buffer must be a `Vector` or `Matrix` with one column per
channel; a mismatch raises an `ArgumentError`.  The function returns the
buffer.

| v0.6 | v0.7 |
|---|---|
| `read!(buf, t, n, Float64)` | `read!(buf, t)` with `buf` sized `n` by the number of channels |

### Enumerated options are lowercase Symbols

Every keyword that selects from a fixed set of choices takes a `Symbol`.  An
invalid choice raises an `ArgumentError` naming the keyword and listing the
valid values.  The `RSE`, `NRSE`, `Differential`, and `PseudoDifferential`
constants and the `TerminalConfig` and `InputType` enums are gone, as is the
long-deprecated string form of `terminal_config`.

| v0.6 | v0.7 |
|---|---|
| `analog_input(ch; terminal_config=RSE)` | `analog_input(ch; terminal_config=:rse)` |
| `analog_input(ch; terminal_config="differential")` | `analog_input(ch; terminal_config=:differential)` |
| `analog_input(ch; type=NIDAQ.Current)` | `analog_input(ch; type=:current)` |
| `count_edges(ch; edge="falling", direction="down")` | `count_edges(ch; edge=:falling, direction=:down)` |
| `line_to_line(ch; units="ticks", edge1="rising")` | `line_to_line(ch; units=:ticks, edge1=:rising)` |

`terminal_config` also accepts `:default`, meaning the device's default, which
the old enum could not represent.

### `generate_pulses` takes explicit units

The units of `low`, `high`, and `delay` used to be inferred from their type:
floating point meant seconds and integer meant timebase ticks.  They are now
chosen by a `units` keyword which defaults to `:seconds`, and the three
durations accept any `Real`.

| v0.6 | v0.7 |
|---|---|
| `generate_pulses(ch; low=2.0, high=2.0)` | `generate_pulses(ch; low=2, high=2)` |
| `generate_pulses(ch; low=50, high=50)` | `generate_pulses(ch; units=:ticks, low=50, high=50)` |

Note that `generate_pulses(ch)` with no arguments used to mean 2 ticks, because
the defaults were integers, and now means 2 seconds.

### `acceleration_input` is `analog_input` with `type=:acceleration`

`sensitivity` and `excitation_current` are keywords of `analog_input` which
apply only to acceleration inputs, and `range` is required for them.  The
`currentexcitval` keyword is renamed.  `acceleration_input` remains as a
deprecated alias.

| v0.6 | v0.7 |
|---|---|
| `acceleration_input(ch; range=[-5, 5], currentexcitval=0.004)` | `analog_input(ch; type=:acceleration, range=[-5, 5], excitation_current=0.004)` |

### Counter reads take no channel name

A counter task holds a single channel, so `read` looks it up rather than asking
for it, and the sample count is positional as it is for the other task types.

| v0.6 | v0.7 |
|---|---|
| `read(t, "Dev1/ctr0"; num_samples=3)` | `read(t, 3)` |
| `read(t, "Dev1/ctr0")` | `read(t)` |

On an on-demand counter task `read(t)` returns one sample, where it used to
return 1024 repeated software reads.

### Counter constructors expose their parameters

Values that were hard-coded are now keywords whose defaults are the old values,
so existing calls behave identically.

| Function | New keywords |
|---|---|
| `quadrature_input` | `decoding`, `z_index_value`, `z_index_phase`, `units`, `pulses_per_revolution`, `initial_angle` |
| `line_to_line` | `range` |
| `generate_pulses` | `idle_state` |

### `channel_type` returns Symbols

`channel_type` returns the driver's constants by name, as `getproperties`
already did, rather than as raw integer codes.

| v0.6 | v0.7 |
|---|---|
| `channel_type(t, ch) == (NIDAQ.Val_AI, NIDAQ.Val_Voltage)` | `channel_type(t, ch) == (:Val_AI, :Val_Voltage)` |

Digital channels have no measurement type, so the second element is `nothing`
for them.

### Properties

`getproperties` builds its table of properties once when the package loads
rather than scanning every wrapper on every call.  The roughly four seconds of
reflection that every call used to cost is gone; what remains is the driver's
own round trips, a few milliseconds per property.  Boolean properties, which
the old code silently dropped, now appear.

Three mislabelings are fixed.  Where several driver constants share a value,
the shortest name is now reported, so an edge setting reads back as
`:Val_Rising` rather than `:Val_RisingSlope`.  The properties which are
bitmasks, the `*TrigUsage` and `*Couplings` families, decode to a vector of
the flag names set, such as
`[:Val_Bit_TriggerUsageTypes_Pause, :Val_Bit_TriggerUsageTypes_Start]`, where
they used to be reported either as a bare integer or under the name of an
unrelated constant which happened to share the value.  And `UInt32` properties
are no longer looked up in the table of attribute ids: counts, sizes, tick
counts, and serial numbers are always plain numbers now, where before a count
of 6240 was reported as `:SelfCal_Supported` because that is the id of an
attribute.  The three `Int32` properties which hold plain numbers,
`BridgeBalanceCoarsePot`, `BridgeBalanceFinePot`, and
`SampClkOverrunSentinelVal`, are likewise left undecoded.

A new `getproperty(task, channel, property)` reads a single channel property.
`setproperty!` raises an `ArgumentError` for an unknown or read-only property
instead of an `UndefVarError`.

### Task lifecycle

Tasks are cleared by a finalizer if they are garbage collected without an
explicit `clear`, so forgotten tasks no longer hold the device.  `clear` is
idempotent and nulls the task handle, `close` is an alias for it, and `isopen`
reports whether a task is still live.  Every channel constructor has a
do-block form which clears the task when the block exits:

```julia
analog_input("Dev1/ai0") do t
    start(t)
    read(t, 100)
end
```

### Other changes

- `Bool32` is no longer exported.  Write `NIDAQ.Bool32` if you need it.
- The low-level wrappers and stripped constants, such as `NIDAQ.CfgSampClkTiming`
  and `NIDAQ.Val_Rising`, are declared `public` on Julia 1.11 and later.
- Empty or NUL-terminated strings for low-level calls should be built with
  `NIDAQ.str2code("")` rather than by hand.
- Seventeen low-level wrappers which take or return 64-bit integers, including
  `CfgSampClkTiming` and `CfgImplicitTiming`, passed them as 32-bit in the
  v23.5 wrapper.  This is fixed.
- Strings passed to the driver are NUL-terminated, which they were not on
  Julia 1.11 and later.
- `analog_input_ranges` and `analog_output_ranges` remain deprecated in favour
  of `analog_voltage_input_ranges` and `analog_voltage_output_ranges`.
