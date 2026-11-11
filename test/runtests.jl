using NIDAQ, Test
import LinearAlgebra

@testset "no hardware needed" begin
    # str2code yields a NUL-terminated buffer of Cchar
    @test NIDAQ.str2code("Dev1").x == Cchar.(codeunits("Dev1\0"))
    @test NIDAQ.str2code("").x == Cchar[0]

    # cstring stops at the first NUL and tolerates its absence
    @test NIDAQ.cstring(Cchar[]) == ""
    @test NIDAQ.cstring(Cchar.(codeunits("abc\0xyz"))) == "abc"
    @test NIDAQ.cstring(Cchar.(codeunits("abc"))) == "abc"

    # the aliasing loop strips the DAQmx prefix, converts constants to 32 bits,
    # and makes everything const
    @test NIDAQ.Val_Rising == NIDAQ.DAQmx_Val_Rising
    @test NIDAQ.AI_Max == NIDAQ.DAQmx_AI_Max
    @test NIDAQ.CfgSampClkTiming === NIDAQ.DAQmxCfgSampClkTiming
    @test isconst(NIDAQ, :Val_Rising) && isconst(NIDAQ, :CfgSampClkTiming)
    @test NIDAQ.Val_Rising isa Int32
    @test NIDAQ.AI_Max isa UInt32
    @static if VERSION >= v"1.11"
        @test Base.ispublic(NIDAQ, :CfgSampClkTiming) && !Base.isexported(NIDAQ, :CfgSampClkTiming)
    end

    # a value is named from the value set of the property it came from, since
    # many constants share a value: 10280 is Val_Rising to an edge property and
    # Val_RisingSlope to a slope property
    @test NIDAQ.Val_Rising == NIDAQ.Val_RisingSlope
    edge = NIDAQ.property_table["CI"]["CountEdgesActiveEdge"].values
    @test NIDAQ._decode_enum(NIDAQ.Val_Rising, edge) == :Val_Rising
    @test NIDAQ._decode_enum(NIDAQ.Val_Falling, edge) == :Val_Falling
    slope = NIDAQ.property_decoder("AnlgEdgeStartTrigSlope")
    @test NIDAQ._decode_enum(NIDAQ.Val_Rising, slope) == :Val_RisingSlope
    @test NIDAQ.property_table["AI"]["AccelUnits"].values[NIDAQ.Val_g] == :Val_AccelUnit_g
    # the driver's ...Ex getters share the value set of their plain namesakes
    @test NIDAQ.property_decoder("AIConvActiveEdgeEx") === NIDAQ.property_decoder("AIConvActiveEdge") === edge
    @test isnothing(NIDAQ.property_decoder("NoSuchProperty"))
    # a value its set does not list stays a number, and a list is converted
    # only if every element is known
    @test NIDAQ._decode_enum(Int32(-987654), edge) === Int32(-987654)
    @test NIDAQ._decode_enum(Int32[NIDAQ.Val_Rising, NIDAQ.Val_Falling], edge) == [:Val_Rising, :Val_Falling]
    @test NIDAQ._decode_enum(Int32[NIDAQ.Val_Rising, 3], edge) == Int32[NIDAQ.Val_Rising, 3]
    @test NIDAQ._decode_enum(Int32[], edge) == Symbol[]
    # every Int32 property is an enumeration with a value set or a bitmask,
    # apart from the three which the header documents as plain numbers
    plain = [g*n for (g, tbl) in NIDAQ.property_table for (n, p) in tbl
             if p.eltype === Int32 && isnothing(p.values) && isnothing(p.flags)]
    @test plain ⊆ ["AIBridgeBalanceCoarsePot", "AIBridgeBalanceFinePot", "CISampClkOverrunSentinelVal"]
    @test isnothing(NIDAQ.property_table["AI"]["BridgeBalanceCoarsePot"].values)
    # and nothing else is named: UInt32 values are counts and sizes, even when
    # one happens to equal an attribute id such as AI_Max
    @test all(isnothing(p.values) for tbl in values(NIDAQ.property_table) for p in values(tbl) if p.eltype !== Int32)
    @test NIDAQ._decode(NIDAQ.AI_Max) === NIDAQ.AI_Max
    @test NIDAQ._decode(UInt32[0x1860, 4]) == UInt32[0x1860, 4]
    @test NIDAQ._decode(Int32(1)) === Int32(1)
    @test NIDAQ._decode(Cchar.(codeunits("a, b\0"))) == ["a", "b"]
    # the table of value sets is the newest one shipped.  every property in it
    # points at a set, and with the matching wrapper every constant exists
    @test NIDAQ.valueset_version == maximum(NIDAQ.shipped_versions)
    @test all(haskey(NIDAQ.value_set_members, s) for s in values(NIDAQ.property_value_sets))
    if NIDAQ.wrapper_version == NIDAQ.valueset_version
        @test all(isdefined(NIDAQ, c) for cs in values(NIDAQ.value_set_members) for c in cs)
        @test all(length(NIDAQ.value_names[s]) == length(cs) for (s, cs) in NIDAQ.value_set_members)
    end
    # and it is exactly what dev/generate_valuesets.jl makes of the header.
    # the header is NI's and is not in the repository, so this runs only where
    # a copy has been put in dev
    header = joinpath(@__DIR__, "..", "dev", "NIDAQmx.h")
    if isfile(header)
        shipped = joinpath(@__DIR__, "..", "src", "valuesets_V$(NIDAQ.valueset_version).jl")
        regenerated = tempname()
        run(pipeline(`$(Base.julia_cmd()) --startup-file=no $(joinpath(@__DIR__, "..", "dev", "generate_valuesets.jl")) $header $regenerated`, stdout=devnull))
        unix(file) = replace(read(file, String), "\r\n" => "\n")
        @test unix(regenerated) == unix(shipped)
    end

    # bitmask properties decode to the list of flags set, not to a single name
    trig = NIDAQ.bit_flags["TriggerUsageTypes"]
    @test NIDAQ._decode_flags(Int32(14), trig) == [:Val_Bit_TriggerUsageTypes_Pause,
                                                   :Val_Bit_TriggerUsageTypes_Reference,
                                                   :Val_Bit_TriggerUsageTypes_Start]
    @test NIDAQ._decode_flags(Int32(0), trig) == Symbol[]
    @test NIDAQ.property_table["Dev"]["AITrigUsage"].flags == "TriggerUsageTypes"
    @test NIDAQ.property_table["Dev"]["AICouplings"].flags == "CouplingTypes"
    @test isnothing(NIDAQ.property_table["AI"]["Coupling"].flags)

    # Bool32 is a 32-bit integer on the wire and a Bool once decoded.  it is
    # public but not exported
    @test reinterpret(UInt32, reinterpret(NIDAQ.Bool32, UInt32(1))) == 1
    @test NIDAQ._decode(reinterpret(NIDAQ.Bool32, UInt32(0))) === false
    @test NIDAQ._decode(reinterpret(NIDAQ.Bool32, UInt32(5))) === true
    # it converts from Bool and from integers, zero being false, so that true,
    # false, and the driver's constants can be passed wherever one is wanted
    @test NIDAQ.Bool32(true) === reinterpret(NIDAQ.Bool32, UInt32(1))
    @test NIDAQ.Bool32(false) === reinterpret(NIDAQ.Bool32, UInt32(0))
    @test NIDAQ.Bool32(NIDAQ.Val_GroupByScanNumber) === NIDAQ.Bool32(true)
    @test NIDAQ.Bool32(NIDAQ.Val_GroupByChannel) === NIDAQ.Bool32(false)
    @test NIDAQ.Bool32(5) === NIDAQ.Bool32(true)
    @test NIDAQ.Bool32(NIDAQ.Bool32(true)) === NIDAQ.Bool32(true)
    @test convert(NIDAQ.Bool32, true) === NIDAQ.Bool32(true)
    @test Ref{NIDAQ.Bool32}(true)[] === NIDAQ.Bool32(true)
    @test Base.cconvert(NIDAQ.Bool32, false) === NIDAQ.Bool32(false)   # what ccall does
    # and back again, any nonzero value being true
    @test Bool(NIDAQ.Bool32(true)) === true
    @test Bool(NIDAQ.Bool32(false)) === false
    @test Bool(reinterpret(NIDAQ.Bool32, UInt32(5))) === true
    @test NIDAQ.Bool32(true) == true
    @test NIDAQ.Bool32(false) != true
    @test sprint(show, NIDAQ.Bool32(true)) == "NIDAQ.Bool32(true)"
    @test isempty(Test.detect_ambiguities(NIDAQ))
    @test !Base.isexported(NIDAQ, :Bool32)
    @static if VERSION >= v"1.11"
        @test Base.ispublic(NIDAQ, :Bool32)
    end

    # enumerated options are lowercase Symbols mapped onto the driver's constants
    @test NIDAQ._lookup(NIDAQ.terminal_configs, :rse, "terminal_config") == NIDAQ.Val_RSE
    @test NIDAQ._lookup(NIDAQ.terminal_configs, :default, "terminal_config") == NIDAQ.Val_Cfg_Default
    @test NIDAQ._lookup(NIDAQ.edges, :falling, "edge") == NIDAQ.Val_Falling
    @test NIDAQ._lookup(NIDAQ.time_units, :ticks, "units") == NIDAQ.Val_Ticks
    @test NIDAQ._lookup(NIDAQ.angle_units, :degrees, "units") == NIDAQ.Val_Degrees
    @test NIDAQ._lookup(NIDAQ.decodings, :x4, "decoding") == NIDAQ.Val_X4
    @test NIDAQ._lookup(NIDAQ.z_index_phases, :a_low_b_high, "z_index_phase") == NIDAQ.Val_ALowBHigh
    @test NIDAQ._lookup(NIDAQ.idle_states, :high, "idle_state") == NIDAQ.Val_High
    err = try NIDAQ._lookup(NIDAQ.edges, :sideways, "edge"); catch e; e; end
    @test err isa ArgumentError
    @test occursin(":rising", err.msg) && occursin(":falling", err.msg) && occursin(":sideways", err.msg)

    # the property table was built at load time
    p = NIDAQ.property_table["AI"]["Max"]
    @test p.getter === NIDAQ.DAQmxGetAIMax && p.setter === NIDAQ.DAQmxSetAIMax
    @test p.eltype === Float64 && p.scalar
    p = NIDAQ.property_table["Sys"]["DevNames"]
    @test isnothing(p.setter) && p.eltype === Cchar && !p.scalar

    # which wrapper gets loaded
    @test NIDAQ.driver_available() isa Bool
    @test NIDAQ.wrapper_version in NIDAQ.shipped_versions
    @test v"26.5.0" in NIDAQ.shipped_versions
    @test issorted(NIDAQ.shipped_versions)
    # a driver newer than every wrapper gets the newest; an older one the
    # newest not newer than it; one older than all of them gets nothing
    @test NIDAQ.select_wrapper(v"99.0.0") == maximum(NIDAQ.shipped_versions)
    @test NIDAQ.select_wrapper(v"26.5.1") == v"26.5.0"
    @test NIDAQ.select_wrapper(v"23.5.0") == v"23.5.0"
    @test NIDAQ.select_wrapper(v"22.0.0") == v"21.3.0"
    @test isnothing(NIDAQ.select_wrapper(v"17.1.0"))
    @test NIDAQ.select_wrapper(v"2.0.0", [v"1.0.0", v"3.0.0"]) == v"1.0.0"

    # the timeout keyword of read and write is in seconds, Inf waiting forever
    @test NIDAQ._timeout(2) === 2.0
    @test NIDAQ._timeout(0) === 0.0
    @test NIDAQ._timeout(Inf) === NIDAQ.DAQmx_Val_WaitInfinitely
    @test NIDAQ._timeout(NIDAQ.default_timeout) === 10.0
    @test_throws ArgumentError NIDAQ._timeout(-1)
    @test_throws ArgumentError NIDAQ._timeout(NaN)
end

# everything else needs the driver and a device.  without them, as on a CI
# runner, the package still loads and the tests above still run
if !NIDAQ.driver_available()
    @info "NI-DAQmx is not installed; skipping the hardware tests"
elseif isempty(devices())
    @info "no data acquisition devices found; skipping the hardware tests"
else
    include("hardware.jl")
end
