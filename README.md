National Instruments Data Acquisition Interface
===============================================

This package provides an interface to NI-DAQmx--- National Instruments' driver
for their data acquisition boards.  Their entire C header file was ported
using [Clang.jl](https://github.com/JuliaInterop/Clang.jl), and a rudimentary
higher-level API is provided for ease of use.

Similar functionality for the Python language is provided by
[PyDAQmx](https://pythonhosted.org/PyDAQmx).


System Requirements
===================
**General**
- Supports Windows and Linux
- NI-DAQmx Base is not supported  

**Linux specific**  
- USB DAQ devices are not supported

Installation
============
**Windows**  
First download and install NI-DAQmx version
[26.5](https://www.ni.com/en/support/downloads/drivers/download.ni-daq-mx.html#484356)
[23.5](https://www.ni.com/en/support/downloads/drivers/download.ni-daq-mx.html#484356) (or
[21.3](https://www.ni.com/de-de/support/downloads/drivers/download.ni-daqmx.html#428058),
[20.1](https://www.ni.com/en-us/support/downloads/drivers/download.ni-daqmx.html#348669), 
[20.1](https://www.ni.com/en-us/support/downloads/drivers/download.ni-daqmx.html#348669),
[19.6](https://www.ni.com/en-us/support/downloads/drivers/download/packaged.ni-daqmx.333268.html), 
[18.6](http://www.ni.com/en-us/support/downloads/drivers/download/unpackaged.ni-daqmx.291872.html);
or for Julia 0.6, [17.1.0](http://www.ni.com/download/ni-daqmx-17.1/6836/en/);
or for Julia 0.5, [16.0.0](http://www.ni.com/download/ni-daqmx-16.0/6120/en/);
or for Julia 0.4, [15.1.1](http://www.ni.com/download/ni-daqmx-15.1.1/5665/en/);
or for Julia 0.3, [14.1.0](http://www.ni.com/download/ni-daqmx-14.1/4953/en/),
[14.0.0](http://www.ni.com/download/ni-daqmx-14.0/4918/en/), or
[9.6.0](http://www.ni.com/download/ni-daqmx-9.6/3423/en/)) from National
Instruments.

**Linux**  
The package supports DAQmx 21.3 (only First Look for Ubuntu) and DAQmx 20.1 on linux. Follow the instructions from this [support doc](https://www.ni.com/en-us/support/documentation/supplemental/18/downloading-and-installing-ni-driver-software-on-linux-desktop.html).

**Adding `NIDAQ.jl`**  
Then on the Julia command line:
```
]add NIDAQ
```


Basic Usage
===========

With no input arguments, the high-level `getproperties` function can
be used to query the system:

```
julia> using NIDAQ

julia> getproperties()
Dict{String,Tuple{Any,Bool}} with 7 entries:
  "DevNames"           => (SubString{String}["Dev1"],false)
  "GlobalChans"        => (SubString{String}[""],false)
  "NIDAQMajorVersion"  => (0x00000010,false)
  "NIDAQMinorVersion"  => (0x00000000,false)
  "NIDAQUpdateVersion" => (0x00000000,false)
  "Scales"             => (SubString{String}[""],false)
  "Tasks"              => (SubString{String}[""],false)
```

Returned is a dictionary of tuples, the first member indicating the property value and
the second a boolean indicating whether the former is mutable.

`getproperties` can also input a string containing the name of a data acquisition device:

```
julia> getproperties("Dev1")
Dict{String,Tuple{Any,Bool}} with 61 entries:
  "AIBridgeRngs"                           => (Float64[],false)
  "AICouplings"                            => (:Val_Transferred_From_Buffer,false)
  "AICurrentIntExcitDiscreteVals"          => (Float64[],false)
  "AICurrentRngs"                          => (Float64[],false)
  "AIDigFltrLowpassCutoffFreqDiscreteVals" => (Float64[],false)
  "AIDigFltrLowpassCutoffFreqRangeVals"    => (Float64[],false)
  "AIFreqRngs"                             => (Float64[],false)
  "AIGains"                                => (Float64[],false)
  "AILowpassCutoffFreqDiscreteVals"        => (Float64[],false)
  "AILowpassCutoffFreqRangeVals"           => (Float64[],false)
  "AIMaxMultiChanRate"                     => (2.0e6,false)
  "AIMaxSingleChanRate"                    => (2.0e6,false)
  "AIMinRate"                              => (0.0232831,false)
  "AIPhysicalChans"                        => (SubString{String}["Dev1/ai0","Dev1/ai1","Dev1/ai2",".
  "AIResistanceRngs"                       => (Float64[],false)
  "AISampModes"                            => (Symbol[:Val_FiniteSamps,:Val_ContSamps],false)
  "AISupportedMeasTypes"                   => (Symbol[:Val_Current,:Val_Resistance,:Val_Strain_Gage.
  "AITrigUsage"                            => (14,false)
  "AIVoltageIntExcitDiscreteVals"          => (Float64[],false)
  "AIVoltageIntExcitRangeVals"             => (Float64[],false)
  "AIVoltageRngs"                          => ([-1.0,1.0,-2.0,2.0,-5.0,5.0,-10.0,10.0],false)
  "AOCurrentRngs"                          => (Float64[],false)
  "AOGains"                                => (Float64[],false)
  "AOMaxRate"                              => (3.33333e6,false)
  "AOMinRate"                              => (0.0232831,false)
  "AOPhysicalChans"                        => (SubString{String}["Dev1/ao0","Dev1/ao1"],false)
  "AOSampModes"                            => (Symbol[:Val_FiniteSamps,:Val_ContSamps],false)
  "AOSupportedOutputTypes"                 => (Symbol[:Val_Voltage],false)
  "AOTrigUsage"                            => (10,false)
  "AOVoltageRngs"                          => ([-5.0,5.0,-10.0,10.0],false)
  "AccessoryProductNums"                   => (UInt32[0x00000000],false)
  "AccessoryProductTypes"                  => (SubString{String}[""],false)
  "AccessorySerialNums"                    => (UInt32[0x00000000],false)
  "BusType"                                => (:Val_USB,false)
  "CIMaxSize"                              => (0x00000020,false)
  "CIMaxTimebase"                          => (1.0e8,false)
  "CIPhysicalChans"                        => (SubString{String}["Dev1/ctr0","Dev1/ctr1","Dev1/ctr2.
  "CISampModes"                            => (Symbol[:Val_FiniteSamps,:Val_ContSamps],false)
  "CISupportedMeasTypes"                   => (Symbol[:Val_CountEdges,:Val_Freq,:Val_Period,:Val_Tw.
  "CITrigUsage"                            => (42,false)
  "COMaxSize"                              => (0x00000020,false)
  "COMaxTimebase"                          => (1.0e8,false)
  "COPhysicalChans"                        => (SubString{String}["Dev1/ctr0","Dev1/ctr1","Dev1/ctr2.
  "COSampModes"                            => (Symbol[:Val_FiniteSamps,:Val_ContSamps],false)
  "COSupportedOutputTypes"                 => (Symbol[:Val_Pulse_Freq,:Val_Pulse_Ticks,:Val_Pulse_T.
  "COTrigUsage"                            => (42,false)
  "ChassisModuleDevNames"                  => (SubString{String}[""],false)
  "DILines"                                => (SubString{String}["Dev1/port0/line0","Dev1/port0/lin.
  "DIMaxRate"                              => (1.0e7,false)
  "DIPorts"                                => (SubString{String}["Dev1/port0","Dev1/port1","Dev1/po.
  "DITrigUsage"                            => (14,false)
  "DOLines"                                => (SubString{String}["Dev1/port0/line0","Dev1/port0/lin.
  "DOMaxRate"                              => (1.0e7,false)
  "DOPorts"                                => (SubString{String}["Dev1/port0","Dev1/port1","Dev1/po.
  "DOTrigUsage"                            => (10,false)
  "NumDMAChans"                            => (0x00000000,false)
  "ProductCategory"                        => (:Val_XSeriesDAQ,false)
  "ProductNum"                             => (0x000075a1,false)
  "ProductType"                            => (SubString{String}["USB-6366 (64 MS) (Mass Terminatio.
  "SerialNum"                              => (0x01719e54,false)
  "Terminals"                              => (SubString{String}["/Dev1/PFI0","/Dev1/PFI1","/Dev1/P.
```

One can index into the dictionary to get a list of channels:

```
julia> getproperties("Dev1")["AIPhysicalChans"]
(SubString{ASCIIString}["Dev1/ai0","Dev1/ai1","Dev1/ai2","Dev1/ai3","Dev1/ai4","Dev1/ai5","Dev1/ai6","Dev1/ai7"],false)
```

A bit simpler in this case though is to use another high-level function
which returns just the string Array:

```
julia> analog_input_channels("Dev1")
8-element Array{String,1}:
 "Dev1/ai0"
 "Dev1/ai1"
 "Dev1/ai2"
 "Dev1/ai3"
 "Dev1/ai4"
 "Dev1/ai5"
 "Dev1/ai6"
 "Dev1/ai7"
```

To add, for example, analog input channels, use the high-level `analog_input` function:

```
julia> t = analog_input("Dev1/ai0:1")
NIDAQ.AITask(Ptr{Nothing} @0x0000000025d18600)

julia> typeof(t)
NIDAQ.AITask (constructor with 3 methods)

julia> supertype(NIDAQ.AITask)
NIDAQ.Task
```

Two channels were added above using the `:` notation.  Additional
channels can be added later by inputing the returned `Task`:

```
julia> analog_input(t, "Dev1/ai2")
```

Keyword arguments choose the terminal configuration, the range of values
expected, and whether voltage or current is measured:

```
julia> analog_input("Dev1/ai3"; terminal_config=:rse, range=[-5.0, 5.0], type=:voltage)
```

Throughout the high-level API such choices are lowercase Symbols, and an
invalid one raises an `ArgumentError` listing the valid ones.  See the
docstring of each function for its keywords.

`getproperties` can also input a `Task`:

```
julia> getproperties(t)
Dict{String,Tuple{Any,Bool}} with 5 entries:
  "Devices"    => (SubString{String}["Dev1"],false)
  "Channels"   => (SubString{String}["Dev1/ai0","Dev1/ai1","Dev1/ai2"],false)
  "Name"       => (SubString{String}["_unnamedTask<0>"],false)
  "NumChans"   => (0x00000003,false)
  "NumDevices" => (0x00000001,false)
```

as well as a string containing the name of the channel:

```
julia> getproperties(t, "Dev1/ai0")
Dict{String,Tuple{Any,Bool}} with 52 entries:
  "AccelUnits"                        => (:Val_g,false)
  "AutoZeroMode"                      => (:Val_None,false)
  "BridgeUnits"                       => (:Val_VoltsPerVolt,false)
  "ChanCalDesc"                       => (SubString{String}[""],false)
  "ChanCalOperatorName"               => (SubString{String}[""],false)
  "ChanCalPolyForwardCoeff"           => (Float64[],false)
  "ChanCalPolyReverseCoeff"           => (Float64[],false)
  "ChanCalScaleType"                  => (:Val_Table,false)
  "ChanCalTablePreScaledVals"         => (Float64[],false)
  "ChanCalTableScaledVals"            => (Float64[],false)
  "ChanCalVerifAcqVals"               => (Float64[],false)
  "ChanCalVerifRefVals"               => (Float64[],false)
  "Coupling"                          => (:Val_DC,false)
  "CurrentACRMSUnits"                 => (:Val_Amps,false)
  "CurrentUnits"                      => (:Val_Amps,false)
  "CustomScaleName"                   => (SubString{String}[""],false)
  "DataXferMech"                      => (:Val_ProgrammedIO,false)
  "DataXferReqCond"                   => (:Val_OnBrdMemNotEmpty,false)
  "DevScalingCoeff"                   => ([0.000102924,0.000312673,5.87393e-14,-3.31855e-19],false)
  "EddyCurrentProxProbeUnits"         => (:Val_Meters,false)
  "ForceUnits"                        => (:Val_Newtons,false)
  "FreqUnits"                         => (:Val_Hz,false)
  "Gain"                              => (1.0,false)
  "InputSrc"                          => (SubString{String}["_external_channel"],false)
  "LVDTUnits"                         => (:Val_Meters,false)
  "LossyLSBRemovalCompressedSampSize" => (0x00000010,false)
  "Max"                               => (10.0,false)
  "MeasType"                          => (:Val_Voltage,false)
  "Min"                               => (-10.0,false)
  "PressureUnits"                     => (:Val_PoundsPerSquareInch,false)
  "RVDTUnits"                         => (:Val_Degrees,false)
  "RawDataCompressionType"            => (:Val_None,false)
  "RawSampJustification"              => (:Val_RightJustified,false)
  "RawSampSize"                       => (0x00000010,false)
  "ResistanceUnits"                   => (:Val_Ohms,false)
  "Resolution"                        => (16.0,false)
  "ResolutionUnits"                   => (:Val_Bits,false)
  "RngHigh"                           => (10.0,false)
  "RngLow"                            => (-10.0,false)
  "SoundPressureUnits"                => (:Val_Pascals,false)
  "StrainGageCfg"                     => (:Val_FullBridgeI,false)
  "StrainUnits"                       => (:Val_Strain,false)
  "TempUnits"                         => (:Val_DegC,false)
  "TermCfg"                           => (:Val_Diff,false)
  "ThrmcplCJCVal"                     => (25.0,false)
  "TorqueUnits"                       => (:Val_NewtonMeters,false)
  "UsbXferReqCount"                   => (0x00000004,false)
  "UsbXferReqSize"                    => (0x00008000,false)
  "VelocityUnits"                     => (:Val_MetersPerSecond,false)
  "VoltageACRMSUnits"                 => (:Val_Volts,false)
  "VoltageUnits"                      => (:Val_Volts,false)
  "VoltagedBRef"                      => (1.0,false)
```

Use `setproperty!` to change a mutable property, and `getproperty` to read a
single one back without fetching all of them:

```
julia> setproperty!(t, "Dev1/ai0", "Max", 5.0)

julia> getproperty(t, "Dev1/ai0", "Max")
5.0
```

(Note that when queried, `Max` and `Min` are reported coerced to the closest
range the device supports, so on a device with only a ±10 V range the above
returns 10.0.)

Once everything is configured, get some data using the `read` function:

```
julia> start(t)

julia> read(t, 10)
10x3 Array{Float64,2}:
 1.52407   -0.448835   0.381075
 1.37546   -0.213537   0.305847
 1.2363    -0.0268698  0.262826
 1.109      0.118619   0.243117
 0.995797   0.2311     0.240073
 0.896695   0.315782   0.248004
 0.811452   0.378752   0.262746
 0.739429   0.424257   0.281893
 0.679263   0.456223   0.302402
 0.629672   0.477774   0.323473

julia> stop(t)

julia> clear(t)
```

`read` can also return `Int16`, `Int32`, `UInt16`, and `UInt32` by specifying
those types as an additional argument:

```
julia> read(t, 10, Int16)
10×3 Array{Int16,2}:
 -12619  -5351  -13973
 -12618  -5350  -13973
 -12620  -5350  -13973
 -12619  -5350  -13974
 -12618  -5351  -13972
 -12618  -5348  -13974
 -12619  -5350  -13973
 -12619  -5350  -13973
 -12619  -5350  -13972
 -12620  -5350  -13973
```

The result is always a matrix with one column per channel.  Omit the number
of samples, as in `read(t)`, to get every sample of a finite acquisition or
everything currently buffered in a continuous one, and use `read!(buffer, t)`
to fill a preallocated matrix instead of allocating a new one.

Similar work flows exist for `analog_output`, `digital_input`,
and `digital_output`.

Counters are similar, except that a counter task holds a single channel,
so there is no method which adds a channel to an existing task, and
`read` takes no channel name:

```
julia> t = count_edges("Dev1/ctr0"; edge=:falling, direction=:up, initial_count=7)
NIDAQ.CITask(Ptr{Nothing} @0x0000000005a1c2e0)

julia> start(t)

julia> read(t)
1-element Vector{UInt32}:
 0x00000007

julia> clear(t)
```

The other counter functions are `quadrature_input`, `line_to_line`, and
`generate_pulses`:

```
julia> t = generate_pulses("Dev1/ctr0"; units=:ticks, low=50, high=50, idle_state=:high)
```

For a full list of high-level functions:

```
julia> filter(s -> Base.isexported(NIDAQ, s), names(NIDAQ))
28-element Vector{Symbol}:
 :NIDAQ
 :acceleration_input
 :analog_current_input_ranges
 :analog_current_output_ranges
 :analog_input
 :analog_input_channels
 :analog_input_ranges
 :analog_output
 :analog_output_channels
 :analog_output_ranges
 :analog_voltage_input_ranges
 :analog_voltage_output_ranges
 :channel_type
 :clear
 :count_edges
 :counter_input_channels
 :counter_output_channels
 :devices
 :digital_input
 :digital_input_channels
 :digital_output
 :digital_output_channels
 :generate_pulses
 :getproperties
 :line_to_line
 :quadrature_input
 :start
 :stop
```

`read`, `read!`, `write`, `getproperty`, `setproperty!`, `close`, and
`isopen` extend the functions of the same name in Julia Base and so are
not listed.  Plain `names(NIDAQ)` also returns the thousands of low-level
wrappers described next, which are public but not exported.

NIDAQmx is a powerful interface, and while NIDAQ.jl provides wrappers
for all of its functions, it only abstracts a few of them.  If these
don't suit your needs you'll have to dive deep into `src/functions_V*.jl`
and `src/constants_V*.jl`.  Complete documentation of this low-level API
is [here](http://zone.ni.com/reference/en-XX/help/370466V-01/) and
[here](http://zone.ni.com/reference/en-XX/help/370471W-01/).

One situation where the low-level API is needed is to specify
continuous output of pulses using a counter:

```
julia> t = generate_pulses("Dev1/ctr0")
NIDAQ.COTask(Ptr{Nothing} @0x00000000059d8790)

julia> NIDAQ.CfgImplicitTiming(t.th, NIDAQ.Val_ContSamps, UInt64(1))
0
```

Note that tasks consist of just a single field `th`, and that this "task
handle" is what must be passed into many low-level routines.

Also, for brevity NIDAQ.jl strips the "DAQmx" prefix to all functions and
constants in NI-DAQmx, and converts the latter to 32 bits.  One must still
take care to cast the other inputs appropriately though.


Adding Support for a Version of NI-DAQmx
========================================

Install [Clang.jl](https://github.com/ihnorton/Clang.jl) to a local folder, e.g. `dev`.  

Find `NIDAQmx.h`, which usually lives in
`C:\Program Files (x86)\National Instruments\NI-DAQ\DAQmx ANSI C Dev\include`.
and copy `NIDAQmx.h` to `dev` folder.

Run `generator.jl` in `dev` folder, it will generate `NIDAQmx.jl` and `common.jl` in `dev` folder.

Move the above two files to `src` folder, and edit the file names accordingly as below:
```
$ mv NIDAQmx.jl ../src/functions_V<version>.jl
$ mv common.jl ../src/constants_V<version>.jl
```

Finally, the following manual edits are necessary:

+ In `constants_V<version>.jl`
  + delete `const __CFUNC = __stdcall`
  + delete `const CVICALLBACK = CVICDECL`,
  + change `const bool32 = uInt32` to `const bool32 = Bool32`.
  + in NI-DAQmx v23.5.0, comment out `const __CFUNC = __stdcall`
  + in NI-DAQmx v23.5.0 comment out all functions.
  + in NI-DAQmx v19.6 add `struct CVITime; lsb::uInt64; msb::int64; end`
  + in NI-DAQmx v17.1.0 comment out `const CVIAbsoluteTime = VOID`
  + in NI-DAQmx v15 to v18 comment out `using Compat`
+ In `functions_V<version>.jl`
  + in NI-DAQmx v21.3 and earlier, globally search for `Cstring` and replace with `SafeCstring`
  + in NI-DAQmx v18 and earlier, globally search for `Ptr` and replace with `Ref`, then globally
search for `CallbackRef` and replace with `CallbackPtr`.
  + for Julia 0.7 support, replace `type` with `_type`


Author
======

[Ben Arthur](http://www.janelia.org/people/research-resources-staff/ben-arthur), arthurb@hhmi.org  
[Scientific Computing](http://www.janelia.org/research-resources/computing-resources)  
[Janelia Research Campus](http://www.janelia.org)  
[Howard Hughes Medical Institute](http://www.hhmi.org)

[![Picture](/hhmi_janelia_160px.png)](http://www.janelia.org)

