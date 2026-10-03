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
export count_edges, quadrature_input, line_to_line, generate_pulses

# properties
export devices, channel_type, getproperties
export analog_input_ranges,             analog_output_ranges
export analog_voltage_input_ranges,     analog_voltage_output_ranges
export analog_current_input_ranges,     analog_current_output_ranges
export analog_input_channels,           analog_output_channels
export digital_input_channels,          digital_output_channels
export counter_input_channels,          counter_output_channels

using Libdl
using Preferences

# the driver library.  find_library returns "" when it is not installed, in
# which case keep the bare name so that the first call into the driver fails
# with the loader's own "could not load library" message
const driver_path = Libdl.find_library(["nicaiu", "libnidaqmx"])
const NIDAQmx = isempty(driver_path) ? (Sys.iswindows() ? "nicaiu" : "libnidaqmx") : driver_path

"""
`driver_available() -> Bool`

whether the NI-DAQmx driver library was found when NIDAQ.jl was loaded.  when
it was not, NIDAQ.jl still loads, so that code using it can be developed and
tested anywhere, but every call into the driver fails.
"""
driver_available() = !isempty(driver_path)

# recompile when the driver is upgraded, so that the wrapper chosen below
# tracks the installed version
driver_available() && Base.include_dependency(Libdl.dlpath(NIDAQmx))

# the driver's bool32 is a 32-bit integer; a distinct type lets getproperties
# tell boolean properties apart from unsigned ones
primitive type Bool32<:Integer 32 end

@static if VERSION >= v"1.11"
    eval(Expr(:public, :Task, :AITask, :AOTask, :DITask, :DOTask, :CITask, :COTask,
                       :Bool32, :str2code, :driver_available, :wrapper_version,
                       :shipped_versions))
end

# the version of the installed driver
function installed_version()
    major, minor, update = Ref{UInt32}(0), Ref{UInt32}(0), Ref{UInt32}(0)
    ccall((:DAQmxGetSysNIDAQMajorVersion, NIDAQmx), Int32, (Ref{UInt32},), major)
    ccall((:DAQmxGetSysNIDAQMinorVersion, NIDAQmx), Int32, (Ref{UInt32},), minor)
    ccall((:DAQmxGetSysNIDAQUpdateVersion, NIDAQmx), Int32, (Ref{UInt32},), update)
    VersionNumber(major[], minor[], update[])
end

# the NI-DAQmx versions for which a wrapper ships with the package
const shipped_versions = sort!([VersionNumber(m.captures[1])
    for m in filter(!isnothing, match.(r"^functions_V(\d+\.\d+\.\d+)\.jl$", readdir(@__DIR__)))])

# the newest shipped wrapper not newer than the installed driver, which works
# because the C API only grows from one version to the next; nothing if the
# driver is older than every wrapper
function select_wrapper(installed::VersionNumber, shipped = shipped_versions)
    candidates = filter(<=(installed), shipped)
    isempty(candidates) ? nothing : maximum(candidates)
end

# which wrapper to load, in order of precedence: the NIDAQ_WRAPPER_VERSION
# environment variable, which the test suite uses to load each shipped wrapper
# in turn; the wrapper_version preference, for pinning a wrapper on a machine
# without the driver; the installed driver; and failing all of those the newest
# wrapper, so that the package can at least be loaded.  the choice is made at
# precompilation.  the preference and the driver library are both tracked, so
# changing either recompiles; the environment variable is not, which is why
# it is for the test suite only
const wrapper_version, load_note = let
    pinned = something(get(ENV, "NIDAQ_WRAPPER_VERSION", nothing),
                       @load_preference("wrapper_version", nothing), Some(nothing))
    if pinned !== nothing
        v = VersionNumber(pinned)
        v in shipped_versions ||
            error("NIDAQ.jl has no wrapper for NI-DAQmx $v; it ships $(join(shipped_versions, ", "))")
        v, nothing
    elseif driver_available()
        installed = installed_version()
        selected = select_wrapper(installed)
        selected === nothing &&
            error("NI-DAQmx $installed is older than any version NIDAQ.jl supports; pin an older release of NIDAQ.jl, see the README")
        selected, selected == installed ? nothing :
            "NI-DAQmx $installed is installed; using the NIDAQ.jl wrapper for $selected"
    else
        maximum(shipped_versions), nothing
    end
end

include("constants_V$wrapper_version.jl")
include("functions_V$wrapper_version.jl")

function __init__()
    if !driver_available()
        @warn "NI-DAQmx was not found, so NIDAQ.jl loaded its wrapper for $wrapper_version but every call into the driver will fail.  Install NI-DAQmx from ni.com and restart Julia."
    elseif load_note !== nothing
        @info load_note
    end
end

# value => name for the signed Val_* enumeration constants, used to report
# enumerated properties by name.  there is deliberately no such table for the
# unsigned constants: those are attribute ids, and every UInt32 property is a
# plain number such as a count, size, or serial number
const signed_constants = Dict{Int64,Symbol}()

# several constants share a value, e.g. Val_Rising and Val_RisingSlope are both
# 10280.  keep the shortest name for each value, which is also the familiar one
function _remember!(d::Dict, value, name::Symbol)
    old = get(d, value, nothing)
    if old === nothing || length(String(name)) < length(String(old))
        d[value] = name
    end
    nothing
end

# some Int32 properties are bitmasks of the Val_Bit_<family>_<flag> constants
# rather than single enumeration values.  they are recognised by name suffix,
# and the flags of each family are collected while the constants are aliased
const bitmask_families = ("TrigUsage" => "TriggerUsageTypes",
                          "Couplings" => "CouplingTypes",
                          "TermCfgs"  => "TermCfg")
const bit_flags = Dict{String,Vector{Pair{Int32,Symbol}}}()   # family => [bit => name]
function bitmask_family(name::AbstractString)
    i = findfirst(p -> endswith(name, p.first), bitmask_families)
    isnothing(i) ? nothing : bitmask_families[i].second
end

# the few Int32 properties which hold a plain number rather than an
# enumeration value, and so must not be looked up in signed_constants
const plain_properties = ("BridgeBalanceCoarsePot",      # 0 to 127
                          "BridgeBalanceFinePot",        # 0 to 4095
                          "SampClkOverrunSentinelVal")   # user-chosen sentinel

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
    flags::Union{Nothing,String}      # bit-flag family if the value is a bitmask
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
            PropertyInfo(pname, getter, setter, eltype(out), length(argtypes) == nargs+1,
                         bitmask_family(pname))
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
        push!(public_names, Symbol(sym_str))
    elseif val isa Signed
        sym_str[1:min(end,4)]=="Val_" || continue
        @eval const $(Symbol(sym_str)) = convert(Int32,$sym)
        _remember!(signed_constants, val, Symbol(sym_str))
        push!(public_names, Symbol(sym_str))
        m = match(r"^Val_Bit_([A-Za-z]+)_\w+$", sym_str)
        m === nothing || push!(get!(bit_flags, m.captures[1], Pair{Int32,Symbol}[]),
                               Int32(val) => Symbol(sym_str))
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

for f in (:analog_input, :analog_output,
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

# a NUL-terminated buffer of Cchar for passing a string to the driver
str2code(s::String) = Ref(Cchar.(codeunits(s * '\0')), 1)

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

