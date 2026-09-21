"""
`NIDAQ.jl` provides an interface to NI-DAQmx--- National Instruments' driver
for their data acquisition boards.  See the README.md for documentation.

# Examples
```julia
t = analog_input("Dev1/ai0:1")
getproperties(t)
setproperty!(t, "Dev1/ai0", "Max", 5.0)
start(t)
read(t, Float64, 10)
stop(t)
clear(t)

t = generate_pulses("Dev1/ctr0")
NIDAQ.CfgImplicitTiming(t.th, NIDAQ.Val_ContSamps, UInt64(1))
```

More examples are in tests/.
"""
module NIDAQ

if VERSION < v"1.0.0"
    import Base.start
else
    export start
end

# tasks
export stop, clear

# channels
export analog_input, analog_output, digital_input, digital_output
export acceleration_input
export count_edges, quadrature_input, line_to_line, generate_pulses

# properties
export devices, channel_type, getproperties
export analog_input_ranges,             analog_output_ranges
export analog_voltage_input_ranges,     analog_voltage_output_ranges
export analog_current_input_ranges,     analog_current_output_ranges
export analog_input_channels,           analog_output_channels
export digital_input_channels,          digital_output_channels
export counter_input_channels,          counter_output_channels

export RSE, NRSE, Differential, PseudoDifferential

const NIDAQmx = Sys.iswindows() ? "C:\\Windows\\System32\\nicaiu.dll" :
    "/usr/lib/x86_64-linux-gnu/libnidaqmx.so"
const SafeCstring = Ref{UInt8}

primitive type Bool32<:Integer 32 end
export Bool32

try
  global ver
  global major, minor, update  # bug in Julia v0.5 on windows?
  major = Ref{UInt32}(0)
  ccall((:DAQmxGetSysNIDAQMajorVersion,NIDAQmx),Int32,(Ref{UInt32},),major)
  minor = Ref{UInt32}(0)
  ccall((:DAQmxGetSysNIDAQMinorVersion,NIDAQmx),Int32,(Ref{UInt32},),minor)
  update = Ref{UInt32}(0)
  ccall((:DAQmxGetSysNIDAQUpdateVersion,NIDAQmx),Int32,(Ref{UInt32},),update)
  ver = "$(major[]).$(minor[]).$(update[])"
catch
  error("can not determine NIDAQmx version.")
end

try
  include("constants_V$ver.jl")
  include("functions_V$ver.jl")
catch
  error("NIDAQmx version $ver is not supported.")
end

unsigned_constants = Dict{UInt64,Symbol}()
signed_constants = Dict{Int64,Symbol}()

for sym in names(NIDAQ, all=true)
    @isdefined(sym) || continue
    sym_str = string(sym)
    (length(sym_str)<5 || sym_str[1:5]!="DAQmx") && continue
    sym_str = sym_str[6:end]
    sym_str[1]=='_' && (sym_str = sym_str[2:end])
    if @eval typeof($sym) <: Unsigned
        @eval $(Symbol(sym_str)) = UInt32($sym)
        unsigned_constants[eval(:($sym))] = Symbol(sym_str)
    elseif @eval typeof($sym) <: Signed
        sym_str[1:min(end,4)]=="Val_" || continue
        @eval $(Symbol(sym_str)) = convert(Int32,$sym)
        signed_constants[eval(:($sym))] = Symbol(sym_str)
    elseif eval(:(typeof($sym)<:Function))
        @eval $(Symbol(sym_str)) = $sym
    end
end
safechop(str::AbstractString) = isempty(str) ? str : chop(str)

function catch_error(code::Int32, extra::String=""; err_fcn=error)
    sz = DAQmxGetErrorString(code, convert(Ptr{Cchar},C_NULL), convert(UInt32,0))
    data = zeros(Cchar,sz)
    ret = DAQmxGetErrorString(code, Ref(data,1), convert(UInt32,sz))
    data = String(UInt8.(data))
    ret>0 && @warn("DAQmxGetErrorString error $ret")
    ret<0 && err_fcn("DAQmxGetErrorString error $ret")
    data = safechop(data)
    code>0 && @warn("NIDAQmx: "*extra*data)
    code<0 && err_fcn("NIDAQmx: "*extra*data)
end

include("task.jl")
include("analog.jl")
include("digital.jl")
include("counter.jl")
include("properties.jl")
include("deprecations.jl")

str2code(s::String) = str2code(Val(Cchar), s)
str2code(::Val{Cchar}, s::String) = Ref(Cchar.(codeunits(s)),1)
str2code(::Val{UInt8}, s::String) = Ref(codeunits(s),1)

@doc """`read(task, precision, nsamples) -> Matrix`

receive data from all analog or digital channels in a NIDAQ task
""" read

@doc """`write(task, data)`

send data to all analog or digital channels in a NIDAQ task
""" write

end

