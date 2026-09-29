"""
`NIDAQ.jl` provides an interface to NI-DAQmx--- National Instruments' driver
for their data acquisition boards.  See the README.md for documentation.

# Examples
```julia
t = analog_input("Dev1/ai0:1")
getproperties(t)
setproperty!(t, "Dev1/ai0", "Max", 5.0)
getproperty(t, "Dev1/ai0", "Max")
start(t)
read(t, 10)
stop(t)
clear(t)

t = generate_pulses("Dev1/ctr0")
NIDAQ.CfgImplicitTiming(t.th, NIDAQ.Val_ContSamps, UInt64(1))
```

More examples are in tests/.
"""
module NIDAQ

# tasks
export start, stop, clear

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

const NIDAQmx = Sys.iswindows() ? "C:\\Windows\\System32\\nicaiu.dll" :
    "/usr/lib/x86_64-linux-gnu/libnidaqmx.so"
const SafeCstring = Ref{UInt8}

primitive type Bool32<:Integer 32 end
export Bool32


@static if VERSION >= v"1.11"
    eval(Expr(:public, :Task, :AITask, :AOTask, :DITask, :DOTask, :CITask, :COTask, :str2code))
end

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

const unsigned_constants = Dict{UInt64,Symbol}()
const signed_constants = Dict{Int64,Symbol}()

# NI-DAQmx exposes properties through getter/setter pairs named
# DAQmxGet<group><property> and DAQmxSet<group><property>.  the table below is
# built once, when the module loads, so that getproperties does not have to
# scan every wrapper on every call.
struct PropertyInfo
    name::String                      # e.g. "Max"
    getter::Function                  # e.g. DAQmxGetAIMax
    setter::Union{Function,Nothing}   # e.g. DAQmxSetAIMax, or nothing if read-only
    eltype::Type                      # type of the value, e.g. Float64, or Cchar for strings
    scalar::Bool                      # true: one Ref out-arg;  false: buffer plus size
end

# group => number of arguments the caller supplies before the out-arg
const property_groups = ("Sys" => 0, "Dev" => 1, "Task" => 1,
                         "AI" => 2, "AO" => 2, "DI" => 2, "DO" => 2, "CI" => 2, "CO" => 2)
const property_table = Dict(g => Dict{String,PropertyInfo}() for (g, _) in property_groups)

# the generated wrappers are a single ccall, so its argument types can be read
# from the lowered code.  this is the only place which depends on that layout.
ccall_argtypes(f::Function) = code_lowered(f)[1].code[end-1].args[3]

function register_property!(sym::Symbol, getter::Function)
    name = String(sym)
    startswith(name, "DAQmxGet") || return
    rest = name[9:end]
    for (group, nargs) in property_groups
        startswith(rest, group) || continue
        argtypes = ccall_argtypes(getter)
        # only getters shaped (args..., out) or (args..., out, size) are properties
        length(argtypes) in (nargs+1, nargs+2) || return
        out = argtypes[nargs+1]
        out isa Type && out <: Union{Ptr,Ref} || return
        setsym = Symbol("DAQmxSet" * rest)
        setter = isdefined(NIDAQ, setsym) ? getfield(NIDAQ, setsym) : nothing
        pname = rest[length(group)+1:end]
        property_table[group][pname] =
            PropertyInfo(pname, getter, setter, eltype(out), length(argtypes) == nargs+1)
        return
    end
end

public_names = Symbol[]
for sym in names(NIDAQ, all=true)
    @isdefined(sym) || continue
    sym_str = string(sym)
    (length(sym_str)<5 || sym_str[1:5]!="DAQmx") && continue
    sym_str = sym_str[6:end]
    sym_str[1]=='_' && (sym_str = sym_str[2:end])
    val = getfield(NIDAQ, sym)
    if val isa Unsigned
        @eval const $(Symbol(sym_str)) = UInt32($sym)
        unsigned_constants[val] = Symbol(sym_str)
        push!(public_names, Symbol(sym_str))
    elseif val isa Signed
        sym_str[1:min(end,4)]=="Val_" || continue
        @eval const $(Symbol(sym_str)) = convert(Int32,$sym)
        signed_constants[val] = Symbol(sym_str)
        push!(public_names, Symbol(sym_str))
    elseif val isa Function
        @eval const $(Symbol(sym_str)) = $sym
        push!(public_names, Symbol(sym_str))
        register_property!(sym, val)
    end
end
# convert a NUL-terminated buffer filled in by the driver to a String
function cstring(data::Vector{Cchar})
    n = something(findfirst(iszero, data), length(data)+1) - 1
    GC.@preserve data unsafe_string(pointer(data), n)
end

# call a DAQmx getter which fills a caller-supplied char buffer, first asking
# the driver how large that buffer needs to be
function getstring(f, args...)
    sz = f(args..., Ptr{Cchar}(C_NULL), UInt32(0))
    sz < 0 && catch_error(sz)
    data = Vector{Cchar}(undef, sz)
    catch_error(f(args..., data, UInt32(sz)))
    cstring(data)
end

@static if VERSION >= v"1.11"
    eval(Expr(:public, public_names...))
end

function catch_error(code::Int32, extra::String=""; err_fcn=error)
    code == 0 && return nothing
    sz = DAQmxGetErrorString(code, Ptr{Cchar}(C_NULL), UInt32(0))
    data = Vector{Cchar}(undef, max(sz, 0))
    ret = DAQmxGetErrorString(code, data, UInt32(length(data)))
    ret>0 && @warn("DAQmxGetErrorString error $ret")
    ret<0 && err_fcn("DAQmxGetErrorString error $ret")
    msg = "NIDAQmx: " * extra * cstring(data)
    code>0 && @warn(msg)
    code<0 && err_fcn(msg)
    nothing
end

include("task.jl")
include("options.jl")
include("analog.jl")
include("digital.jl")
include("counter.jl")
include("properties.jl")
include("deprecations.jl")

for f in (:analog_input, :analog_output, :acceleration_input,
          :digital_input, :digital_output,
          :count_edges, :quadrature_input, :line_to_line, :generate_pulses)
    @eval function $f(body::Function, args...; kwargs...)
        t = $f(args...; kwargs...)
        try
            body(t)
        finally
            clear(t)
        end
    end
end

str2code(s::String) = str2code(Val(Cchar), s)
str2code(::Val{Cchar}, s::String) = Ref(Cchar.(codeunits(s * '\0')),1)
str2code(::Val{UInt8}, s::String) = Ref(codeunits(s),1)

@doc """`read(task, nsamples=-1, T=Float64) -> Matrix{T}`

receive data from all analog or digital input channels in a NIDAQ task, one
column per channel.  nsamples is the number of samples per channel; -1 reads
every sample of a finite acquisition or everything currently buffered in a
continuous one.  T is the element type, and for digital tasks defaults to
UInt32.
""" read

@doc """`write(task, data)`

send data to all analog or digital channels in a NIDAQ task
""" write

end

