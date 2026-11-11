# extract from NIDAQmx.h which constants each enumerated property can take.
#
# many of the driver's constants share a value: 10280 is both Val_Rising and
# Val_RisingSlope, and 1 is fourteen different things.  a value can therefore
# only be named by knowing which property it came from.  the header says so in
# its "Attribute Values" section, which is a series of blocks like
#
#   //*** Values for DAQmx_AI_ACExcit_WireMode ***
#   //*** Value set ACExcitWireMode ***
#   #define DAQmx_Val_4Wire      4 // 4-Wire
#   #define DAQmx_Val_5Wire      5 // 5-Wire
#
# with one "Values for" line for each property which draws on the value set.
# this script turns those blocks into two tables for NIDAQ.jl to load.
# generator.jl runs it, or by itself, which needs nothing but Julia:
#
#   julia dev/generate_valuesets.jl output=<file> [header=<path>]

# NI's header: the copy installed with the driver's C support, or failing that
# one placed beside this script.  nothing if there is none
function find_header()
    candidates = [
        raw"C:\Program Files (x86)\National Instruments\NI-DAQ\DAQmx ANSI C Dev\include\NIDAQmx.h",
        raw"C:\Program Files (x86)\National Instruments\Shared\ExternalCompilerSupport\C\include\NIDAQmx.h",
        "/usr/include/NIDAQmx.h",
        joinpath(@__DIR__, "NIDAQmx.h")]
    i = findfirst(isfile, candidates)
    isnothing(i) ? nothing : candidates[i]
end

# command-line arguments of the form key=value
function keyword_args(args; allowed)
    parsed = Dict{String,String}()
    for arg in args
        key, value = occursin('=', arg) ? split(arg, '='; limit=2) : (arg, "")
        key in allowed && !isempty(value) ||
            error("unrecognised argument `$arg`; expected $(join(allowed .* "=...", ", "))")
        parsed[key] = value
    end
    parsed
end

# returns the members of each value set, and the value set of each property.
# properties are named as their getters are without the DAQmxGet prefix, which
# is the header's name without its underscores: DAQmx_AI_ACExcit_WireMode is
# read by DAQmxGetAIACExcitWireMode
function parse_valuesets(header)
    members = Dict{String,Vector{String}}()
    property_set = Dict{String,String}()
    attributes = String[]        # the "Values for" lines of the block being read
    current = nothing            # the members of the value set being read
    for line in eachline(header)
        if (m = match(r"^//\*\*\* Values? for (.*)$", line)) !== nothing
            current === nothing || (empty!(attributes); current = nothing)
            for a in eachmatch(r"DAQmx_([A-Za-z0-9_]+)", m.captures[1])
                push!(attributes, replace(a.captures[1], "_" => ""))
            end
        elseif (m = match(r"^//\*\*\* Value set (\S+) \*\*\*", line)) !== nothing
            name = m.captures[1]
            haskey(members, name) && error("value set $name appears twice in $header")
            current = members[name] = String[]
            for a in attributes
                get(property_set, a, name) == name ||
                    error("$a is given two value sets, $(property_set[a]) and $name")
                property_set[a] = name
            end
        elseif (m = match(r"^#define DAQmx_(Val_[A-Za-z0-9_]+)\s", line)) !== nothing
            current === nothing || push!(current, m.captures[1])
        elseif !startswith(line, "//")       # a blank line or anything else ends the block
            empty!(attributes); current = nothing
        end
    end
    # bit flags are not enumerations; NIDAQ.jl recognises those properties itself
    for (name, constants) in members
        all(startswith("Val_Bit_"), constants) || continue
        delete!(members, name)
        filter!(p -> p.second != name, property_set)
    end
    # keep only the value sets some property uses
    filter!(p -> p.first in values(property_set), members)
    members, property_set
end

function write_valuesets(header, output)
    members, property_set = parse_valuesets(header)
    isempty(property_set) && error("no value sets found in $header; has its format changed?")
    open(output, "w") do io
        print(io, """
            # generated from NIDAQmx.h by dev/generate_valuesets.jl; do not edit
            #
            # many of the driver's constants share a value, so a property's value can
            # only be named by knowing which of the driver's value sets the property
            # draws on.  properties are named as their getters are without the DAQmxGet
            # prefix, and properties which are absent are not enumerations

            const value_set_members = Dict{String,Vector{Symbol}}(
            """)
        for name in sort!(collect(keys(members)))
            println(io, "    ", repr(name), " => [", join(repr.(Symbol.(members[name])), ", "), "],")
        end
        print(io, """
            )

            const property_value_sets = Dict{String,String}(
            """)
        for property in sort!(collect(keys(property_set)))
            println(io, "    ", repr(property), " => ", repr(property_set[property]), ",")
        end
        println(io, ")")
    end
    println("wrote ", length(property_set), " properties in ", length(members), " value sets to ", output)
end

if abspath(PROGRAM_FILE) == @__FILE__
    args = keyword_args(ARGS; allowed = ("output", "header"))
    haskey(args, "output") || error("say where to write the tables with output=<file>")
    header = get(args, "header", find_header())
    isnothing(header) && error("NIDAQmx.h was not found; install NI's C support or pass header=<path>")
    write_valuesets(header, args["output"])
end
