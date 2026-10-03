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

    # named constants round trip through the decoding used by getproperties.
    # several constants share a value, so compare values rather than names
    @test getfield(NIDAQ, NIDAQ._decode(Int32(NIDAQ.Val_Rising))) == NIDAQ.Val_Rising
    @test NIDAQ._decode(Int32(-987654)) === Int32(-987654)
    # UInt32 values are counts and sizes, never names, even when one happens to
    # equal an attribute id such as AI_Max
    @test NIDAQ._decode(NIDAQ.AI_Max) === NIDAQ.AI_Max
    @test NIDAQ._decode(UInt32[0x1860, 4]) == UInt32[0x1860, 4]
    # and a few Int32 properties are plain numbers too
    @test "BridgeBalanceCoarsePot" in NIDAQ.plain_properties
    @test haskey(NIDAQ.property_table["AI"], "BridgeBalanceCoarsePot")
    @test NIDAQ._decode(Cchar.(codeunits("a, b\0"))) == ["a", "b"]
    # the shortest of several names sharing a value wins, so the familiar one is reported
    @test NIDAQ._decode(Int32(NIDAQ.Val_Rising)) == :Val_Rising
    @test NIDAQ._decode(Int32(NIDAQ.Val_Falling)) == :Val_Falling

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
