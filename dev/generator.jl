# generate the wrapper for one version of NI-DAQmx from its C header.
#
#   julia --project=dev dev/generator.jl [version=26.5.0] [header=<path>] [outdir=<dir>]
#
# with no arguments it wraps the installed driver: the version is asked of the
# driver, the header is the copy NI installs with its C support, and the files
# are written to src.  three files result, each named for the version:
#
#   constants_V<version>.jl   types and constants
#   functions_V<version>.jl   one ccall for each C function
#   valuesets_V<version>.jl   which constants each enumerated property can take
#
# what is written is exactly what ships, with no hand edits, and the test suite
# checks that by regenerating and comparing.  three things here make it so:
#
# - the header spells its 64-bit integers __int64, which Clang understands only
#   with -fms-extensions.  without that flag every uInt64 argument comes out as
#   a 32-bit Cint, which the driver then reads 64 bits of
# - generator.toml leaves out two macros, __CFUNC and CVICALLBACK, whose values
#   are the calling conventions __stdcall and __cdecl and mean nothing in Julia
# - the driver's bool32 is a typedef of uInt32, but NIDAQ.jl needs it to be its
#   own Bool32 type so that boolean properties can be told apart from numbers
#
# for the record, this is what used to be done by hand to the generator's
# output, version by version.  it explains why the older wrappers in src look
# the way they do, and why they cannot simply be regenerated:
#
#   every version   in the constants, delete or comment out `const __CFUNC =
#                   __stdcall` and `const CVICALLBACK = CVICDECL`, and change
#                   `const bool32 = uInt32` to `const bool32 = Bool32`.  those
#                   are the edits this script now makes
#   23.5            comment out the accessor functions Clang.jl writes for the
#                   CVITime struct
#   19.6            add `struct CVITime; lsb::uInt64; msb::int64; end`
#   17.1            comment out `const CVIAbsoluteTime = VOID`
#   15 to 18        comment out `using Compat`
#   21.3 and older  in the functions, replace `Cstring` with `SafeCstring`, an
#                   alias for Ref{UInt8}, because Cstring is wrong for a buffer
#                   which the driver fills in
#   18 and older    in the functions, replace `Ptr` with `Ref` throughout, then
#                   `CallbackRef` back to `CallbackPtr`
#   Julia 0.7       rename arguments called `type` to `_type`
#
# and in October 2026 the 18.6 to 23.5 wrappers were corrected to work with the
# package as it now is: every string became `Ptr{Cchar}`, which did away with
# SafeCstring, and in 23.5 the int64 and uInt64 typedefs and the seventeen
# uInt64 arguments which had come out as Cint were put right, that being the
# damage -fms-extensions prevents

using Clang.Generators
using Libdl

include("generate_valuesets.jl")    # find_header, keyword_args, write_valuesets

# the version of the installed driver
function installed_version()
    lib = Libdl.find_library(["nicaiu", "libnidaqmx"])
    isempty(lib) && error("NI-DAQmx is not installed; pass version=<major.minor.update>")
    handle = Libdl.dlopen(lib)
    function part(name)
        value = Ref{UInt32}(0)
        ccall(Libdl.dlsym(handle, name), Int32, (Ref{UInt32},), value)
        Int(value[])
    end
    VersionNumber(part(:DAQmxGetSysNIDAQMajorVersion), part(:DAQmxGetSysNIDAQMinorVersion),
                  part(:DAQmxGetSysNIDAQUpdateVersion))
end

function generate(; version, header, outdir)
    constants = joinpath(outdir, "constants_V$version.jl")
    functions = joinpath(outdir, "functions_V$version.jl")
    valuesets = joinpath(outdir, "valuesets_V$version.jl")

    options = load_options(joinpath(@__DIR__, "generator.toml"))
    options["general"]["output_common_file_path"] = constants
    options["general"]["output_api_file_path"] = functions
    args = get_default_args()    # must come first, with our own flags appended
    push!(args, "-fms-extensions")
    build!(create_context([header], args, options))

    text = read(constants, String)
    typedef = "const bool32 = uInt32\n"
    count(typedef, text) == 1 ||
        error("expected `$(chomp(typedef))` exactly once in $constants; has the header changed?")
    write(constants, replace(text, typedef => "const bool32 = Bool32\n"))

    write_valuesets(header, valuesets)
    println("wrote the wrapper for NI-DAQmx $version to $outdir")
end

if abspath(PROGRAM_FILE) == @__FILE__
    args = keyword_args(ARGS; allowed = ("version", "header", "outdir"))
    header = get(args, "header", find_header())
    isnothing(header) && error("NIDAQmx.h was not found; install NI's C support or pass header=<path>")
    version = haskey(args, "version") ? VersionNumber(args["version"]) : installed_version()
    generate(; version, header, outdir = abspath(get(args, "outdir", joinpath(@__DIR__, "..", "src"))))
end
