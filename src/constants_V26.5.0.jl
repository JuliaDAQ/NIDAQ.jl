const int8 = Int8

const uInt8 = Cuchar

const int16 = Cshort

const uInt16 = Cushort

const int32 = Cint

const uInt32 = Cuint

const float32 = Cfloat

const float64 = Cdouble

const int64 = Clonglong

const uInt64 = Culonglong

struct CVITime
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{CVITime}, f::Symbol)
    f === :lsb && return Ptr{uInt64}(x + 0)
    f === :msb && return Ptr{int64}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::CVITime, f::Symbol)
    r = Ref{CVITime}(x)
    ptr = Base.unsafe_convert(Ptr{CVITime}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{CVITime}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function Base.propertynames(x::CVITime, private::Bool = false)
    (:lsb, :msb, if private
            fieldnames(typeof(x))
        else
            ()
        end...)
end

struct CVIAbsoluteTime
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{CVIAbsoluteTime}, f::Symbol)
    f === :cviTime && return Ptr{CVITime}(x + 0)
    f === :u32Data && return Ptr{NTuple{4, uInt32}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::CVIAbsoluteTime, f::Symbol)
    r = Ref{CVIAbsoluteTime}(x)
    ptr = Base.unsafe_convert(Ptr{CVIAbsoluteTime}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{CVIAbsoluteTime}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function Base.propertynames(x::CVIAbsoluteTime, private::Bool = false)
    (:cviTime, :u32Data, if private
            fieldnames(typeof(x))
        else
            ()
        end...)
end

# const bool32 = uInt32
const bool32 = Bool32

const TaskHandle = Ptr{Cvoid}

const CalHandle = uInt32

# typedef int32 ( CVICALLBACK * DAQmxEveryNSamplesEventCallbackPtr
const DAQmxEveryNSamplesEventCallbackPtr = Ptr{Cvoid}

# typedef int32 ( CVICALLBACK * DAQmxDoneEventCallbackPtr
const DAQmxDoneEventCallbackPtr = Ptr{Cvoid}

# typedef int32 ( CVICALLBACK * DAQmxSignalEventCallbackPtr
const DAQmxSignalEventCallbackPtr = Ptr{Cvoid}

# const __CFUNC = __stdcall

# Skipping MacroDefinition: __CFUNC_C __cdecl

# Skipping MacroDefinition: __CFUNCPTRVAR __cdecl

# Skipping MacroDefinition: CVICDECL __cdecl

# const CVICALLBACK = CVICDECL

const TRUE = Clong(1)

const FALSE = Clong(0)

const NULL = Clong(0)

const DAQmx_Buf_Input_BufSize = 0x186c

const DAQmx_Buf_Input_OnbrdBufSize = 0x230a

const DAQmx_Buf_Output_BufSize = 0x186d

const DAQmx_Buf_Output_OnbrdBufSize = 0x230b

const DAQmx_SelfCal_Supported = 0x1860

const DAQmx_SelfCal_LastTemp = 0x1864

const DAQmx_ExtCal_RecommendedInterval = 0x1868

const DAQmx_ExtCal_LastTemp = 0x1867

const DAQmx_Cal_UserDefinedInfo = 0x1861

const DAQmx_Cal_UserDefinedInfo_MaxSize = 0x191c

const DAQmx_Cal_DevTemp = 0x223b

const DAQmx_Cal_AccConnectionCount = 0x2feb

const DAQmx_Cal_RecommendedAccConnectionCountLimit = 0x2fec

const DAQmx_AI_Max = 0x17dd

const DAQmx_AI_Min = 0x17de

const DAQmx_AI_CustomScaleName = 0x17e0

const DAQmx_AI_MeasType = 0x0695

const DAQmx_AI_Voltage_Units = 0x1094

const DAQmx_AI_Voltage_dBRef = 0x29b0

const DAQmx_AI_Voltage_ACRMS_Units = 0x17e2

const DAQmx_AI_Temp_Units = 0x1033

const DAQmx_AI_Thrmcpl_Type = 0x1050

const DAQmx_AI_Thrmcpl_ScaleType = 0x29d0

const DAQmx_AI_Thrmcpl_CJCSrc = 0x1035

const DAQmx_AI_Thrmcpl_CJCVal = 0x1036

const DAQmx_AI_Thrmcpl_CJCChan = 0x1034

const DAQmx_AI_RTD_Type = 0x1032

const DAQmx_AI_RTD_R0 = 0x1030

const DAQmx_AI_RTD_A = 0x1010

const DAQmx_AI_RTD_B = 0x1011

const DAQmx_AI_RTD_C = 0x1013

const DAQmx_AI_Thrmstr_A = 0x18c9

const DAQmx_AI_Thrmstr_B = 0x18cb

const DAQmx_AI_Thrmstr_C = 0x18ca

const DAQmx_AI_Thrmstr_R1 = 0x1061

const DAQmx_AI_ForceReadFromChan = 0x18f8

const DAQmx_AI_Current_Units = 0x0701

const DAQmx_AI_Current_ACRMS_Units = 0x17e3

const DAQmx_AI_Strain_Units = 0x0981

const DAQmx_AI_StrainGage_ForceReadFromChan = 0x2ffa

const DAQmx_AI_StrainGage_GageFactor = 0x0994

const DAQmx_AI_StrainGage_PoissonRatio = 0x0998

const DAQmx_AI_StrainGage_Cfg = 0x0982

const DAQmx_AI_RosetteStrainGage_RosetteType = 0x2ffe

const DAQmx_AI_RosetteStrainGage_Orientation = 0x2ffc

const DAQmx_AI_RosetteStrainGage_StrainChans = 0x2ffb

const DAQmx_AI_RosetteStrainGage_RosetteMeasType = 0x2ffd

const DAQmx_AI_Resistance_Units = 0x0955

const DAQmx_AI_Freq_Units = 0x0806

const DAQmx_AI_Freq_ThreshVoltage = 0x0815

const DAQmx_AI_Freq_Hyst = 0x0814

const DAQmx_AI_LVDT_Units = 0x0910

const DAQmx_AI_LVDT_Sensitivity = 0x0939

const DAQmx_AI_LVDT_SensitivityUnits = 0x219a

const DAQmx_AI_RVDT_Units = 0x0877

const DAQmx_AI_RVDT_Sensitivity = 0x0903

const DAQmx_AI_RVDT_SensitivityUnits = 0x219b

const DAQmx_AI_EddyCurrentProxProbe_Units = 0x2ac0

const DAQmx_AI_EddyCurrentProxProbe_Sensitivity = 0x2abe

const DAQmx_AI_EddyCurrentProxProbe_SensitivityUnits = 0x2abf

const DAQmx_AI_Power_Units = 0x31ec

const DAQmx_AI_CalculatedPowerVoltage_Max = 0x31ed

const DAQmx_AI_CalculatedPowerVoltage_Min = 0x31ee

const DAQmx_AI_CalculatedPowerCurrent_Max = 0x31ef

const DAQmx_AI_CalculatedPowerCurrent_Min = 0x31f0

const DAQmx_AI_SoundPressure_MaxSoundPressureLvl = 0x223a

const DAQmx_AI_SoundPressure_Units = 0x1528

const DAQmx_AI_SoundPressure_dBRef = 0x29b1

const DAQmx_AI_Microphone_Sensitivity = 0x1536

const DAQmx_AI_Accel_Units = 0x0673

const DAQmx_AI_Accel_dBRef = 0x29b2

const DAQmx_AI_Accel_4WireDCVoltage_Sensitivity = 0x3115

const DAQmx_AI_Accel_4WireDCVoltage_SensitivityUnits = 0x3116

const DAQmx_AI_Accel_Sensitivity = 0x0692

const DAQmx_AI_Accel_SensitivityUnits = 0x219c

const DAQmx_AI_Accel_Charge_Sensitivity = 0x3113

const DAQmx_AI_Accel_Charge_SensitivityUnits = 0x3114

const DAQmx_AI_Velocity_Units = 0x2ff4

const DAQmx_AI_Velocity_IEPESensor_dBRef = 0x2ff5

const DAQmx_AI_Velocity_IEPESensor_Sensitivity = 0x2ff6

const DAQmx_AI_Velocity_IEPESensor_SensitivityUnits = 0x2ff7

const DAQmx_AI_Force_Units = 0x2f75

const DAQmx_AI_Force_IEPESensor_Sensitivity = 0x2f81

const DAQmx_AI_Force_IEPESensor_SensitivityUnits = 0x2f82

const DAQmx_AI_Pressure_Units = 0x2f76

const DAQmx_AI_Torque_Units = 0x2f77

const DAQmx_AI_Bridge_Units = 0x2f92

const DAQmx_AI_Bridge_ElectricalUnits = 0x2f87

const DAQmx_AI_Bridge_PhysicalUnits = 0x2f88

const DAQmx_AI_Bridge_ScaleType = 0x2f89

const DAQmx_AI_Bridge_TwoPointLin_First_ElectricalVal = 0x2f8a

const DAQmx_AI_Bridge_TwoPointLin_First_PhysicalVal = 0x2f8b

const DAQmx_AI_Bridge_TwoPointLin_Second_ElectricalVal = 0x2f8c

const DAQmx_AI_Bridge_TwoPointLin_Second_PhysicalVal = 0x2f8d

const DAQmx_AI_Bridge_Table_ElectricalVals = 0x2f8e

const DAQmx_AI_Bridge_Table_PhysicalVals = 0x2f8f

const DAQmx_AI_Bridge_Poly_ForwardCoeff = 0x2f90

const DAQmx_AI_Bridge_Poly_ReverseCoeff = 0x2f91

const DAQmx_AI_Charge_Units = 0x3112

const DAQmx_AI_Is_TEDS = 0x2983

const DAQmx_AI_TEDS_Units = 0x21e0

const DAQmx_AI_Coupling = 0x0064

const DAQmx_AI_Impedance = 0x0062

const DAQmx_AI_TermCfg = 0x1097

const DAQmx_AI_InputSrc = 0x2198

const DAQmx_AI_ResistanceCfg = 0x1881

const DAQmx_AI_LeadWireResistance = 0x17ee

const DAQmx_AI_Bridge_Cfg = 0x0087

const DAQmx_AI_Bridge_NomResistance = 0x17ec

const DAQmx_AI_Bridge_InitialVoltage = 0x17ed

const DAQmx_AI_Bridge_InitialRatio = 0x2f86

const DAQmx_AI_Bridge_ShuntCal_Enable = 0x0094

const DAQmx_AI_Bridge_ShuntCal_Select = 0x21d5

const DAQmx_AI_Bridge_ShuntCal_ShuntCalASrc = 0x30ca

const DAQmx_AI_Bridge_ShuntCal_GainAdjust = 0x193f

const DAQmx_AI_Bridge_ShuntCal_ShuntCalAResistance = 0x2f78

const DAQmx_AI_Bridge_ShuntCal_ShuntCalAActualResistance = 0x2f79

const DAQmx_AI_Bridge_ShuntCal_ShuntCalBResistance = 0x2f7a

const DAQmx_AI_Bridge_ShuntCal_ShuntCalBActualResistance = 0x2f7b

const DAQmx_AI_Bridge_Balance_CoarsePot = 0x17f1

const DAQmx_AI_Bridge_Balance_FinePot = 0x18f4

const DAQmx_AI_CurrentShunt_Loc = 0x17f2

const DAQmx_AI_CurrentShunt_Resistance = 0x17f3

const DAQmx_AI_Excit_Sense = 0x30fd

const DAQmx_AI_Excit_Src = 0x17f4

const DAQmx_AI_Excit_Val = 0x17f5

const DAQmx_AI_Excit_UseForScaling = 0x17fc

const DAQmx_AI_Excit_UseMultiplexed = 0x2180

const DAQmx_AI_Excit_ActualVal = 0x1883

const DAQmx_AI_Excit_DCorAC = 0x17fb

const DAQmx_AI_Excit_VoltageOrCurrent = 0x17f6

const DAQmx_AI_Excit_IdleOutputBehavior = 0x30b8

const DAQmx_AI_ACExcit_Freq = 0x0101

const DAQmx_AI_ACExcit_SyncEnable = 0x0102

const DAQmx_AI_ACExcit_WireMode = 0x18cd

const DAQmx_AI_SensorPower_Voltage = 0x3169

const DAQmx_AI_SensorPower_Cfg = 0x316a

const DAQmx_AI_SensorPower_Type = 0x316b

const DAQmx_AI_OpenThrmcplDetectEnable = 0x2f72

const DAQmx_AI_Thrmcpl_LeadOffsetVoltage = 0x2fb8

const DAQmx_AI_Atten = 0x1801

const DAQmx_AI_ProbeAtten = 0x2a88

const DAQmx_AI_Lowpass_Enable = 0x1802

const DAQmx_AI_Lowpass_CutoffFreq = 0x1803

const DAQmx_AI_Lowpass_SwitchCap_ClkSrc = 0x1884

const DAQmx_AI_Lowpass_SwitchCap_ExtClkFreq = 0x1885

const DAQmx_AI_Lowpass_SwitchCap_ExtClkDiv = 0x1886

const DAQmx_AI_Lowpass_SwitchCap_OutClkDiv = 0x1887

const DAQmx_AI_DigFltr_Enable = 0x30bd

const DAQmx_AI_DigFltr_Type = 0x30be

const DAQmx_AI_DigFltr_Response = 0x30bf

const DAQmx_AI_DigFltr_Order = 0x30c0

const DAQmx_AI_DigFltr_Lowpass_CutoffFreq = 0x30c1

const DAQmx_AI_DigFltr_Highpass_CutoffFreq = 0x30c2

const DAQmx_AI_DigFltr_Bandpass_CenterFreq = 0x30c3

const DAQmx_AI_DigFltr_Bandpass_Width = 0x30c4

const DAQmx_AI_DigFltr_Notch_CenterFreq = 0x30c5

const DAQmx_AI_DigFltr_Notch_Width = 0x30c6

const DAQmx_AI_DigFltr_Coeff = 0x30c7

const DAQmx_AI_Filter_Enable = 0x3173

const DAQmx_AI_Filter_Freq = 0x3174

const DAQmx_AI_Filter_Response = 0x3175

const DAQmx_AI_Filter_Order = 0x3176

const DAQmx_AI_FilterDelay = 0x2fed

const DAQmx_AI_FilterDelayUnits = 0x3071

const DAQmx_AI_RemoveFilterDelay = 0x2fbd

const DAQmx_AI_FilterDelayAdjustment = 0x3074

const DAQmx_AI_AveragingWinSize = 0x2fee

const DAQmx_AI_ResolutionUnits = 0x1764

const DAQmx_AI_Resolution = 0x1765

const DAQmx_AI_RawSampSize = 0x22da

const DAQmx_AI_RawSampJustification = 0x0050

const DAQmx_AI_ADCTimingMode = 0x29f9

const DAQmx_AI_ADCCustomTimingMode = 0x2f6b

const DAQmx_AI_Dither_Enable = 0x0068

const DAQmx_AI_ChanCal_HasValidCalInfo = 0x2297

const DAQmx_AI_ChanCal_EnableCal = 0x2298

const DAQmx_AI_ChanCal_ApplyCalIfExp = 0x2299

const DAQmx_AI_ChanCal_ScaleType = 0x229c

const DAQmx_AI_ChanCal_Table_PreScaledVals = 0x229d

const DAQmx_AI_ChanCal_Table_ScaledVals = 0x229e

const DAQmx_AI_ChanCal_Poly_ForwardCoeff = 0x229f

const DAQmx_AI_ChanCal_Poly_ReverseCoeff = 0x22a0

const DAQmx_AI_ChanCal_OperatorName = 0x22a3

const DAQmx_AI_ChanCal_Desc = 0x22a4

const DAQmx_AI_ChanCal_Verif_RefVals = 0x22a1

const DAQmx_AI_ChanCal_Verif_AcqVals = 0x22a2

const DAQmx_AI_Rng_High = 0x1815

const DAQmx_AI_Rng_Low = 0x1816

const DAQmx_AI_DCOffset = 0x2a89

const DAQmx_AI_Gain = 0x1818

const DAQmx_AI_SampAndHold_Enable = 0x181a

const DAQmx_AI_AutoZeroMode = 0x1760

const DAQmx_AI_ChopEnable = 0x3143

const DAQmx_AI_DataXferMaxRate = 0x3117

const DAQmx_AI_DataXferMech = 0x1821

const DAQmx_AI_DataXferReqCond = 0x188b

const DAQmx_AI_DataXferCustomThreshold = 0x230c

const DAQmx_AI_UsbXferReqSize = 0x2a8e

const DAQmx_AI_UsbXferReqCount = 0x3000

const DAQmx_AI_MemMapEnable = 0x188c

const DAQmx_AI_RawDataCompressionType = 0x22d8

const DAQmx_AI_LossyLSBRemoval_CompressedSampSize = 0x22d9

const DAQmx_AI_DevScalingCoeff = 0x1930

const DAQmx_AI_EnhancedAliasRejectionEnable = 0x2294

const DAQmx_AI_OpenChanDetectEnable = 0x30ff

const DAQmx_AI_InputLimitsFaultDetect_UpperLimit = 0x318c

const DAQmx_AI_InputLimitsFaultDetect_LowerLimit = 0x318d

const DAQmx_AI_InputLimitsFaultDetectEnable = 0x318e

const DAQmx_AI_PowerSupplyFaultDetectEnable = 0x3191

const DAQmx_AI_OvercurrentDetectEnable = 0x3194

const DAQmx_AO_Max = 0x1186

const DAQmx_AO_Min = 0x1187

const DAQmx_AO_CustomScaleName = 0x1188

const DAQmx_AO_OutputType = 0x1108

const DAQmx_AO_Voltage_Units = 0x1184

const DAQmx_AO_Voltage_CurrentLimit = 0x2a1d

const DAQmx_AO_Current_Units = 0x1109

const DAQmx_AO_FuncGen_Type = 0x2a18

const DAQmx_AO_FuncGen_Freq = 0x2a19

const DAQmx_AO_FuncGen_Amplitude = 0x2a1a

const DAQmx_AO_FuncGen_Offset = 0x2a1b

const DAQmx_AO_FuncGen_StartPhase = 0x31c4

const DAQmx_AO_FuncGen_Square_DutyCycle = 0x2a1c

const DAQmx_AO_FuncGen_ModulationType = 0x2a22

const DAQmx_AO_FuncGen_FMDeviation = 0x2a23

const DAQmx_AO_OutputImpedance = 0x1490

const DAQmx_AO_LoadImpedance = 0x0121

const DAQmx_AO_IdleOutputBehavior = 0x2240

const DAQmx_AO_TermCfg = 0x188e

const DAQmx_AO_Common_Mode_Offset = 0x31cc

const DAQmx_AO_ResolutionUnits = 0x182b

const DAQmx_AO_Resolution = 0x182c

const DAQmx_AO_DAC_Rng_High = 0x182e

const DAQmx_AO_DAC_Rng_Low = 0x182d

const DAQmx_AO_DAC_Ref_ConnToGnd = 0x0130

const DAQmx_AO_DAC_Ref_AllowConnToGnd = 0x1830

const DAQmx_AO_DAC_Ref_Src = 0x0132

const DAQmx_AO_DAC_Ref_ExtSrc = 0x2252

const DAQmx_AO_DAC_Ref_Val = 0x1832

const DAQmx_AO_DAC_Offset_Src = 0x2253

const DAQmx_AO_DAC_Offset_ExtSrc = 0x2254

const DAQmx_AO_DAC_Offset_Val = 0x2255

const DAQmx_AO_ReglitchEnable = 0x0133

const DAQmx_AO_FilterDelay = 0x3075

const DAQmx_AO_FilterDelayUnits = 0x3076

const DAQmx_AO_FilterDelayAdjustment = 0x3072

const DAQmx_AO_Gain = 0x0118

const DAQmx_AO_UseOnlyOnBrdMem = 0x183a

const DAQmx_AO_DataXferMech = 0x0134

const DAQmx_AO_DataXferReqCond = 0x183c

const DAQmx_AO_UsbXferReqSize = 0x2a8f

const DAQmx_AO_UsbXferReqCount = 0x3001

const DAQmx_AO_MemMapEnable = 0x188f

const DAQmx_AO_DevScalingCoeff = 0x1931

const DAQmx_AO_EnhancedImageRejectionEnable = 0x2241

const DAQmx_DI_InvertLines = 0x0793

const DAQmx_DI_NumLines = 0x2178

const DAQmx_DI_DigFltr_Enable = 0x21d6

const DAQmx_DI_DigFltr_MinPulseWidth = 0x21d7

const DAQmx_DI_DigFltr_EnableBusMode = 0x2efe

const DAQmx_DI_DigFltr_TimebaseSrc = 0x2ed4

const DAQmx_DI_DigFltr_TimebaseRate = 0x2ed5

const DAQmx_DI_DigSync_Enable = 0x2ed6

const DAQmx_DI_Tristate = 0x1890

const DAQmx_DI_LogicFamily = 0x296d

const DAQmx_DI_DataXferMech = 0x2263

const DAQmx_DI_DataXferReqCond = 0x2264

const DAQmx_DI_UsbXferReqSize = 0x2a90

const DAQmx_DI_UsbXferReqCount = 0x3002

const DAQmx_DI_MemMapEnable = 0x296a

const DAQmx_DI_AcquireOn = 0x2966

const DAQmx_DO_OutputDriveType = 0x1137

const DAQmx_DO_InvertLines = 0x1133

const DAQmx_DO_NumLines = 0x2179

const DAQmx_DO_Tristate = 0x18f3

const DAQmx_DO_LineStates_StartState = 0x2972

const DAQmx_DO_LineStates_PausedState = 0x2967

const DAQmx_DO_LineStates_DoneState = 0x2968

const DAQmx_DO_LogicFamily = 0x296e

const DAQmx_DO_Overcurrent_Limit = 0x2a85

const DAQmx_DO_Overcurrent_AutoReenable = 0x2a86

const DAQmx_DO_Overcurrent_ReenablePeriod = 0x2a87

const DAQmx_DO_UseOnlyOnBrdMem = 0x2265

const DAQmx_DO_DataXferMech = 0x2266

const DAQmx_DO_DataXferReqCond = 0x2267

const DAQmx_DO_UsbXferReqSize = 0x2a91

const DAQmx_DO_UsbXferReqCount = 0x3003

const DAQmx_DO_MemMapEnable = 0x296b

const DAQmx_DO_GenerateOn = 0x2969

const DAQmx_CI_Max = 0x189c

const DAQmx_CI_Min = 0x189d

const DAQmx_CI_CustomScaleName = 0x189e

const DAQmx_CI_MeasType = 0x18a0

const DAQmx_CI_Freq_Units = 0x18a1

const DAQmx_CI_Freq_Term = 0x18a2

const DAQmx_CI_Freq_TermCfg = 0x3097

const DAQmx_CI_Freq_LogicLvlBehavior = 0x3098

const DAQmx_CI_Freq_ThreshVoltage = 0x31ab

const DAQmx_CI_Freq_Hyst = 0x31ac

const DAQmx_CI_Freq_DigFltr_Enable = 0x21e7

const DAQmx_CI_Freq_DigFltr_MinPulseWidth = 0x21e8

const DAQmx_CI_Freq_DigFltr_TimebaseSrc = 0x21e9

const DAQmx_CI_Freq_DigFltr_TimebaseRate = 0x21ea

const DAQmx_CI_Freq_DigSync_Enable = 0x21eb

const DAQmx_CI_Freq_StartingEdge = 0x0799

const DAQmx_CI_Freq_MeasMeth = 0x0144

const DAQmx_CI_Freq_EnableAveraging = 0x2ed0

const DAQmx_CI_Freq_MeasTime = 0x0145

const DAQmx_CI_Freq_Div = 0x0147

const DAQmx_CI_Period_Units = 0x18a3

const DAQmx_CI_Period_Term = 0x18a4

const DAQmx_CI_Period_TermCfg = 0x3099

const DAQmx_CI_Period_LogicLvlBehavior = 0x309a

const DAQmx_CI_Period_ThreshVoltage = 0x31ad

const DAQmx_CI_Period_Hyst = 0x31ae

const DAQmx_CI_Period_DigFltr_Enable = 0x21ec

const DAQmx_CI_Period_DigFltr_MinPulseWidth = 0x21ed

const DAQmx_CI_Period_DigFltr_TimebaseSrc = 0x21ee

const DAQmx_CI_Period_DigFltr_TimebaseRate = 0x21ef

const DAQmx_CI_Period_DigSync_Enable = 0x21f0

const DAQmx_CI_Period_StartingEdge = 0x0852

const DAQmx_CI_Period_MeasMeth = 0x192c

const DAQmx_CI_Period_EnableAveraging = 0x2ed1

const DAQmx_CI_Period_MeasTime = 0x192d

const DAQmx_CI_Period_Div = 0x192e

const DAQmx_CI_CountEdges_Term = 0x18c7

const DAQmx_CI_CountEdges_TermCfg = 0x309b

const DAQmx_CI_CountEdges_LogicLvlBehavior = 0x309c

const DAQmx_CI_CountEdges_ThreshVoltage = 0x31af

const DAQmx_CI_CountEdges_Hyst = 0x31b0

const DAQmx_CI_CountEdges_DigFltr_Enable = 0x21f6

const DAQmx_CI_CountEdges_DigFltr_MinPulseWidth = 0x21f7

const DAQmx_CI_CountEdges_DigFltr_TimebaseSrc = 0x21f8

const DAQmx_CI_CountEdges_DigFltr_TimebaseRate = 0x21f9

const DAQmx_CI_CountEdges_DigSync_Enable = 0x21fa

const DAQmx_CI_CountEdges_Dir = 0x0696

const DAQmx_CI_CountEdges_DirTerm = 0x21e1

const DAQmx_CI_CountEdges_CountDir_TermCfg = 0x309d

const DAQmx_CI_CountEdges_CountDir_LogicLvlBehavior = 0x309e

const DAQmx_CI_CountEdges_CountDir_ThreshVoltage = 0x31b1

const DAQmx_CI_CountEdges_CountDir_Hyst = 0x31b2

const DAQmx_CI_CountEdges_CountDir_DigFltr_Enable = 0x21f1

const DAQmx_CI_CountEdges_CountDir_DigFltr_MinPulseWidth = 0x21f2

const DAQmx_CI_CountEdges_CountDir_DigFltr_TimebaseSrc = 0x21f3

const DAQmx_CI_CountEdges_CountDir_DigFltr_TimebaseRate = 0x21f4

const DAQmx_CI_CountEdges_CountDir_DigSync_Enable = 0x21f5

const DAQmx_CI_CountEdges_InitialCnt = 0x0698

const DAQmx_CI_CountEdges_ActiveEdge = 0x0697

const DAQmx_CI_CountEdges_CountReset_Enable = 0x2faf

const DAQmx_CI_CountEdges_CountReset_ResetCount = 0x2fb0

const DAQmx_CI_CountEdges_CountReset_Term = 0x2fb1

const DAQmx_CI_CountEdges_CountReset_TermCfg = 0x309f

const DAQmx_CI_CountEdges_CountReset_LogicLvlBehavior = 0x30a0

const DAQmx_CI_CountEdges_CountReset_ThreshVoltage = 0x31b3

const DAQmx_CI_CountEdges_CountReset_Hyst = 0x31b4

const DAQmx_CI_CountEdges_CountReset_DigFltr_Enable = 0x2fb3

const DAQmx_CI_CountEdges_CountReset_DigFltr_MinPulseWidth = 0x2fb4

const DAQmx_CI_CountEdges_CountReset_DigFltr_TimebaseSrc = 0x2fb5

const DAQmx_CI_CountEdges_CountReset_DigFltr_TimebaseRate = 0x2fb6

const DAQmx_CI_CountEdges_CountReset_DigSync_Enable = 0x2fb7

const DAQmx_CI_CountEdges_CountReset_ActiveEdge = 0x2fb2

const DAQmx_CI_CountEdges_Gate_Enable = 0x30ed

const DAQmx_CI_CountEdges_Gate_Term = 0x30ee

const DAQmx_CI_CountEdges_Gate_TermCfg = 0x30ef

const DAQmx_CI_CountEdges_Gate_LogicLvlBehavior = 0x30f0

const DAQmx_CI_CountEdges_Gate_ThreshVoltage = 0x31b5

const DAQmx_CI_CountEdges_Gate_Hyst = 0x31b6

const DAQmx_CI_CountEdges_Gate_DigFltrEnable = 0x30f1

const DAQmx_CI_CountEdges_Gate_DigFltrMinPulseWidth = 0x30f2

const DAQmx_CI_CountEdges_Gate_DigFltrTimebaseSrc = 0x30f3

const DAQmx_CI_CountEdges_Gate_DigFltrTimebaseRate = 0x30f4

const DAQmx_CI_CountEdges_GateWhen = 0x30f5

const DAQmx_CI_DutyCycle_Term = 0x308d

const DAQmx_CI_DutyCycle_TermCfg = 0x30a1

const DAQmx_CI_DutyCycle_LogicLvlBehavior = 0x30a2

const DAQmx_CI_DutyCycle_DigFltr_Enable = 0x308e

const DAQmx_CI_DutyCycle_DigFltr_MinPulseWidth = 0x308f

const DAQmx_CI_DutyCycle_DigFltr_TimebaseSrc = 0x3090

const DAQmx_CI_DutyCycle_DigFltr_TimebaseRate = 0x3091

const DAQmx_CI_DutyCycle_StartingEdge = 0x3092

const DAQmx_CI_AngEncoder_Units = 0x18a6

const DAQmx_CI_AngEncoder_PulsesPerRev = 0x0875

const DAQmx_CI_AngEncoder_InitialAngle = 0x0881

const DAQmx_CI_LinEncoder_Units = 0x18a9

const DAQmx_CI_LinEncoder_DistPerPulse = 0x0911

const DAQmx_CI_LinEncoder_InitialPos = 0x0915

const DAQmx_CI_Encoder_DecodingType = 0x21e6

const DAQmx_CI_Encoder_AInputTerm = 0x219d

const DAQmx_CI_Encoder_AInputTermCfg = 0x30a3

const DAQmx_CI_Encoder_AInputLogicLvlBehavior = 0x30a4

const DAQmx_CI_Encoder_AInput_DigFltr_Enable = 0x21fb

const DAQmx_CI_Encoder_AInput_DigFltr_MinPulseWidth = 0x21fc

const DAQmx_CI_Encoder_AInput_DigFltr_TimebaseSrc = 0x21fd

const DAQmx_CI_Encoder_AInput_DigFltr_TimebaseRate = 0x21fe

const DAQmx_CI_Encoder_AInput_DigSync_Enable = 0x21ff

const DAQmx_CI_Encoder_BInputTerm = 0x219e

const DAQmx_CI_Encoder_BInputTermCfg = 0x30a5

const DAQmx_CI_Encoder_BInputLogicLvlBehavior = 0x30a6

const DAQmx_CI_Encoder_BInput_DigFltr_Enable = 0x2200

const DAQmx_CI_Encoder_BInput_DigFltr_MinPulseWidth = 0x2201

const DAQmx_CI_Encoder_BInput_DigFltr_TimebaseSrc = 0x2202

const DAQmx_CI_Encoder_BInput_DigFltr_TimebaseRate = 0x2203

const DAQmx_CI_Encoder_BInput_DigSync_Enable = 0x2204

const DAQmx_CI_Encoder_ZInputTerm = 0x219f

const DAQmx_CI_Encoder_ZInputTermCfg = 0x30a7

const DAQmx_CI_Encoder_ZInputLogicLvlBehavior = 0x30a8

const DAQmx_CI_Encoder_ZInput_DigFltr_Enable = 0x2205

const DAQmx_CI_Encoder_ZInput_DigFltr_MinPulseWidth = 0x2206

const DAQmx_CI_Encoder_ZInput_DigFltr_TimebaseSrc = 0x2207

const DAQmx_CI_Encoder_ZInput_DigFltr_TimebaseRate = 0x2208

const DAQmx_CI_Encoder_ZInput_DigSync_Enable = 0x2209

const DAQmx_CI_Encoder_ZIndexEnable = 0x0890

const DAQmx_CI_Encoder_ZIndexVal = 0x0888

const DAQmx_CI_Encoder_ZIndexPhase = 0x0889

const DAQmx_CI_PulseWidth_Units = 0x0823

const DAQmx_CI_PulseWidth_Term = 0x18aa

const DAQmx_CI_PulseWidth_TermCfg = 0x30a9

const DAQmx_CI_PulseWidth_LogicLvlBehavior = 0x30aa

const DAQmx_CI_PulseWidth_DigFltr_Enable = 0x220a

const DAQmx_CI_PulseWidth_DigFltr_MinPulseWidth = 0x220b

const DAQmx_CI_PulseWidth_DigFltr_TimebaseSrc = 0x220c

const DAQmx_CI_PulseWidth_DigFltr_TimebaseRate = 0x220d

const DAQmx_CI_PulseWidth_DigSync_Enable = 0x220e

const DAQmx_CI_PulseWidth_StartingEdge = 0x0825

const DAQmx_CI_Timestamp_Units = 0x22b3

const DAQmx_CI_Timestamp_InitialSeconds = 0x22b4

const DAQmx_CI_GPS_SyncMethod = 0x1092

const DAQmx_CI_GPS_SyncSrc = 0x1093

const DAQmx_CI_Velocity_AngEncoder_Units = 0x30d8

const DAQmx_CI_Velocity_AngEncoder_PulsesPerRev = 0x30d9

const DAQmx_CI_Velocity_LinEncoder_Units = 0x30da

const DAQmx_CI_Velocity_LinEncoder_DistPerPulse = 0x30db

const DAQmx_CI_Velocity_Encoder_DecodingType = 0x30dc

const DAQmx_CI_Velocity_Encoder_AInputTerm = 0x30dd

const DAQmx_CI_Velocity_Encoder_AInputTermCfg = 0x30de

const DAQmx_CI_Velocity_Encoder_AInputLogicLvlBehavior = 0x30df

const DAQmx_CI_Velocity_Encoder_AInputDigFltr_Enable = 0x30e0

const DAQmx_CI_Velocity_Encoder_AInputDigFltr_MinPulseWidth = 0x30e1

const DAQmx_CI_Velocity_Encoder_AInputDigFltr_TimebaseSrc = 0x30e2

const DAQmx_CI_Velocity_Encoder_AInputDigFltr_TimebaseRate = 0x30e3

const DAQmx_CI_Velocity_Encoder_BInputTerm = 0x30e4

const DAQmx_CI_Velocity_Encoder_BInputTermCfg = 0x30e5

const DAQmx_CI_Velocity_Encoder_BInputLogicLvlBehavior = 0x30e6

const DAQmx_CI_Velocity_Encoder_BInputDigFltr_Enable = 0x30e7

const DAQmx_CI_Velocity_Encoder_BInputDigFltr_MinPulseWidth = 0x30e8

const DAQmx_CI_Velocity_Encoder_BInputDigFltr_TimebaseSrc = 0x30e9

const DAQmx_CI_Velocity_Encoder_BInputDigFltr_TimebaseRate = 0x30ea

const DAQmx_CI_Velocity_MeasTime = 0x30eb

const DAQmx_CI_Velocity_Div = 0x30ec

const DAQmx_CI_TwoEdgeSep_Units = 0x18ac

const DAQmx_CI_TwoEdgeSep_FirstTerm = 0x18ad

const DAQmx_CI_TwoEdgeSep_FirstTermCfg = 0x30ab

const DAQmx_CI_TwoEdgeSep_FirstLogicLvlBehavior = 0x30ac

const DAQmx_CI_TwoEdgeSep_First_DigFltr_Enable = 0x220f

const DAQmx_CI_TwoEdgeSep_First_DigFltr_MinPulseWidth = 0x2210

const DAQmx_CI_TwoEdgeSep_First_DigFltr_TimebaseSrc = 0x2211

const DAQmx_CI_TwoEdgeSep_First_DigFltr_TimebaseRate = 0x2212

const DAQmx_CI_TwoEdgeSep_First_DigSync_Enable = 0x2213

const DAQmx_CI_TwoEdgeSep_FirstEdge = 0x0833

const DAQmx_CI_TwoEdgeSep_SecondTerm = 0x18ae

const DAQmx_CI_TwoEdgeSep_SecondTermCfg = 0x30ad

const DAQmx_CI_TwoEdgeSep_SecondLogicLvlBehavior = 0x30ae

const DAQmx_CI_TwoEdgeSep_Second_DigFltr_Enable = 0x2214

const DAQmx_CI_TwoEdgeSep_Second_DigFltr_MinPulseWidth = 0x2215

const DAQmx_CI_TwoEdgeSep_Second_DigFltr_TimebaseSrc = 0x2216

const DAQmx_CI_TwoEdgeSep_Second_DigFltr_TimebaseRate = 0x2217

const DAQmx_CI_TwoEdgeSep_Second_DigSync_Enable = 0x2218

const DAQmx_CI_TwoEdgeSep_SecondEdge = 0x0834

const DAQmx_CI_SemiPeriod_Units = 0x18af

const DAQmx_CI_SemiPeriod_Term = 0x18b0

const DAQmx_CI_SemiPeriod_TermCfg = 0x30af

const DAQmx_CI_SemiPeriod_LogicLvlBehavior = 0x30b0

const DAQmx_CI_SemiPeriod_DigFltr_Enable = 0x2219

const DAQmx_CI_SemiPeriod_DigFltr_MinPulseWidth = 0x221a

const DAQmx_CI_SemiPeriod_DigFltr_TimebaseSrc = 0x221b

const DAQmx_CI_SemiPeriod_DigFltr_TimebaseRate = 0x221c

const DAQmx_CI_SemiPeriod_DigSync_Enable = 0x221d

const DAQmx_CI_SemiPeriod_StartingEdge = 0x22fe

const DAQmx_CI_Pulse_Freq_Units = 0x2f0b

const DAQmx_CI_Pulse_Freq_Term = 0x2f04

const DAQmx_CI_Pulse_Freq_TermCfg = 0x30b1

const DAQmx_CI_Pulse_Freq_LogicLvlBehavior = 0x30b2

const DAQmx_CI_Pulse_Freq_DigFltr_Enable = 0x2f06

const DAQmx_CI_Pulse_Freq_DigFltr_MinPulseWidth = 0x2f07

const DAQmx_CI_Pulse_Freq_DigFltr_TimebaseSrc = 0x2f08

const DAQmx_CI_Pulse_Freq_DigFltr_TimebaseRate = 0x2f09

const DAQmx_CI_Pulse_Freq_DigSync_Enable = 0x2f0a

const DAQmx_CI_Pulse_Freq_Start_Edge = 0x2f05

const DAQmx_CI_Pulse_Time_Units = 0x2f13

const DAQmx_CI_Pulse_Time_Term = 0x2f0c

const DAQmx_CI_Pulse_Time_TermCfg = 0x30b3

const DAQmx_CI_Pulse_Time_LogicLvlBehavior = 0x30b4

const DAQmx_CI_Pulse_Time_DigFltr_Enable = 0x2f0e

const DAQmx_CI_Pulse_Time_DigFltr_MinPulseWidth = 0x2f0f

const DAQmx_CI_Pulse_Time_DigFltr_TimebaseSrc = 0x2f10

const DAQmx_CI_Pulse_Time_DigFltr_TimebaseRate = 0x2f11

const DAQmx_CI_Pulse_Time_DigSync_Enable = 0x2f12

const DAQmx_CI_Pulse_Time_StartEdge = 0x2f0d

const DAQmx_CI_Pulse_Ticks_Term = 0x2f14

const DAQmx_CI_Pulse_Ticks_TermCfg = 0x30b5

const DAQmx_CI_Pulse_Ticks_LogicLvlBehavior = 0x30b6

const DAQmx_CI_Pulse_Ticks_DigFltr_Enable = 0x2f16

const DAQmx_CI_Pulse_Ticks_DigFltr_MinPulseWidth = 0x2f17

const DAQmx_CI_Pulse_Ticks_DigFltr_TimebaseSrc = 0x2f18

const DAQmx_CI_Pulse_Ticks_DigFltr_TimebaseRate = 0x2f19

const DAQmx_CI_Pulse_Ticks_DigSync_Enable = 0x2f1a

const DAQmx_CI_Pulse_Ticks_StartEdge = 0x2f15

const DAQmx_CI_CtrTimebaseSrc = 0x0143

const DAQmx_CI_CtrTimebaseRate = 0x18b2

const DAQmx_CI_CtrTimebaseActiveEdge = 0x0142

const DAQmx_CI_CtrTimebase_DigFltr_Enable = 0x2271

const DAQmx_CI_CtrTimebase_DigFltr_MinPulseWidth = 0x2272

const DAQmx_CI_CtrTimebase_DigFltr_TimebaseSrc = 0x2273

const DAQmx_CI_CtrTimebase_DigFltr_TimebaseRate = 0x2274

const DAQmx_CI_CtrTimebase_DigSync_Enable = 0x2275

const DAQmx_CI_ThreshVoltage = 0x30b7

const DAQmx_CI_Filter_Enable = 0x31b7

const DAQmx_CI_Filter_Freq = 0x31b8

const DAQmx_CI_Filter_Response = 0x31b9

const DAQmx_CI_Filter_Order = 0x31ba

const DAQmx_CI_FilterDelay = 0x31bb

const DAQmx_CI_FilterDelayUnits = 0x31bc

const DAQmx_CI_Count = 0x0148

const DAQmx_CI_OutputState = 0x0149

const DAQmx_CI_TCReached = 0x0150

const DAQmx_CI_CtrTimebaseMasterTimebaseDiv = 0x18b3

const DAQmx_CI_SampClkOverrunBehavior = 0x3093

const DAQmx_CI_SampClkOverrunSentinelVal = 0x3094

const DAQmx_CI_DataXferMech = 0x0200

const DAQmx_CI_DataXferReqCond = 0x2efb

const DAQmx_CI_UsbXferReqSize = 0x2a92

const DAQmx_CI_UsbXferReqCount = 0x3004

const DAQmx_CI_MemMapEnable = 0x2ed2

const DAQmx_CI_NumPossiblyInvalidSamps = 0x193c

const DAQmx_CI_DupCountPrevent = 0x21ac

const DAQmx_CI_Prescaler = 0x2239

const DAQmx_CI_MaxMeasPeriod = 0x3095

const DAQmx_CO_OutputType = 0x18b5

const DAQmx_CO_Pulse_IdleState = 0x1170

const DAQmx_CO_Pulse_Term = 0x18e1

const DAQmx_CO_Pulse_Time_Units = 0x18d6

const DAQmx_CO_Pulse_HighTime = 0x18ba

const DAQmx_CO_Pulse_LowTime = 0x18bb

const DAQmx_CO_Pulse_Time_InitialDelay = 0x18bc

const DAQmx_CO_Pulse_DutyCyc = 0x1176

const DAQmx_CO_Pulse_Freq_Units = 0x18d5

const DAQmx_CO_Pulse_Freq = 0x1178

const DAQmx_CO_Pulse_Freq_InitialDelay = 0x0299

const DAQmx_CO_Pulse_HighTicks = 0x1169

const DAQmx_CO_Pulse_LowTicks = 0x1171

const DAQmx_CO_Pulse_Ticks_InitialDelay = 0x0298

const DAQmx_CO_CtrTimebaseSrc = 0x0339

const DAQmx_CO_CtrTimebaseRate = 0x18c2

const DAQmx_CO_CtrTimebaseActiveEdge = 0x0341

const DAQmx_CO_CtrTimebase_DigFltr_Enable = 0x2276

const DAQmx_CO_CtrTimebase_DigFltr_MinPulseWidth = 0x2277

const DAQmx_CO_CtrTimebase_DigFltr_TimebaseSrc = 0x2278

const DAQmx_CO_CtrTimebase_DigFltr_TimebaseRate = 0x2279

const DAQmx_CO_CtrTimebase_DigSync_Enable = 0x227a

const DAQmx_CO_Count = 0x0293

const DAQmx_CO_OutputState = 0x0294

const DAQmx_CO_AutoIncrCnt = 0x0295

const DAQmx_CO_CtrTimebaseMasterTimebaseDiv = 0x18c3

const DAQmx_CO_PulseDone = 0x190e

const DAQmx_CO_EnableInitialDelayOnRetrigger = 0x2ec9

const DAQmx_CO_ConstrainedGenMode = 0x29f2

const DAQmx_CO_UseOnlyOnBrdMem = 0x2ecb

const DAQmx_CO_DataXferMech = 0x2ecc

const DAQmx_CO_DataXferReqCond = 0x2ecd

const DAQmx_CO_UsbXferReqSize = 0x2a93

const DAQmx_CO_UsbXferReqCount = 0x3005

const DAQmx_CO_MemMapEnable = 0x2ed3

const DAQmx_CO_Prescaler = 0x226d

const DAQmx_CO_RdyForNewVal = 0x22ff

const DAQmx_Pwr_Voltage_Setpoint = 0x31d4

const DAQmx_Pwr_Voltage_DevScalingCoeff = 0x31d9

const DAQmx_Pwr_Current_Setpoint = 0x31d5

const DAQmx_Pwr_Current_DevScalingCoeff = 0x31da

const DAQmx_Pwr_OutputEnable = 0x31d6

const DAQmx_Pwr_OutputState = 0x31d7

const DAQmx_Pwr_IdleOutputBehavior = 0x31d8

const DAQmx_Pwr_RemoteSense = 0x31db

const DAQmx_ChanType = 0x187f

const DAQmx_PhysicalChanName = 0x18f5

const DAQmx_ChanDescr = 0x1926

const DAQmx_ChanIsGlobal = 0x2304

const DAQmx_Chan_SyncUnlockBehavior = 0x313c

const DAQmx_Dev_IsSimulated = 0x22ca

const DAQmx_Dev_ProductCategory = 0x29a9

const DAQmx_Dev_ProductType = 0x0631

const DAQmx_Dev_ProductNum = 0x231d

const DAQmx_Dev_SerialNum = 0x0632

const DAQmx_Dev_Accessory_ProductTypes = 0x2f6d

const DAQmx_Dev_Accessory_ProductNums = 0x2f6e

const DAQmx_Dev_Accessory_SerialNums = 0x2f6f

const DAQmx_Carrier_SerialNum = 0x2a8a

const DAQmx_FieldDAQ_DevName = 0x3171

const DAQmx_FieldDAQ_BankDevNames = 0x3178

const DAQmx_Dev_IDPin_PinNames = 0x31f1

const DAQmx_Dev_IDPin_PinStatuses = 0x31f2

const DAQmx_Dev_IDPin_MemFamilyCodes = 0x31f3

const DAQmx_Dev_IDPin_MemSerialNums = 0x31f4

const DAQmx_Dev_IDPin_MemSizes = 0x31f5

const DAQmx_Dev_Chassis_ModuleDevNames = 0x29b6

const DAQmx_Dev_AnlgTrigSupported = 0x2984

const DAQmx_Dev_DigTrigSupported = 0x2985

const DAQmx_Dev_TimeTrigSupported = 0x301f

const DAQmx_Dev_AI_PhysicalChans = 0x231e

const DAQmx_Dev_AI_SupportedMeasTypes = 0x2fd2

const DAQmx_Dev_AI_MaxSingleChanRate = 0x298c

const DAQmx_Dev_AI_MaxMultiChanRate = 0x298d

const DAQmx_Dev_AI_MinRate = 0x298e

const DAQmx_Dev_AI_SimultaneousSamplingSupported = 0x298f

const DAQmx_Dev_AI_NumSampTimingEngines = 0x3163

const DAQmx_Dev_AI_SampModes = 0x2fdc

const DAQmx_Dev_AI_NumSyncPulseSrcs = 0x3164

const DAQmx_Dev_AI_TrigUsage = 0x2986

const DAQmx_Dev_AI_VoltageRngs = 0x2990

const DAQmx_Dev_AI_VoltageIntExcitDiscreteVals = 0x29c9

const DAQmx_Dev_AI_VoltageIntExcitRangeVals = 0x29ca

const DAQmx_Dev_AI_ChargeRngs = 0x3111

const DAQmx_Dev_AI_CurrentRngs = 0x2991

const DAQmx_Dev_AI_CurrentIntExcitDiscreteVals = 0x29cb

const DAQmx_Dev_AI_BridgeRngs = 0x2fd0

const DAQmx_Dev_AI_ResistanceRngs = 0x2a15

const DAQmx_Dev_AI_FreqRngs = 0x2992

const DAQmx_Dev_AI_Gains = 0x2993

const DAQmx_Dev_AI_Couplings = 0x2994

const DAQmx_Dev_AI_LowpassCutoffFreqDiscreteVals = 0x2995

const DAQmx_Dev_AI_LowpassCutoffFreqRangeVals = 0x29cf

const DAQmx_AI_DigFltr_Types = 0x3107

const DAQmx_Dev_AI_DigFltr_LowpassCutoffFreqDiscreteVals = 0x30c8

const DAQmx_Dev_AI_DigFltr_LowpassCutoffFreqRangeVals = 0x30c9

const DAQmx_Dev_AO_PhysicalChans = 0x231f

const DAQmx_Dev_AO_SupportedOutputTypes = 0x2fd3

const DAQmx_Dev_AO_MaxRate = 0x2997

const DAQmx_Dev_AO_MinRate = 0x2998

const DAQmx_Dev_AO_SampClkSupported = 0x2996

const DAQmx_Dev_AO_NumSampTimingEngines = 0x3165

const DAQmx_Dev_AO_SampModes = 0x2fdd

const DAQmx_Dev_AO_NumSyncPulseSrcs = 0x3166

const DAQmx_Dev_AO_TrigUsage = 0x2987

const DAQmx_Dev_AO_VoltageRngs = 0x299b

const DAQmx_Dev_AO_CurrentRngs = 0x299c

const DAQmx_Dev_AO_Gains = 0x299d

const DAQmx_Dev_DI_Lines = 0x2320

const DAQmx_Dev_DI_Ports = 0x2321

const DAQmx_Dev_DI_MaxRate = 0x2999

const DAQmx_Dev_DI_NumSampTimingEngines = 0x3167

const DAQmx_Dev_DI_TrigUsage = 0x2988

const DAQmx_Dev_DO_Lines = 0x2322

const DAQmx_Dev_DO_Ports = 0x2323

const DAQmx_Dev_DO_MaxRate = 0x299a

const DAQmx_Dev_DO_NumSampTimingEngines = 0x3168

const DAQmx_Dev_DO_TrigUsage = 0x2989

const DAQmx_Dev_CI_PhysicalChans = 0x2324

const DAQmx_Dev_CI_SupportedMeasTypes = 0x2fd4

const DAQmx_Dev_CI_TrigUsage = 0x298a

const DAQmx_Dev_CI_SampClkSupported = 0x299e

const DAQmx_Dev_CI_SampModes = 0x2fde

const DAQmx_Dev_CI_MaxSize = 0x299f

const DAQmx_Dev_CI_MaxTimebase = 0x29a0

const DAQmx_Dev_CO_PhysicalChans = 0x2325

const DAQmx_Dev_CO_SupportedOutputTypes = 0x2fd5

const DAQmx_Dev_CO_SampClkSupported = 0x2f5b

const DAQmx_Dev_CO_SampModes = 0x2fdf

const DAQmx_Dev_CO_TrigUsage = 0x298b

const DAQmx_Dev_CO_MaxSize = 0x29a1

const DAQmx_Dev_CO_MaxTimebase = 0x29a2

const DAQmx_Dev_TEDS_HWTEDSSupported = 0x2fd6

const DAQmx_Dev_NumDMAChans = 0x233c

const DAQmx_Dev_BusType = 0x2326

const DAQmx_Dev_PCI_BusNum = 0x2327

const DAQmx_Dev_PCI_DevNum = 0x2328

const DAQmx_Dev_PXI_ChassisNum = 0x2329

const DAQmx_Dev_PXI_SlotNum = 0x232a

const DAQmx_Dev_CompactDAQ_ChassisDevName = 0x29b7

const DAQmx_Dev_CompactDAQ_SlotNum = 0x29b8

const DAQmx_Dev_CompactRIO_ChassisDevName = 0x3161

const DAQmx_Dev_CompactRIO_SlotNum = 0x3162

const DAQmx_Dev_TCPIP_Hostname = 0x2a8b

const DAQmx_Dev_TCPIP_EthernetIP = 0x2a8c

const DAQmx_Dev_TCPIP_WirelessIP = 0x2a8d

const DAQmx_Dev_Terminals = 0x2a40

const DAQmx_Dev_NumTimeTrigs = 0x3141

const DAQmx_Dev_NumTimestampEngines = 0x3142

const DAQmx_Exported_AIConvClk_OutputTerm = 0x1687

const DAQmx_Exported_AIConvClk_Pulse_Polarity = 0x1688

const DAQmx_Exported_10MHzRefClk_OutputTerm = 0x226e

const DAQmx_Exported_20MHzTimebase_OutputTerm = 0x1657

const DAQmx_Exported_SampClk_OutputBehavior = 0x186b

const DAQmx_Exported_SampClk_OutputTerm = 0x1663

const DAQmx_Exported_SampClk_DelayOffset = 0x21c4

const DAQmx_Exported_SampClk_Pulse_Polarity = 0x1664

const DAQmx_Exported_SampClkTimebase_OutputTerm = 0x18f9

const DAQmx_Exported_DividedSampClkTimebase_OutputTerm = 0x21a1

const DAQmx_Exported_AdvTrig_OutputTerm = 0x1645

const DAQmx_Exported_AdvTrig_Pulse_Polarity = 0x1646

const DAQmx_Exported_AdvTrig_Pulse_WidthUnits = 0x1647

const DAQmx_Exported_AdvTrig_Pulse_Width = 0x1648

const DAQmx_Exported_PauseTrig_OutputTerm = 0x1615

const DAQmx_Exported_PauseTrig_Lvl_ActiveLvl = 0x1616

const DAQmx_Exported_RefTrig_OutputTerm = 0x0590

const DAQmx_Exported_RefTrig_Pulse_Polarity = 0x0591

const DAQmx_Exported_StartTrig_OutputTerm = 0x0584

const DAQmx_Exported_StartTrig_Pulse_Polarity = 0x0585

const DAQmx_Exported_AdvCmpltEvent_OutputTerm = 0x1651

const DAQmx_Exported_AdvCmpltEvent_Delay = 0x1757

const DAQmx_Exported_AdvCmpltEvent_Pulse_Polarity = 0x1652

const DAQmx_Exported_AdvCmpltEvent_Pulse_Width = 0x1654

const DAQmx_Exported_AIHoldCmpltEvent_OutputTerm = 0x18ed

const DAQmx_Exported_AIHoldCmpltEvent_PulsePolarity = 0x18ee

const DAQmx_Exported_ChangeDetectEvent_OutputTerm = 0x2197

const DAQmx_Exported_ChangeDetectEvent_Pulse_Polarity = 0x2303

const DAQmx_Exported_CtrOutEvent_OutputTerm = 0x1717

const DAQmx_Exported_CtrOutEvent_OutputBehavior = 0x174f

const DAQmx_Exported_CtrOutEvent_Pulse_Polarity = 0x1718

const DAQmx_Exported_CtrOutEvent_Toggle_IdleState = 0x186a

const DAQmx_Exported_HshkEvent_OutputTerm = 0x22ba

const DAQmx_Exported_HshkEvent_OutputBehavior = 0x22bb

const DAQmx_Exported_HshkEvent_Delay = 0x22bc

const DAQmx_Exported_HshkEvent_Interlocked_AssertedLvl = 0x22bd

const DAQmx_Exported_HshkEvent_Interlocked_AssertOnStart = 0x22be

const DAQmx_Exported_HshkEvent_Interlocked_DeassertDelay = 0x22bf

const DAQmx_Exported_HshkEvent_Pulse_Polarity = 0x22c0

const DAQmx_Exported_HshkEvent_Pulse_Width = 0x22c1

const DAQmx_Exported_RdyForXferEvent_OutputTerm = 0x22b5

const DAQmx_Exported_RdyForXferEvent_Lvl_ActiveLvl = 0x22b6

const DAQmx_Exported_RdyForXferEvent_DeassertCond = 0x2963

const DAQmx_Exported_RdyForXferEvent_DeassertCondCustomThreshold = 0x2964

const DAQmx_Exported_DataActiveEvent_OutputTerm = 0x1633

const DAQmx_Exported_DataActiveEvent_Lvl_ActiveLvl = 0x1634

const DAQmx_Exported_RdyForStartEvent_OutputTerm = 0x1609

const DAQmx_Exported_RdyForStartEvent_Lvl_ActiveLvl = 0x1751

const DAQmx_Exported_SyncPulseEvent_OutputTerm = 0x223c

const DAQmx_Exported_WatchdogExpiredEvent_OutputTerm = 0x21aa

const DAQmx_PersistedChan_Author = 0x22d0

const DAQmx_PersistedChan_AllowInteractiveEditing = 0x22d1

const DAQmx_PersistedChan_AllowInteractiveDeletion = 0x22d2

const DAQmx_PersistedScale_Author = 0x22d4

const DAQmx_PersistedScale_AllowInteractiveEditing = 0x22d5

const DAQmx_PersistedScale_AllowInteractiveDeletion = 0x22d6

const DAQmx_PersistedTask_Author = 0x22cc

const DAQmx_PersistedTask_AllowInteractiveEditing = 0x22cd

const DAQmx_PersistedTask_AllowInteractiveDeletion = 0x22ce

const DAQmx_PhysicalChan_AI_SupportedMeasTypes = 0x2fd7

const DAQmx_PhysicalChan_AI_TermCfgs = 0x2342

const DAQmx_PhysicalChan_AI_InputSrcs = 0x2fd8

const DAQmx_PhysicalChan_AI_SensorPower_Types = 0x3179

const DAQmx_PhysicalChan_AI_SensorPower_VoltageRangeVals = 0x317a

const DAQmx_PhysicalChan_AI_PowerControl_Voltage = 0x316c

const DAQmx_PhysicalChan_AI_PowerControl_Enable = 0x316d

const DAQmx_PhysicalChan_AI_PowerControl_Type = 0x316e

const DAQmx_PhysicalChan_AI_SensorPower_OpenChan = 0x317c

const DAQmx_PhysicalChan_AI_SensorPower_Overcurrent = 0x317d

const DAQmx_PhysicalChan_AO_SupportedOutputTypes = 0x2fd9

const DAQmx_PhysicalChan_AO_SupportedPowerUpOutputTypes = 0x304e

const DAQmx_PhysicalChan_AO_TermCfgs = 0x29a3

const DAQmx_PhysicalChan_AO_ManualControlEnable = 0x2a1e

const DAQmx_PhysicalChan_AO_ManualControl_ShortDetected = 0x2ec3

const DAQmx_PhysicalChan_AO_ManualControlAmplitude = 0x2a1f

const DAQmx_PhysicalChan_AO_ManualControlFreq = 0x2a20

const DAQmx_AO_PowerAmp_ChannelEnable = 0x3062

const DAQmx_AO_PowerAmp_ScalingCoeff = 0x3063

const DAQmx_AO_PowerAmp_Overcurrent = 0x3064

const DAQmx_AO_PowerAmp_Gain = 0x3065

const DAQmx_AO_PowerAmp_Offset = 0x3066

const DAQmx_PhysicalChan_DI_PortWidth = 0x29a4

const DAQmx_PhysicalChan_DI_SampClkSupported = 0x29a5

const DAQmx_PhysicalChan_DI_SampModes = 0x2fe0

const DAQmx_PhysicalChan_DI_ChangeDetectSupported = 0x29a6

const DAQmx_PhysicalChan_DO_PortWidth = 0x29a7

const DAQmx_PhysicalChan_DO_SampClkSupported = 0x29a8

const DAQmx_PhysicalChan_DO_SampModes = 0x2fe1

const DAQmx_PhysicalChan_CI_SupportedMeasTypes = 0x2fda

const DAQmx_PhysicalChan_CO_SupportedOutputTypes = 0x2fdb

const DAQmx_PhysicalChan_Dig_PortLogicFamily = 0x31eb

const DAQmx_PhysicalChan_TEDS_MfgID = 0x21da

const DAQmx_PhysicalChan_TEDS_ModelNum = 0x21db

const DAQmx_PhysicalChan_TEDS_SerialNum = 0x21dc

const DAQmx_PhysicalChan_TEDS_VersionNum = 0x21dd

const DAQmx_PhysicalChan_TEDS_VersionLetter = 0x21de

const DAQmx_PhysicalChan_TEDS_BitStream = 0x21df

const DAQmx_PhysicalChan_TEDS_TemplateIDs = 0x228f

const DAQmx_Read_RelativeTo = 0x190a

const DAQmx_Read_Offset = 0x190b

const DAQmx_Read_ChannelsToRead = 0x1823

const DAQmx_Read_ReadAllAvailSamp = 0x1215

const DAQmx_Read_AutoStart = 0x1826

const DAQmx_Read_OverWrite = 0x1211

const DAQmx_Logging_FilePath = 0x2ec4

const DAQmx_Logging_Mode = 0x2ec5

const DAQmx_Logging_TDMS_GroupName = 0x2ec6

const DAQmx_Logging_TDMS_Operation = 0x2ec7

const DAQmx_Logging_Pause = 0x2fe3

const DAQmx_Logging_SampsPerFile = 0x2fe4

const DAQmx_Logging_FileWriteSize = 0x2fc3

const DAQmx_Logging_FilePreallocationSize = 0x2fc6

const DAQmx_Read_CurrReadPos = 0x1221

const DAQmx_Read_AvailSampPerChan = 0x1223

const DAQmx_Read_TotalSampPerChanAcquired = 0x192a

const DAQmx_Read_CommonModeRangeErrorChansExist = 0x2a98

const DAQmx_Read_CommonModeRangeErrorChans = 0x2a99

const DAQmx_Read_ExcitFaultChansExist = 0x3088

const DAQmx_Read_ExcitFaultChans = 0x3089

const DAQmx_Read_OvercurrentChansExist = 0x29e6

const DAQmx_Read_OvercurrentChans = 0x29e7

const DAQmx_Read_OvertemperatureChansExist = 0x3081

const DAQmx_Read_OvertemperatureChans = 0x3082

const DAQmx_Read_OpenChansExist = 0x3100

const DAQmx_Read_OpenChans = 0x3101

const DAQmx_Read_OpenChansDetails = 0x3102

const DAQmx_Read_OpenCurrentLoopChansExist = 0x2a09

const DAQmx_Read_OpenCurrentLoopChans = 0x2a0a

const DAQmx_Read_OpenThrmcplChansExist = 0x2a96

const DAQmx_Read_OpenThrmcplChans = 0x2a97

const DAQmx_Read_OverloadedChansExist = 0x2174

const DAQmx_Read_OverloadedChans = 0x2175

const DAQmx_Read_InputLimitsFaultChansExist = 0x318f

const DAQmx_Read_InputLimitsFaultChans = 0x3190

const DAQmx_Read_PLL_UnlockedChansExist = 0x3118

const DAQmx_Read_PLL_UnlockedChans = 0x3119

const DAQmx_Read_PowerSupplyFaultChansExist = 0x3192

const DAQmx_Read_PowerSupplyFaultChans = 0x3193

const DAQmx_Read_Sync_UnlockedChansExist = 0x313d

const DAQmx_Read_Sync_UnlockedChans = 0x313e

const DAQmx_Read_AccessoryInsertionOrRemovalDetected = 0x2f70

const DAQmx_Read_DevsWithInsertedOrRemovedAccessories = 0x2f71

const DAQmx_RemoteSenseErrorChansExist = 0x31dd

const DAQmx_RemoteSenseErrorChans = 0x31de

const DAQmx_AuxPowerErrorChansExist = 0x31df

const DAQmx_AuxPowerErrorChans = 0x31e0

const DAQmx_ReverseVoltageErrorChansExist = 0x31e6

const DAQmx_ReverseVoltageErrorChans = 0x31e7

const DAQmx_Read_ChangeDetect_HasOverflowed = 0x2194

const DAQmx_Read_RawDataWidth = 0x217a

const DAQmx_Read_NumChans = 0x217b

const DAQmx_Read_DigitalLines_BytesPerChan = 0x217c

const DAQmx_Read_WaitMode = 0x2232

const DAQmx_Read_SleepTime = 0x22b0

const DAQmx_RealTime_ConvLateErrorsToWarnings = 0x22ee

const DAQmx_RealTime_NumOfWarmupIters = 0x22ed

const DAQmx_RealTime_WaitForNextSampClkWaitMode = 0x22ef

const DAQmx_RealTime_ReportMissedSamp = 0x2319

const DAQmx_RealTime_WriteRecoveryMode = 0x231a

const DAQmx_Scale_Descr = 0x1226

const DAQmx_Scale_ScaledUnits = 0x191b

const DAQmx_Scale_PreScaledUnits = 0x18f7

const DAQmx_Scale_Type = 0x1929

const DAQmx_Scale_Lin_Slope = 0x1227

const DAQmx_Scale_Lin_YIntercept = 0x1228

const DAQmx_Scale_Map_ScaledMax = 0x1229

const DAQmx_Scale_Map_PreScaledMax = 0x1231

const DAQmx_Scale_Map_ScaledMin = 0x1230

const DAQmx_Scale_Map_PreScaledMin = 0x1232

const DAQmx_Scale_Poly_ForwardCoeff = 0x1234

const DAQmx_Scale_Poly_ReverseCoeff = 0x1235

const DAQmx_Scale_Table_ScaledVals = 0x1236

const DAQmx_Scale_Table_PreScaledVals = 0x1237

const DAQmx_SwitchChan_Usage = 0x18e4

const DAQmx_SwitchChan_AnlgBusSharingEnable = 0x2f9e

const DAQmx_SwitchChan_MaxACCarryCurrent = 0x0648

const DAQmx_SwitchChan_MaxACSwitchCurrent = 0x0646

const DAQmx_SwitchChan_MaxACCarryPwr = 0x0642

const DAQmx_SwitchChan_MaxACSwitchPwr = 0x0644

const DAQmx_SwitchChan_MaxDCCarryCurrent = 0x0647

const DAQmx_SwitchChan_MaxDCSwitchCurrent = 0x0645

const DAQmx_SwitchChan_MaxDCCarryPwr = 0x0643

const DAQmx_SwitchChan_MaxDCSwitchPwr = 0x0649

const DAQmx_SwitchChan_MaxACVoltage = 0x0651

const DAQmx_SwitchChan_MaxDCVoltage = 0x0650

const DAQmx_SwitchChan_WireMode = 0x18e5

const DAQmx_SwitchChan_Bandwidth = 0x0640

const DAQmx_SwitchChan_Impedance = 0x0641

const DAQmx_SwitchDev_SettlingTime = 0x1244

const DAQmx_SwitchDev_AutoConnAnlgBus = 0x17da

const DAQmx_SwitchDev_PwrDownLatchRelaysAfterSettling = 0x22db

const DAQmx_SwitchDev_Settled = 0x1243

const DAQmx_SwitchDev_RelayList = 0x17dc

const DAQmx_SwitchDev_NumRelays = 0x18e6

const DAQmx_SwitchDev_SwitchChanList = 0x18e7

const DAQmx_SwitchDev_NumSwitchChans = 0x18e8

const DAQmx_SwitchDev_NumRows = 0x18e9

const DAQmx_SwitchDev_NumColumns = 0x18ea

const DAQmx_SwitchDev_Topology = 0x193d

const DAQmx_SwitchDev_Temperature = 0x301a

const DAQmx_SwitchScan_BreakMode = 0x1247

const DAQmx_SwitchScan_RepeatMode = 0x1248

const DAQmx_SwitchScan_WaitingForAdv = 0x17d9

const DAQmx_Sys_GlobalChans = 0x1265

const DAQmx_Sys_Scales = 0x1266

const DAQmx_Sys_Tasks = 0x1267

const DAQmx_Sys_DevNames = 0x193b

const DAQmx_Sys_NIDAQMajorVersion = 0x1272

const DAQmx_Sys_NIDAQMinorVersion = 0x1923

const DAQmx_Sys_NIDAQUpdateVersion = 0x2f22

const DAQmx_Task_Name = 0x1276

const DAQmx_Task_Channels = 0x1273

const DAQmx_Task_NumChans = 0x2181

const DAQmx_Task_Devices = 0x230e

const DAQmx_Task_NumDevices = 0x29ba

const DAQmx_Task_Complete = 0x1274

const DAQmx_SampQuant_SampMode = 0x1300

const DAQmx_SampQuant_SampPerChan = 0x1310

const DAQmx_SampTimingType = 0x1347

const DAQmx_SampClk_Rate = 0x1344

const DAQmx_SampClk_MaxRate = 0x22c8

const DAQmx_SampClk_Src = 0x1852

const DAQmx_SampClk_ActiveEdge = 0x1301

const DAQmx_SampClk_OverrunBehavior = 0x2efc

const DAQmx_SampClk_UnderflowBehavior = 0x2961

const DAQmx_SampClk_TimebaseDiv = 0x18eb

const DAQmx_SampClk_Term = 0x2f1b

const DAQmx_SampClk_Timebase_Rate = 0x1303

const DAQmx_SampClk_Timebase_Src = 0x1308

const DAQmx_SampClk_Timebase_ActiveEdge = 0x18ec

const DAQmx_SampClk_Timebase_MasterTimebaseDiv = 0x1305

const DAQmx_SampClkTimebase_Term = 0x2f1c

const DAQmx_SampClk_DigFltr_Enable = 0x221e

const DAQmx_SampClk_DigFltr_MinPulseWidth = 0x221f

const DAQmx_SampClk_DigFltr_TimebaseSrc = 0x2220

const DAQmx_SampClk_DigFltr_TimebaseRate = 0x2221

const DAQmx_SampClk_DigSync_Enable = 0x2222

const DAQmx_SampClk_WriteWfm_UseInitialWfmDT = 0x30fc

const DAQmx_Hshk_DelayAfterXfer = 0x22c2

const DAQmx_Hshk_StartCond = 0x22c3

const DAQmx_Hshk_SampleInputDataWhen = 0x22c4

const DAQmx_ChangeDetect_DI_RisingEdgePhysicalChans = 0x2195

const DAQmx_ChangeDetect_DI_FallingEdgePhysicalChans = 0x2196

const DAQmx_ChangeDetect_DI_Tristate = 0x2efa

const DAQmx_OnDemand_SimultaneousAOEnable = 0x21a0

const DAQmx_Implicit_UnderflowBehavior = 0x2efd

const DAQmx_AIConv_Rate = 0x1848

const DAQmx_AIConv_MaxRate = 0x22c9

const DAQmx_AIConv_Src = 0x1502

const DAQmx_AIConv_ActiveEdge = 0x1853

const DAQmx_AIConv_TimebaseDiv = 0x1335

const DAQmx_AIConv_Timebase_Src = 0x1339

const DAQmx_DelayFromSampClk_DelayUnits = 0x1304

const DAQmx_DelayFromSampClk_Delay = 0x1317

const DAQmx_AIConv_DigFltr_Enable = 0x2edc

const DAQmx_AIConv_DigFltr_MinPulseWidth = 0x2edd

const DAQmx_AIConv_DigFltr_TimebaseSrc = 0x2ede

const DAQmx_AIConv_DigFltr_TimebaseRate = 0x2edf

const DAQmx_AIConv_DigSync_Enable = 0x2ee0

const DAQmx_MasterTimebase_Rate = 0x1495

const DAQmx_MasterTimebase_Src = 0x1343

const DAQmx_RefClk_Rate = 0x1315

const DAQmx_RefClk_Src = 0x1316

const DAQmx_SyncPulse_Type = 0x3136

const DAQmx_SyncPulse_Src = 0x223d

const DAQmx_SyncPulse_Time_When = 0x3137

const DAQmx_SyncPulse_Time_Timescale = 0x3138

const DAQmx_SyncPulse_SyncTime = 0x223e

const DAQmx_SyncPulse_MinDelayToStart = 0x223f

const DAQmx_SyncPulse_ResetTime = 0x2f7c

const DAQmx_SyncPulse_ResetDelay = 0x2f7d

const DAQmx_SyncPulse_Term = 0x2f85

const DAQmx_SyncClk_Interval = 0x2f7e

const DAQmx_SampTimingEngine = 0x2a26

const DAQmx_FirstSampTimestamp_Enable = 0x3139

const DAQmx_FirstSampTimestamp_Timescale = 0x313b

const DAQmx_FirstSampTimestamp_Val = 0x313a

const DAQmx_FirstSampClk_When = 0x3182

const DAQmx_FirstSampClk_Timescale = 0x3183

const DAQmx_FirstSampClk_Offset = 0x31aa

const DAQmx_StartTrig_Type = 0x1393

const DAQmx_StartTrig_Term = 0x2f1e

const DAQmx_DigEdge_StartTrig_Src = 0x1407

const DAQmx_DigEdge_StartTrig_Edge = 0x1404

const DAQmx_DigEdge_StartTrig_DigFltr_Enable = 0x2223

const DAQmx_DigEdge_StartTrig_DigFltr_MinPulseWidth = 0x2224

const DAQmx_DigEdge_StartTrig_DigFltr_TimebaseSrc = 0x2225

const DAQmx_DigEdge_StartTrig_DigFltr_TimebaseRate = 0x2226

const DAQmx_DigEdge_StartTrig_DigSync_Enable = 0x2227

const DAQmx_DigPattern_StartTrig_Src = 0x1410

const DAQmx_DigPattern_StartTrig_Pattern = 0x2186

const DAQmx_DigPattern_StartTrig_When = 0x1411

const DAQmx_AnlgEdge_StartTrig_Src = 0x1398

const DAQmx_AnlgEdge_StartTrig_Slope = 0x1397

const DAQmx_AnlgEdge_StartTrig_Lvl = 0x1396

const DAQmx_AnlgEdge_StartTrig_Hyst = 0x1395

const DAQmx_AnlgEdge_StartTrig_Coupling = 0x2233

const DAQmx_AnlgEdge_StartTrig_DigFltr_Enable = 0x2ee1

const DAQmx_AnlgEdge_StartTrig_DigFltr_MinPulseWidth = 0x2ee2

const DAQmx_AnlgEdge_StartTrig_DigFltr_TimebaseSrc = 0x2ee3

const DAQmx_AnlgEdge_StartTrig_DigFltr_TimebaseRate = 0x2ee4

const DAQmx_AnlgEdge_StartTrig_DigSync_Enable = 0x2ee5

const DAQmx_AnlgMultiEdge_StartTrig_Srcs = 0x3121

const DAQmx_AnlgMultiEdge_StartTrig_Slopes = 0x3122

const DAQmx_AnlgMultiEdge_StartTrig_Lvls = 0x3123

const DAQmx_AnlgMultiEdge_StartTrig_Hysts = 0x3124

const DAQmx_AnlgMultiEdge_StartTrig_Couplings = 0x3125

const DAQmx_AnlgWin_StartTrig_Src = 0x1400

const DAQmx_AnlgWin_StartTrig_When = 0x1401

const DAQmx_AnlgWin_StartTrig_Top = 0x1403

const DAQmx_AnlgWin_StartTrig_Btm = 0x1402

const DAQmx_AnlgWin_StartTrig_Coupling = 0x2234

const DAQmx_AnlgWin_StartTrig_DigFltr_Enable = 0x2eff

const DAQmx_AnlgWin_StartTrig_DigFltr_MinPulseWidth = 0x2f00

const DAQmx_AnlgWin_StartTrig_DigFltr_TimebaseSrc = 0x2f01

const DAQmx_AnlgWin_StartTrig_DigFltr_TimebaseRate = 0x2f02

const DAQmx_AnlgWin_StartTrig_DigSync_Enable = 0x2f03

const DAQmx_StartTrig_TrigWhen = 0x304d

const DAQmx_StartTrig_Timescale = 0x3036

const DAQmx_StartTrig_TimestampEnable = 0x314a

const DAQmx_StartTrig_TimestampTimescale = 0x312d

const DAQmx_StartTrig_TimestampVal = 0x314b

const DAQmx_StartTrig_Delay = 0x1856

const DAQmx_StartTrig_DelayUnits = 0x18c8

const DAQmx_StartTrig_Retriggerable = 0x190f

const DAQmx_StartTrig_TrigWin = 0x311a

const DAQmx_StartTrig_RetriggerWin = 0x311b

const DAQmx_StartTrig_MaxNumTrigsToDetect = 0x311c

const DAQmx_RefTrig_Type = 0x1419

const DAQmx_RefTrig_PretrigSamples = 0x1445

const DAQmx_RefTrig_Term = 0x2f1f

const DAQmx_DigEdge_RefTrig_Src = 0x1434

const DAQmx_DigEdge_RefTrig_Edge = 0x1430

const DAQmx_DigEdge_RefTrig_DigFltr_Enable = 0x2ed7

const DAQmx_DigEdge_RefTrig_DigFltr_MinPulseWidth = 0x2ed8

const DAQmx_DigEdge_RefTrig_DigFltr_TimebaseSrc = 0x2ed9

const DAQmx_DigEdge_RefTrig_DigFltr_TimebaseRate = 0x2eda

const DAQmx_DigEdge_RefTrig_DigSync_Enable = 0x2edb

const DAQmx_DigPattern_RefTrig_Src = 0x1437

const DAQmx_DigPattern_RefTrig_Pattern = 0x2187

const DAQmx_DigPattern_RefTrig_When = 0x1438

const DAQmx_AnlgEdge_RefTrig_Src = 0x1424

const DAQmx_AnlgEdge_RefTrig_Slope = 0x1423

const DAQmx_AnlgEdge_RefTrig_Lvl = 0x1422

const DAQmx_AnlgEdge_RefTrig_Hyst = 0x1421

const DAQmx_AnlgEdge_RefTrig_Coupling = 0x2235

const DAQmx_AnlgEdge_RefTrig_DigFltr_Enable = 0x2ee6

const DAQmx_AnlgEdge_RefTrig_DigFltr_MinPulseWidth = 0x2ee7

const DAQmx_AnlgEdge_RefTrig_DigFltr_TimebaseSrc = 0x2ee8

const DAQmx_AnlgEdge_RefTrig_DigFltr_TimebaseRate = 0x2ee9

const DAQmx_AnlgEdge_RefTrig_DigSync_Enable = 0x2eea

const DAQmx_AnlgMultiEdge_RefTrig_Srcs = 0x3126

const DAQmx_AnlgMultiEdge_RefTrig_Slopes = 0x3127

const DAQmx_AnlgMultiEdge_RefTrig_Lvls = 0x3128

const DAQmx_AnlgMultiEdge_RefTrig_Hysts = 0x3129

const DAQmx_AnlgMultiEdge_RefTrig_Couplings = 0x312a

const DAQmx_AnlgWin_RefTrig_Src = 0x1426

const DAQmx_AnlgWin_RefTrig_When = 0x1427

const DAQmx_AnlgWin_RefTrig_Top = 0x1429

const DAQmx_AnlgWin_RefTrig_Btm = 0x1428

const DAQmx_AnlgWin_RefTrig_Coupling = 0x1857

const DAQmx_AnlgWin_RefTrig_DigFltr_Enable = 0x2eeb

const DAQmx_AnlgWin_RefTrig_DigFltr_MinPulseWidth = 0x2eec

const DAQmx_AnlgWin_RefTrig_DigFltr_TimebaseSrc = 0x2eed

const DAQmx_AnlgWin_RefTrig_DigFltr_TimebaseRate = 0x2eee

const DAQmx_AnlgWin_RefTrig_DigSync_Enable = 0x2eef

const DAQmx_RefTrig_AutoTrigEnable = 0x2ec1

const DAQmx_RefTrig_AutoTriggered = 0x2ec2

const DAQmx_RefTrig_TimestampEnable = 0x312e

const DAQmx_RefTrig_TimestampTimescale = 0x3130

const DAQmx_RefTrig_TimestampVal = 0x312f

const DAQmx_RefTrig_Delay = 0x1483

const DAQmx_RefTrig_Retriggerable = 0x311d

const DAQmx_RefTrig_TrigWin = 0x311e

const DAQmx_RefTrig_RetriggerWin = 0x311f

const DAQmx_RefTrig_MaxNumTrigsToDetect = 0x3120

const DAQmx_AdvTrig_Type = 0x1365

const DAQmx_DigEdge_AdvTrig_Src = 0x1362

const DAQmx_DigEdge_AdvTrig_Edge = 0x1360

const DAQmx_DigEdge_AdvTrig_DigFltr_Enable = 0x2238

const DAQmx_HshkTrig_Type = 0x22b7

const DAQmx_Interlocked_HshkTrig_Src = 0x22b8

const DAQmx_Interlocked_HshkTrig_AssertedLvl = 0x22b9

const DAQmx_PauseTrig_Type = 0x1366

const DAQmx_PauseTrig_Term = 0x2f20

const DAQmx_AnlgLvl_PauseTrig_Src = 0x1370

const DAQmx_AnlgLvl_PauseTrig_When = 0x1371

const DAQmx_AnlgLvl_PauseTrig_Lvl = 0x1369

const DAQmx_AnlgLvl_PauseTrig_Hyst = 0x1368

const DAQmx_AnlgLvl_PauseTrig_Coupling = 0x2236

const DAQmx_AnlgLvl_PauseTrig_DigFltr_Enable = 0x2ef0

const DAQmx_AnlgLvl_PauseTrig_DigFltr_MinPulseWidth = 0x2ef1

const DAQmx_AnlgLvl_PauseTrig_DigFltr_TimebaseSrc = 0x2ef2

const DAQmx_AnlgLvl_PauseTrig_DigFltr_TimebaseRate = 0x2ef3

const DAQmx_AnlgLvl_PauseTrig_DigSync_Enable = 0x2ef4

const DAQmx_AnlgWin_PauseTrig_Src = 0x1373

const DAQmx_AnlgWin_PauseTrig_When = 0x1374

const DAQmx_AnlgWin_PauseTrig_Top = 0x1376

const DAQmx_AnlgWin_PauseTrig_Btm = 0x1375

const DAQmx_AnlgWin_PauseTrig_Coupling = 0x2237

const DAQmx_AnlgWin_PauseTrig_DigFltr_Enable = 0x2ef5

const DAQmx_AnlgWin_PauseTrig_DigFltr_MinPulseWidth = 0x2ef6

const DAQmx_AnlgWin_PauseTrig_DigFltr_TimebaseSrc = 0x2ef7

const DAQmx_AnlgWin_PauseTrig_DigFltr_TimebaseRate = 0x2ef8

const DAQmx_AnlgWin_PauseTrig_DigSync_Enable = 0x2ef9

const DAQmx_DigLvl_PauseTrig_Src = 0x1379

const DAQmx_DigLvl_PauseTrig_When = 0x1380

const DAQmx_DigLvl_PauseTrig_DigFltr_Enable = 0x2228

const DAQmx_DigLvl_PauseTrig_DigFltr_MinPulseWidth = 0x2229

const DAQmx_DigLvl_PauseTrig_DigFltr_TimebaseSrc = 0x222a

const DAQmx_DigLvl_PauseTrig_DigFltr_TimebaseRate = 0x222b

const DAQmx_DigLvl_PauseTrig_DigSync_Enable = 0x222c

const DAQmx_DigPattern_PauseTrig_Src = 0x216f

const DAQmx_DigPattern_PauseTrig_Pattern = 0x2188

const DAQmx_DigPattern_PauseTrig_When = 0x2170

const DAQmx_ArmStartTrig_Type = 0x1414

const DAQmx_ArmStart_Term = 0x2f7f

const DAQmx_DigEdge_ArmStartTrig_Src = 0x1417

const DAQmx_DigEdge_ArmStartTrig_Edge = 0x1415

const DAQmx_DigEdge_ArmStartTrig_DigFltr_Enable = 0x222d

const DAQmx_DigEdge_ArmStartTrig_DigFltr_MinPulseWidth = 0x222e

const DAQmx_DigEdge_ArmStartTrig_DigFltr_TimebaseSrc = 0x222f

const DAQmx_DigEdge_ArmStartTrig_DigFltr_TimebaseRate = 0x2230

const DAQmx_DigEdge_ArmStartTrig_DigSync_Enable = 0x2231

const DAQmx_ArmStartTrig_TrigWhen = 0x3131

const DAQmx_ArmStartTrig_Timescale = 0x3132

const DAQmx_ArmStartTrig_TimestampEnable = 0x3133

const DAQmx_ArmStartTrig_TimestampTimescale = 0x3135

const DAQmx_ArmStartTrig_TimestampVal = 0x3134

const DAQmx_Trigger_SyncType = 0x2f80

const DAQmx_Watchdog_Timeout = 0x21a9

const DAQmx_WatchdogExpirTrig_Type = 0x21a3

const DAQmx_WatchdogExpirTrig_TrigOnNetworkConnLoss = 0x305d

const DAQmx_DigEdge_WatchdogExpirTrig_Src = 0x21a4

const DAQmx_DigEdge_WatchdogExpirTrig_Edge = 0x21a5

const DAQmx_Watchdog_DO_ExpirState = 0x21a7

const DAQmx_Watchdog_AO_OutputType = 0x305e

const DAQmx_Watchdog_AO_ExpirState = 0x305f

const DAQmx_Watchdog_CO_ExpirState = 0x3060

const DAQmx_Watchdog_HasExpired = 0x21a8

const DAQmx_Write_RelativeTo = 0x190c

const DAQmx_Write_Offset = 0x190d

const DAQmx_Write_RegenMode = 0x1453

const DAQmx_Write_CurrWritePos = 0x1458

const DAQmx_Write_OvercurrentChansExist = 0x29e8

const DAQmx_Write_OvercurrentChans = 0x29e9

const DAQmx_Write_OvertemperatureChansExist = 0x2a84

const DAQmx_Write_OvertemperatureChans = 0x3083

const DAQmx_Write_ExternalOvervoltageChansExist = 0x30bb

const DAQmx_Write_ExternalOvervoltageChans = 0x30bc

const DAQmx_Write_OverloadedChansExist = 0x3084

const DAQmx_Write_OverloadedChans = 0x3085

const DAQmx_Write_OpenCurrentLoopChansExist = 0x29ea

const DAQmx_Write_OpenCurrentLoopChans = 0x29eb

const DAQmx_Write_PowerSupplyFaultChansExist = 0x29ec

const DAQmx_Write_PowerSupplyFaultChans = 0x29ed

const DAQmx_Write_Sync_UnlockedChansExist = 0x313f

const DAQmx_Write_Sync_UnlockedChans = 0x3140

const DAQmx_Write_SpaceAvail = 0x1460

const DAQmx_Write_TotalSampPerChanGenerated = 0x192b

const DAQmx_Write_AccessoryInsertionOrRemovalDetected = 0x3053

const DAQmx_Write_DevsWithInsertedOrRemovedAccessories = 0x3054

const DAQmx_Write_RawDataWidth = 0x217d

const DAQmx_Write_NumChans = 0x217e

const DAQmx_Write_WaitMode = 0x22b1

const DAQmx_Write_SleepTime = 0x22b2

const DAQmx_Write_DigitalLines_BytesPerChan = 0x217f

const DAQmx_ReadWaitMode = DAQmx_Read_WaitMode

const DAQmx_Val_Task_Start = 0

const DAQmx_Val_Task_Stop = 1

const DAQmx_Val_Task_Verify = 2

const DAQmx_Val_Task_Commit = 3

const DAQmx_Val_Task_Reserve = 4

const DAQmx_Val_Task_Unreserve = 5

const DAQmx_Val_Task_Abort = 6

const DAQmx_Val_SynchronousEventCallbacks = 1 << 0

const DAQmx_Val_Acquired_Into_Buffer = 1

const DAQmx_Val_Transferred_From_Buffer = 2

const DAQmx_Val_ResetTimer = 0

const DAQmx_Val_ClearExpiration = 1

const DAQmx_Val_ChanPerLine = 0

const DAQmx_Val_ChanForAllLines = 1

const DAQmx_Val_GroupByChannel = 0

const DAQmx_Val_GroupByScanNumber = 1

const DAQmx_Val_DoNotInvertPolarity = 0

const DAQmx_Val_InvertPolarity = 1

const DAQmx_Val_Action_Commit = 0

const DAQmx_Val_Action_Cancel = 1

const DAQmx_Val_AdvanceTrigger = 12488

const DAQmx_Val_Rising = 10280

const DAQmx_Val_Falling = 10171

const DAQmx_Val_PathStatus_Available = 10431

const DAQmx_Val_PathStatus_AlreadyExists = 10432

const DAQmx_Val_PathStatus_Unsupported = 10433

const DAQmx_Val_PathStatus_ChannelInUse = 10434

const DAQmx_Val_PathStatus_SourceChannelConflict = 10435

const DAQmx_Val_PathStatus_ChannelReservedForRouting = 10436

const DAQmx_Val_DegC = 10143

const DAQmx_Val_DegF = 10144

const DAQmx_Val_Kelvins = 10325

const DAQmx_Val_DegR = 10145

const DAQmx_Val_High = 10192

const DAQmx_Val_Low = 10214

const DAQmx_Val_Tristate = 10310

const DAQmx_Val_PullUp = 15950

const DAQmx_Val_PullDown = 15951

const DAQmx_Val_ChannelVoltage = 0

const DAQmx_Val_ChannelCurrent = 1

const DAQmx_Val_ChannelHighImpedance = 2

const DAQmx_Val_Open = 10437

const DAQmx_Val_Closed = 10438

const DAQmx_Val_Loopback0 = 0

const DAQmx_Val_Loopback180 = 1

const DAQmx_Val_Ground = 2

const DAQmx_Val_Voltage = 10322

const DAQmx_Val_Bridge = 15908

const DAQmx_Val_Current = 10134

const DAQmx_Val_Diff = 10106

const DAQmx_Val_PseudoDiff = 12529

const DAQmx_Val_Charge = 16105

const DAQmx_Val_PowerCalibrationType_RemoteVoltage = 15100

const DAQmx_Val_PowerCalibrationType_LocalVoltage = 15101

const DAQmx_Val_PowerCalibrationType_Current = 15102

const DAQmx_Val_A = 12513

const DAQmx_Val_B = 12514

const DAQmx_Val_Newtons = 15875

const DAQmx_Val_Pounds = 15876

const DAQmx_Val_FromCustomScale = 10065

const DAQmx_Val_StartTrigger = 12491

const DAQmx_Val_ReferenceTrigger = 12490

const DAQmx_Val_ArmStartTrigger = 14641

const DAQmx_Val_FirstSampleTimestamp = 16130

const DAQmx_Val_FullBridge = 10182

const DAQmx_Val_HalfBridge = 10187

const DAQmx_Val_QuarterBridge120OhmCompletionResistor = 16163

const DAQmx_Val_QuarterBridge350OhmCompletionResistor = 16164

const DAQmx_Val_Cfg_Default = -1

const DAQmx_Val_Default = -1

const DAQmx_Val_WaitInfinitely = -1.0

const DAQmx_Val_Auto = -1

const DAQmx_Val_Save_Overwrite = 1 << 0

const DAQmx_Val_Save_AllowInteractiveEditing = 1 << 1

const DAQmx_Val_Save_AllowInteractiveDeletion = 1 << 2

const DAQmx_Val_Bit_TriggerUsageTypes_Advance = 1 << 0

const DAQmx_Val_Bit_TriggerUsageTypes_Pause = 1 << 1

const DAQmx_Val_Bit_TriggerUsageTypes_Reference = 1 << 2

const DAQmx_Val_Bit_TriggerUsageTypes_Start = 1 << 3

const DAQmx_Val_Bit_TriggerUsageTypes_Handshake = 1 << 4

const DAQmx_Val_Bit_TriggerUsageTypes_ArmStart = 1 << 5

const DAQmx_Val_Bit_CouplingTypes_AC = 1 << 0

const DAQmx_Val_Bit_CouplingTypes_DC = 1 << 1

const DAQmx_Val_Bit_CouplingTypes_Ground = 1 << 2

const DAQmx_Val_Bit_CouplingTypes_HFReject = 1 << 3

const DAQmx_Val_Bit_CouplingTypes_LFReject = 1 << 4

const DAQmx_Val_Bit_CouplingTypes_NoiseReject = 1 << 5

const DAQmx_Val_Bit_TermCfg_RSE = 1 << 0

const DAQmx_Val_Bit_TermCfg_NRSE = 1 << 1

const DAQmx_Val_Bit_TermCfg_Diff = 1 << 2

const DAQmx_Val_Bit_TermCfg_PseudoDIFF = 1 << 3

const DAQmx_Val_4Wire = 4

const DAQmx_Val_5Wire = 5

const DAQmx_Val_6Wire = 6

const DAQmx_Val_Automatic = 16097

const DAQmx_Val_HighResolution = 10195

const DAQmx_Val_HighSpeed = 14712

const DAQmx_Val_Best50HzRejection = 14713

const DAQmx_Val_Best60HzRejection = 14714

const DAQmx_Val_Custom = 10137

const DAQmx_Val_VoltageRMS = 10350

const DAQmx_Val_CurrentRMS = 10351

const DAQmx_Val_Voltage_CustomWithExcitation = 10323

const DAQmx_Val_Freq_Voltage = 10181

const DAQmx_Val_Resistance = 10278

const DAQmx_Val_Temp_TC = 10303

const DAQmx_Val_Temp_Thrmstr = 10302

const DAQmx_Val_Temp_RTD = 10301

const DAQmx_Val_Temp_BuiltInSensor = 10311

const DAQmx_Val_Strain_Gage = 10300

const DAQmx_Val_Rosette_Strain_Gage = 15980

const DAQmx_Val_Position_LVDT = 10352

const DAQmx_Val_Position_RVDT = 10353

const DAQmx_Val_Position_EddyCurrentProximityProbe = 14835

const DAQmx_Val_Accelerometer = 10356

const DAQmx_Val_Acceleration_Charge = 16104

const DAQmx_Val_Acceleration_4WireDCVoltage = 16106

const DAQmx_Val_Velocity_IEPESensor = 15966

const DAQmx_Val_Force_Bridge = 15899

const DAQmx_Val_Force_IEPESensor = 15895

const DAQmx_Val_Pressure_Bridge = 15902

const DAQmx_Val_SoundPressure_Microphone = 10354

const DAQmx_Val_Torque_Bridge = 15905

const DAQmx_Val_TEDS_Sensor = 12531

const DAQmx_Val_Power = 16201

const DAQmx_Val_Calculated_Power = 16204

const DAQmx_Val_ZeroVolts = 12526

const DAQmx_Val_HighImpedance = 12527

const DAQmx_Val_MaintainExistingValue = 12528

const DAQmx_Val_FuncGen = 14750

const DAQmx_Val_PicoCoulombsPerG = 16099

const DAQmx_Val_PicoCoulombsPerMetersPerSecondSquared = 16100

const DAQmx_Val_PicoCoulombsPerInchesPerSecondSquared = 16101

const DAQmx_Val_mVoltsPerG = 12509

const DAQmx_Val_VoltsPerG = 12510

const DAQmx_Val_AccelUnit_g = 10186

const DAQmx_Val_MetersPerSecondSquared = 12470

const DAQmx_Val_InchesPerSecondSquared = 12471

const DAQmx_Val_FiniteSamps = 10178

const DAQmx_Val_ContSamps = 10123

const DAQmx_Val_HWTimedSinglePoint = 12522

const DAQmx_Val_AboveLvl = 10093

const DAQmx_Val_BelowLvl = 10107

const DAQmx_Val_Degrees = 10146

const DAQmx_Val_Radians = 10273

const DAQmx_Val_Ticks = 10304

const DAQmx_Val_RPM = 16080

const DAQmx_Val_RadiansPerSecond = 16081

const DAQmx_Val_DegreesPerSecond = 16082

const DAQmx_Val_None = 10230

const DAQmx_Val_Once = 10244

const DAQmx_Val_EverySample = 10164

const DAQmx_Val_NoAction = 10227

const DAQmx_Val_BreakBeforeMake = 10110

const DAQmx_Val_QuarterBridge = 10270

const DAQmx_Val_NoBridge = 10228

const DAQmx_Val_VoltsPerVolt = 15896

const DAQmx_Val_mVoltsPerVolt = 15897

const DAQmx_Val_KilogramForce = 15877

const DAQmx_Val_Pascals = 10081

const DAQmx_Val_PoundsPerSquareInch = 15879

const DAQmx_Val_Bar = 15880

const DAQmx_Val_NewtonMeters = 15881

const DAQmx_Val_InchOunces = 15882

const DAQmx_Val_InchPounds = 15883

const DAQmx_Val_FootPounds = 15884

const DAQmx_Val_FromTEDS = 12516

const DAQmx_Val_PCI = 12582

const DAQmx_Val_PCIe = 13612

const DAQmx_Val_PXI = 12583

const DAQmx_Val_PXIe = 14706

const DAQmx_Val_SCXI = 12584

const DAQmx_Val_SCC = 14707

const DAQmx_Val_PCCard = 12585

const DAQmx_Val_USB = 12586

const DAQmx_Val_CompactDAQ = 14637

const DAQmx_Val_CompactRIO = 16143

const DAQmx_Val_TCPIP = 14828

const DAQmx_Val_Unknown = 12588

const DAQmx_Val_SwitchBlock = 15870

const DAQmx_Val_CountEdges = 10125

const DAQmx_Val_Freq = 10179

const DAQmx_Val_Period = 10256

const DAQmx_Val_PulseWidth = 10359

const DAQmx_Val_SemiPeriod = 10289

const DAQmx_Val_PulseFrequency = 15864

const DAQmx_Val_PulseTime = 15865

const DAQmx_Val_PulseTicks = 15866

const DAQmx_Val_DutyCycle = 16070

const DAQmx_Val_Position_AngEncoder = 10360

const DAQmx_Val_Position_LinEncoder = 10361

const DAQmx_Val_Velocity_AngEncoder = 16078

const DAQmx_Val_Velocity_LinEncoder = 16079

const DAQmx_Val_TwoEdgeSep = 10267

const DAQmx_Val_GPS_Timestamp = 10362

const DAQmx_Val_BuiltIn = 10200

const DAQmx_Val_ConstVal = 10116

const DAQmx_Val_Chan = 10113

const DAQmx_Val_Pulse_Time = 10269

const DAQmx_Val_Pulse_Freq = 10119

const DAQmx_Val_Pulse_Ticks = 10268

const DAQmx_Val_AI = 10100

const DAQmx_Val_AO = 10102

const DAQmx_Val_DI = 10151

const DAQmx_Val_DO = 10153

const DAQmx_Val_CI = 10131

const DAQmx_Val_CO = 10132

const DAQmx_Val_Unconstrained = 14708

const DAQmx_Val_FixedHighFreq = 14709

const DAQmx_Val_FixedLowFreq = 14710

const DAQmx_Val_Fixed50PercentDutyCycle = 14711

const DAQmx_Val_CountUp = 10128

const DAQmx_Val_CountDown = 10124

const DAQmx_Val_ExtControlled = 10326

const DAQmx_Val_LowFreq1Ctr = 10105

const DAQmx_Val_HighFreq2Ctr = 10157

const DAQmx_Val_LargeRng2Ctr = 10205

const DAQmx_Val_DynAvg = 16065

const DAQmx_Val_AC = 10045

const DAQmx_Val_DC = 10050

const DAQmx_Val_GND = 10066

const DAQmx_Val_Internal = 10200

const DAQmx_Val_External = 10167

const DAQmx_Val_UserProvided = 10167

const DAQmx_Val_Coulombs = 16102

const DAQmx_Val_PicoCoulombs = 16103

const DAQmx_Val_Amps = 10342

const DAQmx_Val_RightJustified = 10279

const DAQmx_Val_LeftJustified = 10209

const DAQmx_Val_DMA = 10054

const DAQmx_Val_Interrupts = 10204

const DAQmx_Val_ProgrammedIO = 10264

const DAQmx_Val_USBbulk = 12590

const DAQmx_Val_OnbrdMemMoreThanHalfFull = 10237

const DAQmx_Val_OnbrdMemFull = 10236

const DAQmx_Val_OnbrdMemCustomThreshold = 12577

const DAQmx_Val_ActiveDrive = 12573

const DAQmx_Val_OpenCollector = 12574

const DAQmx_Val_NoChange = 10160

const DAQmx_Val_PatternMatches = 10254

const DAQmx_Val_PatternDoesNotMatch = 10253

const DAQmx_Val_SampClkPeriods = 10286

const DAQmx_Val_Seconds = 10364

const DAQmx_Val_SampleClkPeriods = 10286

const DAQmx_Val_mVoltsPerMil = 14836

const DAQmx_Val_VoltsPerMil = 14837

const DAQmx_Val_mVoltsPerMillimeter = 14838

const DAQmx_Val_VoltsPerMillimeter = 14839

const DAQmx_Val_mVoltsPerMicron = 14840

const DAQmx_Val_X1 = 10090

const DAQmx_Val_X2 = 10091

const DAQmx_Val_X4 = 10092

const DAQmx_Val_TwoPulseCounting = 10313

const DAQmx_Val_AHighBHigh = 10040

const DAQmx_Val_AHighBLow = 10041

const DAQmx_Val_ALowBHigh = 10042

const DAQmx_Val_ALowBLow = 10043

const DAQmx_Val_Pulse = 10265

const DAQmx_Val_Toggle = 10307

const DAQmx_Val_Lvl = 10210

const DAQmx_Val_Interlocked = 12549

const DAQmx_Val_Lowpass = 16071

const DAQmx_Val_Highpass = 16072

const DAQmx_Val_Bandpass = 16073

const DAQmx_Val_Notch = 16074

const DAQmx_Val_ConstantGroupDelay = 16075

const DAQmx_Val_Butterworth = 16076

const DAQmx_Val_Elliptical = 16077

const DAQmx_Val_HardwareDefined = 10191

const DAQmx_Val_Comb = 16152

const DAQmx_Val_Bessel = 16153

const DAQmx_Val_Brickwall = 16155

const DAQmx_Val_mVoltsPerNewton = 15891

const DAQmx_Val_mVoltsPerPound = 15892

const DAQmx_Val_Hz = 10373

const DAQmx_Val_Sine = 14751

const DAQmx_Val_Triangle = 14752

const DAQmx_Val_Square = 14753

const DAQmx_Val_Sawtooth = 14754

const DAQmx_Val_IRIGB = 10070

const DAQmx_Val_PPS = 10080

const DAQmx_Val_Immediate = 10198

const DAQmx_Val_WaitForHandshakeTriggerAssert = 12550

const DAQmx_Val_WaitForHandshakeTriggerDeassert = 12551

const DAQmx_Val_MemoryNotPresent = 16205

const DAQmx_Val_MemoryPresent = 16206

const DAQmx_Val_OnBrdMemMoreThanHalfFull = 10237

const DAQmx_Val_OnBrdMemNotEmpty = 10241

const DAQmx_Val_WhenAcqComplete = 12546

const DAQmx_Val_RSE = 10083

const DAQmx_Val_NRSE = 10078

const DAQmx_Val_mVoltsPerVoltPerMillimeter = 12506

const DAQmx_Val_mVoltsPerVoltPerMilliInch = 12505

const DAQmx_Val_Meters = 10219

const DAQmx_Val_Inches = 10379

const DAQmx_Val_Off = 10231

const DAQmx_Val_Log = 15844

const DAQmx_Val_LogAndRead = 15842

const DAQmx_Val_OpenOrCreate = 15846

const DAQmx_Val_CreateOrReplace = 15847

const DAQmx_Val_Create = 15848

const DAQmx_Val_1point8V = 16184

const DAQmx_Val_2point5V = 14620

const DAQmx_Val_3point3V = 14621

const DAQmx_Val_5V = 14619

const DAQmx_Val_SameAsSampTimebase = 10284

const DAQmx_Val_SameAsMasterTimebase = 10282

const DAQmx_Val_100MHzTimebase = 15857

const DAQmx_Val_80MHzTimebase = 14636

const DAQmx_Val_20MHzTimebase = 12537

const DAQmx_Val_8MHzTimebase = 16023

const DAQmx_Val_AM = 14756

const DAQmx_Val_FM = 14757

const DAQmx_Val_OnBrdMemEmpty = 10235

const DAQmx_Val_OnBrdMemHalfFullOrLess = 10239

const DAQmx_Val_OnBrdMemNotFull = 10242

const DAQmx_Val_StopTaskAndError = 15862

const DAQmx_Val_IgnoreOverruns = 15863

const DAQmx_Val_OverwriteUnreadSamps = 10252

const DAQmx_Val_DoNotOverwriteUnreadSamps = 10159

const DAQmx_Val_ActiveHigh = 10095

const DAQmx_Val_ActiveLow = 10096

const DAQmx_Val_OutputDisabled = 15503

const DAQmx_Val_ConstantVoltage = 15500

const DAQmx_Val_ConstantCurrent = 15501

const DAQmx_Val_Overvoltage = 15502

const DAQmx_Val_Watts = 16203

const DAQmx_Val_MSeriesDAQ = 14643

const DAQmx_Val_XSeriesDAQ = 15858

const DAQmx_Val_ESeriesDAQ = 14642

const DAQmx_Val_SSeriesDAQ = 14644

const DAQmx_Val_BSeriesDAQ = 14662

const DAQmx_Val_SCSeriesDAQ = 14645

const DAQmx_Val_USBDAQ = 14646

const DAQmx_Val_AOSeries = 14647

const DAQmx_Val_DigitalIO = 14648

const DAQmx_Val_TIOSeries = 14661

const DAQmx_Val_DynamicSignalAcquisition = 14649

const DAQmx_Val_Switches = 14650

const DAQmx_Val_CompactDAQChassis = 14658

const DAQmx_Val_CompactRIOChassis = 16144

const DAQmx_Val_CSeriesModule = 14659

const DAQmx_Val_SCXIModule = 14660

const DAQmx_Val_SCCConnectorBlock = 14704

const DAQmx_Val_SCCModule = 14705

const DAQmx_Val_NIELVIS = 14755

const DAQmx_Val_NetworkDAQ = 14829

const DAQmx_Val_SCExpress = 15886

const DAQmx_Val_FieldDAQ = 16151

const DAQmx_Val_TestScaleChassis = 16180

const DAQmx_Val_TestScaleModule = 16181

const DAQmx_Val_mioDAQ = 16182

const DAQmx_Val_Pt3750 = 12481

const DAQmx_Val_Pt3851 = 10071

const DAQmx_Val_Pt3911 = 12482

const DAQmx_Val_Pt3916 = 10069

const DAQmx_Val_Pt3920 = 10053

const DAQmx_Val_Pt3928 = 12483

const DAQmx_Val_mVoltsPerVoltPerDegree = 12507

const DAQmx_Val_mVoltsPerVoltPerRadian = 12508

const DAQmx_Val_LosslessPacking = 12555

const DAQmx_Val_LossyLSBRemoval = 12556

const DAQmx_Val_FirstSample = 10424

const DAQmx_Val_CurrReadPos = 10425

const DAQmx_Val_RefTrig = 10426

const DAQmx_Val_FirstPretrigSamp = 10427

const DAQmx_Val_MostRecentSamp = 10428

const DAQmx_Val_AllowRegen = 10097

const DAQmx_Val_DoNotAllowRegen = 10158

const DAQmx_Val_2Wire = 2

const DAQmx_Val_3Wire = 3

const DAQmx_Val_Ohms = 10384

const DAQmx_Val_Bits = 10109

const DAQmx_Val_SCXI1124Range0to1V = 14629

const DAQmx_Val_SCXI1124Range0to5V = 14630

const DAQmx_Val_SCXI1124Range0to10V = 14631

const DAQmx_Val_SCXI1124RangeNeg1to1V = 14632

const DAQmx_Val_SCXI1124RangeNeg5to5V = 14633

const DAQmx_Val_SCXI1124RangeNeg10to10V = 14634

const DAQmx_Val_SCXI1124Range0to20mA = 14635

const DAQmx_Val_SampClkActiveEdge = 14617

const DAQmx_Val_SampClkInactiveEdge = 14618

const DAQmx_Val_HandshakeTriggerAsserts = 12552

const DAQmx_Val_HandshakeTriggerDeasserts = 12553

const DAQmx_Val_SampClk = 10388

const DAQmx_Val_BurstHandshake = 12548

const DAQmx_Val_Handshake = 10389

const DAQmx_Val_Implicit = 10451

const DAQmx_Val_OnDemand = 10390

const DAQmx_Val_ChangeDetection = 12504

const DAQmx_Val_PipelinedSampClk = 14668

const DAQmx_Val_Linear = 10447

const DAQmx_Val_MapRanges = 10448

const DAQmx_Val_Polynomial = 10449

const DAQmx_Val_Table = 10450

const DAQmx_Val_TwoPointLinear = 15898

const DAQmx_Val_Enabled = 16145

const DAQmx_Val_Disabled = 16146

const DAQmx_Val_BipolarDC = 16147

const DAQmx_Val_AandB = 12515

const DAQmx_Val_R1 = 12465

const DAQmx_Val_R2 = 12466

const DAQmx_Val_R3 = 12467

const DAQmx_Val_R4 = 14813

const DAQmx_Val_AIConvertClock = 12484

const DAQmx_Val_10MHzRefClock = 12536

const DAQmx_Val_20MHzTimebaseClock = 12486

const DAQmx_Val_SampleClock = 12487

const DAQmx_Val_AdvCmpltEvent = 12492

const DAQmx_Val_AIHoldCmpltEvent = 12493

const DAQmx_Val_CounterOutputEvent = 12494

const DAQmx_Val_ChangeDetectionEvent = 12511

const DAQmx_Val_WDTExpiredEvent = 12512

const DAQmx_Val_SampleCompleteEvent = 12530

const DAQmx_Val_RisingSlope = 10280

const DAQmx_Val_FallingSlope = 10171

const DAQmx_Val_FullBridgeI = 10183

const DAQmx_Val_FullBridgeII = 10184

const DAQmx_Val_FullBridgeIII = 10185

const DAQmx_Val_HalfBridgeI = 10188

const DAQmx_Val_HalfBridgeII = 10189

const DAQmx_Val_QuarterBridgeI = 10271

const DAQmx_Val_QuarterBridgeII = 10272

const DAQmx_Val_RectangularRosette = 15968

const DAQmx_Val_DeltaRosette = 15969

const DAQmx_Val_TeeRosette = 15970

const DAQmx_Val_PrincipalStrain1 = 15971

const DAQmx_Val_PrincipalStrain2 = 15972

const DAQmx_Val_PrincipalStrainAngle = 15973

const DAQmx_Val_CartesianStrainX = 15974

const DAQmx_Val_CartesianStrainY = 15975

const DAQmx_Val_CartesianShearStrainXY = 15976

const DAQmx_Val_MaxShearStrain = 15977

const DAQmx_Val_MaxShearStrainAngle = 15978

const DAQmx_Val_Strain = 10299

const DAQmx_Val_Finite = 10172

const DAQmx_Val_Cont = 10117

const DAQmx_Val_Source = 10439

const DAQmx_Val_Load = 10440

const DAQmx_Val_ReservedForRouting = 10441

const DAQmx_Val_Onboard = 16128

const DAQmx_Val_DigEdge = 10150

const DAQmx_Val_Time = 15996

const DAQmx_Val_Master = 15888

const DAQmx_Val_Slave = 15889

const DAQmx_Val_IgnoreLostSyncLock = 16129

const DAQmx_Val_J_Type_TC = 10072

const DAQmx_Val_K_Type_TC = 10073

const DAQmx_Val_N_Type_TC = 10077

const DAQmx_Val_R_Type_TC = 10082

const DAQmx_Val_S_Type_TC = 10085

const DAQmx_Val_T_Type_TC = 10086

const DAQmx_Val_B_Type_TC = 10047

const DAQmx_Val_E_Type_TC = 10055

const DAQmx_Val_A_Type_TC = 16208

const DAQmx_Val_C_Type_TC = 16209

const DAQmx_Val_HostTime = 16126

const DAQmx_Val_IODeviceTime = 16127

const DAQmx_Val_SingleCycle = 14613

const DAQmx_Val_Multicycle = 14614

const DAQmx_Val_Software = 10292

const DAQmx_Val_AnlgLvl = 10101

const DAQmx_Val_AnlgWin = 10103

const DAQmx_Val_DigLvl = 10152

const DAQmx_Val_DigPattern = 10398

const DAQmx_Val_AnlgEdge = 10099

const DAQmx_Val_AnlgMultiEdge = 16108

const DAQmx_Val_HaltOutputAndError = 14615

const DAQmx_Val_PauseUntilDataAvailable = 14616

const DAQmx_Val_Volts = 10348

const DAQmx_Val_g = 10186

const DAQmx_Val_MetersPerSecond = 15959

const DAQmx_Val_InchesPerSecond = 15960

const DAQmx_Val_MillivoltsPerMillimeterPerSecond = 15963

const DAQmx_Val_MilliVoltsPerInchPerSecond = 15964

const DAQmx_Val_WaitForInterrupt = 12523

const DAQmx_Val_Poll = 12524

const DAQmx_Val_Yield = 12525

const DAQmx_Val_Sleep = 12547

const DAQmx_Val_EnteringWin = 10163

const DAQmx_Val_LeavingWin = 10208

const DAQmx_Val_InsideWin = 10199

const DAQmx_Val_OutsideWin = 10251

const DAQmx_Val_WriteToEEPROM = 12538

const DAQmx_Val_WriteToPROM = 12539

const DAQmx_Val_DoNotWrite = 12540

const DAQmx_Val_CurrWritePos = 10430

const DAQmx_Val_ZeroVoltsOrAmps = 12526

const DAQmx_Val_RepeatedData = 16062

const DAQmx_Val_SentinelValue = 16063

const DAQmx_Val_LogicLevelPullUp = 16064

const DAQmx_Val_Local = 16095

const DAQmx_Val_Remote = 16096

const DAQmx_Val_Switch_Topology_Configured_Topology = "Configured Topology"

const DAQmx_Val_Switch_Topology_1127_1_Wire_64x1_Mux = "1127/1-Wire 64x1 Mux"

const DAQmx_Val_Switch_Topology_1127_2_Wire_32x1_Mux = "1127/2-Wire 32x1 Mux"

const DAQmx_Val_Switch_Topology_1127_2_Wire_4x8_Matrix = "1127/2-Wire 4x8 Matrix"

const DAQmx_Val_Switch_Topology_1127_4_Wire_16x1_Mux = "1127/4-Wire 16x1 Mux"

const DAQmx_Val_Switch_Topology_1127_Independent = "1127/Independent"

const DAQmx_Val_Switch_Topology_1128_1_Wire_64x1_Mux = "1128/1-Wire 64x1 Mux"

const DAQmx_Val_Switch_Topology_1128_2_Wire_32x1_Mux = "1128/2-Wire 32x1 Mux"

const DAQmx_Val_Switch_Topology_1128_2_Wire_4x8_Matrix = "1128/2-Wire 4x8 Matrix"

const DAQmx_Val_Switch_Topology_1128_4_Wire_16x1_Mux = "1128/4-Wire 16x1 Mux"

const DAQmx_Val_Switch_Topology_1128_Independent = "1128/Independent"

const DAQmx_Val_Switch_Topology_1129_2_Wire_16x16_Matrix = "1129/2-Wire 16x16 Matrix"

const DAQmx_Val_Switch_Topology_1129_2_Wire_8x32_Matrix = "1129/2-Wire 8x32 Matrix"

const DAQmx_Val_Switch_Topology_1129_2_Wire_4x64_Matrix = "1129/2-Wire 4x64 Matrix"

const DAQmx_Val_Switch_Topology_1129_2_Wire_Dual_8x16_Matrix = "1129/2-Wire Dual 8x16 Matrix"

const DAQmx_Val_Switch_Topology_1129_2_Wire_Dual_4x32_Matrix = "1129/2-Wire Dual 4x32 Matrix"

const DAQmx_Val_Switch_Topology_1129_2_Wire_Quad_4x16_Matrix = "1129/2-Wire Quad 4x16 Matrix"

const DAQmx_Val_Switch_Topology_1130_1_Wire_256x1_Mux = "1130/1-Wire 256x1 Mux"

const DAQmx_Val_Switch_Topology_1130_1_Wire_Dual_128x1_Mux = "1130/1-Wire Dual 128x1 Mux"

const DAQmx_Val_Switch_Topology_1130_2_Wire_128x1_Mux = "1130/2-Wire 128x1 Mux"

const DAQmx_Val_Switch_Topology_1130_4_Wire_64x1_Mux = "1130/4-Wire 64x1 Mux"

const DAQmx_Val_Switch_Topology_1130_1_Wire_4x64_Matrix = "1130/1-Wire 4x64 Matrix"

const DAQmx_Val_Switch_Topology_1130_1_Wire_8x32_Matrix = "1130/1-Wire 8x32 Matrix"

const DAQmx_Val_Switch_Topology_1130_1_Wire_Octal_32x1_Mux = "1130/1-Wire Octal 32x1 Mux"

const DAQmx_Val_Switch_Topology_1130_1_Wire_Quad_64x1_Mux = "1130/1-Wire Quad 64x1 Mux"

const DAQmx_Val_Switch_Topology_1130_1_Wire_Sixteen_16x1_Mux = "1130/1-Wire Sixteen 16x1 Mux"

const DAQmx_Val_Switch_Topology_1130_2_Wire_4x32_Matrix = "1130/2-Wire 4x32 Matrix"

const DAQmx_Val_Switch_Topology_1130_2_Wire_Octal_16x1_Mux = "1130/2-Wire Octal 16x1 Mux"

const DAQmx_Val_Switch_Topology_1130_2_Wire_Quad_32x1_Mux = "1130/2-Wire Quad 32x1 Mux"

const DAQmx_Val_Switch_Topology_1130_4_Wire_Quad_16x1_Mux = "1130/4-Wire Quad 16x1 Mux"

const DAQmx_Val_Switch_Topology_1130_Independent = "1130/Independent"

const DAQmx_Val_Switch_Topology_1160_16_SPDT = "1160/16-SPDT"

const DAQmx_Val_Switch_Topology_1161_8_SPDT = "1161/8-SPDT"

const DAQmx_Val_Switch_Topology_1163R_Octal_4x1_Mux = "1163R/Octal 4x1 Mux"

const DAQmx_Val_Switch_Topology_1166_32_SPDT = "1166/32-SPDT"

const DAQmx_Val_Switch_Topology_1166_16_DPDT = "1166/16-DPDT"

const DAQmx_Val_Switch_Topology_1167_Independent = "1167/Independent"

const DAQmx_Val_Switch_Topology_1169_100_SPST = "1169/100-SPST"

const DAQmx_Val_Switch_Topology_1169_50_DPST = "1169/50-DPST"

const DAQmx_Val_Switch_Topology_1175_1_Wire_196x1_Mux = "1175/1-Wire 196x1 Mux"

const DAQmx_Val_Switch_Topology_1175_2_Wire_98x1_Mux = "1175/2-Wire 98x1 Mux"

const DAQmx_Val_Switch_Topology_1175_2_Wire_95x1_Mux = "1175/2-Wire 95x1 Mux"

const DAQmx_Val_Switch_Topology_1190_Quad_4x1_Mux = "1190/Quad 4x1 Mux"

const DAQmx_Val_Switch_Topology_1191_Quad_4x1_Mux = "1191/Quad 4x1 Mux"

const DAQmx_Val_Switch_Topology_1192_8_SPDT = "1192/8-SPDT"

const DAQmx_Val_Switch_Topology_1193_32x1_Mux = "1193/32x1 Mux"

const DAQmx_Val_Switch_Topology_1193_Dual_16x1_Mux = "1193/Dual 16x1 Mux"

const DAQmx_Val_Switch_Topology_1193_Quad_8x1_Mux = "1193/Quad 8x1 Mux"

const DAQmx_Val_Switch_Topology_1193_16x1_Terminated_Mux = "1193/16x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_1193_Dual_8x1_Terminated_Mux = "1193/Dual 8x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_1193_Quad_4x1_Terminated_Mux = "1193/Quad 4x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_1193_Independent = "1193/Independent"

const DAQmx_Val_Switch_Topology_1194_Quad_4x1_Mux = "1194/Quad 4x1 Mux"

const DAQmx_Val_Switch_Topology_1195_Quad_4x1_Mux = "1195/Quad 4x1 Mux"

const DAQmx_Val_Switch_Topology_2501_1_Wire_48x1_Mux = "2501/1-Wire 48x1 Mux"

const DAQmx_Val_Switch_Topology_2501_1_Wire_48x1_Amplified_Mux = "2501/1-Wire 48x1 Amplified Mux"

const DAQmx_Val_Switch_Topology_2501_2_Wire_24x1_Mux = "2501/2-Wire 24x1 Mux"

const DAQmx_Val_Switch_Topology_2501_2_Wire_24x1_Amplified_Mux = "2501/2-Wire 24x1 Amplified Mux"

const DAQmx_Val_Switch_Topology_2501_2_Wire_Dual_12x1_Mux = "2501/2-Wire Dual 12x1 Mux"

const DAQmx_Val_Switch_Topology_2501_2_Wire_Quad_6x1_Mux = "2501/2-Wire Quad 6x1 Mux"

const DAQmx_Val_Switch_Topology_2501_2_Wire_4x6_Matrix = "2501/2-Wire 4x6 Matrix"

const DAQmx_Val_Switch_Topology_2501_4_Wire_12x1_Mux = "2501/4-Wire 12x1 Mux"

const DAQmx_Val_Switch_Topology_2503_1_Wire_48x1_Mux = "2503/1-Wire 48x1 Mux"

const DAQmx_Val_Switch_Topology_2503_2_Wire_24x1_Mux = "2503/2-Wire 24x1 Mux"

const DAQmx_Val_Switch_Topology_2503_2_Wire_Dual_12x1_Mux = "2503/2-Wire Dual 12x1 Mux"

const DAQmx_Val_Switch_Topology_2503_2_Wire_Quad_6x1_Mux = "2503/2-Wire Quad 6x1 Mux"

const DAQmx_Val_Switch_Topology_2503_2_Wire_4x6_Matrix = "2503/2-Wire 4x6 Matrix"

const DAQmx_Val_Switch_Topology_2503_4_Wire_12x1_Mux = "2503/4-Wire 12x1 Mux"

const DAQmx_Val_Switch_Topology_2510_Independent = "2510/Independent"

const DAQmx_Val_Switch_Topology_2512_Independent = "2512/Independent"

const DAQmx_Val_Switch_Topology_2514_Independent = "2514/Independent"

const DAQmx_Val_Switch_Topology_2515_Independent = "2515/Independent"

const DAQmx_Val_Switch_Topology_2520_80_SPST = "2520/80-SPST"

const DAQmx_Val_Switch_Topology_2521_40_DPST = "2521/40-DPST"

const DAQmx_Val_Switch_Topology_2522_53_SPDT = "2522/53-SPDT"

const DAQmx_Val_Switch_Topology_2523_26_DPDT = "2523/26-DPDT"

const DAQmx_Val_Switch_Topology_2527_1_Wire_64x1_Mux = "2527/1-Wire 64x1 Mux"

const DAQmx_Val_Switch_Topology_2527_1_Wire_Dual_32x1_Mux = "2527/1-Wire Dual 32x1 Mux"

const DAQmx_Val_Switch_Topology_2527_2_Wire_32x1_Mux = "2527/2-Wire 32x1 Mux"

const DAQmx_Val_Switch_Topology_2527_2_Wire_Dual_16x1_Mux = "2527/2-Wire Dual 16x1 Mux"

const DAQmx_Val_Switch_Topology_2527_4_Wire_16x1_Mux = "2527/4-Wire 16x1 Mux"

const DAQmx_Val_Switch_Topology_2527_Independent = "2527/Independent"

const DAQmx_Val_Switch_Topology_2529_2_Wire_8x16_Matrix = "2529/2-Wire 8x16 Matrix"

const DAQmx_Val_Switch_Topology_2529_2_Wire_4x32_Matrix = "2529/2-Wire 4x32 Matrix"

const DAQmx_Val_Switch_Topology_2529_2_Wire_Dual_4x16_Matrix = "2529/2-Wire Dual 4x16 Matrix"

const DAQmx_Val_Switch_Topology_2530_1_Wire_128x1_Mux = "2530/1-Wire 128x1 Mux"

const DAQmx_Val_Switch_Topology_2530_1_Wire_Dual_64x1_Mux = "2530/1-Wire Dual 64x1 Mux"

const DAQmx_Val_Switch_Topology_2530_2_Wire_64x1_Mux = "2530/2-Wire 64x1 Mux"

const DAQmx_Val_Switch_Topology_2530_4_Wire_32x1_Mux = "2530/4-Wire 32x1 Mux"

const DAQmx_Val_Switch_Topology_2530_1_Wire_4x32_Matrix = "2530/1-Wire 4x32 Matrix"

const DAQmx_Val_Switch_Topology_2530_1_Wire_8x16_Matrix = "2530/1-Wire 8x16 Matrix"

const DAQmx_Val_Switch_Topology_2530_1_Wire_Octal_16x1_Mux = "2530/1-Wire Octal 16x1 Mux"

const DAQmx_Val_Switch_Topology_2530_1_Wire_Quad_32x1_Mux = "2530/1-Wire Quad 32x1 Mux"

const DAQmx_Val_Switch_Topology_2530_2_Wire_4x16_Matrix = "2530/2-Wire 4x16 Matrix"

const DAQmx_Val_Switch_Topology_2530_2_Wire_Dual_32x1_Mux = "2530/2-Wire Dual 32x1 Mux"

const DAQmx_Val_Switch_Topology_2530_2_Wire_Quad_16x1_Mux = "2530/2-Wire Quad 16x1 Mux"

const DAQmx_Val_Switch_Topology_2530_4_Wire_Dual_16x1_Mux = "2530/4-Wire Dual 16x1 Mux"

const DAQmx_Val_Switch_Topology_2530_Independent = "2530/Independent"

const DAQmx_Val_Switch_Topology_2531_1_Wire_4x128_Matrix = "2531/1-Wire 4x128 Matrix"

const DAQmx_Val_Switch_Topology_2531_1_Wire_8x64_Matrix = "2531/1-Wire 8x64 Matrix"

const DAQmx_Val_Switch_Topology_2531_1_Wire_Dual_4x64_Matrix = "2531/1-Wire Dual 4x64 Matrix"

const DAQmx_Val_Switch_Topology_2531_1_Wire_Dual_8x32_Matrix = "2531/1-Wire Dual 8x32 Matrix"

const DAQmx_Val_Switch_Topology_2531_1_Wire_Sixteen_2x16_Matrix = "2531/1-Wire Sixteen 2x16 Matrix"

const DAQmx_Val_Switch_Topology_2532_1_Wire_16x32_Matrix = "2532/1-Wire 16x32 Matrix"

const DAQmx_Val_Switch_Topology_2532_1_Wire_4x128_Matrix = "2532/1-Wire 4x128 Matrix"

const DAQmx_Val_Switch_Topology_2532_1_Wire_8x64_Matrix = "2532/1-Wire 8x64 Matrix"

const DAQmx_Val_Switch_Topology_2532_1_Wire_Dual_16x16_Matrix = "2532/1-Wire Dual 16x16 Matrix"

const DAQmx_Val_Switch_Topology_2532_1_Wire_Dual_4x64_Matrix = "2532/1-Wire Dual 4x64 Matrix"

const DAQmx_Val_Switch_Topology_2532_1_Wire_Dual_8x32_Matrix = "2532/1-Wire Dual 8x32 Matrix"

const DAQmx_Val_Switch_Topology_2532_1_Wire_Quad_4x32_Matrix = "2532/1-Wire Quad 4x32 Matrix"

const DAQmx_Val_Switch_Topology_2532_1_Wire_Sixteen_2x16_Matrix = "2532/1-Wire Sixteen 2x16 Matrix"

const DAQmx_Val_Switch_Topology_2532_2_Wire_16x16_Matrix = "2532/2-Wire 16x16 Matrix"

const DAQmx_Val_Switch_Topology_2532_2_Wire_4x64_Matrix = "2532/2-Wire 4x64 Matrix"

const DAQmx_Val_Switch_Topology_2532_2_Wire_8x32_Matrix = "2532/2-Wire 8x32 Matrix"

const DAQmx_Val_Switch_Topology_2532_2_Wire_Dual_4x32_Matrix = "2532/2-Wire Dual 4x32 Matrix"

const DAQmx_Val_Switch_Topology_2533_1_Wire_4x64_Matrix = "2533/1-Wire 4x64 Matrix"

const DAQmx_Val_Switch_Topology_2534_1_Wire_8x32_Matrix = "2534/1-Wire 8x32 Matrix"

const DAQmx_Val_Switch_Topology_2535_1_Wire_4x136_Matrix = "2535/1-Wire 4x136 Matrix"

const DAQmx_Val_Switch_Topology_2536_1_Wire_8x68_Matrix = "2536/1-Wire 8x68 Matrix"

const DAQmx_Val_Switch_Topology_2540_1_Wire_8x9_Matrix = "2540/1-Wire 8x9 Matrix"

const DAQmx_Val_Switch_Topology_2541_1_Wire_8x12_Matrix = "2541/1-Wire 8x12 Matrix"

const DAQmx_Val_Switch_Topology_2542_Quad_2x1_Terminated_Mux = "2542/Quad 2x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_2543_Dual_4x1_Terminated_Mux = "2543/Dual 4x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_2544_8x1_Terminated_Mux = "2544/8x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_2545_4x1_Terminated_Mux = "2545/4x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_2546_Dual_4x1_Mux = "2546/Dual 4x1 Mux"

const DAQmx_Val_Switch_Topology_2547_8x1_Mux = "2547/8x1 Mux"

const DAQmx_Val_Switch_Topology_2548_4_SPDT = "2548/4-SPDT"

const DAQmx_Val_Switch_Topology_2549_Terminated_2_SPDT = "2549/Terminated 2-SPDT"

const DAQmx_Val_Switch_Topology_2554_4x1_Mux = "2554/4x1 Mux"

const DAQmx_Val_Switch_Topology_2555_4x1_Terminated_Mux = "2555/4x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_2556_Dual_4x1_Mux = "2556/Dual 4x1 Mux"

const DAQmx_Val_Switch_Topology_2557_8x1_Mux = "2557/8x1 Mux"

const DAQmx_Val_Switch_Topology_2558_4_SPDT = "2558/4-SPDT"

const DAQmx_Val_Switch_Topology_2559_Terminated_2_SPDT = "2559/Terminated 2-SPDT"

const DAQmx_Val_Switch_Topology_2564_16_SPST = "2564/16-SPST"

const DAQmx_Val_Switch_Topology_2564_8_DPST = "2564/8-DPST"

const DAQmx_Val_Switch_Topology_2565_16_SPST = "2565/16-SPST"

const DAQmx_Val_Switch_Topology_2566_16_SPDT = "2566/16-SPDT"

const DAQmx_Val_Switch_Topology_2566_8_DPDT = "2566/8-DPDT"

const DAQmx_Val_Switch_Topology_2567_Independent = "2567/Independent"

const DAQmx_Val_Switch_Topology_2568_31_SPST = "2568/31-SPST"

const DAQmx_Val_Switch_Topology_2568_15_DPST = "2568/15-DPST"

const DAQmx_Val_Switch_Topology_2569_100_SPST = "2569/100-SPST"

const DAQmx_Val_Switch_Topology_2569_50_DPST = "2569/50-DPST"

const DAQmx_Val_Switch_Topology_2570_40_SPDT = "2570/40-SPDT"

const DAQmx_Val_Switch_Topology_2570_20_DPDT = "2570/20-DPDT"

const DAQmx_Val_Switch_Topology_2571_66_SPDT = "2571/66-SPDT"

const DAQmx_Val_Switch_Topology_2575_1_Wire_196x1_Mux = "2575/1-Wire 196x1 Mux"

const DAQmx_Val_Switch_Topology_2575_2_Wire_98x1_Mux = "2575/2-Wire 98x1 Mux"

const DAQmx_Val_Switch_Topology_2575_2_Wire_95x1_Mux = "2575/2-Wire 95x1 Mux"

const DAQmx_Val_Switch_Topology_2576_2_Wire_64x1_Mux = "2576/2-Wire 64x1 Mux"

const DAQmx_Val_Switch_Topology_2576_2_Wire_Dual_32x1_Mux = "2576/2-Wire Dual 32x1 Mux"

const DAQmx_Val_Switch_Topology_2576_2_Wire_Octal_8x1_Mux = "2576/2-Wire Octal 8x1 Mux"

const DAQmx_Val_Switch_Topology_2576_2_Wire_Quad_16x1_Mux = "2576/2-Wire Quad 16x1 Mux"

const DAQmx_Val_Switch_Topology_2576_2_Wire_Sixteen_4x1_Mux = "2576/2-Wire Sixteen 4x1 Mux"

const DAQmx_Val_Switch_Topology_2576_Independent = "2576/Independent"

const DAQmx_Val_Switch_Topology_2584_1_Wire_12x1_Mux = "2584/1-Wire 12x1 Mux"

const DAQmx_Val_Switch_Topology_2584_1_Wire_Dual_6x1_Mux = "2584/1-Wire Dual 6x1 Mux"

const DAQmx_Val_Switch_Topology_2584_2_Wire_6x1_Mux = "2584/2-Wire 6x1 Mux"

const DAQmx_Val_Switch_Topology_2584_Independent = "2584/Independent"

const DAQmx_Val_Switch_Topology_2585_1_Wire_10x1_Mux = "2585/1-Wire 10x1 Mux"

const DAQmx_Val_Switch_Topology_2586_10_SPST = "2586/10-SPST"

const DAQmx_Val_Switch_Topology_2586_5_DPST = "2586/5-DPST"

const DAQmx_Val_Switch_Topology_2590_4x1_Mux = "2590/4x1 Mux"

const DAQmx_Val_Switch_Topology_2591_4x1_Mux = "2591/4x1 Mux"

const DAQmx_Val_Switch_Topology_2593_16x1_Mux = "2593/16x1 Mux"

const DAQmx_Val_Switch_Topology_2593_Dual_8x1_Mux = "2593/Dual 8x1 Mux"

const DAQmx_Val_Switch_Topology_2593_8x1_Terminated_Mux = "2593/8x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_2593_Dual_4x1_Terminated_Mux = "2593/Dual 4x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_2593_Independent = "2593/Independent"

const DAQmx_Val_Switch_Topology_2594_4x1_Mux = "2594/4x1 Mux"

const DAQmx_Val_Switch_Topology_2595_4x1_Mux = "2595/4x1 Mux"

const DAQmx_Val_Switch_Topology_2596_Dual_6x1_Mux = "2596/Dual 6x1 Mux"

const DAQmx_Val_Switch_Topology_2597_6x1_Terminated_Mux = "2597/6x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_2598_Dual_Transfer = "2598/Dual Transfer"

const DAQmx_Val_Switch_Topology_2599_2_SPDT = "2599/2-SPDT"

const DAQmx_Val_Switch_Topology_2720_Independent = "2720/Independent"

const DAQmx_Val_Switch_Topology_2722_Independent = "2722/Independent"

const DAQmx_Val_Switch_Topology_2725_Independent = "2725/Independent"

const DAQmx_Val_Switch_Topology_2727_Independent = "2727/Independent"

const DAQmx_Val_Switch_Topology_2790_Independent = "2790/Independent"

const DAQmx_Val_Switch_Topology_2796_Dual_6x1_Mux = "2796/Dual 6x1 Mux"

const DAQmx_Val_Switch_Topology_2797_6x1_Terminated_Mux = "2797/6x1 Terminated Mux"

const DAQmx_Val_Switch_Topology_2798_Dual_Transfer = "2798/Dual Transfer"

const DAQmx_Val_Switch_Topology_2799_2_SPDT = "2799/2-SPDT"

const DAQmxSuccess = 0

const DAQmxError58WPowerAndCoolingChassisRequired = -209905

const DAQmxErrorIDPinNoEEPROM = -209904

const DAQmxErrorIDPinNameInvalid = -209903

const DAQmxErrorIDPinDataWriteError = -209902

const DAQmxErrorIDPinUnsupportedFormatCode = -209901

const DAQmxErrorIDPinDataTooLarge = -209900

const DAQmxErrorIDPinUnsupportedFamilyCode = -209899

const DAQmxErrorPropertyNotSpecdForEntirePort = -209898

const DAQmxErrorCannotSetPropertyWhenDAQmxTaskRunning = -209897

const DAQmxErrorAttrNotSupportedUsePhysicalChannelProperty = -209896

const DAQmxErrorAICalculatedPowerMinMaxAttrNotSupported = -209895

const DAQmxErrorAIMinMaxAttrWriteNotSupportedForCalcPower = -209894

const DAQmxErrorPowerVoltageAndCurrentConfigurationMismatch = -209893

const DAQmxErrorVoltageAndCurrentChannelsNotSameDevice = -209892

const DAQmxErrorVoltageAndCurrentChannelCountMismatch = -209891

const DAQmxErrorBreakpointModesInconsistent = -209890

const DAQmxErrorNeedsUsbSuperSpeed = -209889

const DAQmxErrorRemoteSense = -209888

const DAQmxErrorOverTemperatureProtectionActivated = -209887

const DAQmxErrorMultiTaskCfgSampRateNotSupportedWithPropSet = -209886

const DAQmxErrorMultiTaskCfgSampRateConflictingProp = -209885

const DAQmxErrorNoCommonSampRateFoundNoRepeatSamps = -209884

const DAQmxErrorNoCommonSampRateFound = -209883

const DAQmxErrorMultiTaskCfgDoesNotSupportMultiDevTask = -209882

const DAQmxErrorMultiTaskSampRateCfgNotSupported = -209881

const DAQmxErrorDebugSessionNotAllowedTimingSourceRegistered = -209880

const DAQmxErrorDebugSessionNotAllowedWhenLogging = -209879

const DAQmxErrorDebugSessionNotAllowedEventRegistered = -209878

const DAQmxErrorInvalidTargetTaskForDebugSession = -209877

const DAQmxErrorFunctionNotSupportedForDevice = -209876

const DAQmxErrorMultipleTargetTasksFoundForDebugSession = -209875

const DAQmxErrorTargetTaskNotFoundForDebugSession = -209874

const DAQmxErrorOperationNotSupportedInDebugSession = -209873

const DAQmxErrorOperationNotPermittedInMonitorModeForDebugSession = -209872

const DAQmxErrorGetActiveDevPrptyFailedDueToDifftVals = -209871

const DAQmxErrorTaskAlreadyRegisteredATimingSource = -209870

const DAQmxErrorFilterNotSupportedOnHWRev = -209869

const DAQmxErrorSensorPowerSupplyVoltageLevel = -209868

const DAQmxErrorSensorPowerSupply = -209867

const DAQmxErrorInvalidScanlist = -209866

const DAQmxErrorTimeResourceCannotBeRouted = -209865

const DAQmxErrorInvalidResetDelayRequested = -209864

const DAQmxErrorExceededTotalTimetriggersAvailable = -209863

const DAQmxErrorExceededTotalTimestampsAvailable = -209862

const DAQmxErrorNoSynchronizationProtocolRunning = -209861

const DAQmxErrorConflictingCoherencyRequirements = -209860

const DAQmxErrorNoSharedTimescale = -209859

const DAQmxErrorInvalidFieldDAQBankName = -209858

const DAQmxErrorDeviceDoesNotSupportHWTSP = -209857

const DAQmxErrorBankTypeDoesNotMatchBankTypeInDestination = -209856

const DAQmxErrorInvalidFieldDAQBankNumberSpecd = -209855

const DAQmxErrorUnsupportedSimulatedBankForSimulatedFieldDAQ = -209854

const DAQmxErrorFieldDAQBankSimMustMatchFieldDAQSim = -209853

const DAQmxErrorDevNoLongerSupportedWithinDAQmxAPI = -209852

const DAQmxErrorTimingEngineDoesNotSupportOnBoardMemory = -209851

const DAQmxErrorDuplicateTaskCrossProject = -209850

const DAQmxErrorTimeStartTriggerBeforeArmStartTrigger = -209849

const DAQmxErrorTimeTriggerCannotBeSet = -209848

const DAQmxErrorInvalidTriggerWindowValue = -209847

const DAQmxErrorCannotQueryPropertyBeforeOrDuringAcquisition = -209846

const DAQmxErrorSampleClockTimebaseNotSupported = -209845

const DAQmxErrorTimestampNotYetReceived = -209844

const DAQmxErrorTimeTriggerNotSupported = -209843

const DAQmxErrorTimestampNotEnabled = -209842

const DAQmxErrorTimeTriggersInconsistent = -209841

const DAQmxErrorTriggerConfiguredIsInThePast = -209840

const DAQmxErrorTriggerConfiguredIsTooFarFromCurrentTime = -209839

const DAQmxErrorSynchronizationLockLost = -209838

const DAQmxErrorInconsistentTimescales = -209837

const DAQmxErrorCannotSynchronizeDevices = -209836

const DAQmxErrorAssociatedChansHaveAttributeConflictWithMultipleMaxMinRanges = -209835

const DAQmxErrorSampleRateNumChansOrAttributeValues = -209834

const DAQmxErrorWaitForValidTimestampNotSupported = -209833

const DAQmxErrorTrigWinTimeoutExpired = -209832

const DAQmxErrorInvalidTriggerCfgForDevice = -209831

const DAQmxErrorInvalidDataTransferMechanismForDevice = -209830

const DAQmxErrorInputFIFOOverflow3 = -209829

const DAQmxErrorTooManyDevicesForAnalogMultiEdgeTrigCDAQ = -209828

const DAQmxErrorTooManyTriggersTypesSpecifiedInTask = -209827

const DAQmxErrorMismatchedMultiTriggerConfigValues = -209826

const DAQmxErrorInconsistentAODACRangeAcrossTasks = -209825

const DAQmxErrorInconsistentDTToWrite = -209824

const DAQmxErrorFunctionObsolete = -209823

const DAQmxErrorNegativeDurationNotSupported = -209822

const DAQmxErrorDurationTooSmall = -209821

const DAQmxErrorDurationTooLong = -209820

const DAQmxErrorDurationBasedNotSupportedForSpecifiedTimingMode = -209819

const DAQmxErrorInvalidLEDState = -209818

const DAQmxErrorWatchdogStatesNotUniform = -209817

const DAQmxErrorSelfTestFailedPowerSupplyOutOfTolerance = -209816

const DAQmxErrorHWTSPMultiSampleWrite = -209815

const DAQmxErrorOnboardRegenExceedsChannelLimit = -209814

const DAQmxErrorWatchdogChannelExpirationStateNotSpecified = -209813

const DAQmxErrorInvalidShuntSourceForCalibration = -209812

const DAQmxErrorInvalidShuntSelectForCalibration = -209811

const DAQmxErrorInvalidShuntCalibrationConfiguration = -209810

const DAQmxErrorBufferedOperationsNotSupportedOnChannelStandalone = -209809

const DAQmxErrorFeatureNotAvailableOnAccessory = -209808

const DAQmxErrorInconsistentThreshVoltageAcrossTerminals = -209807

const DAQmxErrorDAQmxIsNotInstalledOnTarget = -209806

const DAQmxErrorCOCannotKeepUpInHWTimedSinglePoint = -209805

const DAQmxErrorWaitForNextSampClkDetected3OrMoreSampClks = -209803

const DAQmxErrorWaitForNextSampClkDetectedMissedSampClk = -209802

const DAQmxErrorWriteNotCompleteBeforeSampClk = -209801

const DAQmxErrorReadNotCompleteBeforeSampClk = -209800

const DAQmxErrorInconsistentDigitalFilteringAcrossTerminals = -201510

const DAQmxErrorInconsistentPullUpCfgAcrossTerminals = -201509

const DAQmxErrorInconsistentTermCfgAcrossTerminals = -201508

const DAQmxErrorVCXODCMBecameUnlocked = -201507

const DAQmxErrorPLLDACUpdateFailed = -201506

const DAQmxErrorNoCabledDevice = -201505

const DAQmxErrorLostRefClk = -201504

const DAQmxErrorCantUseAITimingEngineWithCounters = -201503

const DAQmxErrorDACOffsetValNotSet = -201502

const DAQmxErrorCalAdjustRefValOutOfRange = -201501

const DAQmxErrorChansForCalAdjustMustPerformSetContext = -201500

const DAQmxErrorGetCalDataInvalidForCalMode = -201499

const DAQmxErrorNoIEPEWithACNotAllowed = -201498

const DAQmxErrorSetupCalNeededBeforeGetCalDataPoints = -201497

const DAQmxErrorVoltageNotCalibrated = -201496

const DAQmxErrorMissingRangeForCalibration = -201495

const DAQmxErrorMultipleChansNotSupportedDuringCalAdjust = -201494

const DAQmxErrorShuntCalFailedOutOfRange = -201493

const DAQmxErrorOperationNotSupportedOnSimulatedDevice = -201492

const DAQmxErrorFirmwareVersionSameAsInstalledVersion = -201491

const DAQmxErrorFirmwareVersionOlderThanInstalledVersion = -201490

const DAQmxErrorFirmwareUpdateInvalidState = -201489

const DAQmxErrorFirmwareUpdateInvalidID = -201488

const DAQmxErrorFirmwareUpdateAutomaticManagementEnabled = -201487

const DAQmxErrorSetupCalibrationNotCalled = -201486

const DAQmxErrorCalMeasuredDataSizeVsActualDataSizeMismatch = -201485

const DAQmxErrorCDAQMissingDSAMasterForChanExpansion = -201484

const DAQmxErrorCDAQMasterNotFoundForChanExpansion = -201483

const DAQmxErrorAllChansShouldBeProvidedForCalibration = -201482

const DAQmxErrorMustSpecifyExpirationStateForAllLinesInRange = -201481

const DAQmxErrorOpenSessionExists = -201480

const DAQmxErrorCannotQueryTerminalForSWArmStart = -201479

const DAQmxErrorChassisWatchdogTimerExpired = -201478

const DAQmxErrorCantReserveWatchdogTaskWhileOtherTasksReserved = -201477

const DAQmxErrorCantReserveTaskWhileWatchdogTaskReserving = -201476

const DAQmxErrorAuxPowerSourceRequired = -201475

const DAQmxErrorDeviceNotSupportedOnLocalSystem = -201474

const DAQmxErrorOneTimestampChannelRequiredForCombinedNavigationRead = -201472

const DAQmxErrorMultDevsMultPhysChans = -201471

const DAQmxErrorInvalidCalAdjustmentPointValues = -201470

const DAQmxErrorDifferentDigitizerFromCommunicator = -201469

const DAQmxErrorCDAQSyncMasterClockNotPresent = -201468

const DAQmxErrorAssociatedChansHaveConflictingProps = -201467

const DAQmxErrorAutoConfigBetweenMultipleDeviceStatesInvalid = -201466

const DAQmxErrorAutoConfigOfOfflineDevicesInvalid = -201465

const DAQmxErrorExternalFIFOFault = -201464

const DAQmxErrorConnectionsNotReciprocal = -201463

const DAQmxErrorInvalidOutputToInputCDAQSyncConnection = -201462

const DAQmxErrorReferenceClockNotPresent = -201461

const DAQmxErrorBlankStringExpansionFoundNoSupportedCDAQSyncConnectionDevices = -201460

const DAQmxErrorNoDevicesSupportCDAQSyncConnections = -201459

const DAQmxErrorInvalidCDAQSyncTimeoutValue = -201458

const DAQmxErrorCDAQSyncConnectionToSamePort = -201457

const DAQmxErrorDevsWithoutCommonSyncConnectionStrategy = -201456

const DAQmxErrorNoCDAQSyncBetweenPhysAndSimulatedDevs = -201455

const DAQmxErrorUnableToContainCards = -201454

const DAQmxErrorFindDisconnectedBetweenPhysAndSimDeviceStatesInvalid = -201453

const DAQmxErrorOperationAborted = -201452

const DAQmxErrorTwoPortsRequired = -201451

const DAQmxErrorDeviceDoesNotSupportCDAQSyncConnections = -201450

const DAQmxErrorInvalidcDAQSyncPortConnectionFormat = -201449

const DAQmxErrorRosetteMeasurementsNotSpecified = -201448

const DAQmxErrorInvalidNumOfPhysChansForDeltaRosette = -201447

const DAQmxErrorInvalidNumOfPhysChansForTeeRosette = -201446

const DAQmxErrorRosetteStrainChanNamesNeeded = -201445

const DAQmxErrorMultideviceWithOnDemandTiming = -201444

const DAQmxErrorFREQOUTCannotProduceDesiredFrequency3 = -201443

const DAQmxErrorTwoEdgeSeparationSameTerminalSameEdge = -201442

const DAQmxErrorDontMixSyncPulseAndSampClkTimebaseOn449x = -201441

const DAQmxErrorNeitherRefClkNorSampClkTimebaseConfiguredForDSASync = -201440

const DAQmxErrorRetriggeringFiniteCONotAllowed = -201439

const DAQmxErrorDeviceRebootedFromWDTTimeout = -201438

const DAQmxErrorTimeoutValueExceedsMaximum = -201437

const DAQmxErrorSharingDifferentWireModes = -201436

const DAQmxErrorCantPrimeWithEmptyBuffer = -201435

const DAQmxErrorConfigFailedBecauseWatchdogExpired = -201434

const DAQmxErrorWriteFailedBecauseWatchdogChangedLineDirection = -201433

const DAQmxErrorMultipleSubsytemCalibration = -201432

const DAQmxErrorIncorrectChannelForOffsetAdjustment = -201431

const DAQmxErrorInvalidNumRefVoltagesToWrite = -201430

const DAQmxErrorStartTrigDelayWithDSAModule = -201429

const DAQmxErrorMoreThanOneSyncPulseDetected = -201428

const DAQmxErrorDevNotSupportedWithinDAQmxAPI = -201427

const DAQmxErrorDevsWithoutSyncStrategies = -201426

const DAQmxErrorDevsWithoutCommonSyncStrategy = -201425

const DAQmxErrorSyncStrategiesCannotSync = -201424

const DAQmxErrorChassisCommunicationInterrupted = -201423

const DAQmxErrorUnknownCardPowerProfileInCarrier = -201422

const DAQmxErrorAttrNotSupportedOnAccessory = -201421

const DAQmxErrorNetworkDeviceReservedByAnotherHost = -201420

const DAQmxErrorIncorrectFirmwareFileUploaded = -201419

const DAQmxErrorInvalidFirmwareFileUploaded = -201418

const DAQmxErrorInTimerTimeoutOnArm = -201417

const DAQmxErrorCantExceedSlotRelayDriveLimit = -201416

const DAQmxErrorModuleUnsupportedFor9163 = -201415

const DAQmxErrorConnectionsNotSupported = -201414

const DAQmxErrorAccessoryNotPresent = -201413

const DAQmxErrorSpecifiedAccessoryChannelsNotPresentOnDevice = -201412

const DAQmxErrorConnectionsNotSupportedOnAccessory = -201411

const DAQmxErrorRateTooFastForHWTSP = -201410

const DAQmxErrorDelayFromSampleClockOutOfRangeForHWTSP = -201409

const DAQmxErrorAveragingWhenNotInternalHWTSP = -201408

const DAQmxErrorAttributeNotSupportedUnlessHWTSP = -201407

const DAQmxErrorFiveVoltDetectFailed = -201406

const DAQmxErrorAnalogBusStateInconsistent = -201405

const DAQmxErrorCardDetectedDoesNotMatchExpectedCard = -201404

const DAQmxErrorLoggingStartNewFileNotCalled = -201403

const DAQmxErrorLoggingSampsPerFileNotDivisible = -201402

const DAQmxErrorRetrievingNetworkDeviceProperties = -201401

const DAQmxErrorFilePreallocationFailed = -201400

const DAQmxErrorModuleMismatchInSameTimedTask = -201399

const DAQmxErrorInvalidAttributeValuePossiblyDueToOtherAttributeValues = -201398

const DAQmxErrorChangeDetectionStoppedToPreventDeviceHang = -201397

const DAQmxErrorFilterDelayRemovalNotPosssibleWithAnalogTrigger = -201396

const DAQmxErrorNonbufferedOrNoChannels = -201395

const DAQmxErrorTristateLogicLevelNotSpecdForEntirePort = -201394

const DAQmxErrorTristateLogicLevelNotSupportedOnDigOutChan = -201393

const DAQmxErrorTristateLogicLevelNotSupported = -201392

const DAQmxErrorIncompleteGainAndCouplingCalAdjustment = -201391

const DAQmxErrorNetworkStatusConnectionLost = -201390

const DAQmxErrorModuleChangeDuringConnectionLoss = -201389

const DAQmxErrorNetworkDeviceNotReservedByHost = -201388

const DAQmxErrorDuplicateCalibrationAdjustmentInput = -201387

const DAQmxErrorSelfCalFailedContactTechSupport = -201386

const DAQmxErrorSelfCalFailedToConverge = -201385

const DAQmxErrorUnsupportedSimulatedModuleForSimulatedChassis = -201384

const DAQmxErrorLoggingWriteSizeTooBig = -201383

const DAQmxErrorLoggingWriteSizeNotDivisible = -201382

const DAQmxErrorMyDAQPowerRailFault = -201381

const DAQmxErrorDeviceDoesNotSupportThisOperation = -201380

const DAQmxErrorNetworkDevicesNotSupportedOnThisPlatform = -201379

const DAQmxErrorUnknownFirmwareVersion = -201378

const DAQmxErrorFirmwareIsUpdating = -201377

const DAQmxErrorAccessoryEEPROMIsCorrupt = -201376

const DAQmxErrorThrmcplLeadOffsetNullingCalNotSupported = -201375

const DAQmxErrorSelfCalFailedTryExtCal = -201374

const DAQmxErrorOutputP2PNotSupportedWithMultithreadedScripts = -201373

const DAQmxErrorThrmcplCalibrationChannelsOpen = -201372

const DAQmxErrorMDNSServiceInstanceAlreadyInUse = -201371

const DAQmxErrorIPAddressAlreadyInUse = -201370

const DAQmxErrorHostnameAlreadyInUse = -201369

const DAQmxErrorInvalidNumberOfCalAdjustmentPoints = -201368

const DAQmxErrorFilterOrDigitalSyncInternalSignal = -201367

const DAQmxErrorBadDDSSource = -201366

const DAQmxErrorOnboardRegenWithMoreThan16Channels = -201365

const DAQmxErrorTriggerTooFast = -201364

const DAQmxErrorMinMaxOutsideTableRange = -201363

const DAQmxErrorChannelExpansionWithInvalidAnalogTriggerDevice = -201362

const DAQmxErrorSyncPulseSrcInvalidForTask = -201361

const DAQmxErrorInvalidCarrierSlotNumberSpecd = -201360

const DAQmxErrorCardsMustBeInSameCarrier = -201359

const DAQmxErrorCardDevCarrierSimMustMatch = -201358

const DAQmxErrorDevMustHaveAtLeastOneCard = -201357

const DAQmxErrorCardTopologyError = -201356

const DAQmxErrorExceededCarrierPowerLimit = -201355

const DAQmxErrorCardsIncompatible = -201354

const DAQmxErrorAnalogBusNotValid = -201353

const DAQmxErrorReservationConflict = -201352

const DAQmxErrorMemMappedOnDemandNotSupported = -201351

const DAQmxErrorSlaveWithNoStartTriggerConfigured = -201350

const DAQmxErrorChannelExpansionWithDifferentTriggerDevices = -201349

const DAQmxErrorCounterSyncAndRetriggered = -201348

const DAQmxErrorNoExternalSyncPulseDetected = -201347

const DAQmxErrorSlaveAndNoExternalSyncPulse = -201346

const DAQmxErrorCustomTimingRequiredForAttribute = -201345

const DAQmxErrorCustomTimingModeNotSet = -201344

const DAQmxErrorAccessoryPowerTripped = -201343

const DAQmxErrorUnsupportedAccessory = -201342

const DAQmxErrorInvalidAccessoryChange = -201341

const DAQmxErrorFirmwareRequiresUpgrade = -201340

const DAQmxErrorFastExternalTimebaseNotSupportedForDevice = -201339

const DAQmxErrorInvalidShuntLocationForCalibration = -201338

const DAQmxErrorDeviceNameTooLong = -201337

const DAQmxErrorBridgeScalesUnsupported = -201336

const DAQmxErrorMismatchedElecPhysValues = -201335

const DAQmxErrorLinearRequiresUniquePoints = -201334

const DAQmxErrorMissingRequiredScalingParameter = -201333

const DAQmxErrorLoggingNotSupportOnOutputTasks = -201332

const DAQmxErrorMemoryMappedHardwareTimedNonBufferedUnsupported = -201331

const DAQmxErrorCannotUpdatePulseTrainWithAutoIncrementEnabled = -201330

const DAQmxErrorHWTimedSinglePointAndDataXferNotDMA = -201329

const DAQmxErrorSCCSecondStageEmpty = -201328

const DAQmxErrorSCCInvalidDualStageCombo = -201327

const DAQmxErrorSCCInvalidSecondStage = -201326

const DAQmxErrorSCCInvalidFirstStage = -201325

const DAQmxErrorCounterMultipleSampleClockedChannels = -201324

const DAQmxError2CounterMeasurementModeAndSampleClocked = -201323

const DAQmxErrorCantHaveBothMemMappedAndNonMemMappedTasks = -201322

const DAQmxErrorMemMappedDataReadByAnotherProcess = -201321

const DAQmxErrorRetriggeringInvalidForGivenSettings = -201320

const DAQmxErrorAIOverrun = -201319

const DAQmxErrorCOOverrun = -201318

const DAQmxErrorCounterMultipleBufferedChannels = -201317

const DAQmxErrorInvalidTimebaseForCOHWTSP = -201316

const DAQmxErrorWriteBeforeEvent = -201315

const DAQmxErrorCIOverrun = -201314

const DAQmxErrorCounterNonResponsiveAndReset = -201313

const DAQmxErrorMeasTypeOrChannelNotSupportedForLogging = -201312

const DAQmxErrorFileAlreadyOpenedForWrite = -201311

const DAQmxErrorTdmsNotFound = -201310

const DAQmxErrorGenericFileIO = -201309

const DAQmxErrorFiniteSTCCounterNotSupportedForLogging = -201308

const DAQmxErrorMeasurementTypeNotSupportedForLogging = -201307

const DAQmxErrorFileAlreadyOpened = -201306

const DAQmxErrorDiskFull = -201305

const DAQmxErrorFilePathInvalid = -201304

const DAQmxErrorFileVersionMismatch = -201303

const DAQmxErrorFileWriteProtected = -201302

const DAQmxErrorReadNotSupportedForLoggingMode = -201301

const DAQmxErrorAttributeNotSupportedWhenLogging = -201300

const DAQmxErrorLoggingModeNotSupportedNonBuffered = -201299

const DAQmxErrorPropertyNotSupportedWithConflictingProperty = -201298

const DAQmxErrorParallelSSHOnConnector1 = -201297

const DAQmxErrorCOOnlyImplicitSampleTimingTypeSupported = -201296

const DAQmxErrorCalibrationFailedAOOutOfRange = -201295

const DAQmxErrorCalibrationFailedAIOutOfRange = -201294

const DAQmxErrorCalPWMLinearityFailed = -201293

const DAQmxErrorOverrunUnderflowConfigurationCombo = -201292

const DAQmxErrorCannotWriteToFiniteCOTask = -201291

const DAQmxErrorNetworkDAQInvalidWEPKeyLength = -201290

const DAQmxErrorCalInputsShortedNotSupported = -201289

const DAQmxErrorCannotSetPropertyWhenTaskIsReserved = -201288

const DAQmxErrorMinus12VFuseBlown = -201287

const DAQmxErrorPlus12VFuseBlown = -201286

const DAQmxErrorPlus5VFuseBlown = -201285

const DAQmxErrorPlus3VFuseBlown = -201284

const DAQmxErrorDeviceSerialPortError = -201283

const DAQmxErrorPowerUpStateMachineNotDone = -201282

const DAQmxErrorTooManyTriggersSpecifiedInTask = -201281

const DAQmxErrorVerticalOffsetNotSupportedOnDevice = -201280

const DAQmxErrorInvalidCouplingForMeasurementType = -201279

const DAQmxErrorDigitalLineUpdateTooFastForDevice = -201278

const DAQmxErrorCertificateIsTooBigToTransfer = -201277

const DAQmxErrorOnlyPEMOrDERCertiticatesAccepted = -201276

const DAQmxErrorCalCouplingNotSupported = -201275

const DAQmxErrorDeviceNotSupportedIn64Bit = -201274

const DAQmxErrorNetworkDeviceInUse = -201273

const DAQmxErrorInvalidIPv4AddressFormat = -201272

const DAQmxErrorNetworkProductTypeMismatch = -201271

const DAQmxErrorOnlyPEMCertificatesAccepted = -201270

const DAQmxErrorCalibrationRequiresPrototypingBoardEnabled = -201269

const DAQmxErrorAllCurrentLimitingResourcesAlreadyTaken = -201268

const DAQmxErrorUserDefInfoStringBadLength = -201267

const DAQmxErrorPropertyNotFound = -201266

const DAQmxErrorOverVoltageProtectionActivated = -201265

const DAQmxErrorScaledIQWaveformTooLarge = -201264

const DAQmxErrorFirmwareFailedToDownload = -201263

const DAQmxErrorPropertyNotSupportedForBusType = -201262

const DAQmxErrorChangeRateWhileRunningCouldNotBeCompleted = -201261

const DAQmxErrorCannotQueryManualControlAttribute = -201260

const DAQmxErrorInvalidNetworkConfiguration = -201259

const DAQmxErrorInvalidWirelessConfiguration = -201258

const DAQmxErrorInvalidWirelessCountryCode = -201257

const DAQmxErrorInvalidWirelessChannel = -201256

const DAQmxErrorNetworkEEPROMHasChanged = -201255

const DAQmxErrorNetworkSerialNumberMismatch = -201254

const DAQmxErrorNetworkStatusDown = -201253

const DAQmxErrorNetworkTargetUnreachable = -201252

const DAQmxErrorNetworkTargetNotFound = -201251

const DAQmxErrorNetworkStatusTimedOut = -201250

const DAQmxErrorInvalidWirelessSecuritySelection = -201249

const DAQmxErrorNetworkDeviceConfigurationLocked = -201248

const DAQmxErrorNetworkDAQDeviceNotSupported = -201247

const DAQmxErrorNetworkDAQCannotCreateEmptySleeve = -201246

const DAQmxErrorUserDefInfoStringTooLong = -201245

const DAQmxErrorModuleTypeDoesNotMatchModuleTypeInDestination = -201244

const DAQmxErrorInvalidTEDSInterfaceAddress = -201243

const DAQmxErrorDevDoesNotSupportSCXIComm = -201242

const DAQmxErrorSCXICommDevConnector0MustBeCabledToModule = -201241

const DAQmxErrorSCXIModuleDoesNotSupportDigitizationMode = -201240

const DAQmxErrorDevDoesNotSupportMultiplexedSCXIDigitizationMode = -201239

const DAQmxErrorDevOrDevPhysChanDoesNotSupportSCXIDigitization = -201238

const DAQmxErrorInvalidPhysChanName = -201237

const DAQmxErrorSCXIChassisCommModeInvalid = -201236

const DAQmxErrorRequiredDependencyNotFound = -201235

const DAQmxErrorInvalidStorage = -201234

const DAQmxErrorInvalidObject = -201233

const DAQmxErrorStorageAlteredPriorToSave = -201232

const DAQmxErrorTaskDoesNotReferenceLocalChannel = -201231

const DAQmxErrorReferencedDevSimMustMatchTarget = -201230

const DAQmxErrorProgrammedIOFailsBecauseOfWatchdogTimer = -201229

const DAQmxErrorWatchdogTimerFailsBecauseOfProgrammedIO = -201228

const DAQmxErrorCantUseThisTimingEngineWithAPort = -201227

const DAQmxErrorProgrammedIOConflict = -201226

const DAQmxErrorChangeDetectionIncompatibleWithProgrammedIO = -201225

const DAQmxErrorTristateNotEnoughLines = -201224

const DAQmxErrorTristateConflict = -201223

const DAQmxErrorGenerateOrFiniteWaitExpectedBeforeBreakBlock = -201222

const DAQmxErrorBreakBlockNotAllowedInLoop = -201221

const DAQmxErrorClearTriggerNotAllowedInBreakBlock = -201220

const DAQmxErrorNestingNotAllowedInBreakBlock = -201219

const DAQmxErrorIfElseBlockNotAllowedInBreakBlock = -201218

const DAQmxErrorRepeatUntilTriggerLoopNotAllowedInBreakBlock = -201217

const DAQmxErrorWaitUntilTriggerNotAllowedInBreakBlock = -201216

const DAQmxErrorMarkerPosInvalidInBreakBlock = -201215

const DAQmxErrorInvalidWaitDurationInBreakBlock = -201214

const DAQmxErrorInvalidSubsetLengthInBreakBlock = -201213

const DAQmxErrorInvalidWaveformLengthInBreakBlock = -201212

const DAQmxErrorInvalidWaitDurationBeforeBreakBlock = -201211

const DAQmxErrorInvalidSubsetLengthBeforeBreakBlock = -201210

const DAQmxErrorInvalidWaveformLengthBeforeBreakBlock = -201209

const DAQmxErrorSampleRateTooHighForADCTimingMode = -201208

const DAQmxErrorActiveDevNotSupportedWithMultiDevTask = -201207

const DAQmxErrorRealDevAndSimDevNotSupportedInSameTask = -201206

const DAQmxErrorRTSISimMustMatchDevSim = -201205

const DAQmxErrorBridgeShuntCaNotSupported = -201204

const DAQmxErrorStrainShuntCaNotSupported = -201203

const DAQmxErrorGainTooLargeForGainCalConst = -201202

const DAQmxErrorOffsetTooLargeForOffsetCalConst = -201201

const DAQmxErrorElvisPrototypingBoardRemoved = -201200

const DAQmxErrorElvis2PowerRailFault = -201199

const DAQmxErrorElvis2PhysicalChansFault = -201198

const DAQmxErrorElvis2PhysicalChansThermalEvent = -201197

const DAQmxErrorRXBitErrorRateLimitExceeded = -201196

const DAQmxErrorPHYBitErrorRateLimitExceeded = -201195

const DAQmxErrorTwoPartAttributeCalledOutOfOrder = -201194

const DAQmxErrorInvalidSCXIChassisAddress = -201193

const DAQmxErrorCouldNotConnectToRemoteMXS = -201192

const DAQmxErrorExcitationStateRequiredForAttributes = -201191

const DAQmxErrorDeviceNotUsableUntilUSBReplug = -201190

const DAQmxErrorInputFIFOOverflowDuringCalibrationOnFullSpeedUSB = -201189

const DAQmxErrorInputFIFOOverflowDuringCalibration = -201188

const DAQmxErrorCJCChanConflictsWithNonThermocoupleChan = -201187

const DAQmxErrorCommDeviceForPXIBackplaneNotInRightmostSlot = -201186

const DAQmxErrorCommDeviceForPXIBackplaneNotInSameChassis = -201185

const DAQmxErrorCommDeviceForPXIBackplaneNotPXI = -201184

const DAQmxErrorInvalidCalExcitFrequency = -201183

const DAQmxErrorInvalidCalExcitVoltage = -201182

const DAQmxErrorInvalidAIInputSrc = -201181

const DAQmxErrorInvalidCalInputRef = -201180

const DAQmxErrordBReferenceValueNotGreaterThanZero = -201179

const DAQmxErrorSampleClockRateIsTooFastForSampleClockTiming = -201178

const DAQmxErrorDeviceNotUsableUntilColdStart = -201177

const DAQmxErrorSampleClockRateIsTooFastForBurstTiming = -201176

const DAQmxErrorDevImportFailedAssociatedResourceIDsNotSupported = -201175

const DAQmxErrorSCXI1600ImportNotSupported = -201174

const DAQmxErrorPowerSupplyConfigurationFailed = -201173

const DAQmxErrorIEPEWithDCNotAllowed = -201172

const DAQmxErrorMinTempForThermocoupleTypeOutsideAccuracyForPolyScaling = -201171

const DAQmxErrorDevImportFailedNoDeviceToOverwriteAndSimulationNotSupported = -201170

const DAQmxErrorDevImportFailedDeviceNotSupportedOnDestination = -201169

const DAQmxErrorFirmwareIsTooOld = -201168

const DAQmxErrorFirmwareCouldntUpdate = -201167

const DAQmxErrorFirmwareIsCorrupt = -201166

const DAQmxErrorFirmwareTooNew = -201165

const DAQmxErrorSampClockCannotBeExportedFromExternalSampClockSrc = -201164

const DAQmxErrorPhysChanReservedForInputWhenDesiredForOutput = -201163

const DAQmxErrorPhysChanReservedForOutputWhenDesiredForInput = -201162

const DAQmxErrorSpecifiedCDAQSlotNotEmpty = -201161

const DAQmxErrorDeviceDoesNotSupportSimulation = -201160

const DAQmxErrorInvalidCDAQSlotNumberSpecd = -201159

const DAQmxErrorCSeriesModSimMustMatchCDAQChassisSim = -201158

const DAQmxErrorSCCCabledDevMustNotBeSimWhenSCCCarrierIsNotSim = -201157

const DAQmxErrorSCCModSimMustMatchSCCCarrierSim = -201156

const DAQmxErrorSCXIModuleDoesNotSupportSimulation = -201155

const DAQmxErrorSCXICableDevMustNotBeSimWhenModIsNotSim = -201154

const DAQmxErrorSCXIDigitizerSimMustNotBeSimWhenModIsNotSim = -201153

const DAQmxErrorSCXIModSimMustMatchSCXIChassisSim = -201152

const DAQmxErrorSimPXIDevReqSlotAndChassisSpecd = -201151

const DAQmxErrorSimDevConflictWithRealDev = -201150

const DAQmxErrorInsufficientDataForCalibration = -201149

const DAQmxErrorTriggerChannelMustBeEnabled = -201148

const DAQmxErrorCalibrationDataConflictCouldNotBeResolved = -201147

const DAQmxErrorSoftwareTooNewForSelfCalibrationData = -201146

const DAQmxErrorSoftwareTooNewForExtCalibrationData = -201145

const DAQmxErrorSelfCalibrationDataTooNewForSoftware = -201144

const DAQmxErrorExtCalibrationDataTooNewForSoftware = -201143

const DAQmxErrorSoftwareTooNewForEEPROM = -201142

const DAQmxErrorEEPROMTooNewForSoftware = -201141

const DAQmxErrorSoftwareTooNewForHardware = -201140

const DAQmxErrorHardwareTooNewForSoftware = -201139

const DAQmxErrorTaskCannotRestartFirstSampNotAvailToGenerate = -201138

const DAQmxErrorOnlyUseStartTrigSrcPrptyWithDevDataLines = -201137

const DAQmxErrorOnlyUsePauseTrigSrcPrptyWithDevDataLines = -201136

const DAQmxErrorOnlyUseRefTrigSrcPrptyWithDevDataLines = -201135

const DAQmxErrorPauseTrigDigPatternSizeDoesNotMatchSrcSize = -201134

const DAQmxErrorLineConflictCDAQ = -201133

const DAQmxErrorCannotWriteBeyondFinalFiniteSample = -201132

const DAQmxErrorRefAndStartTriggerSrcCantBeSame = -201131

const DAQmxErrorMemMappingIncompatibleWithPhysChansInTask = -201130

const DAQmxErrorOutputDriveTypeMemMappingConflict = -201129

const DAQmxErrorCAPIDeviceIndexInvalid = -201128

const DAQmxErrorRatiometricDevicesMustUseExcitationForScaling = -201127

const DAQmxErrorPropertyRequiresPerDeviceCfg = -201126

const DAQmxErrorAICouplingAndAIInputSourceConflict = -201125

const DAQmxErrorOnlyOneTaskCanPerformDOMemoryMappingAtATime = -201124

const DAQmxErrorTooManyChansForAnalogRefTrigCDAQ = -201123

const DAQmxErrorSpecdPropertyValueIsIncompatibleWithSampleTimingType = -201122

const DAQmxErrorCPUNotSupportedRequireSSE = -201121

const DAQmxErrorSpecdPropertyValueIsIncompatibleWithSampleTimingResponseMode = -201120

const DAQmxErrorConflictingNextWriteIsLastAndRegenModeProperties = -201119

const DAQmxErrorMStudioOperationDoesNotSupportDeviceContext = -201118

const DAQmxErrorPropertyValueInChannelExpansionContextInvalid = -201117

const DAQmxErrorHWTimedNonBufferedAONotSupported = -201116

const DAQmxErrorWaveformLengthNotMultOfQuantum = -201115

const DAQmxErrorDSAExpansionMixedBoardsWrongOrderInPXIChassis = -201114

const DAQmxErrorPowerLevelTooLowForOOK = -201113

const DAQmxErrorDeviceComponentTestFailure = -201112

const DAQmxErrorUserDefinedWfmWithOOKUnsupported = -201111

const DAQmxErrorInvalidDigitalModulationUserDefinedWaveform = -201110

const DAQmxErrorBothRefInAndRefOutEnabled = -201109

const DAQmxErrorBothAnalogAndDigitalModulationEnabled = -201108

const DAQmxErrorBufferedOpsNotSupportedInSpecdSlotForCDAQ = -201107

const DAQmxErrorPhysChanNotSupportedInSpecdSlotForCDAQ = -201106

const DAQmxErrorResourceReservedWithConflictingSettings = -201105

const DAQmxErrorInconsistentAnalogTrigSettingsCDAQ = -201104

const DAQmxErrorTooManyChansForAnalogPauseTrigCDAQ = -201103

const DAQmxErrorAnalogTrigNotFirstInScanListCDAQ = -201102

const DAQmxErrorTooManyChansGivenTimingType = -201101

const DAQmxErrorSampClkTimebaseDivWithExtSampClk = -201100

const DAQmxErrorCantSaveTaskWithPerDeviceTimingProperties = -201099

const DAQmxErrorConflictingAutoZeroMode = -201098

const DAQmxErrorSampClkRateNotSupportedWithEAREnabled = -201097

const DAQmxErrorSampClkTimebaseRateNotSpecd = -201096

const DAQmxErrorSessionCorruptedByDLLReload = -201095

const DAQmxErrorActiveDevNotSupportedWithChanExpansion = -201094

const DAQmxErrorSampClkRateInvalid = -201093

const DAQmxErrorExtSyncPulseSrcCannotBeExported = -201092

const DAQmxErrorSyncPulseMinDelayToStartNeededForExtSyncPulseSrc = -201091

const DAQmxErrorSyncPulseSrcInvalid = -201090

const DAQmxErrorSampClkTimebaseRateInvalid = -201089

const DAQmxErrorSampClkTimebaseSrcInvalid = -201088

const DAQmxErrorSampClkRateMustBeSpecd = -201087

const DAQmxErrorInvalidAttributeName = -201086

const DAQmxErrorCJCChanNameMustBeSetWhenCJCSrcIsScannableChan = -201085

const DAQmxErrorHiddenChanMissingInChansPropertyInCfgFile = -201084

const DAQmxErrorChanNamesNotSpecdInCfgFile = -201083

const DAQmxErrorDuplicateHiddenChanNamesInCfgFile = -201082

const DAQmxErrorDuplicateChanNameInCfgFile = -201081

const DAQmxErrorInvalidSCCModuleForSlotSpecd = -201080

const DAQmxErrorInvalidSCCSlotNumberSpecd = -201079

const DAQmxErrorInvalidSectionIdentifier = -201078

const DAQmxErrorInvalidSectionName = -201077

const DAQmxErrorDAQmxVersionNotSupported = -201076

const DAQmxErrorSWObjectsFoundInFile = -201075

const DAQmxErrorHWObjectsFoundInFile = -201074

const DAQmxErrorLocalChannelSpecdWithNoParentTask = -201073

const DAQmxErrorTaskReferencesMissingLocalChannel = -201072

const DAQmxErrorTaskReferencesLocalChannelFromOtherTask = -201071

const DAQmxErrorTaskMissingChannelProperty = -201070

const DAQmxErrorInvalidLocalChanName = -201069

const DAQmxErrorInvalidEscapeCharacterInString = -201068

const DAQmxErrorInvalidTableIdentifier = -201067

const DAQmxErrorValueFoundInInvalidColumn = -201066

const DAQmxErrorMissingStartOfTable = -201065

const DAQmxErrorFileMissingRequiredDAQmxHeader = -201064

const DAQmxErrorDeviceIDDoesNotMatch = -201063

const DAQmxErrorBufferedOperationsNotSupportedOnSelectedLines = -201062

const DAQmxErrorPropertyConflictsWithScale = -201061

const DAQmxErrorInvalidINIFileSyntax = -201060

const DAQmxErrorDeviceInfoFailedPXIChassisNotIdentified = -201059

const DAQmxErrorInvalidHWProductNumber = -201058

const DAQmxErrorInvalidHWProductType = -201057

const DAQmxErrorInvalidNumericFormatSpecd = -201056

const DAQmxErrorDuplicatePropertyInObject = -201055

const DAQmxErrorInvalidEnumValueSpecd = -201054

const DAQmxErrorTEDSSensorPhysicalChannelConflict = -201053

const DAQmxErrorTooManyPhysicalChansForTEDSInterfaceSpecd = -201052

const DAQmxErrorIncapableTEDSInterfaceControllingDeviceSpecd = -201051

const DAQmxErrorSCCCarrierSpecdIsMissing = -201050

const DAQmxErrorIncapableSCCDigitizingDeviceSpecd = -201049

const DAQmxErrorAccessorySettingNotApplicable = -201048

const DAQmxErrorDeviceAndConnectorSpecdAlreadyOccupied = -201047

const DAQmxErrorIllegalAccessoryTypeForDeviceSpecd = -201046

const DAQmxErrorInvalidDeviceConnectorNumberSpecd = -201045

const DAQmxErrorInvalidAccessoryName = -201044

const DAQmxErrorMoreThanOneMatchForSpecdDevice = -201043

const DAQmxErrorNoMatchForSpecdDevice = -201042

const DAQmxErrorProductTypeAndProductNumberConflict = -201041

const DAQmxErrorExtraPropertyDetectedInSpecdObject = -201040

const DAQmxErrorRequiredPropertyMissing = -201039

const DAQmxErrorCantSetAuthorForLocalChan = -201038

const DAQmxErrorInvalidTimeValue = -201037

const DAQmxErrorInvalidTimeFormat = -201036

const DAQmxErrorDigDevChansSpecdInModeOtherThanParallel = -201035

const DAQmxErrorCascadeDigitizationModeNotSupported = -201034

const DAQmxErrorSpecdSlotAlreadyOccupied = -201033

const DAQmxErrorInvalidSCXISlotNumberSpecd = -201032

const DAQmxErrorAddressAlreadyInUse = -201031

const DAQmxErrorSpecdDeviceDoesNotSupportRTSI = -201030

const DAQmxErrorSpecdDeviceIsAlreadyOnRTSIBus = -201029

const DAQmxErrorIdentifierInUse = -201028

const DAQmxErrorWaitForNextSampleClockOrReadDetected3OrMoreMissedSampClks = -201027

const DAQmxErrorHWTimedAndDataXferPIO = -201026

const DAQmxErrorNonBufferedAndHWTimed = -201025

const DAQmxErrorCTROutSampClkPeriodShorterThanGenPulseTrainPeriodPolled = -201024

const DAQmxErrorCTROutSampClkPeriodShorterThanGenPulseTrainPeriod2 = -201023

const DAQmxErrorCOCannotKeepUpInHWTimedSinglePointPolled = -201022

const DAQmxErrorWriteRecoveryCannotKeepUpInHWTimedSinglePoint = -201021

const DAQmxErrorNoChangeDetectionOnSelectedLineForDevice = -201020

const DAQmxErrorSMIOPauseTriggersNotSupportedWithChannelExpansion = -201019

const DAQmxErrorClockMasterForExternalClockNotLongestPipeline = -201018

const DAQmxErrorUnsupportedUnicodeByteOrderMarker = -201017

const DAQmxErrorTooManyInstructionsInLoopInScript = -201016

const DAQmxErrorPLLNotLocked = -201015

const DAQmxErrorIfElseBlockNotAllowedInFiniteRepeatLoopInScript = -201014

const DAQmxErrorIfElseBlockNotAllowedInConditionalRepeatLoopInScript = -201013

const DAQmxErrorClearIsLastInstructionInIfElseBlockInScript = -201012

const DAQmxErrorInvalidWaitDurationBeforeIfElseBlockInScript = -201011

const DAQmxErrorMarkerPosInvalidBeforeIfElseBlockInScript = -201010

const DAQmxErrorInvalidSubsetLengthBeforeIfElseBlockInScript = -201009

const DAQmxErrorInvalidWaveformLengthBeforeIfElseBlockInScript = -201008

const DAQmxErrorGenerateOrFiniteWaitInstructionExpectedBeforeIfElseBlockInScript = -201007

const DAQmxErrorCalPasswordNotSupported = -201006

const DAQmxErrorSetupCalNeededBeforeAdjustCal = -201005

const DAQmxErrorMultipleChansNotSupportedDuringCalSetup = -201004

const DAQmxErrorDevCannotBeAccessed = -201003

const DAQmxErrorSampClkRateDoesntMatchSampClkSrc = -201002

const DAQmxErrorSampClkRateNotSupportedWithEARDisabled = -201001

const DAQmxErrorLabVIEWVersionDoesntSupportDAQmxEvents = -201000

const DAQmxErrorCOReadyForNewValNotSupportedWithOnDemand = -200999

const DAQmxErrorCIHWTimedSinglePointNotSupportedForMeasType = -200998

const DAQmxErrorOnDemandNotSupportedWithHWTimedSinglePoint = -200997

const DAQmxErrorHWTimedSinglePointAndDataXferNotProgIO = -200996

const DAQmxErrorMemMapAndHWTimedSinglePoint = -200995

const DAQmxErrorCannotSetPropertyWhenHWTimedSinglePointTaskIsRunning = -200994

const DAQmxErrorCTROutSampClkPeriodShorterThanGenPulseTrainPeriod = -200993

const DAQmxErrorTooManyEventsGenerated = -200992

const DAQmxErrorMStudioCppRemoveEventsBeforeStop = -200991

const DAQmxErrorCAPICannotRegisterSyncEventsFromMultipleThreads = -200990

const DAQmxErrorReadWaitNextSampClkWaitMismatchTwo = -200989

const DAQmxErrorReadWaitNextSampClkWaitMismatchOne = -200988

const DAQmxErrorDAQmxSignalEventTypeNotSupportedByChanTypesOrDevicesInTask = -200987

const DAQmxErrorCannotUnregisterDAQmxSoftwareEventWhileTaskIsRunning = -200986

const DAQmxErrorAutoStartWriteNotAllowedEventRegistered = -200985

const DAQmxErrorAutoStartReadNotAllowedEventRegistered = -200984

const DAQmxErrorCannotGetPropertyWhenTaskNotReservedCommittedOrRunning = -200983

const DAQmxErrorSignalEventsNotSupportedByDevice = -200982

const DAQmxErrorEveryNSamplesAcqIntoBufferEventNotSupportedByDevice = -200981

const DAQmxErrorEveryNSampsTransferredFromBufferEventNotSupportedByDevice = -200980

const DAQmxErrorCAPISyncEventsTaskStateChangeNotAllowedFromDifferentThread = -200979

const DAQmxErrorDAQmxSWEventsWithDifferentCallMechanisms = -200978

const DAQmxErrorCantSaveChanWithPolyCalScaleAndAllowInteractiveEdit = -200977

const DAQmxErrorChanDoesNotSupportCJC = -200976

const DAQmxErrorCOReadyForNewValNotSupportedWithHWTimedSinglePoint = -200975

const DAQmxErrorDACAllowConnToGndNotSupportedByDevWhenRefSrcExt = -200974

const DAQmxErrorCantGetPropertyTaskNotRunning = -200973

const DAQmxErrorCantSetPropertyTaskNotRunning = -200972

const DAQmxErrorCantSetPropertyTaskNotRunningCommitted = -200971

const DAQmxErrorAIEveryNSampsEventIntervalNotMultipleOf2 = -200970

const DAQmxErrorInvalidTEDSPhysChanNotAI = -200969

const DAQmxErrorCAPICannotPerformTaskOperationInAsyncCallback = -200968

const DAQmxErrorEveryNSampsTransferredFromBufferEventAlreadyRegistered = -200967

const DAQmxErrorEveryNSampsAcqIntoBufferEventAlreadyRegistered = -200966

const DAQmxErrorEveryNSampsTransferredFromBufferNotForInput = -200965

const DAQmxErrorEveryNSampsAcqIntoBufferNotForOutput = -200964

const DAQmxErrorAOSampTimingTypeDifferentIn2Tasks = -200963

const DAQmxErrorCouldNotDownloadFirmwareHWDamaged = -200962

const DAQmxErrorCouldNotDownloadFirmwareFileMissingOrDamaged = -200961

const DAQmxErrorCannotRegisterDAQmxSoftwareEventWhileTaskIsRunning = -200960

const DAQmxErrorDifferentRawDataCompression = -200959

const DAQmxErrorConfiguredTEDSInterfaceDevNotDetected = -200958

const DAQmxErrorCompressedSampSizeExceedsResolution = -200957

const DAQmxErrorChanDoesNotSupportCompression = -200956

const DAQmxErrorDifferentRawDataFormats = -200955

const DAQmxErrorSampClkOutputTermIncludesStartTrigSrc = -200954

const DAQmxErrorStartTrigSrcEqualToSampClkSrc = -200953

const DAQmxErrorEventOutputTermIncludesTrigSrc = -200952

const DAQmxErrorCOMultipleWritesBetweenSampClks = -200951

const DAQmxErrorDoneEventAlreadyRegistered = -200950

const DAQmxErrorSignalEventAlreadyRegistered = -200949

const DAQmxErrorCannotHaveTimedLoopAndDAQmxSignalEventsInSameTask = -200948

const DAQmxErrorNeedLabVIEW711PatchToUseDAQmxEvents = -200947

const DAQmxErrorStartFailedDueToWriteFailure = -200946

const DAQmxErrorDataXferCustomThresholdNotDMAXferMethodSpecifiedForDev = -200945

const DAQmxErrorDataXferRequestConditionNotSpecifiedForCustomThreshold = -200944

const DAQmxErrorDataXferCustomThresholdNotSpecified = -200943

const DAQmxErrorCAPISyncCallbackNotSupportedOnThisPlatform = -200942

const DAQmxErrorCalChanReversePolyCoefNotSpecd = -200941

const DAQmxErrorCalChanForwardPolyCoefNotSpecd = -200940

const DAQmxErrorChanCalRepeatedNumberInPreScaledVals = -200939

const DAQmxErrorChanCalTableNumScaledNotEqualNumPrescaledVals = -200938

const DAQmxErrorChanCalTableScaledValsNotSpecd = -200937

const DAQmxErrorChanCalTablePreScaledValsNotSpecd = -200936

const DAQmxErrorChanCalScaleTypeNotSet = -200935

const DAQmxErrorChanCalExpired = -200934

const DAQmxErrorChanCalExpirationDateNotSet = -200933

const DAQmxError3OutputPortCombinationGivenSampTimingType653x = -200932

const DAQmxError3InputPortCombinationGivenSampTimingType653x = -200931

const DAQmxError2OutputPortCombinationGivenSampTimingType653x = -200930

const DAQmxError2InputPortCombinationGivenSampTimingType653x = -200929

const DAQmxErrorPatternMatcherMayBeUsedByOneTrigOnly = -200928

const DAQmxErrorNoChansSpecdForPatternSource = -200927

const DAQmxErrorChangeDetectionChanNotInTask = -200926

const DAQmxErrorChangeDetectionChanNotTristated = -200925

const DAQmxErrorWaitModeValueNotSupportedNonBuffered = -200924

const DAQmxErrorWaitModePropertyNotSupportedNonBuffered = -200923

const DAQmxErrorCantSavePerLineConfigDigChanSoInteractiveEditsAllowed = -200922

const DAQmxErrorCantSaveNonPortMultiLineDigChanSoInteractiveEditsAllowed = -200921

const DAQmxErrorBufferSizeNotMultipleOfEveryNSampsEventIntervalNoIrqOnDev = -200920

const DAQmxErrorGlobalTaskNameAlreadyChanName = -200919

const DAQmxErrorGlobalChanNameAlreadyTaskName = -200918

const DAQmxErrorAOEveryNSampsEventIntervalNotMultipleOf2 = -200917

const DAQmxErrorSampleTimebaseDivisorNotSupportedGivenTimingType = -200916

const DAQmxErrorHandshakeEventOutputTermNotSupportedGivenTimingType = -200915

const DAQmxErrorChangeDetectionOutputTermNotSupportedGivenTimingType = -200914

const DAQmxErrorReadyForTransferOutputTermNotSupportedGivenTimingType = -200913

const DAQmxErrorRefTrigOutputTermNotSupportedGivenTimingType = -200912

const DAQmxErrorStartTrigOutputTermNotSupportedGivenTimingType = -200911

const DAQmxErrorSampClockOutputTermNotSupportedGivenTimingType = -200910

const DAQmxError20MhzTimebaseNotSupportedGivenTimingType = -200909

const DAQmxErrorSampClockSourceNotSupportedGivenTimingType = -200908

const DAQmxErrorRefTrigTypeNotSupportedGivenTimingType = -200907

const DAQmxErrorPauseTrigTypeNotSupportedGivenTimingType = -200906

const DAQmxErrorHandshakeTrigTypeNotSupportedGivenTimingType = -200905

const DAQmxErrorStartTrigTypeNotSupportedGivenTimingType = -200904

const DAQmxErrorRefClkSrcNotSupported = -200903

const DAQmxErrorDataVoltageLowAndHighIncompatible = -200902

const DAQmxErrorInvalidCharInDigPatternString = -200901

const DAQmxErrorCantUsePort3AloneGivenSampTimingTypeOn653x = -200900

const DAQmxErrorCantUsePort1AloneGivenSampTimingTypeOn653x = -200899

const DAQmxErrorPartialUseOfPhysicalLinesWithinPortNotSupported653x = -200898

const DAQmxErrorPhysicalChanNotSupportedGivenSampTimingType653x = -200897

const DAQmxErrorCanExportOnlyDigEdgeTrigs = -200896

const DAQmxErrorRefTrigDigPatternSizeDoesNotMatchSourceSize = -200895

const DAQmxErrorStartTrigDigPatternSizeDoesNotMatchSourceSize = -200894

const DAQmxErrorChangeDetectionRisingAndFallingEdgeChanDontMatch = -200893

const DAQmxErrorPhysicalChansForChangeDetectionAndPatternMatch653x = -200892

const DAQmxErrorCanExportOnlyOnboardSampClk = -200891

const DAQmxErrorInternalSampClkNotRisingEdge = -200890

const DAQmxErrorRefTrigDigPatternChanNotInTask = -200889

const DAQmxErrorRefTrigDigPatternChanNotTristated = -200888

const DAQmxErrorStartTrigDigPatternChanNotInTask = -200887

const DAQmxErrorStartTrigDigPatternChanNotTristated = -200886

const DAQmxErrorPXIStarAndClock10Sync = -200885

const DAQmxErrorGlobalChanCannotBeSavedSoInteractiveEditsAllowed = -200884

const DAQmxErrorTaskCannotBeSavedSoInteractiveEditsAllowed = -200883

const DAQmxErrorInvalidGlobalChan = -200882

const DAQmxErrorEveryNSampsEventAlreadyRegistered = -200881

const DAQmxErrorEveryNSampsEventIntervalZeroNotSupported = -200880

const DAQmxErrorChanSizeTooBigForU16PortWrite = -200879

const DAQmxErrorChanSizeTooBigForU16PortRead = -200878

const DAQmxErrorBufferSizeNotMultipleOfEveryNSampsEventIntervalWhenDMA = -200877

const DAQmxErrorWriteWhenTaskNotRunningCOTicks = -200876

const DAQmxErrorWriteWhenTaskNotRunningCOFreq = -200875

const DAQmxErrorWriteWhenTaskNotRunningCOTime = -200874

const DAQmxErrorAOMinMaxNotSupportedDACRangeTooSmall = -200873

const DAQmxErrorAOMinMaxNotSupportedGivenDACRange = -200872

const DAQmxErrorAOMinMaxNotSupportedGivenDACRangeAndOffsetVal = -200871

const DAQmxErrorAOMinMaxNotSupportedDACOffsetValInappropriate = -200870

const DAQmxErrorAOMinMaxNotSupportedGivenDACOffsetVal = -200869

const DAQmxErrorAOMinMaxNotSupportedDACRefValTooSmall = -200868

const DAQmxErrorAOMinMaxNotSupportedGivenDACRefVal = -200867

const DAQmxErrorAOMinMaxNotSupportedGivenDACRefAndOffsetVal = -200866

const DAQmxErrorWhenAcqCompAndNumSampsPerChanExceedsOnBrdBufSize = -200865

const DAQmxErrorWhenAcqCompAndNoRefTrig = -200864

const DAQmxErrorWaitForNextSampClkNotSupported = -200863

const DAQmxErrorDevInUnidentifiedPXIChassis = -200862

const DAQmxErrorMaxSoundPressureMicSensitivitRelatedAIPropertiesNotSupportedByDev = -200861

const DAQmxErrorMaxSoundPressureAndMicSensitivityNotSupportedByDev = -200860

const DAQmxErrorAOBufferSizeZeroForSampClkTimingType = -200859

const DAQmxErrorAOCallWriteBeforeStartForSampClkTimingType = -200858

const DAQmxErrorInvalidCalLowPassCutoffFreq = -200857

const DAQmxErrorSimulationCannotBeDisabledForDevCreatedAsSimulatedDev = -200856

const DAQmxErrorCannotAddNewDevsAfterTaskConfiguration = -200855

const DAQmxErrorDifftSyncPulseSrcAndSampClkTimebaseSrcDevMultiDevTask = -200854

const DAQmxErrorTermWithoutDevInMultiDevTask = -200853

const DAQmxErrorSyncNoDevSampClkTimebaseOrSyncPulseInPXISlot2 = -200852

const DAQmxErrorPhysicalChanNotOnThisConnector = -200851

const DAQmxErrorNumSampsToWaitNotGreaterThanZeroInScript = -200850

const DAQmxErrorNumSampsToWaitNotMultipleOfAlignmentQuantumInScript = -200849

const DAQmxErrorEveryNSamplesEventNotSupportedForNonBufferedTasks = -200848

const DAQmxErrorBufferedAndDataXferPIO = -200847

const DAQmxErrorCannotWriteWhenAutoStartFalseAndTaskNotRunning = -200846

const DAQmxErrorNonBufferedAndDataXferInterrupts = -200845

const DAQmxErrorWriteFailedMultipleCtrsWithFREQOUT = -200844

const DAQmxErrorReadNotCompleteBefore3SampClkEdges = -200843

const DAQmxErrorCtrHWTimedSinglePointAndDataXferNotProgIO = -200842

const DAQmxErrorPrescalerNot1ForInputTerminal = -200841

const DAQmxErrorPrescalerNot1ForTimebaseSrc = -200840

const DAQmxErrorSampClkTimingTypeWhenTristateIsFalse = -200839

const DAQmxErrorOutputBufferSizeNotMultOfXferSize = -200838

const DAQmxErrorSampPerChanNotMultOfXferSize = -200837

const DAQmxErrorWriteToTEDSFailed = -200836

const DAQmxErrorSCXIDevNotUsablePowerTurnedOff = -200835

const DAQmxErrorCannotReadWhenAutoStartFalseBufSizeZeroAndTaskNotRunning = -200834

const DAQmxErrorCannotReadWhenAutoStartFalseHWTimedSinglePtAndTaskNotRunning = -200833

const DAQmxErrorCannotReadWhenAutoStartFalseOnDemandAndTaskNotRunning = -200832

const DAQmxErrorSimultaneousAOWhenNotOnDemandTiming = -200831

const DAQmxErrorMemMapAndSimultaneousAO = -200830

const DAQmxErrorWriteFailedMultipleCOOutputTypes = -200829

const DAQmxErrorWriteToTEDSNotSupportedOnRT = -200828

const DAQmxErrorVirtualTEDSDataFileError = -200827

const DAQmxErrorTEDSSensorDataError = -200826

const DAQmxErrorDataSizeMoreThanSizeOfEEPROMOnTEDS = -200825

const DAQmxErrorPROMOnTEDSContainsBasicTEDSData = -200824

const DAQmxErrorPROMOnTEDSAlreadyWritten = -200823

const DAQmxErrorTEDSDoesNotContainPROM = -200822

const DAQmxErrorHWTimedSinglePointNotSupportedAI = -200821

const DAQmxErrorHWTimedSinglePointOddNumChansInAITask = -200820

const DAQmxErrorCantUseOnlyOnBoardMemWithProgrammedIO = -200819

const DAQmxErrorSwitchDevShutDownDueToHighTemp = -200818

const DAQmxErrorExcitationNotSupportedWhenTermCfgDiff = -200817

const DAQmxErrorTEDSMinElecValGEMaxElecVal = -200816

const DAQmxErrorTEDSMinPhysValGEMaxPhysVal = -200815

const DAQmxErrorCIOnboardClockNotSupportedAsInputTerm = -200814

const DAQmxErrorInvalidSampModeForPositionMeas = -200813

const DAQmxErrorTrigWhenAOHWTimedSinglePtSampMode = -200812

const DAQmxErrorDAQmxCantUseStringDueToUnknownChar = -200811

const DAQmxErrorDAQmxCantRetrieveStringDueToUnknownChar = -200810

const DAQmxErrorClearTEDSNotSupportedOnRT = -200809

const DAQmxErrorCfgTEDSNotSupportedOnRT = -200808

const DAQmxErrorProgFilterClkCfgdToDifferentMinPulseWidthBySameTask1PerDev = -200807

const DAQmxErrorProgFilterClkCfgdToDifferentMinPulseWidthByAnotherTask1PerDev = -200806

const DAQmxErrorNoLastExtCalDateTimeLastExtCalNotDAQmx = -200804

const DAQmxErrorCannotWriteNotStartedAutoStartFalseNotOnDemandHWTimedSglPt = -200803

const DAQmxErrorCannotWriteNotStartedAutoStartFalseNotOnDemandBufSizeZero = -200802

const DAQmxErrorCOInvalidTimingSrcDueToSignal = -200801

const DAQmxErrorCIInvalidTimingSrcForSampClkDueToSampTimingType = -200800

const DAQmxErrorCIInvalidTimingSrcForEventCntDueToSampMode = -200799

const DAQmxErrorNoChangeDetectOnNonInputDigLineForDev = -200798

const DAQmxErrorEmptyStringTermNameNotSupported = -200797

const DAQmxErrorMemMapEnabledForHWTimedNonBufferedAO = -200796

const DAQmxErrorDevOnboardMemOverflowDuringHWTimedNonBufferedGen = -200795

const DAQmxErrorCODAQmxWriteMultipleChans = -200794

const DAQmxErrorCantMaintainExistingValueAOSync = -200793

const DAQmxErrorMStudioMultiplePhysChansNotSupported = -200792

const DAQmxErrorCantConfigureTEDSForChan = -200791

const DAQmxErrorWriteDataTypeTooSmall = -200790

const DAQmxErrorReadDataTypeTooSmall = -200789

const DAQmxErrorMeasuredBridgeOffsetTooHigh = -200788

const DAQmxErrorStartTrigConflictWithCOHWTimedSinglePt = -200787

const DAQmxErrorSampClkRateExtSampClkTimebaseRateMismatch = -200786

const DAQmxErrorInvalidTimingSrcDueToSampTimingType = -200785

const DAQmxErrorVirtualTEDSFileNotFound = -200784

const DAQmxErrorMStudioNoForwardPolyScaleCoeffs = -200783

const DAQmxErrorMStudioNoReversePolyScaleCoeffs = -200782

const DAQmxErrorMStudioNoPolyScaleCoeffsUseCalc = -200781

const DAQmxErrorMStudioNoForwardPolyScaleCoeffsUseCalc = -200780

const DAQmxErrorMStudioNoReversePolyScaleCoeffsUseCalc = -200779

const DAQmxErrorCOSampModeSampTimingTypeSampClkConflict = -200778

const DAQmxErrorDevCannotProduceMinPulseWidth = -200777

const DAQmxErrorCannotProduceMinPulseWidthGivenPropertyValues = -200776

const DAQmxErrorTermCfgdToDifferentMinPulseWidthByAnotherTask = -200775

const DAQmxErrorTermCfgdToDifferentMinPulseWidthByAnotherProperty = -200774

const DAQmxErrorDigSyncNotAvailableOnTerm = -200773

const DAQmxErrorDigFilterNotAvailableOnTerm = -200772

const DAQmxErrorDigFilterEnabledMinPulseWidthNotCfg = -200771

const DAQmxErrorDigFilterAndSyncBothEnabled = -200770

const DAQmxErrorHWTimedSinglePointAOAndDataXferNotProgIO = -200769

const DAQmxErrorNonBufferedAOAndDataXferNotProgIO = -200768

const DAQmxErrorProgIODataXferForBufferedAO = -200767

const DAQmxErrorTEDSLegacyTemplateIDInvalidOrUnsupported = -200766

const DAQmxErrorTEDSMappingMethodInvalidOrUnsupported = -200765

const DAQmxErrorTEDSLinearMappingSlopeZero = -200764

const DAQmxErrorAIInputBufferSizeNotMultOfXferSize = -200763

const DAQmxErrorNoSyncPulseExtSampClkTimebase = -200762

const DAQmxErrorNoSyncPulseAnotherTaskRunning = -200761

const DAQmxErrorAOMinMaxNotInGainRange = -200760

const DAQmxErrorAOMinMaxNotInDACRange = -200759

const DAQmxErrorDevOnlySupportsSampClkTimingAO = -200758

const DAQmxErrorDevOnlySupportsSampClkTimingAI = -200757

const DAQmxErrorTEDSIncompatibleSensorAndMeasType = -200756

const DAQmxErrorTEDSMultipleCalTemplatesNotSupported = -200755

const DAQmxErrorTEDSTemplateParametersNotSupported = -200754

const DAQmxErrorParsingTEDSData = -200753

const DAQmxErrorMultipleActivePhysChansNotSupported = -200752

const DAQmxErrorNoChansSpecdForChangeDetect = -200751

const DAQmxErrorInvalidCalVoltageForGivenGain = -200750

const DAQmxErrorInvalidCalGain = -200749

const DAQmxErrorMultipleWritesBetweenSampClks = -200748

const DAQmxErrorInvalidAcqTypeForFREQOUT = -200747

const DAQmxErrorSuitableTimebaseNotFoundTimeCombo2 = -200746

const DAQmxErrorSuitableTimebaseNotFoundFrequencyCombo2 = -200745

const DAQmxErrorRefClkRateRefClkSrcMismatch = -200744

const DAQmxErrorNoTEDSTerminalBlock = -200743

const DAQmxErrorCorruptedTEDSMemory = -200742

const DAQmxErrorTEDSNotSupported = -200741

const DAQmxErrorTimingSrcTaskStartedBeforeTimedLoop = -200740

const DAQmxErrorPropertyNotSupportedForTimingSrc = -200739

const DAQmxErrorTimingSrcDoesNotExist = -200738

const DAQmxErrorInputBufferSizeNotEqualSampsPerChanForFiniteSampMode = -200737

const DAQmxErrorFREQOUTCannotProduceDesiredFrequency2 = -200736

const DAQmxErrorExtRefClkRateNotSpecified = -200735

const DAQmxErrorDeviceDoesNotSupportDMADataXferForNonBufferedAcq = -200734

const DAQmxErrorDigFilterMinPulseWidthSetWhenTristateIsFalse = -200733

const DAQmxErrorDigFilterEnableSetWhenTristateIsFalse = -200732

const DAQmxErrorNoHWTimingWithOnDemand = -200731

const DAQmxErrorCannotDetectChangesWhenTristateIsFalse = -200730

const DAQmxErrorCannotHandshakeWhenTristateIsFalse = -200729

const DAQmxErrorLinesUsedForStaticInputNotForHandshakingControl = -200728

const DAQmxErrorLinesUsedForHandshakingControlNotForStaticInput = -200727

const DAQmxErrorLinesUsedForStaticInputNotForHandshakingInput = -200726

const DAQmxErrorLinesUsedForHandshakingInputNotForStaticInput = -200725

const DAQmxErrorDifferentDITristateValsForChansInTask = -200724

const DAQmxErrorTimebaseCalFreqVarianceTooLarge = -200723

const DAQmxErrorTimebaseCalFailedToConverge = -200722

const DAQmxErrorInadequateResolutionForTimebaseCal = -200721

const DAQmxErrorInvalidAOGainCalConst = -200720

const DAQmxErrorInvalidAOOffsetCalConst = -200719

const DAQmxErrorInvalidAIGainCalConst = -200718

const DAQmxErrorInvalidAIOffsetCalConst = -200717

const DAQmxErrorDigOutputOverrun = -200716

const DAQmxErrorDigInputOverrun = -200715

const DAQmxErrorAcqStoppedDriverCantXferDataFastEnough = -200714

const DAQmxErrorChansCantAppearInSameTask = -200713

const DAQmxErrorInputCfgFailedBecauseWatchdogExpired = -200712

const DAQmxErrorAnalogTrigChanNotExternal = -200711

const DAQmxErrorTooManyChansForInternalAIInputSrc = -200710

const DAQmxErrorTEDSSensorNotDetected = -200709

const DAQmxErrorPrptyGetSpecdActiveItemFailedDueToDifftValues = -200708

const DAQmxErrorRoutingDestTermPXIClk10InNotInSlot2 = -200706

const DAQmxErrorRoutingDestTermPXIStarXNotInSlot2 = -200705

const DAQmxErrorRoutingSrcTermPXIStarXNotInSlot2 = -200704

const DAQmxErrorRoutingSrcTermPXIStarInSlot16AndAbove = -200703

const DAQmxErrorRoutingDestTermPXIStarInSlot16AndAbove = -200702

const DAQmxErrorRoutingDestTermPXIStarInSlot2 = -200701

const DAQmxErrorRoutingSrcTermPXIStarInSlot2 = -200700

const DAQmxErrorRoutingDestTermPXIChassisNotIdentified = -200699

const DAQmxErrorRoutingSrcTermPXIChassisNotIdentified = -200698

const DAQmxErrorFailedToAcquireCalData = -200697

const DAQmxErrorBridgeOffsetNullingCalNotSupported = -200696

const DAQmxErrorAIMaxNotSpecified = -200695

const DAQmxErrorAIMinNotSpecified = -200694

const DAQmxErrorOddTotalBufferSizeToWrite = -200693

const DAQmxErrorOddTotalNumSampsToWrite = -200692

const DAQmxErrorBufferWithWaitMode = -200691

const DAQmxErrorBufferWithHWTimedSinglePointSampMode = -200690

const DAQmxErrorCOWritePulseLowTicksNotSupported = -200689

const DAQmxErrorCOWritePulseHighTicksNotSupported = -200688

const DAQmxErrorCOWritePulseLowTimeOutOfRange = -200687

const DAQmxErrorCOWritePulseHighTimeOutOfRange = -200686

const DAQmxErrorCOWriteFreqOutOfRange = -200685

const DAQmxErrorCOWriteDutyCycleOutOfRange = -200684

const DAQmxErrorInvalidInstallation = -200683

const DAQmxErrorRefTrigMasterSessionUnavailable = -200682

const DAQmxErrorRouteFailedBecauseWatchdogExpired = -200681

const DAQmxErrorDeviceShutDownDueToHighTemp = -200680

const DAQmxErrorNoMemMapWhenHWTimedSinglePoint = -200679

const DAQmxErrorWriteFailedBecauseWatchdogExpired = -200678

const DAQmxErrorDifftInternalAIInputSrcs = -200677

const DAQmxErrorDifftAIInputSrcInOneChanGroup = -200676

const DAQmxErrorInternalAIInputSrcInMultChanGroups = -200675

const DAQmxErrorSwitchOpFailedDueToPrevError = -200674

const DAQmxErrorWroteMultiSampsUsingSingleSampWrite = -200673

const DAQmxErrorMismatchedInputArraySizes = -200672

const DAQmxErrorCantExceedRelayDriveLimit = -200671

const DAQmxErrorDACRngLowNotEqualToMinusRefVal = -200670

const DAQmxErrorCantAllowConnectDACToGnd = -200669

const DAQmxErrorWatchdogTimeoutOutOfRangeAndNotSpecialVal = -200668

const DAQmxErrorNoWatchdogOutputOnPortReservedForInput = -200667

const DAQmxErrorNoInputOnPortCfgdForWatchdogOutput = -200666

const DAQmxErrorWatchdogExpirationStateNotEqualForLinesInPort = -200665

const DAQmxErrorCannotPerformOpWhenTaskNotReserved = -200664

const DAQmxErrorPowerupStateNotSupported = -200663

const DAQmxErrorWatchdogTimerNotSupported = -200662

const DAQmxErrorOpNotSupportedWhenRefClkSrcNone = -200661

const DAQmxErrorSampClkRateUnavailable = -200660

const DAQmxErrorPrptyGetSpecdSingleActiveChanFailedDueToDifftVals = -200659

const DAQmxErrorPrptyGetImpliedActiveChanFailedDueToDifftVals = -200658

const DAQmxErrorPrptyGetSpecdActiveChanFailedDueToDifftVals = -200657

const DAQmxErrorNoRegenWhenUsingBrdMem = -200656

const DAQmxErrorNonbufferedReadMoreThanSampsPerChan = -200655

const DAQmxErrorWatchdogExpirationTristateNotSpecdForEntirePort = -200654

const DAQmxErrorPowerupTristateNotSpecdForEntirePort = -200653

const DAQmxErrorPowerupStateNotSpecdForEntirePort = -200652

const DAQmxErrorCantSetWatchdogExpirationOnDigInChan = -200651

const DAQmxErrorCantSetPowerupStateOnDigInChan = -200650

const DAQmxErrorPhysChanNotInTask = -200649

const DAQmxErrorPhysChanDevNotInTask = -200648

const DAQmxErrorDigInputNotSupported = -200647

const DAQmxErrorDigFilterIntervalNotEqualForLines = -200646

const DAQmxErrorDigFilterIntervalAlreadyCfgd = -200645

const DAQmxErrorCantResetExpiredWatchdog = -200644

const DAQmxErrorActiveChanTooManyLinesSpecdWhenGettingPrpty = -200643

const DAQmxErrorActiveChanNotSpecdWhenGetting1LinePrpty = -200642

const DAQmxErrorDigPrptyCannotBeSetPerLine = -200641

const DAQmxErrorSendAdvCmpltAfterWaitForTrigInScanlist = -200640

const DAQmxErrorDisconnectionRequiredInScanlist = -200639

const DAQmxErrorTwoWaitForTrigsAfterConnectionInScanlist = -200638

const DAQmxErrorActionSeparatorRequiredAfterBreakingConnectionInScanlist = -200637

const DAQmxErrorConnectionInScanlistMustWaitForTrig = -200636

const DAQmxErrorActionNotSupportedTaskNotWatchdog = -200635

const DAQmxErrorWfmNameSameAsScriptName = -200634

const DAQmxErrorScriptNameSameAsWfmName = -200633

const DAQmxErrorDSFStopClock = -200632

const DAQmxErrorDSFReadyForStartClock = -200631

const DAQmxErrorWriteOffsetNotMultOfIncr = -200630

const DAQmxErrorDifferentPrptyValsNotSupportedOnDev = -200629

const DAQmxErrorRefAndPauseTrigConfigured = -200628

const DAQmxErrorFailedToEnableHighSpeedInputClock = -200627

const DAQmxErrorEmptyPhysChanInPowerUpStatesArray = -200626

const DAQmxErrorActivePhysChanTooManyLinesSpecdWhenGettingPrpty = -200625

const DAQmxErrorActivePhysChanNotSpecdWhenGetting1LinePrpty = -200624

const DAQmxErrorPXIDevTempCausedShutDown = -200623

const DAQmxErrorInvalidNumSampsToWrite = -200622

const DAQmxErrorOutputFIFOUnderflow2 = -200621

const DAQmxErrorRepeatedAIPhysicalChan = -200620

const DAQmxErrorMultScanOpsInOneChassis = -200619

const DAQmxErrorInvalidAIChanOrder = -200618

const DAQmxErrorReversePowerProtectionActivated = -200617

const DAQmxErrorInvalidAsynOpHandle = -200616

const DAQmxErrorFailedToEnableHighSpeedOutput = -200615

const DAQmxErrorCannotReadPastEndOfRecord = -200614

const DAQmxErrorAcqStoppedToPreventInputBufferOverwriteOneDataXferMech = -200613

const DAQmxErrorZeroBasedChanIndexInvalid = -200612

const DAQmxErrorNoChansOfGivenTypeInTask = -200611

const DAQmxErrorSampClkSrcInvalidForOutputValidForInput = -200610

const DAQmxErrorOutputBufSizeTooSmallToStartGen = -200609

const DAQmxErrorInputBufSizeTooSmallToStartAcq = -200608

const DAQmxErrorExportTwoSignalsOnSameTerminal = -200607

const DAQmxErrorChanIndexInvalid = -200606

const DAQmxErrorRangeSyntaxNumberTooBig = -200605

const DAQmxErrorNULLPtr = -200604

const DAQmxErrorScaledMinEqualMax = -200603

const DAQmxErrorPreScaledMinEqualMax = -200602

const DAQmxErrorPropertyNotSupportedForScaleType = -200601

const DAQmxErrorChannelNameGenerationNumberTooBig = -200600

const DAQmxErrorRepeatedNumberInScaledValues = -200599

const DAQmxErrorRepeatedNumberInPreScaledValues = -200598

const DAQmxErrorLinesAlreadyReservedForOutput = -200597

const DAQmxErrorSwitchOperationChansSpanMultipleDevsInList = -200596

const DAQmxErrorInvalidIDInListAtBeginningOfSwitchOperation = -200595

const DAQmxErrorMStudioInvalidPolyDirection = -200594

const DAQmxErrorMStudioPropertyGetWhileTaskNotVerified = -200593

const DAQmxErrorRangeWithTooManyObjects = -200592

const DAQmxErrorCppDotNetAPINegativeBufferSize = -200591

const DAQmxErrorCppCantRemoveInvalidEventHandler = -200590

const DAQmxErrorCppCantRemoveEventHandlerTwice = -200589

const DAQmxErrorCppCantRemoveOtherObjectsEventHandler = -200588

const DAQmxErrorDigLinesReservedOrUnavailable = -200587

const DAQmxErrorDSFFailedToResetStream = -200586

const DAQmxErrorDSFReadyForOutputNotAsserted = -200585

const DAQmxErrorSampToWritePerChanNotMultipleOfIncr = -200584

const DAQmxErrorAOPropertiesCauseVoltageBelowMin = -200583

const DAQmxErrorAOPropertiesCauseVoltageOverMax = -200582

const DAQmxErrorPropertyNotSupportedWhenRefClkSrcNone = -200581

const DAQmxErrorAIMaxTooSmall = -200580

const DAQmxErrorAIMaxTooLarge = -200579

const DAQmxErrorAIMinTooSmall = -200578

const DAQmxErrorAIMinTooLarge = -200577

const DAQmxErrorBuiltInCJCSrcNotSupported = -200576

const DAQmxErrorTooManyPostTrigSampsPerChan = -200575

const DAQmxErrorTrigLineNotFoundSingleDevRoute = -200574

const DAQmxErrorDifferentInternalAIInputSources = -200573

const DAQmxErrorDifferentAIInputSrcInOneChanGroup = -200572

const DAQmxErrorInternalAIInputSrcInMultipleChanGroups = -200571

const DAQmxErrorCAPIChanIndexInvalid = -200570

const DAQmxErrorCollectionDoesNotMatchChanType = -200569

const DAQmxErrorOutputCantStartChangedRegenerationMode = -200568

const DAQmxErrorOutputCantStartChangedBufferSize = -200567

const DAQmxErrorChanSizeTooBigForU32PortWrite = -200566

const DAQmxErrorChanSizeTooBigForU8PortWrite = -200565

const DAQmxErrorChanSizeTooBigForU32PortRead = -200564

const DAQmxErrorChanSizeTooBigForU8PortRead = -200563

const DAQmxErrorInvalidDigDataWrite = -200562

const DAQmxErrorInvalidAODataWrite = -200561

const DAQmxErrorWaitUntilDoneDoesNotIndicateDone = -200560

const DAQmxErrorMultiChanTypesInTask = -200559

const DAQmxErrorMultiDevsInTask = -200558

const DAQmxErrorCannotSetPropertyWhenTaskRunning = -200557

const DAQmxErrorCannotGetPropertyWhenTaskNotCommittedOrRunning = -200556

const DAQmxErrorLeadingUnderscoreInString = -200555

const DAQmxErrorTrailingSpaceInString = -200554

const DAQmxErrorLeadingSpaceInString = -200553

const DAQmxErrorInvalidCharInString = -200552

const DAQmxErrorDLLBecameUnlocked = -200551

const DAQmxErrorDLLLock = -200550

const DAQmxErrorSelfCalConstsInvalid = -200549

const DAQmxErrorInvalidTrigCouplingExceptForExtTrigChan = -200548

const DAQmxErrorWriteFailsBufferSizeAutoConfigured = -200547

const DAQmxErrorExtCalAdjustExtRefVoltageFailed = -200546

const DAQmxErrorSelfCalFailedExtNoiseOrRefVoltageOutOfCal = -200545

const DAQmxErrorExtCalTemperatureNotDAQmx = -200544

const DAQmxErrorExtCalDateTimeNotDAQmx = -200543

const DAQmxErrorSelfCalTemperatureNotDAQmx = -200542

const DAQmxErrorSelfCalDateTimeNotDAQmx = -200541

const DAQmxErrorDACRefValNotSet = -200540

const DAQmxErrorAnalogMultiSampWriteNotSupported = -200539

const DAQmxErrorInvalidActionInControlTask = -200538

const DAQmxErrorPolyCoeffsInconsistent = -200537

const DAQmxErrorSensorValTooLow = -200536

const DAQmxErrorSensorValTooHigh = -200535

const DAQmxErrorWaveformNameTooLong = -200534

const DAQmxErrorIdentifierTooLongInScript = -200533

const DAQmxErrorUnexpectedIDFollowingSwitchChanName = -200532

const DAQmxErrorRelayNameNotSpecifiedInList = -200531

const DAQmxErrorUnexpectedIDFollowingRelayNameInList = -200530

const DAQmxErrorUnexpectedIDFollowingSwitchOpInList = -200529

const DAQmxErrorInvalidLineGrouping = -200528

const DAQmxErrorCtrMinMax = -200527

const DAQmxErrorWriteChanTypeMismatch = -200526

const DAQmxErrorReadChanTypeMismatch = -200525

const DAQmxErrorWriteNumChansMismatch = -200524

const DAQmxErrorOneChanReadForMultiChanTask = -200523

const DAQmxErrorCannotSelfCalDuringExtCal = -200522

const DAQmxErrorMeasCalAdjustOscillatorPhaseDAC = -200521

const DAQmxErrorInvalidCalConstCalADCAdjustment = -200520

const DAQmxErrorInvalidCalConstOscillatorFreqDACValue = -200519

const DAQmxErrorInvalidCalConstOscillatorPhaseDACValue = -200518

const DAQmxErrorInvalidCalConstOffsetDACValue = -200517

const DAQmxErrorInvalidCalConstGainDACValue = -200516

const DAQmxErrorInvalidNumCalADCReadsToAverage = -200515

const DAQmxErrorInvalidCfgCalAdjustDirectPathOutputImpedance = -200514

const DAQmxErrorInvalidCfgCalAdjustMainPathOutputImpedance = -200513

const DAQmxErrorInvalidCfgCalAdjustMainPathPostAmpGainAndOffset = -200512

const DAQmxErrorInvalidCfgCalAdjustMainPathPreAmpGain = -200511

const DAQmxErrorInvalidCfgCalAdjustMainPreAmpOffset = -200510

const DAQmxErrorMeasCalAdjustCalADC = -200509

const DAQmxErrorMeasCalAdjustOscillatorFrequency = -200508

const DAQmxErrorMeasCalAdjustDirectPathOutputImpedance = -200507

const DAQmxErrorMeasCalAdjustMainPathOutputImpedance = -200506

const DAQmxErrorMeasCalAdjustDirectPathGain = -200505

const DAQmxErrorMeasCalAdjustMainPathPostAmpGainAndOffset = -200504

const DAQmxErrorMeasCalAdjustMainPathPreAmpGain = -200503

const DAQmxErrorMeasCalAdjustMainPathPreAmpOffset = -200502

const DAQmxErrorInvalidDateTimeInEEPROM = -200501

const DAQmxErrorUnableToLocateErrorResources = -200500

const DAQmxErrorDotNetAPINotUnsigned32BitNumber = -200499

const DAQmxErrorInvalidRangeOfObjectsSyntaxInString = -200498

const DAQmxErrorAttemptToEnableLineNotPreviouslyDisabled = -200497

const DAQmxErrorInvalidCharInPattern = -200496

const DAQmxErrorIntermediateBufferFull = -200495

const DAQmxErrorLoadTaskFailsBecauseNoTimingOnDev = -200494

const DAQmxErrorCAPIReservedParamNotNULLNorEmpty = -200493

const DAQmxErrorCAPIReservedParamNotNULL = -200492

const DAQmxErrorCAPIReservedParamNotZero = -200491

const DAQmxErrorSampleValueOutOfRange = -200490

const DAQmxErrorChanAlreadyInTask = -200489

const DAQmxErrorVirtualChanDoesNotExist = -200488

const DAQmxErrorChanNotInTask = -200486

const DAQmxErrorTaskNotInDataNeighborhood = -200485

const DAQmxErrorCantSaveTaskWithoutReplace = -200484

const DAQmxErrorCantSaveChanWithoutReplace = -200483

const DAQmxErrorDevNotInTask = -200482

const DAQmxErrorDevAlreadyInTask = -200481

const DAQmxErrorCanNotPerformOpWhileTaskRunning = -200479

const DAQmxErrorCanNotPerformOpWhenNoChansInTask = -200478

const DAQmxErrorCanNotPerformOpWhenNoDevInTask = -200477

const DAQmxErrorCannotPerformOpWhenTaskNotRunning = -200475

const DAQmxErrorOperationTimedOut = -200474

const DAQmxErrorCannotReadWhenAutoStartFalseAndTaskNotRunningOrCommitted = -200473

const DAQmxErrorCannotWriteWhenAutoStartFalseAndTaskNotRunningOrCommitted = -200472

const DAQmxErrorTaskVersionNew = -200470

const DAQmxErrorChanVersionNew = -200469

const DAQmxErrorEmptyString = -200467

const DAQmxErrorChannelSizeTooBigForPortReadType = -200466

const DAQmxErrorChannelSizeTooBigForPortWriteType = -200465

const DAQmxErrorExpectedNumberOfChannelsVerificationFailed = -200464

const DAQmxErrorNumLinesMismatchInReadOrWrite = -200463

const DAQmxErrorOutputBufferEmpty = -200462

const DAQmxErrorInvalidChanName = -200461

const DAQmxErrorReadNoInputChansInTask = -200460

const DAQmxErrorWriteNoOutputChansInTask = -200459

const DAQmxErrorPropertyNotSupportedNotInputTask = -200457

const DAQmxErrorPropertyNotSupportedNotOutputTask = -200456

const DAQmxErrorGetPropertyNotInputBufferedTask = -200455

const DAQmxErrorGetPropertyNotOutputBufferedTask = -200454

const DAQmxErrorInvalidTimeoutVal = -200453

const DAQmxErrorAttributeNotSupportedInTaskContext = -200452

const DAQmxErrorAttributeNotQueryableUnlessTaskIsCommitted = -200451

const DAQmxErrorAttributeNotSettableWhenTaskIsRunning = -200450

const DAQmxErrorDACRngLowNotMinusRefValNorZero = -200449

const DAQmxErrorDACRngHighNotEqualRefVal = -200448

const DAQmxErrorUnitsNotFromCustomScale = -200447

const DAQmxErrorInvalidVoltageReadingDuringExtCal = -200446

const DAQmxErrorCalFunctionNotSupported = -200445

const DAQmxErrorInvalidPhysicalChanForCal = -200444

const DAQmxErrorExtCalNotComplete = -200443

const DAQmxErrorCantSyncToExtStimulusFreqDuringCal = -200442

const DAQmxErrorUnableToDetectExtStimulusFreqDuringCal = -200441

const DAQmxErrorInvalidCloseAction = -200440

const DAQmxErrorExtCalFunctionOutsideExtCalSession = -200439

const DAQmxErrorInvalidCalArea = -200438

const DAQmxErrorExtCalConstsInvalid = -200437

const DAQmxErrorStartTrigDelayWithExtSampClk = -200436

const DAQmxErrorDelayFromSampClkWithExtConv = -200435

const DAQmxErrorFewerThan2PreScaledVals = -200434

const DAQmxErrorFewerThan2ScaledValues = -200433

const DAQmxErrorPhysChanOutputType = -200432

const DAQmxErrorPhysChanMeasType = -200431

const DAQmxErrorInvalidPhysChanType = -200430

const DAQmxErrorLabVIEWEmptyTaskOrChans = -200429

const DAQmxErrorLabVIEWInvalidTaskOrChans = -200428

const DAQmxErrorInvalidRefClkRate = -200427

const DAQmxErrorInvalidExtTrigImpedance = -200426

const DAQmxErrorHystTrigLevelAIMax = -200425

const DAQmxErrorLineNumIncompatibleWithVideoSignalFormat = -200424

const DAQmxErrorTrigWindowAIMinAIMaxCombo = -200423

const DAQmxErrorTrigAIMinAIMax = -200422

const DAQmxErrorHystTrigLevelAIMin = -200421

const DAQmxErrorInvalidSampRateConsiderRIS = -200420

const DAQmxErrorInvalidReadPosDuringRIS = -200419

const DAQmxErrorImmedTrigDuringRISMode = -200418

const DAQmxErrorTDCNotEnabledDuringRISMode = -200417

const DAQmxErrorMultiRecWithRIS = -200416

const DAQmxErrorInvalidRefClkSrc = -200415

const DAQmxErrorInvalidSampClkSrc = -200414

const DAQmxErrorInsufficientOnBoardMemForNumRecsAndSamps = -200413

const DAQmxErrorInvalidAIAttenuation = -200412

const DAQmxErrorACCouplingNotAllowedWith50OhmImpedance = -200411

const DAQmxErrorInvalidRecordNum = -200410

const DAQmxErrorZeroSlopeLinearScale = -200409

const DAQmxErrorZeroReversePolyScaleCoeffs = -200408

const DAQmxErrorZeroForwardPolyScaleCoeffs = -200407

const DAQmxErrorNoReversePolyScaleCoeffs = -200406

const DAQmxErrorNoForwardPolyScaleCoeffs = -200405

const DAQmxErrorNoPolyScaleCoeffs = -200404

const DAQmxErrorReversePolyOrderLessThanNumPtsToCompute = -200403

const DAQmxErrorReversePolyOrderNotPositive = -200402

const DAQmxErrorNumPtsToComputeNotPositive = -200401

const DAQmxErrorWaveformLengthNotMultipleOfIncr = -200400

const DAQmxErrorCAPINoExtendedErrorInfoAvailable = -200399

const DAQmxErrorCVIFunctionNotFoundInDAQmxDLL = -200398

const DAQmxErrorCVIFailedToLoadDAQmxDLL = -200397

const DAQmxErrorNoCommonTrigLineForImmedRoute = -200396

const DAQmxErrorNoCommonTrigLineForTaskRoute = -200395

const DAQmxErrorF64PrptyValNotUnsignedInt = -200394

const DAQmxErrorRegisterNotWritable = -200393

const DAQmxErrorInvalidOutputVoltageAtSampClkRate = -200392

const DAQmxErrorStrobePhaseShiftDCMBecameUnlocked = -200391

const DAQmxErrorDrivePhaseShiftDCMBecameUnlocked = -200390

const DAQmxErrorClkOutPhaseShiftDCMBecameUnlocked = -200389

const DAQmxErrorOutputBoardClkDCMBecameUnlocked = -200388

const DAQmxErrorInputBoardClkDCMBecameUnlocked = -200387

const DAQmxErrorInternalClkDCMBecameUnlocked = -200386

const DAQmxErrorDCMLock = -200385

const DAQmxErrorDataLineReservedForDynamicOutput = -200384

const DAQmxErrorInvalidRefClkSrcGivenSampClkSrc = -200383

const DAQmxErrorNoPatternMatcherAvailable = -200382

const DAQmxErrorInvalidDelaySampRateBelowPhaseShiftDCMThresh = -200381

const DAQmxErrorStrainGageCalibration = -200380

const DAQmxErrorInvalidExtClockFreqAndDivCombo = -200379

const DAQmxErrorCustomScaleDoesNotExist = -200378

const DAQmxErrorOnlyFrontEndChanOpsDuringScan = -200377

const DAQmxErrorInvalidOptionForDigitalPortChannel = -200376

const DAQmxErrorUnsupportedSignalTypeExportSignal = -200375

const DAQmxErrorInvalidSignalTypeExportSignal = -200374

const DAQmxErrorUnsupportedTrigTypeSendsSWTrig = -200373

const DAQmxErrorInvalidTrigTypeSendsSWTrig = -200372

const DAQmxErrorRepeatedPhysicalChan = -200371

const DAQmxErrorResourcesInUseForRouteInTask = -200370

const DAQmxErrorResourcesInUseForRoute = -200369

const DAQmxErrorRouteNotSupportedByHW = -200368

const DAQmxErrorResourcesInUseForExportSignalPolarity = -200367

const DAQmxErrorResourcesInUseForInversionInTask = -200366

const DAQmxErrorResourcesInUseForInversion = -200365

const DAQmxErrorExportSignalPolarityNotSupportedByHW = -200364

const DAQmxErrorInversionNotSupportedByHW = -200363

const DAQmxErrorOverloadedChansExistNotRead = -200362

const DAQmxErrorInputFIFOOverflow2 = -200361

const DAQmxErrorCJCChanNotSpecd = -200360

const DAQmxErrorCtrExportSignalNotPossible = -200359

const DAQmxErrorRefTrigWhenContinuous = -200358

const DAQmxErrorIncompatibleSensorOutputAndDeviceInputRanges = -200357

const DAQmxErrorCustomScaleNameUsed = -200356

const DAQmxErrorPropertyValNotSupportedByHW = -200355

const DAQmxErrorPropertyValNotValidTermName = -200354

const DAQmxErrorResourcesInUseForProperty = -200353

const DAQmxErrorCJCChanAlreadyUsed = -200352

const DAQmxErrorForwardPolynomialCoefNotSpecd = -200351

const DAQmxErrorTableScaleNumPreScaledAndScaledValsNotEqual = -200350

const DAQmxErrorTableScalePreScaledValsNotSpecd = -200349

const DAQmxErrorTableScaleScaledValsNotSpecd = -200348

const DAQmxErrorIntermediateBufferSizeNotMultipleOfIncr = -200347

const DAQmxErrorEventPulseWidthOutOfRange = -200346

const DAQmxErrorEventDelayOutOfRange = -200345

const DAQmxErrorSampPerChanNotMultipleOfIncr = -200344

const DAQmxErrorCannotCalculateNumSampsTaskNotStarted = -200343

const DAQmxErrorScriptNotInMem = -200342

const DAQmxErrorOnboardMemTooSmall = -200341

const DAQmxErrorReadAllAvailableDataWithoutBuffer = -200340

const DAQmxErrorPulseActiveAtStart = -200339

const DAQmxErrorCalTempNotSupported = -200338

const DAQmxErrorDelayFromSampClkTooLong = -200337

const DAQmxErrorDelayFromSampClkTooShort = -200336

const DAQmxErrorAIConvRateTooHigh = -200335

const DAQmxErrorDelayFromStartTrigTooLong = -200334

const DAQmxErrorDelayFromStartTrigTooShort = -200333

const DAQmxErrorSampRateTooHigh = -200332

const DAQmxErrorSampRateTooLow = -200331

const DAQmxErrorPFI0UsedForAnalogAndDigitalSrc = -200330

const DAQmxErrorPrimingCfgFIFO = -200329

const DAQmxErrorCannotOpenTopologyCfgFile = -200328

const DAQmxErrorInvalidDTInsideWfmDataType = -200327

const DAQmxErrorRouteSrcAndDestSame = -200326

const DAQmxErrorReversePolynomialCoefNotSpecd = -200325

const DAQmxErrorDevAbsentOrUnavailable = -200324

const DAQmxErrorNoAdvTrigForMultiDevScan = -200323

const DAQmxErrorInterruptsInsufficientDataXferMech = -200322

const DAQmxErrorInvalidAttentuationBasedOnMinMax = -200321

const DAQmxErrorCabledModuleCannotRouteSSH = -200320

const DAQmxErrorCabledModuleCannotRouteConvClk = -200319

const DAQmxErrorInvalidExcitValForScaling = -200318

const DAQmxErrorNoDevMemForScript = -200317

const DAQmxErrorScriptDataUnderflow = -200316

const DAQmxErrorNoDevMemForWaveform = -200315

const DAQmxErrorStreamDCMBecameUnlocked = -200314

const DAQmxErrorStreamDCMLock = -200313

const DAQmxErrorWaveformNotInMem = -200312

const DAQmxErrorWaveformWriteOutOfBounds = -200311

const DAQmxErrorWaveformPreviouslyAllocated = -200310

const DAQmxErrorSampClkTbMasterTbDivNotAppropriateForSampTbSrc = -200309

const DAQmxErrorSampTbRateSampTbSrcMismatch = -200308

const DAQmxErrorMasterTbRateMasterTbSrcMismatch = -200307

const DAQmxErrorSampsPerChanTooBig = -200306

const DAQmxErrorFinitePulseTrainNotPossible = -200305

const DAQmxErrorExtMasterTimebaseRateNotSpecified = -200304

const DAQmxErrorExtSampClkSrcNotSpecified = -200303

const DAQmxErrorInputSignalSlowerThanMeasTime = -200302

const DAQmxErrorCannotUpdatePulseGenProperty = -200301

const DAQmxErrorInvalidTimingType = -200300

const DAQmxErrorPropertyUnavailWhenUsingOnboardMemory = -200297

const DAQmxErrorCannotWriteAfterStartWithOnboardMemory = -200295

const DAQmxErrorNotEnoughSampsWrittenForInitialXferRqstCondition = -200294

const DAQmxErrorNoMoreSpace = -200293

const DAQmxErrorSamplesCanNotYetBeWritten = -200292

const DAQmxErrorGenStoppedToPreventIntermediateBufferRegenOfOldSamples = -200291

const DAQmxErrorGenStoppedToPreventRegenOfOldSamples = -200290

const DAQmxErrorSamplesNoLongerWriteable = -200289

const DAQmxErrorSamplesWillNeverBeGenerated = -200288

const DAQmxErrorNegativeWriteSampleNumber = -200287

const DAQmxErrorNoAcqStarted = -200286

const DAQmxErrorSamplesNotYetAvailable = -200284

const DAQmxErrorAcqStoppedToPreventIntermediateBufferOverflow = -200283

const DAQmxErrorNoRefTrigConfigured = -200282

const DAQmxErrorCannotReadRelativeToRefTrigUntilDone = -200281

const DAQmxErrorSamplesNoLongerAvailable = -200279

const DAQmxErrorSamplesWillNeverBeAvailable = -200278

const DAQmxErrorNegativeReadSampleNumber = -200277

const DAQmxErrorExternalSampClkAndRefClkThruSameTerm = -200276

const DAQmxErrorExtSampClkRateTooLowForClkIn = -200275

const DAQmxErrorExtSampClkRateTooHighForBackplane = -200274

const DAQmxErrorSampClkRateAndDivCombo = -200273

const DAQmxErrorSampClkRateTooLowForDivDown = -200272

const DAQmxErrorProductOfAOMinAndGainTooSmall = -200271

const DAQmxErrorInterpolationRateNotPossible = -200270

const DAQmxErrorOffsetTooLarge = -200269

const DAQmxErrorOffsetTooSmall = -200268

const DAQmxErrorProductOfAOMaxAndGainTooLarge = -200267

const DAQmxErrorMinAndMaxNotSymmetric = -200266

const DAQmxErrorInvalidAnalogTrigSrc = -200265

const DAQmxErrorTooManyChansForAnalogRefTrig = -200264

const DAQmxErrorTooManyChansForAnalogPauseTrig = -200263

const DAQmxErrorTrigWhenOnDemandSampTiming = -200262

const DAQmxErrorInconsistentAnalogTrigSettings = -200261

const DAQmxErrorMemMapDataXferModeSampTimingCombo = -200260

const DAQmxErrorInvalidJumperedAttr = -200259

const DAQmxErrorInvalidGainBasedOnMinMax = -200258

const DAQmxErrorInconsistentExcit = -200257

const DAQmxErrorTopologyNotSupportedByCfgTermBlock = -200256

const DAQmxErrorBuiltInTempSensorNotSupported = -200255

const DAQmxErrorInvalidTerm = -200254

const DAQmxErrorCannotTristateTerm = -200253

const DAQmxErrorCannotTristateBusyTerm = -200252

const DAQmxErrorNoDMAChansAvailable = -200251

const DAQmxErrorInvalidWaveformLengthWithinLoopInScript = -200250

const DAQmxErrorInvalidSubsetLengthWithinLoopInScript = -200249

const DAQmxErrorMarkerPosInvalidForLoopInScript = -200248

const DAQmxErrorIntegerExpectedInScript = -200247

const DAQmxErrorPLLBecameUnlocked = -200246

const DAQmxErrorPLLLock = -200245

const DAQmxErrorDDCClkOutDCMBecameUnlocked = -200244

const DAQmxErrorDDCClkOutDCMLock = -200243

const DAQmxErrorClkDoublerDCMBecameUnlocked = -200242

const DAQmxErrorClkDoublerDCMLock = -200241

const DAQmxErrorSampClkDCMBecameUnlocked = -200240

const DAQmxErrorSampClkDCMLock = -200239

const DAQmxErrorSampClkTimebaseDCMBecameUnlocked = -200238

const DAQmxErrorSampClkTimebaseDCMLock = -200237

const DAQmxErrorAttrCannotBeReset = -200236

const DAQmxErrorExplanationNotFound = -200235

const DAQmxErrorWriteBufferTooSmall = -200234

const DAQmxErrorSpecifiedAttrNotValid = -200233

const DAQmxErrorAttrCannotBeRead = -200232

const DAQmxErrorAttrCannotBeSet = -200231

const DAQmxErrorNULLPtrForC_Api = -200230

const DAQmxErrorReadBufferTooSmall = -200229

const DAQmxErrorBufferTooSmallForString = -200228

const DAQmxErrorNoAvailTrigLinesOnDevice = -200227

const DAQmxErrorTrigBusLineNotAvail = -200226

const DAQmxErrorCouldNotReserveRequestedTrigLine = -200225

const DAQmxErrorTrigLineNotFound = -200224

const DAQmxErrorSCXI1126ThreshHystCombination = -200223

const DAQmxErrorAcqStoppedToPreventInputBufferOverwrite = -200222

const DAQmxErrorTimeoutExceeded = -200221

const DAQmxErrorInvalidDeviceID = -200220

const DAQmxErrorInvalidAOChanOrder = -200219

const DAQmxErrorSampleTimingTypeAndDataXferMode = -200218

const DAQmxErrorBufferWithOnDemandSampTiming = -200217

const DAQmxErrorBufferAndDataXferMode = -200216

const DAQmxErrorMemMapAndBuffer = -200215

const DAQmxErrorNoAnalogTrigHW = -200214

const DAQmxErrorTooManyPretrigPlusMinPostTrigSamps = -200213

const DAQmxErrorInconsistentUnitsSpecified = -200212

const DAQmxErrorMultipleRelaysForSingleRelayOp = -200211

const DAQmxErrorMultipleDevIDsPerChassisSpecifiedInList = -200210

const DAQmxErrorDuplicateDevIDInList = -200209

const DAQmxErrorInvalidRangeStatementCharInList = -200208

const DAQmxErrorInvalidDeviceIDInList = -200207

const DAQmxErrorTriggerPolarityConflict = -200206

const DAQmxErrorCannotScanWithCurrentTopology = -200205

const DAQmxErrorUnexpectedIdentifierInFullySpecifiedPathInList = -200204

const DAQmxErrorSwitchCannotDriveMultipleTrigLines = -200203

const DAQmxErrorInvalidRelayName = -200202

const DAQmxErrorSwitchScanlistTooBig = -200201

const DAQmxErrorSwitchChanInUse = -200200

const DAQmxErrorSwitchNotResetBeforeScan = -200199

const DAQmxErrorInvalidTopology = -200198

const DAQmxErrorAttrNotSupported = -200197

const DAQmxErrorUnexpectedEndOfActionsInList = -200196

const DAQmxErrorPowerLimitExceeded = -200195

const DAQmxErrorHWUnexpectedlyPoweredOffAndOn = -200194

const DAQmxErrorSwitchOperationNotSupported = -200193

const DAQmxErrorOnlyContinuousScanSupported = -200192

const DAQmxErrorSwitchDifferentTopologyWhenScanning = -200191

const DAQmxErrorDisconnectPathNotSameAsExistingPath = -200190

const DAQmxErrorConnectionNotPermittedOnChanReservedForRouting = -200189

const DAQmxErrorCannotConnectSrcChans = -200188

const DAQmxErrorCannotConnectChannelToItself = -200187

const DAQmxErrorChannelNotReservedForRouting = -200186

const DAQmxErrorCannotConnectChansDirectly = -200185

const DAQmxErrorChansAlreadyConnected = -200184

const DAQmxErrorChanDuplicatedInPath = -200183

const DAQmxErrorNoPathToDisconnect = -200182

const DAQmxErrorInvalidSwitchChan = -200181

const DAQmxErrorNoPathAvailableBetween2SwitchChans = -200180

const DAQmxErrorExplicitConnectionExists = -200179

const DAQmxErrorSwitchDifferentSettlingTimeWhenScanning = -200178

const DAQmxErrorOperationOnlyPermittedWhileScanning = -200177

const DAQmxErrorOperationNotPermittedWhileScanning = -200176

const DAQmxErrorHardwareNotResponding = -200175

const DAQmxErrorInvalidSampAndMasterTimebaseRateCombo = -200173

const DAQmxErrorNonZeroBufferSizeInProgIOXfer = -200172

const DAQmxErrorVirtualChanNameUsed = -200171

const DAQmxErrorPhysicalChanDoesNotExist = -200170

const DAQmxErrorMemMapOnlyForProgIOXfer = -200169

const DAQmxErrorTooManyChans = -200168

const DAQmxErrorCannotHaveCJTempWithOtherChans = -200167

const DAQmxErrorOutputBufferUnderwrite = -200166

const DAQmxErrorSensorInvalidCompletionResistance = -200163

const DAQmxErrorVoltageExcitIncompatibleWith2WireCfg = -200162

const DAQmxErrorIntExcitSrcNotAvailable = -200161

const DAQmxErrorCannotCreateChannelAfterTaskVerified = -200160

const DAQmxErrorLinesReservedForSCXIControl = -200159

const DAQmxErrorCouldNotReserveLinesForSCXIControl = -200158

const DAQmxErrorCalibrationFailed = -200157

const DAQmxErrorReferenceFrequencyInvalid = -200156

const DAQmxErrorReferenceResistanceInvalid = -200155

const DAQmxErrorReferenceCurrentInvalid = -200154

const DAQmxErrorReferenceVoltageInvalid = -200153

const DAQmxErrorEEPROMDataInvalid = -200152

const DAQmxErrorCabledModuleNotCapableOfRoutingAI = -200151

const DAQmxErrorChannelNotAvailableInParallelMode = -200150

const DAQmxErrorExternalTimebaseRateNotKnownForDelay = -200149

const DAQmxErrorFREQOUTCannotProduceDesiredFrequency = -200148

const DAQmxErrorMultipleCounterInputTask = -200147

const DAQmxErrorCounterStartPauseTriggerConflict = -200146

const DAQmxErrorCounterInputPauseTriggerAndSampleClockInvalid = -200145

const DAQmxErrorCounterOutputPauseTriggerInvalid = -200144

const DAQmxErrorCounterTimebaseRateNotSpecified = -200143

const DAQmxErrorCounterTimebaseRateNotFound = -200142

const DAQmxErrorCounterOverflow = -200141

const DAQmxErrorCounterNoTimebaseEdgesBetweenGates = -200140

const DAQmxErrorCounterMaxMinRangeFreq = -200139

const DAQmxErrorCounterMaxMinRangeTime = -200138

const DAQmxErrorSuitableTimebaseNotFoundTimeCombo = -200137

const DAQmxErrorSuitableTimebaseNotFoundFrequencyCombo = -200136

const DAQmxErrorInternalTimebaseSourceDivisorCombo = -200135

const DAQmxErrorInternalTimebaseSourceRateCombo = -200134

const DAQmxErrorInternalTimebaseRateDivisorSourceCombo = -200133

const DAQmxErrorExternalTimebaseRateNotknownForRate = -200132

const DAQmxErrorAnalogTrigChanNotFirstInScanList = -200131

const DAQmxErrorNoDivisorForExternalSignal = -200130

const DAQmxErrorAttributeInconsistentAcrossRepeatedPhysicalChannels = -200128

const DAQmxErrorCannotHandshakeWithPort0 = -200127

const DAQmxErrorControlLineConflictOnPortC = -200126

const DAQmxErrorLines4To7ConfiguredForOutput = -200125

const DAQmxErrorLines4To7ConfiguredForInput = -200124

const DAQmxErrorLines0To3ConfiguredForOutput = -200123

const DAQmxErrorLines0To3ConfiguredForInput = -200122

const DAQmxErrorPortConfiguredForOutput = -200121

const DAQmxErrorPortConfiguredForInput = -200120

const DAQmxErrorPortConfiguredForStaticDigitalOps = -200119

const DAQmxErrorPortReservedForHandshaking = -200118

const DAQmxErrorPortDoesNotSupportHandshakingDataIO = -200117

const DAQmxErrorCannotTristate8255OutputLines = -200116

const DAQmxErrorTemperatureOutOfRangeForCalibration = -200113

const DAQmxErrorCalibrationHandleInvalid = -200112

const DAQmxErrorPasswordRequired = -200111

const DAQmxErrorIncorrectPassword = -200110

const DAQmxErrorPasswordTooLong = -200109

const DAQmxErrorCalibrationSessionAlreadyOpen = -200108

const DAQmxErrorSCXIModuleIncorrect = -200107

const DAQmxErrorAttributeInconsistentAcrossChannelsOnDevice = -200106

const DAQmxErrorSCXI1122ResistanceChanNotSupportedForCfg = -200105

const DAQmxErrorBracketPairingMismatchInList = -200104

const DAQmxErrorInconsistentNumSamplesToWrite = -200103

const DAQmxErrorIncorrectDigitalPattern = -200102

const DAQmxErrorIncorrectNumChannelsToWrite = -200101

const DAQmxErrorIncorrectReadFunction = -200100

const DAQmxErrorPhysicalChannelNotSpecified = -200099

const DAQmxErrorMoreThanOneTerminal = -200098

const DAQmxErrorMoreThanOneActiveChannelSpecified = -200097

const DAQmxErrorInvalidNumberSamplesToRead = -200096

const DAQmxErrorAnalogWaveformExpected = -200095

const DAQmxErrorDigitalWaveformExpected = -200094

const DAQmxErrorActiveChannelNotSpecified = -200093

const DAQmxErrorFunctionNotSupportedForDeviceTasks = -200092

const DAQmxErrorFunctionNotInLibrary = -200091

const DAQmxErrorLibraryNotPresent = -200090

const DAQmxErrorDuplicateTask = -200089

const DAQmxErrorInvalidTask = -200088

const DAQmxErrorInvalidChannel = -200087

const DAQmxErrorInvalidSyntaxForPhysicalChannelRange = -200086

const DAQmxErrorMinNotLessThanMax = -200082

const DAQmxErrorSampleRateNumChansConvertPeriodCombo = -200081

const DAQmxErrorAODuringCounter1DMAConflict = -200079

const DAQmxErrorAIDuringCounter0DMAConflict = -200078

const DAQmxErrorInvalidAttributeValue = -200077

const DAQmxErrorSuppliedCurrentDataOutsideSpecifiedRange = -200076

const DAQmxErrorSuppliedVoltageDataOutsideSpecifiedRange = -200075

const DAQmxErrorCannotStoreCalConst = -200074

const DAQmxErrorSCXIModuleNotFound = -200073

const DAQmxErrorDuplicatePhysicalChansNotSupported = -200072

const DAQmxErrorTooManyPhysicalChansInList = -200071

const DAQmxErrorInvalidAdvanceEventTriggerType = -200070

const DAQmxErrorDeviceIsNotAValidSwitch = -200069

const DAQmxErrorDeviceDoesNotSupportScanning = -200068

const DAQmxErrorScanListCannotBeTimed = -200067

const DAQmxErrorConnectOperatorInvalidAtPointInList = -200066

const DAQmxErrorUnexpectedSwitchActionInList = -200065

const DAQmxErrorUnexpectedSeparatorInList = -200064

const DAQmxErrorExpectedTerminatorInList = -200063

const DAQmxErrorExpectedConnectOperatorInList = -200062

const DAQmxErrorExpectedSeparatorInList = -200061

const DAQmxErrorFullySpecifiedPathInListContainsRange = -200060

const DAQmxErrorConnectionSeparatorAtEndOfList = -200059

const DAQmxErrorIdentifierInListTooLong = -200058

const DAQmxErrorDuplicateDeviceIDInListWhenSettling = -200057

const DAQmxErrorChannelNameNotSpecifiedInList = -200056

const DAQmxErrorDeviceIDNotSpecifiedInList = -200055

const DAQmxErrorSemicolonDoesNotFollowRangeInList = -200054

const DAQmxErrorSwitchActionInListSpansMultipleDevices = -200053

const DAQmxErrorRangeWithoutAConnectActionInList = -200052

const DAQmxErrorInvalidIdentifierFollowingSeparatorInList = -200051

const DAQmxErrorInvalidChannelNameInList = -200050

const DAQmxErrorInvalidNumberInRepeatStatementInList = -200049

const DAQmxErrorInvalidTriggerLineInList = -200048

const DAQmxErrorInvalidIdentifierInListFollowingDeviceID = -200047

const DAQmxErrorInvalidIdentifierInListAtEndOfSwitchAction = -200046

const DAQmxErrorDeviceRemoved = -200045

const DAQmxErrorRoutingPathNotAvailable = -200044

const DAQmxErrorRoutingHardwareBusy = -200043

const DAQmxErrorRequestedSignalInversionForRoutingNotPossible = -200042

const DAQmxErrorInvalidRoutingDestinationTerminalName = -200041

const DAQmxErrorInvalidRoutingSourceTerminalName = -200040

const DAQmxErrorRoutingNotSupportedForDevice = -200039

const DAQmxErrorWaitIsLastInstructionOfLoopInScript = -200038

const DAQmxErrorClearIsLastInstructionOfLoopInScript = -200037

const DAQmxErrorInvalidLoopIterationsInScript = -200036

const DAQmxErrorRepeatLoopNestingTooDeepInScript = -200035

const DAQmxErrorMarkerPositionOutsideSubsetInScript = -200034

const DAQmxErrorSubsetStartOffsetNotAlignedInScript = -200033

const DAQmxErrorInvalidSubsetLengthInScript = -200032

const DAQmxErrorMarkerPositionNotAlignedInScript = -200031

const DAQmxErrorSubsetOutsideWaveformInScript = -200030

const DAQmxErrorMarkerOutsideWaveformInScript = -200029

const DAQmxErrorWaveformInScriptNotInMem = -200028

const DAQmxErrorKeywordExpectedInScript = -200027

const DAQmxErrorBufferNameExpectedInScript = -200026

const DAQmxErrorProcedureNameExpectedInScript = -200025

const DAQmxErrorScriptHasInvalidIdentifier = -200024

const DAQmxErrorScriptHasInvalidCharacter = -200023

const DAQmxErrorResourceAlreadyReserved = -200022

const DAQmxErrorSelfTestFailed = -200020

const DAQmxErrorADCOverrun = -200019

const DAQmxErrorDACUnderflow = -200018

const DAQmxErrorInputFIFOUnderflow = -200017

const DAQmxErrorOutputFIFOUnderflow = -200016

const DAQmxErrorSCXISerialCommunication = -200015

const DAQmxErrorDigitalTerminalSpecifiedMoreThanOnce = -200014

const DAQmxErrorDigitalOutputNotSupported = -200012

const DAQmxErrorInconsistentChannelDirections = -200011

const DAQmxErrorInputFIFOOverflow = -200010

const DAQmxErrorTimeStampOverwritten = -200009

const DAQmxErrorStopTriggerHasNotOccurred = -200008

const DAQmxErrorRecordNotAvailable = -200007

const DAQmxErrorRecordOverwritten = -200006

const DAQmxErrorDataNotAvailable = -200005

const DAQmxErrorDataOverwrittenInDeviceMemory = -200004

const DAQmxErrorDuplicatedChannel = -200003

const DAQmxWarningTimestampCounterRolledOver = 200003

const DAQmxWarningInputTerminationOverloaded = 200004

const DAQmxWarningADCOverloaded = 200005

const DAQmxWarningPLLUnlocked = 200007

const DAQmxWarningCounter0DMADuringAIConflict = 200008

const DAQmxWarningCounter1DMADuringAOConflict = 200009

const DAQmxWarningStoppedBeforeDone = 200010

const DAQmxWarningRateViolatesSettlingTime = 200011

const DAQmxWarningRateViolatesMaxADCRate = 200012

const DAQmxWarningUserDefInfoStringTooLong = 200013

const DAQmxWarningTooManyInterruptsPerSecond = 200014

const DAQmxWarningPotentialGlitchDuringWrite = 200015

const DAQmxWarningDevNotSelfCalibratedWithDAQmx = 200016

const DAQmxWarningAISampRateTooLow = 200017

const DAQmxWarningAIConvRateTooLow = 200018

const DAQmxWarningReadOffsetCoercion = 200019

const DAQmxWarningPretrigCoercion = 200020

const DAQmxWarningSampValCoercedToMax = 200021

const DAQmxWarningSampValCoercedToMin = 200022

const DAQmxWarningPropertyVersionNew = 200024

const DAQmxWarningUserDefinedInfoTooLong = 200025

const DAQmxWarningCAPIStringTruncatedToFitBuffer = 200026

const DAQmxWarningSampClkRateTooLow = 200027

const DAQmxWarningPossiblyInvalidCTRSampsInFiniteDMAAcq = 200028

const DAQmxWarningRISAcqCompletedSomeBinsNotFilled = 200029

const DAQmxWarningPXIDevTempExceedsMaxOpTemp = 200030

const DAQmxWarningOutputGainTooLowForRFFreq = 200031

const DAQmxWarningOutputGainTooHighForRFFreq = 200032

const DAQmxWarningMultipleWritesBetweenSampClks = 200033

const DAQmxWarningDeviceMayShutDownDueToHighTemp = 200034

const DAQmxWarningRateViolatesMinADCRate = 200035

const DAQmxWarningSampClkRateAboveDevSpecs = 200036

const DAQmxWarningCOPrevDAQmxWriteSettingsOverwrittenForHWTimedSinglePoint = 200037

const DAQmxWarningLowpassFilterSettlingTimeExceedsUserTimeBetween2ADCConversions = 200038

const DAQmxWarningLowpassFilterSettlingTimeExceedsDriverTimeBetween2ADCConversions = 200039

const DAQmxWarningSampClkRateViolatesSettlingTimeForGen = 200040

const DAQmxWarningInvalidCalConstValueForAI = 200041

const DAQmxWarningInvalidCalConstValueForAO = 200042

const DAQmxWarningChanCalExpired = 200043

const DAQmxWarningUnrecognizedEnumValueEncounteredInStorage = 200044

const DAQmxWarningTableCRCNotCorrect = 200045

const DAQmxWarningExternalCRCNotCorrect = 200046

const DAQmxWarningSelfCalCRCNotCorrect = 200047

const DAQmxWarningDeviceSpecExceeded = 200048

const DAQmxWarningOnlyGainCalibrated = 200049

const DAQmxWarningReversePowerProtectionActivated = 200050

const DAQmxWarningOverVoltageProtectionActivated = 200051

const DAQmxWarningBufferSizeNotMultipleOfSectorSize = 200052

const DAQmxWarningSampleRateMayCauseAcqToFail = 200053

const DAQmxWarningUserAreaCRCNotCorrect = 200054

const DAQmxWarningPowerUpInfoCRCNotCorrect = 200055

const DAQmxWarningConnectionCountHasExceededRecommendedLimit = 200056

const DAQmxWarningNetworkDeviceAlreadyAdded = 200057

const DAQmxWarningAccessoryConnectionCountIsInvalid = 200058

const DAQmxWarningUnableToDisconnectPorts = 200059

const DAQmxWarningReadRepeatedData = 200060

const DAQmxWarningPXI5600_NotConfigured = 200061

const DAQmxWarningPXI5661_IncorrectlyConfigured = 200062

const DAQmxWarningPXIe5601_NotConfigured = 200063

const DAQmxWarningPXIe5663_IncorrectlyConfigured = 200064

const DAQmxWarningPXIe5663E_IncorrectlyConfigured = 200065

const DAQmxWarningPXIe5603_NotConfigured = 200066

const DAQmxWarningPXIe5665_5603_IncorrectlyConfigured = 200067

const DAQmxWarningPXIe5667_5603_IncorrectlyConfigured = 200068

const DAQmxWarningPXIe5605_NotConfigured = 200069

const DAQmxWarningPXIe5665_5605_IncorrectlyConfigured = 200070

const DAQmxWarningPXIe5667_5605_IncorrectlyConfigured = 200071

const DAQmxWarningPXIe5606_NotConfigured = 200072

const DAQmxWarningPXIe5665_5606_IncorrectlyConfigured = 200073

const DAQmxWarningPXI5610_NotConfigured = 200074

const DAQmxWarningPXI5610_IncorrectlyConfigured = 200075

const DAQmxWarningPXIe5611_NotConfigured = 200076

const DAQmxWarningPXIe5611_IncorrectlyConfigured = 200077

const DAQmxWarningUSBHotfixForDAQ = 200078

const DAQmxWarningNoChangeSupersededByIdleBehavior = 200079

const DAQmxWarningReadNotCompleteBeforeSampClk = 209800

const DAQmxWarningWriteNotCompleteBeforeSampClk = 209801

const DAQmxWarningWaitForNextSampClkDetectedMissedSampClk = 209802

const DAQmxWarningOutputDataTransferConditionNotSupported = 209803

const DAQmxWarningTimestampMayBeInvalid = 209804

const DAQmxWarningFirstSampleTimestampInaccurate = 209805

const DAQmxErrorInterfaceObsoleted_Routing = -89169

const DAQmxErrorRoCoServiceNotAvailable_Routing = -89168

const DAQmxErrorRoutingDestTermPXIDStarXNotInSystemTimingSlot_Routing = -89167

const DAQmxErrorRoutingSrcTermPXIDStarXNotInSystemTimingSlot_Routing = -89166

const DAQmxErrorRoutingSrcTermPXIDStarInNonDStarTriggerSlot_Routing = -89165

const DAQmxErrorRoutingDestTermPXIDStarInNonDStarTriggerSlot_Routing = -89164

const DAQmxErrorRoutingDestTermPXIClk10InNotInStarTriggerSlot_Routing = -89162

const DAQmxErrorRoutingDestTermPXIClk10InNotInSystemTimingSlot_Routing = -89161

const DAQmxErrorRoutingDestTermPXIStarXNotInStarTriggerSlot_Routing = -89160

const DAQmxErrorRoutingDestTermPXIStarXNotInSystemTimingSlot_Routing = -89159

const DAQmxErrorRoutingSrcTermPXIStarXNotInStarTriggerSlot_Routing = -89158

const DAQmxErrorRoutingSrcTermPXIStarXNotInSystemTimingSlot_Routing = -89157

const DAQmxErrorRoutingSrcTermPXIStarInNonStarTriggerSlot_Routing = -89156

const DAQmxErrorRoutingDestTermPXIStarInNonStarTriggerSlot_Routing = -89155

const DAQmxErrorRoutingDestTermPXIStarInStarTriggerSlot_Routing = -89154

const DAQmxErrorRoutingDestTermPXIStarInSystemTimingSlot_Routing = -89153

const DAQmxErrorRoutingSrcTermPXIStarInStarTriggerSlot_Routing = -89152

const DAQmxErrorRoutingSrcTermPXIStarInSystemTimingSlot_Routing = -89151

const DAQmxErrorInvalidSignalModifier_Routing = -89150

const DAQmxErrorRoutingDestTermPXIClk10InNotInSlot2_Routing = -89149

const DAQmxErrorRoutingDestTermPXIStarXNotInSlot2_Routing = -89148

const DAQmxErrorRoutingSrcTermPXIStarXNotInSlot2_Routing = -89147

const DAQmxErrorRoutingSrcTermPXIStarInSlot16AndAbove_Routing = -89146

const DAQmxErrorRoutingDestTermPXIStarInSlot16AndAbove_Routing = -89145

const DAQmxErrorRoutingDestTermPXIStarInSlot2_Routing = -89144

const DAQmxErrorRoutingSrcTermPXIStarInSlot2_Routing = -89143

const DAQmxErrorRoutingDestTermPXIChassisNotIdentified_Routing = -89142

const DAQmxErrorRoutingSrcTermPXIChassisNotIdentified_Routing = -89141

const DAQmxErrorTrigLineNotFoundSingleDevRoute_Routing = -89140

const DAQmxErrorNoCommonTrigLineForRoute_Routing = -89139

const DAQmxErrorResourcesInUseForRouteInTask_Routing = -89138

const DAQmxErrorResourcesInUseForRoute_Routing = -89137

const DAQmxErrorRouteNotSupportedByHW_Routing = -89136

const DAQmxErrorResourcesInUseForInversionInTask_Routing = -89135

const DAQmxErrorResourcesInUseForInversion_Routing = -89134

const DAQmxErrorInversionNotSupportedByHW_Routing = -89133

const DAQmxErrorResourcesInUseForProperty_Routing = -89132

const DAQmxErrorRouteSrcAndDestSame_Routing = -89131

const DAQmxErrorDevAbsentOrUnavailable_Routing = -89130

const DAQmxErrorInvalidTerm_Routing = -89129

const DAQmxErrorCannotTristateTerm_Routing = -89128

const DAQmxErrorCannotTristateBusyTerm_Routing = -89127

const DAQmxErrorCouldNotReserveRequestedTrigLine_Routing = -89126

const DAQmxErrorTrigLineNotFound_Routing = -89125

const DAQmxErrorRoutingPathNotAvailable_Routing = -89124

const DAQmxErrorRoutingHardwareBusy_Routing = -89123

const DAQmxErrorRequestedSignalInversionForRoutingNotPossible_Routing = -89122

const DAQmxErrorInvalidRoutingDestinationTerminalName_Routing = -89121

const DAQmxErrorInvalidRoutingSourceTerminalName_Routing = -89120

const DAQmxErrorServiceLocatorNotAvailable_Routing = -88907

const DAQmxErrorCouldNotConnectToServer_Routing = -88900

const DAQmxErrorDeviceNameContainsSpacesOrPunctuation_Routing = -88720

const DAQmxErrorDeviceNameContainsNonprintableCharacters_Routing = -88719

const DAQmxErrorDeviceNameIsEmpty_Routing = -88718

const DAQmxErrorDeviceNameNotFound_Routing = -88717

const DAQmxErrorLocalRemoteDriverVersionMismatch_Routing = -88716

const DAQmxErrorDuplicateDeviceName_Routing = -88715

const DAQmxErrorRuntimeAborting_Routing = -88710

const DAQmxErrorRuntimeAborted_Routing = -88709

const DAQmxErrorResourceNotInPool_Routing = -88708

const DAQmxErrorDriverDeviceGUIDNotFound_Routing = -88705

const DAQmxErrorPALUSBTransactionError = -50808

const DAQmxErrorPALIsocStreamBufferError = -50807

const DAQmxErrorPALInvalidAddressComponent = -50806

const DAQmxErrorPALSharingViolation = -50805

const DAQmxErrorPALInvalidDeviceState = -50804

const DAQmxErrorPALConnectionReset = -50803

const DAQmxErrorPALConnectionAborted = -50802

const DAQmxErrorPALConnectionRefused = -50801

const DAQmxErrorPALBusResetOccurred = -50800

const DAQmxErrorPALWaitInterrupted = -50700

const DAQmxErrorPALMessageUnderflow = -50651

const DAQmxErrorPALMessageOverflow = -50650

const DAQmxErrorPALThreadAlreadyDead = -50604

const DAQmxErrorPALThreadStackSizeNotSupported = -50603

const DAQmxErrorPALThreadControllerIsNotThreadCreator = -50602

const DAQmxErrorPALThreadHasNoThreadObject = -50601

const DAQmxErrorPALThreadCouldNotRun = -50600

const DAQmxErrorPALSyncAbandoned = -50551

const DAQmxErrorPALSyncTimedOut = -50550

const DAQmxErrorPALReceiverSocketInvalid = -50503

const DAQmxErrorPALSocketListenerInvalid = -50502

const DAQmxErrorPALSocketListenerAlreadyRegistered = -50501

const DAQmxErrorPALDispatcherAlreadyExported = -50500

const DAQmxErrorPALDMALinkEventMissed = -50450

const DAQmxErrorPALBusError = -50413

const DAQmxErrorPALRetryLimitExceeded = -50412

const DAQmxErrorPALTransferOverread = -50411

const DAQmxErrorPALTransferOverwritten = -50410

const DAQmxErrorPALPhysicalBufferFull = -50409

const DAQmxErrorPALPhysicalBufferEmpty = -50408

const DAQmxErrorPALLogicalBufferFull = -50407

const DAQmxErrorPALLogicalBufferEmpty = -50406

const DAQmxErrorPALTransferAborted = -50405

const DAQmxErrorPALTransferStopped = -50404

const DAQmxErrorPALTransferInProgress = -50403

const DAQmxErrorPALTransferNotInProgress = -50402

const DAQmxErrorPALCommunicationsFault = -50401

const DAQmxErrorPALTransferTimedOut = -50400

const DAQmxErrorPALMemoryHeapNotEmpty = -50355

const DAQmxErrorPALMemoryBlockCheckFailed = -50354

const DAQmxErrorPALMemoryPageLockFailed = -50353

const DAQmxErrorPALMemoryFull = -50352

const DAQmxErrorPALMemoryAlignmentFault = -50351

const DAQmxErrorPALMemoryConfigurationFault = -50350

const DAQmxErrorPALDeviceInitializationFault = -50303

const DAQmxErrorPALDeviceNotSupported = -50302

const DAQmxErrorPALDeviceUnknown = -50301

const DAQmxErrorPALDeviceNotFound = -50300

const DAQmxErrorPALFeatureDisabled = -50265

const DAQmxErrorPALComponentBusy = -50264

const DAQmxErrorPALComponentAlreadyInstalled = -50263

const DAQmxErrorPALComponentNotUnloadable = -50262

const DAQmxErrorPALComponentNeverLoaded = -50261

const DAQmxErrorPALComponentAlreadyLoaded = -50260

const DAQmxErrorPALComponentCircularDependency = -50259

const DAQmxErrorPALComponentInitializationFault = -50258

const DAQmxErrorPALComponentImageCorrupt = -50257

const DAQmxErrorPALFeatureNotSupported = -50256

const DAQmxErrorPALFunctionNotFound = -50255

const DAQmxErrorPALFunctionObsolete = -50254

const DAQmxErrorPALComponentTooNew = -50253

const DAQmxErrorPALComponentTooOld = -50252

const DAQmxErrorPALComponentNotFound = -50251

const DAQmxErrorPALVersionMismatch = -50250

const DAQmxErrorPALFileFault = -50209

const DAQmxErrorPALFileWriteFault = -50208

const DAQmxErrorPALFileReadFault = -50207

const DAQmxErrorPALFileSeekFault = -50206

const DAQmxErrorPALFileCloseFault = -50205

const DAQmxErrorPALFileOpenFault = -50204

const DAQmxErrorPALDiskFull = -50203

const DAQmxErrorPALOSFault = -50202

const DAQmxErrorPALOSInitializationFault = -50201

const DAQmxErrorPALOSUnsupported = -50200

const DAQmxErrorPALCalculationOverflow = -50175

const DAQmxErrorPALHardwareFault = -50152

const DAQmxErrorPALFirmwareFault = -50151

const DAQmxErrorPALSoftwareFault = -50150

const DAQmxErrorPALMessageQueueFull = -50108

const DAQmxErrorPALResourceAmbiguous = -50107

const DAQmxErrorPALResourceBusy = -50106

const DAQmxErrorPALResourceInitialized = -50105

const DAQmxErrorPALResourceNotInitialized = -50104

const DAQmxErrorPALResourceReserved = -50103

const DAQmxErrorPALResourceNotReserved = -50102

const DAQmxErrorPALResourceNotAvailable = -50101

const DAQmxErrorPALResourceOwnedBySystem = -50100

const DAQmxErrorPALBadToken = -50020

const DAQmxErrorPALBadThreadMultitask = -50019

const DAQmxErrorPALBadLibrarySpecifier = -50018

const DAQmxErrorPALBadAddressSpace = -50017

const DAQmxErrorPALBadWindowType = -50016

const DAQmxErrorPALBadAddressClass = -50015

const DAQmxErrorPALBadWriteCount = -50014

const DAQmxErrorPALBadWriteOffset = -50013

const DAQmxErrorPALBadWriteMode = -50012

const DAQmxErrorPALBadReadCount = -50011

const DAQmxErrorPALBadReadOffset = -50010

const DAQmxErrorPALBadReadMode = -50009

const DAQmxErrorPALBadCount = -50008

const DAQmxErrorPALBadOffset = -50007

const DAQmxErrorPALBadMode = -50006

const DAQmxErrorPALBadDataSize = -50005

const DAQmxErrorPALBadPointer = -50004

const DAQmxErrorPALBadSelector = -50003

const DAQmxErrorPALBadDevice = -50002

const DAQmxErrorPALIrrelevantAttribute = -50001

const DAQmxErrorPALValueConflict = -50000

const DAQmxWarningPALValueConflict = 50000

const DAQmxWarningPALIrrelevantAttribute = 50001

const DAQmxWarningPALBadDevice = 50002

const DAQmxWarningPALBadSelector = 50003

const DAQmxWarningPALBadPointer = 50004

const DAQmxWarningPALBadDataSize = 50005

const DAQmxWarningPALBadMode = 50006

const DAQmxWarningPALBadOffset = 50007

const DAQmxWarningPALBadCount = 50008

const DAQmxWarningPALBadReadMode = 50009

const DAQmxWarningPALBadReadOffset = 50010

const DAQmxWarningPALBadReadCount = 50011

const DAQmxWarningPALBadWriteMode = 50012

const DAQmxWarningPALBadWriteOffset = 50013

const DAQmxWarningPALBadWriteCount = 50014

const DAQmxWarningPALBadAddressClass = 50015

const DAQmxWarningPALBadWindowType = 50016

const DAQmxWarningPALBadThreadMultitask = 50019

const DAQmxWarningPALResourceOwnedBySystem = 50100

const DAQmxWarningPALResourceNotAvailable = 50101

const DAQmxWarningPALResourceNotReserved = 50102

const DAQmxWarningPALResourceReserved = 50103

const DAQmxWarningPALResourceNotInitialized = 50104

const DAQmxWarningPALResourceInitialized = 50105

const DAQmxWarningPALResourceBusy = 50106

const DAQmxWarningPALResourceAmbiguous = 50107

const DAQmxWarningPALFirmwareFault = 50151

const DAQmxWarningPALHardwareFault = 50152

const DAQmxWarningPALOSUnsupported = 50200

const DAQmxWarningPALOSFault = 50202

const DAQmxWarningPALFunctionObsolete = 50254

const DAQmxWarningPALFunctionNotFound = 50255

const DAQmxWarningPALFeatureNotSupported = 50256

const DAQmxWarningPALComponentInitializationFault = 50258

const DAQmxWarningPALComponentAlreadyLoaded = 50260

const DAQmxWarningPALComponentNotUnloadable = 50262

const DAQmxWarningPALMemoryAlignmentFault = 50351

const DAQmxWarningPALMemoryHeapNotEmpty = 50355

const DAQmxWarningPALTransferNotInProgress = 50402

const DAQmxWarningPALTransferInProgress = 50403

const DAQmxWarningPALTransferStopped = 50404

const DAQmxWarningPALTransferAborted = 50405

const DAQmxWarningPALLogicalBufferEmpty = 50406

const DAQmxWarningPALLogicalBufferFull = 50407

const DAQmxWarningPALPhysicalBufferEmpty = 50408

const DAQmxWarningPALPhysicalBufferFull = 50409

const DAQmxWarningPALTransferOverwritten = 50410

const DAQmxWarningPALTransferOverread = 50411

const DAQmxWarningPALDispatcherAlreadyExported = 50500

const DAQmxWarningPALSyncAbandoned = 50551

