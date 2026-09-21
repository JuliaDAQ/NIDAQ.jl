function DAQmxLoadTask(taskName, taskHandle)
    ccall((:DAQmxLoadTask, NIDAQmx), int32, (Ptr{Cchar}, Ptr{TaskHandle}), taskName, taskHandle)
end

function DAQmxCreateTask(taskName, taskHandle)
    ccall((:DAQmxCreateTask, NIDAQmx), int32, (Ptr{Cchar}, Ptr{TaskHandle}), taskName, taskHandle)
end

function DAQmxAddGlobalChansToTask(taskHandle, channelNames)
    ccall((:DAQmxAddGlobalChansToTask, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channelNames)
end

function DAQmxStartTask(taskHandle)
    ccall((:DAQmxStartTask, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxStopTask(taskHandle)
    ccall((:DAQmxStopTask, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxClearTask(taskHandle)
    ccall((:DAQmxClearTask, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxWaitUntilTaskDone(taskHandle, timeToWait)
    ccall((:DAQmxWaitUntilTaskDone, NIDAQmx), int32, (TaskHandle, float64), taskHandle, timeToWait)
end

function DAQmxWaitForValidTimestamp(taskHandle, timestampEvent, timeout, timestamp)
    ccall((:DAQmxWaitForValidTimestamp, NIDAQmx), int32, (TaskHandle, int32, float64, Ptr{CVIAbsoluteTime}), taskHandle, timestampEvent, timeout, timestamp)
end

function DAQmxIsTaskDone(taskHandle, isTaskDone)
    ccall((:DAQmxIsTaskDone, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, isTaskDone)
end

function DAQmxTaskControl(taskHandle, action)
    ccall((:DAQmxTaskControl, NIDAQmx), int32, (TaskHandle, int32), taskHandle, action)
end

function DAQmxGetNthTaskChannel(taskHandle, index, buffer, bufferSize)
    ccall((:DAQmxGetNthTaskChannel, NIDAQmx), int32, (TaskHandle, uInt32, Ptr{Cchar}, int32), taskHandle, index, buffer, bufferSize)
end

function DAQmxGetNthTaskDevice(taskHandle, index, buffer, bufferSize)
    ccall((:DAQmxGetNthTaskDevice, NIDAQmx), int32, (TaskHandle, uInt32, Ptr{Cchar}, int32), taskHandle, index, buffer, bufferSize)
end

function DAQmxRegisterEveryNSamplesEvent(task, everyNsamplesEventType, nSamples, options, callbackFunction, callbackData)
    ccall((:DAQmxRegisterEveryNSamplesEvent, NIDAQmx), int32, (TaskHandle, int32, uInt32, uInt32, DAQmxEveryNSamplesEventCallbackPtr, Ptr{Cvoid}), task, everyNsamplesEventType, nSamples, options, callbackFunction, callbackData)
end

function DAQmxRegisterDoneEvent(task, options, callbackFunction, callbackData)
    ccall((:DAQmxRegisterDoneEvent, NIDAQmx), int32, (TaskHandle, uInt32, DAQmxDoneEventCallbackPtr, Ptr{Cvoid}), task, options, callbackFunction, callbackData)
end

function DAQmxRegisterSignalEvent(task, signalID, options, callbackFunction, callbackData)
    ccall((:DAQmxRegisterSignalEvent, NIDAQmx), int32, (TaskHandle, int32, uInt32, DAQmxSignalEventCallbackPtr, Ptr{Cvoid}), task, signalID, options, callbackFunction, callbackData)
end

function DAQmxCreateAIVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAIVoltageChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAICurrentChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    ccall((:DAQmxCreateAICurrentChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function DAQmxCreateAIVoltageRMSChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAIVoltageRMSChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAICurrentRMSChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    ccall((:DAQmxCreateAICurrentRMSChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function DAQmxCreateAIThrmcplChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thermocoupleType, cjcSource, cjcVal, cjcChannel)
    ccall((:DAQmxCreateAIThrmcplChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thermocoupleType, cjcSource, cjcVal, cjcChannel)
end

function DAQmxCreateAIRTDChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, rtdType, resistanceConfig, currentExcitSource, currentExcitVal, r0)
    ccall((:DAQmxCreateAIRTDChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, int32, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, rtdType, resistanceConfig, currentExcitSource, currentExcitVal, r0)
end

function DAQmxCreateAIThrmstrChanIex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, a, b, c)
    ccall((:DAQmxCreateAIThrmstrChanIex, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, a, b, c)
end

function DAQmxCreateAIThrmstrChanVex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, a, b, c, r1)
    ccall((:DAQmxCreateAIThrmstrChanVex, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, float64, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, a, b, c, r1)
end

function DAQmxCreateAIFreqVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thresholdLevel, hysteresis, customScaleName)
    ccall((:DAQmxCreateAIFreqVoltageChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, float64, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thresholdLevel, hysteresis, customScaleName)
end

function DAQmxCreateAIResistanceChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIResistanceChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIStrainGageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, initialBridgeVoltage, nominalGageResistance, poissonRatio, leadWireResistance, customScaleName)
    ccall((:DAQmxCreateAIStrainGageChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, float64, float64, float64, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, initialBridgeVoltage, nominalGageResistance, poissonRatio, leadWireResistance, customScaleName)
end

function DAQmxCreateAIRosetteStrainGageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, rosetteType, gageOrientation, rosetteMeasTypes, numRosetteMeasTypes, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, nominalGageResistance, poissonRatio, leadWireResistance)
    ccall((:DAQmxCreateAIRosetteStrainGageChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, float64, Ptr{int32}, uInt32, int32, int32, float64, float64, float64, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, rosetteType, gageOrientation, rosetteMeasTypes, numRosetteMeasTypes, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, nominalGageResistance, poissonRatio, leadWireResistance)
end

function DAQmxCreateAIForceBridgeTwoPointLinChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIForceBridgeTwoPointLinChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, float64, float64, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function DAQmxCreateAIForceBridgeTableChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIForceBridgeTableChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, int32, Ptr{float64}, uInt32, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function DAQmxCreateAIForceBridgePolynomialChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIForceBridgePolynomialChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function DAQmxCreateAIPressureBridgeTwoPointLinChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIPressureBridgeTwoPointLinChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, float64, float64, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function DAQmxCreateAIPressureBridgeTableChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIPressureBridgeTableChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, int32, Ptr{float64}, uInt32, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function DAQmxCreateAIPressureBridgePolynomialChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIPressureBridgePolynomialChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function DAQmxCreateAITorqueBridgeTwoPointLinChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAITorqueBridgeTwoPointLinChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, float64, float64, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function DAQmxCreateAITorqueBridgeTableChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAITorqueBridgeTableChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, int32, Ptr{float64}, uInt32, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function DAQmxCreateAITorqueBridgePolynomialChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAITorqueBridgePolynomialChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function DAQmxCreateAIBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, customScaleName)
    ccall((:DAQmxCreateAIBridgeChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, customScaleName)
end

function DAQmxCreateAIVoltageChanWithExcit(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
    ccall((:DAQmxCreateAIVoltageChanWithExcit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, int32, int32, float64, bool32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function DAQmxCreateAITempBuiltInSensorChan(taskHandle, physicalChannel, nameToAssignToChannel, units)
    ccall((:DAQmxCreateAITempBuiltInSensorChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function DAQmxCreateAIAccelChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIAccelChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIVelocityIEPEChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIVelocityIEPEChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIForceIEPEChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIForceIEPEChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIMicrophoneChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, micSensitivity, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIMicrophoneChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, int32, float64, float64, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, micSensitivity, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIChargeChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAIChargeChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAIAccelChargeChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
    ccall((:DAQmxCreateAIAccelChargeChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function DAQmxCreateAIAccel4WireDCVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
    ccall((:DAQmxCreateAIAccel4WireDCVoltageChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, float64, int32, int32, float64, bool32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function DAQmxCreateAIPosLVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    ccall((:DAQmxCreateAIPosLVDTChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, float64, int32, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function DAQmxCreateAIPosRVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    ccall((:DAQmxCreateAIPosRVDTChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, float64, int32, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function DAQmxCreateAIPosEddyCurrProxProbeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
    ccall((:DAQmxCreateAIPosEddyCurrProxProbeChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function DAQmxCreateAIDeviceTempChan(taskHandle, physicalChannel, nameToAssignToChannel, units)
    ccall((:DAQmxCreateAIDeviceTempChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function DAQmxCreateTEDSAIVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateTEDSAIVoltageChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateTEDSAICurrentChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    ccall((:DAQmxCreateTEDSAICurrentChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function DAQmxCreateTEDSAIThrmcplChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, cjcSource, cjcVal, cjcChannel)
    ccall((:DAQmxCreateTEDSAIThrmcplChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, cjcSource, cjcVal, cjcChannel)
end

function DAQmxCreateTEDSAIRTDChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
    ccall((:DAQmxCreateTEDSAIRTDChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function DAQmxCreateTEDSAIThrmstrChanIex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
    ccall((:DAQmxCreateTEDSAIThrmstrChanIex, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function DAQmxCreateTEDSAIThrmstrChanVex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, r1)
    ccall((:DAQmxCreateTEDSAIThrmstrChanVex, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, r1)
end

function DAQmxCreateTEDSAIResistanceChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIResistanceChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIStrainGageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, initialBridgeVoltage, leadWireResistance, customScaleName)
    ccall((:DAQmxCreateTEDSAIStrainGageChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, float64, float64, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, initialBridgeVoltage, leadWireResistance, customScaleName)
end

function DAQmxCreateTEDSAIForceBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIForceBridgeChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIPressureBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIPressureBridgeChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAITorqueBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAITorqueBridgeChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIBridgeChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIVoltageChanWithExcit(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIVoltageChanWithExcit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIAccelChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIAccelChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIForceIEPEChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIForceIEPEChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIMicrophoneChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIMicrophoneChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, int32, float64, int32, float64, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIPosLVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    ccall((:DAQmxCreateTEDSAIPosLVDTChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function DAQmxCreateTEDSAIPosRVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    ccall((:DAQmxCreateTEDSAIPosRVDTChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function DAQmxCreateAOVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAOVoltageChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAOCurrentChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAOCurrentChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, Ptr{Cchar}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAOFuncGenChan(taskHandle, physicalChannel, nameToAssignToChannel, type, freq, amplitude, offset)
    ccall((:DAQmxCreateAOFuncGenChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, type, freq, amplitude, offset)
end

function DAQmxCreateDIChan(taskHandle, lines, nameToAssignToLines, lineGrouping)
    ccall((:DAQmxCreateDIChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function DAQmxCreateDOChan(taskHandle, lines, nameToAssignToLines, lineGrouping)
    ccall((:DAQmxCreateDOChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function DAQmxCreateCIFreqChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
    ccall((:DAQmxCreateCIFreqChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, uInt32, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function DAQmxCreateCIPeriodChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
    ccall((:DAQmxCreateCIPeriodChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, float64, uInt32, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function DAQmxCreateCICountEdgesChan(taskHandle, counter, nameToAssignToChannel, edge, initialCount, countDirection)
    ccall((:DAQmxCreateCICountEdgesChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, uInt32, int32), taskHandle, counter, nameToAssignToChannel, edge, initialCount, countDirection)
end

function DAQmxCreateCIDutyCycleChan(taskHandle, counter, nameToAssignToChannel, minFreq, maxFreq, edge, customScaleName)
    ccall((:DAQmxCreateCIDutyCycleChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, minFreq, maxFreq, edge, customScaleName)
end

function DAQmxCreateCIPulseWidthChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, startingEdge, customScaleName)
    ccall((:DAQmxCreateCIPulseWidthChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, startingEdge, customScaleName)
end

function DAQmxCreateCISemiPeriodChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateCISemiPeriodChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateCITwoEdgeSepChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, firstEdge, secondEdge, customScaleName)
    ccall((:DAQmxCreateCITwoEdgeSepChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, int32, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, firstEdge, secondEdge, customScaleName)
end

function DAQmxCreateCIPulseChanFreq(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
    ccall((:DAQmxCreateCIPulseChanFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function DAQmxCreateCIPulseChanTime(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
    ccall((:DAQmxCreateCIPulseChanTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function DAQmxCreateCIPulseChanTicks(taskHandle, counter, nameToAssignToChannel, sourceTerminal, minVal, maxVal)
    ccall((:DAQmxCreateCIPulseChanTicks, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, float64, float64), taskHandle, counter, nameToAssignToChannel, sourceTerminal, minVal, maxVal)
end

function DAQmxCreateCILinEncoderChan(taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, distPerPulse, initialPos, customScaleName)
    ccall((:DAQmxCreateCILinEncoderChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, bool32, float64, int32, int32, float64, float64, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, distPerPulse, initialPos, customScaleName)
end

function DAQmxCreateCIAngEncoderChan(taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, pulsesPerRev, initialAngle, customScaleName)
    ccall((:DAQmxCreateCIAngEncoderChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, bool32, float64, int32, int32, uInt32, float64, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, pulsesPerRev, initialAngle, customScaleName)
end

function DAQmxCreateCILinVelocityChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, distPerPulse, customScaleName)
    ccall((:DAQmxCreateCILinVelocityChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, distPerPulse, customScaleName)
end

function DAQmxCreateCIAngVelocityChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, pulsesPerRev, customScaleName)
    ccall((:DAQmxCreateCIAngVelocityChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, int32, int32, uInt32, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, pulsesPerRev, customScaleName)
end

function DAQmxCreateCIGPSTimestampChan(taskHandle, counter, nameToAssignToChannel, units, syncMethod, customScaleName)
    ccall((:DAQmxCreateCIGPSTimestampChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, int32, Ptr{Cchar}), taskHandle, counter, nameToAssignToChannel, units, syncMethod, customScaleName)
end

function DAQmxCreateCOPulseChanFreq(taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle)
    ccall((:DAQmxCreateCOPulseChanFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, int32, float64, float64, float64), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle)
end

function DAQmxCreateCOPulseChanTime(taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, lowTime, highTime)
    ccall((:DAQmxCreateCOPulseChanTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, int32, float64, float64, float64), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, lowTime, highTime)
end

function DAQmxCreateCOPulseChanTicks(taskHandle, counter, nameToAssignToChannel, sourceTerminal, idleState, initialDelay, lowTicks, highTicks)
    ccall((:DAQmxCreateCOPulseChanTicks, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, int32, int32, int32, int32), taskHandle, counter, nameToAssignToChannel, sourceTerminal, idleState, initialDelay, lowTicks, highTicks)
end

function DAQmxCreateAIPowerChan(taskHandle, physicalChannel, nameToAssignToChannel, voltageSetpoint, currentSetpoint, outputEnable)
    ccall((:DAQmxCreateAIPowerChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, float64, float64, bool32), taskHandle, physicalChannel, nameToAssignToChannel, voltageSetpoint, currentSetpoint, outputEnable)
end

function DAQmxCreateAICalculatedPowerChan(taskHandle, voltagePhysicalChannel, currentPhysicalChannel, nameToAssignToChannel, terminalConfig, voltageMinVal, voltageMaxVal, currentMinVal, currentMaxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    ccall((:DAQmxCreateAICalculatedPowerChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, int32, float64, float64, float64, float64, int32, int32, float64, Ptr{Cchar}), taskHandle, voltagePhysicalChannel, currentPhysicalChannel, nameToAssignToChannel, terminalConfig, voltageMinVal, voltageMaxVal, currentMinVal, currentMaxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function DAQmxGetAIChanCalCalDate(taskHandle, channelName, year, month, day, hour, minute)
    ccall((:DAQmxGetAIChanCalCalDate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}), taskHandle, channelName, year, month, day, hour, minute)
end

function DAQmxSetAIChanCalCalDate(taskHandle, channelName, year, month, day, hour, minute)
    ccall((:DAQmxSetAIChanCalCalDate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32, uInt32, uInt32, uInt32, uInt32), taskHandle, channelName, year, month, day, hour, minute)
end

function DAQmxGetAIChanCalExpDate(taskHandle, channelName, year, month, day, hour, minute)
    ccall((:DAQmxGetAIChanCalExpDate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}), taskHandle, channelName, year, month, day, hour, minute)
end

function DAQmxSetAIChanCalExpDate(taskHandle, channelName, year, month, day, hour, minute)
    ccall((:DAQmxSetAIChanCalExpDate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32, uInt32, uInt32, uInt32, uInt32), taskHandle, channelName, year, month, day, hour, minute)
end

function DAQmxResetChanAttribute(taskHandle, channel, attribute)
    ccall((:DAQmxResetChanAttribute, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, attribute)
end

function DAQmxCfgSampClkTiming(taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgSampClkTiming, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64, int32, int32, uInt64), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function DAQmxCfgHandshakingTiming(taskHandle, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgHandshakingTiming, NIDAQmx), int32, (TaskHandle, int32, uInt64), taskHandle, sampleMode, sampsPerChan)
end

function DAQmxCfgBurstHandshakingTimingImportClock(taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkSrc, sampleClkActiveEdge, pauseWhen, readyEventActiveLevel)
    ccall((:DAQmxCfgBurstHandshakingTimingImportClock, NIDAQmx), int32, (TaskHandle, int32, uInt64, float64, Ptr{Cchar}, int32, int32, int32), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkSrc, sampleClkActiveEdge, pauseWhen, readyEventActiveLevel)
end

function DAQmxCfgBurstHandshakingTimingExportClock(taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkOutpTerm, sampleClkPulsePolarity, pauseWhen, readyEventActiveLevel)
    ccall((:DAQmxCfgBurstHandshakingTimingExportClock, NIDAQmx), int32, (TaskHandle, int32, uInt64, float64, Ptr{Cchar}, int32, int32, int32), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkOutpTerm, sampleClkPulsePolarity, pauseWhen, readyEventActiveLevel)
end

function DAQmxCfgChangeDetectionTiming(taskHandle, risingEdgeChan, fallingEdgeChan, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgChangeDetectionTiming, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, uInt64), taskHandle, risingEdgeChan, fallingEdgeChan, sampleMode, sampsPerChan)
end

function DAQmxCfgImplicitTiming(taskHandle, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgImplicitTiming, NIDAQmx), int32, (TaskHandle, int32, uInt64), taskHandle, sampleMode, sampsPerChan)
end

function DAQmxCfgPipelinedSampClkTiming(taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgPipelinedSampClkTiming, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64, int32, int32, uInt64), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function DAQmxResetTimingAttribute(taskHandle, attribute)
    ccall((:DAQmxResetTimingAttribute, NIDAQmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxResetTimingAttributeEx(taskHandle, deviceNames, attribute)
    ccall((:DAQmxResetTimingAttributeEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, deviceNames, attribute)
end

function DAQmxDisableStartTrig(taskHandle)
    ccall((:DAQmxDisableStartTrig, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxCfgDigEdgeStartTrig(taskHandle, triggerSource, triggerEdge)
    ccall((:DAQmxCfgDigEdgeStartTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, triggerSource, triggerEdge)
end

function DAQmxCfgAnlgEdgeStartTrig(taskHandle, triggerSource, triggerSlope, triggerLevel)
    ccall((:DAQmxCfgAnlgEdgeStartTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32, float64), taskHandle, triggerSource, triggerSlope, triggerLevel)
end

function DAQmxCfgAnlgMultiEdgeStartTrig(taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, arraySize)
    ccall((:DAQmxCfgAnlgMultiEdgeStartTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}, Ptr{float64}, uInt32), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, arraySize)
end

function DAQmxCfgAnlgWindowStartTrig(taskHandle, triggerSource, triggerWhen, windowTop, windowBottom)
    ccall((:DAQmxCfgAnlgWindowStartTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32, float64, float64), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom)
end

function DAQmxCfgTimeStartTrig(taskHandle, when, timescale)
    ccall((:DAQmxCfgTimeStartTrig, NIDAQmx), int32, (TaskHandle, CVIAbsoluteTime, int32), taskHandle, when, timescale)
end

function DAQmxCfgDigPatternStartTrig(taskHandle, triggerSource, triggerPattern, triggerWhen)
    ccall((:DAQmxCfgDigPatternStartTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32), taskHandle, triggerSource, triggerPattern, triggerWhen)
end

function DAQmxDisableRefTrig(taskHandle)
    ccall((:DAQmxDisableRefTrig, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxCfgDigEdgeRefTrig(taskHandle, triggerSource, triggerEdge, pretriggerSamples)
    ccall((:DAQmxCfgDigEdgeRefTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32, uInt32), taskHandle, triggerSource, triggerEdge, pretriggerSamples)
end

function DAQmxCfgAnlgEdgeRefTrig(taskHandle, triggerSource, triggerSlope, triggerLevel, pretriggerSamples)
    ccall((:DAQmxCfgAnlgEdgeRefTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32, float64, uInt32), taskHandle, triggerSource, triggerSlope, triggerLevel, pretriggerSamples)
end

function DAQmxCfgAnlgMultiEdgeRefTrig(taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, pretriggerSamples, arraySize)
    ccall((:DAQmxCfgAnlgMultiEdgeRefTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}, Ptr{float64}, uInt32, uInt32), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, pretriggerSamples, arraySize)
end

function DAQmxCfgAnlgMultiEdgeRefTrigEx(taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, arraySize, pretriggerSamples)
    ccall((:DAQmxCfgAnlgMultiEdgeRefTrigEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}, Ptr{float64}, uInt32, uInt32), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, arraySize, pretriggerSamples)
end

function DAQmxCfgAnlgWindowRefTrig(taskHandle, triggerSource, triggerWhen, windowTop, windowBottom, pretriggerSamples)
    ccall((:DAQmxCfgAnlgWindowRefTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32, float64, float64, uInt32), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom, pretriggerSamples)
end

function DAQmxCfgDigPatternRefTrig(taskHandle, triggerSource, triggerPattern, triggerWhen, pretriggerSamples)
    ccall((:DAQmxCfgDigPatternRefTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, int32, uInt32), taskHandle, triggerSource, triggerPattern, triggerWhen, pretriggerSamples)
end

function DAQmxResetTrigAttribute(taskHandle, attribute)
    ccall((:DAQmxResetTrigAttribute, NIDAQmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxReadAnalogF64(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadAnalogF64, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadAnalogScalarF64(taskHandle, timeout, value, reserved)
    ccall((:DAQmxReadAnalogScalarF64, NIDAQmx), int32, (TaskHandle, float64, Ptr{float64}, Ptr{bool32}), taskHandle, timeout, value, reserved)
end

function DAQmxReadBinaryI16(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadBinaryI16, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{int16}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadBinaryU16(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadBinaryU16, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt16}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadBinaryI32(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadBinaryI32, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{int32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadBinaryU32(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadBinaryU32, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadDigitalU8(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadDigitalU8, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt8}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadDigitalU16(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadDigitalU16, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt16}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadDigitalU32(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadDigitalU32, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadDigitalScalarU32(taskHandle, timeout, value, reserved)
    ccall((:DAQmxReadDigitalScalarU32, NIDAQmx), int32, (TaskHandle, float64, Ptr{uInt32}, Ptr{bool32}), taskHandle, timeout, value, reserved)
end

function DAQmxReadDigitalLines(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInBytes, sampsPerChanRead, numBytesPerSamp, reserved)
    ccall((:DAQmxReadDigitalLines, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt8}, uInt32, Ptr{int32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInBytes, sampsPerChanRead, numBytesPerSamp, reserved)
end

function DAQmxReadCounterF64(taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCounterF64, NIDAQmx), int32, (TaskHandle, int32, float64, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCounterU32(taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCounterU32, NIDAQmx), int32, (TaskHandle, int32, float64, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCounterF64Ex(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCounterF64Ex, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCounterU32Ex(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCounterU32Ex, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCounterScalarF64(taskHandle, timeout, value, reserved)
    ccall((:DAQmxReadCounterScalarF64, NIDAQmx), int32, (TaskHandle, float64, Ptr{float64}, Ptr{bool32}), taskHandle, timeout, value, reserved)
end

function DAQmxReadCounterScalarU32(taskHandle, timeout, value, reserved)
    ccall((:DAQmxReadCounterScalarU32, NIDAQmx), int32, (TaskHandle, float64, Ptr{uInt32}, Ptr{bool32}), taskHandle, timeout, value, reserved)
end

function DAQmxReadPowerF64(taskHandle, numSampsPerChan, timeout, fillMode, readArrayVoltage, readArrayCurrent, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadPowerF64, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{float64}, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArrayVoltage, readArrayCurrent, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadPowerBinaryI16(taskHandle, numSampsPerChan, timeout, fillMode, readArrayVoltage, readArrayCurrent, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadPowerBinaryI16, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{int16}, Ptr{int16}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArrayVoltage, readArrayCurrent, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadPowerScalarF64(taskHandle, timeout, voltage, current, reserved)
    ccall((:DAQmxReadPowerScalarF64, NIDAQmx), int32, (TaskHandle, float64, Ptr{float64}, Ptr{float64}, Ptr{bool32}), taskHandle, timeout, voltage, current, reserved)
end

function DAQmxReadCtrFreq(taskHandle, numSampsPerChan, timeout, interleaved, readArrayFrequency, readArrayDutyCycle, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCtrFreq, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{float64}, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayFrequency, readArrayDutyCycle, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCtrTime(taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTime, readArrayLowTime, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCtrTime, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{float64}, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTime, readArrayLowTime, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCtrTicks(taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTicks, readArrayLowTicks, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCtrTicks, NIDAQmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt32}, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTicks, readArrayLowTicks, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCtrFreqScalar(taskHandle, timeout, frequency, dutyCycle, reserved)
    ccall((:DAQmxReadCtrFreqScalar, NIDAQmx), int32, (TaskHandle, float64, Ptr{float64}, Ptr{float64}, Ptr{bool32}), taskHandle, timeout, frequency, dutyCycle, reserved)
end

function DAQmxReadCtrTimeScalar(taskHandle, timeout, highTime, lowTime, reserved)
    ccall((:DAQmxReadCtrTimeScalar, NIDAQmx), int32, (TaskHandle, float64, Ptr{float64}, Ptr{float64}, Ptr{bool32}), taskHandle, timeout, highTime, lowTime, reserved)
end

function DAQmxReadCtrTicksScalar(taskHandle, timeout, highTicks, lowTicks, reserved)
    ccall((:DAQmxReadCtrTicksScalar, NIDAQmx), int32, (TaskHandle, float64, Ptr{uInt32}, Ptr{uInt32}, Ptr{bool32}), taskHandle, timeout, highTicks, lowTicks, reserved)
end

function DAQmxReadRaw(taskHandle, numSampsPerChan, timeout, readArray, arraySizeInBytes, sampsRead, numBytesPerSamp, reserved)
    ccall((:DAQmxReadRaw, NIDAQmx), int32, (TaskHandle, int32, float64, Ptr{Cvoid}, uInt32, Ptr{int32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInBytes, sampsRead, numBytesPerSamp, reserved)
end

function DAQmxGetNthTaskReadChannel(taskHandle, index, buffer, bufferSize)
    ccall((:DAQmxGetNthTaskReadChannel, NIDAQmx), int32, (TaskHandle, uInt32, Ptr{Cchar}, int32), taskHandle, index, buffer, bufferSize)
end

function DAQmxResetReadAttribute(taskHandle, attribute)
    ccall((:DAQmxResetReadAttribute, NIDAQmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxConfigureLogging(taskHandle, filePath, loggingMode, groupName, operation)
    ccall((:DAQmxConfigureLogging, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32, Ptr{Cchar}, int32), taskHandle, filePath, loggingMode, groupName, operation)
end

function DAQmxStartNewFile(taskHandle, filePath)
    ccall((:DAQmxStartNewFile, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, filePath)
end

function DAQmxWriteAnalogF64(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteAnalogF64, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{float64}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteAnalogScalarF64(taskHandle, autoStart, timeout, value, reserved)
    ccall((:DAQmxWriteAnalogScalarF64, NIDAQmx), int32, (TaskHandle, bool32, float64, float64, Ptr{bool32}), taskHandle, autoStart, timeout, value, reserved)
end

function DAQmxWriteBinaryI16(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteBinaryI16, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{int16}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteBinaryU16(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteBinaryU16, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt16}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteBinaryI32(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteBinaryI32, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{int32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteBinaryU32(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteBinaryU32, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteDigitalU8(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteDigitalU8, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt8}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteDigitalU16(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteDigitalU16, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt16}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteDigitalU32(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteDigitalU32, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteDigitalScalarU32(taskHandle, autoStart, timeout, value, reserved)
    ccall((:DAQmxWriteDigitalScalarU32, NIDAQmx), int32, (TaskHandle, bool32, float64, uInt32, Ptr{bool32}), taskHandle, autoStart, timeout, value, reserved)
end

function DAQmxWriteDigitalLines(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteDigitalLines, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt8}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteCtrFreq(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, frequency, dutyCycle, numSampsPerChanWritten, reserved)
    ccall((:DAQmxWriteCtrFreq, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{float64}, Ptr{float64}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, frequency, dutyCycle, numSampsPerChanWritten, reserved)
end

function DAQmxWriteCtrFreqScalar(taskHandle, autoStart, timeout, frequency, dutyCycle, reserved)
    ccall((:DAQmxWriteCtrFreqScalar, NIDAQmx), int32, (TaskHandle, bool32, float64, float64, float64, Ptr{bool32}), taskHandle, autoStart, timeout, frequency, dutyCycle, reserved)
end

function DAQmxWriteCtrTime(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTime, lowTime, numSampsPerChanWritten, reserved)
    ccall((:DAQmxWriteCtrTime, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{float64}, Ptr{float64}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTime, lowTime, numSampsPerChanWritten, reserved)
end

function DAQmxWriteCtrTimeScalar(taskHandle, autoStart, timeout, highTime, lowTime, reserved)
    ccall((:DAQmxWriteCtrTimeScalar, NIDAQmx), int32, (TaskHandle, bool32, float64, float64, float64, Ptr{bool32}), taskHandle, autoStart, timeout, highTime, lowTime, reserved)
end

function DAQmxWriteCtrTicks(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTicks, lowTicks, numSampsPerChanWritten, reserved)
    ccall((:DAQmxWriteCtrTicks, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt32}, Ptr{uInt32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTicks, lowTicks, numSampsPerChanWritten, reserved)
end

function DAQmxWriteCtrTicksScalar(taskHandle, autoStart, timeout, highTicks, lowTicks, reserved)
    ccall((:DAQmxWriteCtrTicksScalar, NIDAQmx), int32, (TaskHandle, bool32, float64, uInt32, uInt32, Ptr{bool32}), taskHandle, autoStart, timeout, highTicks, lowTicks, reserved)
end

function DAQmxWriteRaw(taskHandle, numSamps, autoStart, timeout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteRaw, NIDAQmx), int32, (TaskHandle, int32, bool32, float64, Ptr{Cvoid}, Ptr{int32}, Ptr{bool32}), taskHandle, numSamps, autoStart, timeout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxResetWriteAttribute(taskHandle, attribute)
    ccall((:DAQmxResetWriteAttribute, NIDAQmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxExportSignal(taskHandle, signalID, outputTerminal)
    ccall((:DAQmxExportSignal, NIDAQmx), int32, (TaskHandle, int32, Ptr{Cchar}), taskHandle, signalID, outputTerminal)
end

function DAQmxResetExportedSignalAttribute(taskHandle, attribute)
    ccall((:DAQmxResetExportedSignalAttribute, NIDAQmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxCreateLinScale(name, slope, yIntercept, preScaledUnits, scaledUnits)
    ccall((:DAQmxCreateLinScale, NIDAQmx), int32, (Ptr{Cchar}, float64, float64, int32, Ptr{Cchar}), name, slope, yIntercept, preScaledUnits, scaledUnits)
end

function DAQmxCreateMapScale(name, prescaledMin, prescaledMax, scaledMin, scaledMax, preScaledUnits, scaledUnits)
    ccall((:DAQmxCreateMapScale, NIDAQmx), int32, (Ptr{Cchar}, float64, float64, float64, float64, int32, Ptr{Cchar}), name, prescaledMin, prescaledMax, scaledMin, scaledMax, preScaledUnits, scaledUnits)
end

function DAQmxCreatePolynomialScale(name, forwardCoeffs, numForwardCoeffsIn, reverseCoeffs, numReverseCoeffsIn, preScaledUnits, scaledUnits)
    ccall((:DAQmxCreatePolynomialScale, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, Ptr{Cchar}), name, forwardCoeffs, numForwardCoeffsIn, reverseCoeffs, numReverseCoeffsIn, preScaledUnits, scaledUnits)
end

function DAQmxCreateTableScale(name, prescaledVals, numPrescaledValsIn, scaledVals, numScaledValsIn, preScaledUnits, scaledUnits)
    ccall((:DAQmxCreateTableScale, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, Ptr{Cchar}), name, prescaledVals, numPrescaledValsIn, scaledVals, numScaledValsIn, preScaledUnits, scaledUnits)
end

function DAQmxCalculateReversePolyCoeff(forwardCoeffs, numForwardCoeffsIn, minValX, maxValX, numPointsToCompute, reversePolyOrder, reverseCoeffs)
    ccall((:DAQmxCalculateReversePolyCoeff, NIDAQmx), int32, (Ptr{float64}, uInt32, float64, float64, int32, int32, Ptr{float64}), forwardCoeffs, numForwardCoeffsIn, minValX, maxValX, numPointsToCompute, reversePolyOrder, reverseCoeffs)
end

function DAQmxCfgInputBuffer(taskHandle, numSampsPerChan)
    ccall((:DAQmxCfgInputBuffer, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, numSampsPerChan)
end

function DAQmxCfgOutputBuffer(taskHandle, numSampsPerChan)
    ccall((:DAQmxCfgOutputBuffer, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, numSampsPerChan)
end

function DAQmxGetBufferAttribute(taskHandle, attribute, value)
    ccall((:DAQmxGetBufferAttribute, NIDAQmx), int32, (TaskHandle, int32, Ptr{Cvoid}), taskHandle, attribute, value)
end

function DAQmxResetBufferAttribute(taskHandle, attribute)
    ccall((:DAQmxResetBufferAttribute, NIDAQmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxSwitchCreateScanList(scanList, taskHandle)
    ccall((:DAQmxSwitchCreateScanList, NIDAQmx), int32, (Ptr{Cchar}, Ptr{TaskHandle}), scanList, taskHandle)
end

function DAQmxSwitchCreateScanListEx(taskName, scanList, taskHandle)
    ccall((:DAQmxSwitchCreateScanListEx, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, Ptr{TaskHandle}), taskName, scanList, taskHandle)
end

function DAQmxSwitchConnect(switchChannel1, switchChannel2, waitForSettling)
    ccall((:DAQmxSwitchConnect, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, bool32), switchChannel1, switchChannel2, waitForSettling)
end

function DAQmxSwitchConnectMulti(connectionList, waitForSettling)
    ccall((:DAQmxSwitchConnectMulti, NIDAQmx), int32, (Ptr{Cchar}, bool32), connectionList, waitForSettling)
end

function DAQmxSwitchDisconnect(switchChannel1, switchChannel2, waitForSettling)
    ccall((:DAQmxSwitchDisconnect, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, bool32), switchChannel1, switchChannel2, waitForSettling)
end

function DAQmxSwitchDisconnectMulti(connectionList, waitForSettling)
    ccall((:DAQmxSwitchDisconnectMulti, NIDAQmx), int32, (Ptr{Cchar}, bool32), connectionList, waitForSettling)
end

function DAQmxSwitchDisconnectAll(deviceName, waitForSettling)
    ccall((:DAQmxSwitchDisconnectAll, NIDAQmx), int32, (Ptr{Cchar}, bool32), deviceName, waitForSettling)
end

function DAQmxSwitchSetTopologyAndReset(deviceName, newTopology)
    ccall((:DAQmxSwitchSetTopologyAndReset, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}), deviceName, newTopology)
end

function DAQmxSwitchFindPath(switchChannel1, switchChannel2, path, pathBufferSize, pathStatus)
    ccall((:DAQmxSwitchFindPath, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, uInt32, Ptr{int32}), switchChannel1, switchChannel2, path, pathBufferSize, pathStatus)
end

function DAQmxSwitchOpenRelays(relayList, waitForSettling)
    ccall((:DAQmxSwitchOpenRelays, NIDAQmx), int32, (Ptr{Cchar}, bool32), relayList, waitForSettling)
end

function DAQmxSwitchCloseRelays(relayList, waitForSettling)
    ccall((:DAQmxSwitchCloseRelays, NIDAQmx), int32, (Ptr{Cchar}, bool32), relayList, waitForSettling)
end

function DAQmxSwitchGetSingleRelayCount(relayName, count)
    ccall((:DAQmxSwitchGetSingleRelayCount, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), relayName, count)
end

function DAQmxSwitchGetMultiRelayCount(relayList, count, countArraySize, numRelayCountsRead)
    ccall((:DAQmxSwitchGetMultiRelayCount, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}, uInt32, Ptr{uInt32}), relayList, count, countArraySize, numRelayCountsRead)
end

function DAQmxSwitchGetSingleRelayPos(relayName, relayPos)
    ccall((:DAQmxSwitchGetSingleRelayPos, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), relayName, relayPos)
end

function DAQmxSwitchGetMultiRelayPos(relayList, relayPos, relayPosArraySize, numRelayPossRead)
    ccall((:DAQmxSwitchGetMultiRelayPos, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}, uInt32, Ptr{uInt32}), relayList, relayPos, relayPosArraySize, numRelayPossRead)
end

function DAQmxSwitchWaitForSettling(deviceName)
    ccall((:DAQmxSwitchWaitForSettling, NIDAQmx), int32, (Ptr{Cchar},), deviceName)
end

function DAQmxGetSwitchChanAttribute(switchChannelName, attribute, value)
    ccall((:DAQmxGetSwitchChanAttribute, NIDAQmx), int32, (Ptr{Cchar}, int32, Ptr{Cvoid}), switchChannelName, attribute, value)
end

function DAQmxGetSwitchScanAttribute(taskHandle, attribute, value)
    ccall((:DAQmxGetSwitchScanAttribute, NIDAQmx), int32, (TaskHandle, int32, Ptr{Cvoid}), taskHandle, attribute, value)
end

function DAQmxResetSwitchScanAttribute(taskHandle, attribute)
    ccall((:DAQmxResetSwitchScanAttribute, NIDAQmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxDisableAdvTrig(taskHandle)
    ccall((:DAQmxDisableAdvTrig, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxCfgDigEdgeAdvTrig(taskHandle, triggerSource, triggerEdge)
    ccall((:DAQmxCfgDigEdgeAdvTrig, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, triggerSource, triggerEdge)
end

function DAQmxSendSoftwareTrigger(taskHandle, triggerID)
    ccall((:DAQmxSendSoftwareTrigger, NIDAQmx), int32, (TaskHandle, int32), taskHandle, triggerID)
end

function DAQmxConnectTerms(sourceTerminal, destinationTerminal, signalModifiers)
    ccall((:DAQmxConnectTerms, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, int32), sourceTerminal, destinationTerminal, signalModifiers)
end

function DAQmxDisconnectTerms(sourceTerminal, destinationTerminal)
    ccall((:DAQmxDisconnectTerms, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}), sourceTerminal, destinationTerminal)
end

function DAQmxTristateOutputTerm(outputTerminal)
    ccall((:DAQmxTristateOutputTerm, NIDAQmx), int32, (Ptr{Cchar},), outputTerminal)
end

function DAQmxResetDevice(deviceName)
    ccall((:DAQmxResetDevice, NIDAQmx), int32, (Ptr{Cchar},), deviceName)
end

function DAQmxSelfTestDevice(deviceName)
    ccall((:DAQmxSelfTestDevice, NIDAQmx), int32, (Ptr{Cchar},), deviceName)
end

function DAQmxCreateWatchdogTimerTaskEx(deviceName, taskName, taskHandle, timeout)
    ccall((:DAQmxCreateWatchdogTimerTaskEx, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, Ptr{TaskHandle}, float64), deviceName, taskName, taskHandle, timeout)
end

function DAQmxControlWatchdogTask(taskHandle, action)
    ccall((:DAQmxControlWatchdogTask, NIDAQmx), int32, (TaskHandle, int32), taskHandle, action)
end

function DAQmxCfgWatchdogAOExpirStates(taskHandle, channelNames, expirStateArray, outputTypeArray, arraySize)
    ccall((:DAQmxCfgWatchdogAOExpirStates, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, Ptr{int32}, uInt32), taskHandle, channelNames, expirStateArray, outputTypeArray, arraySize)
end

function DAQmxCfgWatchdogCOExpirStates(taskHandle, channelNames, expirStateArray, arraySize)
    ccall((:DAQmxCfgWatchdogCOExpirStates, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}, uInt32), taskHandle, channelNames, expirStateArray, arraySize)
end

function DAQmxCfgWatchdogDOExpirStates(taskHandle, channelNames, expirStateArray, arraySize)
    ccall((:DAQmxCfgWatchdogDOExpirStates, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}, uInt32), taskHandle, channelNames, expirStateArray, arraySize)
end

function DAQmxResetWatchdogAttribute(taskHandle, lines, attribute)
    ccall((:DAQmxResetWatchdogAttribute, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, lines, attribute)
end

function DAQmxSelfCal(deviceName)
    ccall((:DAQmxSelfCal, NIDAQmx), int32, (Ptr{Cchar},), deviceName)
end

function DAQmxPerformBridgeOffsetNullingCal(taskHandle, channel)
    ccall((:DAQmxPerformBridgeOffsetNullingCal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxPerformBridgeOffsetNullingCalEx(taskHandle, channel, skipUnsupportedChannels)
    ccall((:DAQmxPerformBridgeOffsetNullingCalEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, skipUnsupportedChannels)
end

function DAQmxPerformThrmcplLeadOffsetNullingCal(taskHandle, channel, skipUnsupportedChannels)
    ccall((:DAQmxPerformThrmcplLeadOffsetNullingCal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, skipUnsupportedChannels)
end

function DAQmxPerformStrainShuntCal(taskHandle, channel, shuntResistorValue, shuntResistorLocation, skipUnsupportedChannels)
    ccall((:DAQmxPerformStrainShuntCal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64, int32, bool32), taskHandle, channel, shuntResistorValue, shuntResistorLocation, skipUnsupportedChannels)
end

function DAQmxPerformStrainShuntCalEx(taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, skipUnsupportedChannels)
    ccall((:DAQmxPerformStrainShuntCalEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64, int32, int32, int32, bool32), taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, skipUnsupportedChannels)
end

function DAQmxPerformBridgeShuntCal(taskHandle, channel, shuntResistorValue, shuntResistorLocation, bridgeResistance, skipUnsupportedChannels)
    ccall((:DAQmxPerformBridgeShuntCal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64, int32, float64, bool32), taskHandle, channel, shuntResistorValue, shuntResistorLocation, bridgeResistance, skipUnsupportedChannels)
end

function DAQmxPerformBridgeShuntCalEx(taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, bridgeResistance, skipUnsupportedChannels)
    ccall((:DAQmxPerformBridgeShuntCalEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64, int32, int32, int32, float64, bool32), taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, bridgeResistance, skipUnsupportedChannels)
end

function DAQmxGetSelfCalLastDateAndTime(deviceName, year, month, day, hour, minute)
    ccall((:DAQmxGetSelfCalLastDateAndTime, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}), deviceName, year, month, day, hour, minute)
end

function DAQmxGetSelfCalLastDateAndTimeEx(deviceName, timestamp)
    ccall((:DAQmxGetSelfCalLastDateAndTimeEx, NIDAQmx), int32, (Ptr{Cchar}, Ptr{CVIAbsoluteTime}), deviceName, timestamp)
end

function DAQmxGetExtCalLastDateAndTime(deviceName, year, month, day, hour, minute)
    ccall((:DAQmxGetExtCalLastDateAndTime, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}), deviceName, year, month, day, hour, minute)
end

function DAQmxGetExtCalLastDateAndTimeEx(deviceName, timestamp)
    ccall((:DAQmxGetExtCalLastDateAndTimeEx, NIDAQmx), int32, (Ptr{Cchar}, Ptr{CVIAbsoluteTime}), deviceName, timestamp)
end

function DAQmxRestoreLastExtCalConst(deviceName)
    ccall((:DAQmxRestoreLastExtCalConst, NIDAQmx), int32, (Ptr{Cchar},), deviceName)
end

function DAQmxESeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxESeriesCalAdjust, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxMSeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxMSeriesCalAdjust, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxSSeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxSSeriesCalAdjust, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxSCBaseboardCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxSCBaseboardCalAdjust, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxAOSeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxAOSeriesCalAdjust, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxXSeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxXSeriesCalAdjust, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxAdjust64xxCal(calHandle, referenceVoltage)
    ccall((:DAQmxAdjust64xxCal, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxDeviceSupportsCal(deviceName, calSupported)
    ccall((:DAQmxDeviceSupportsCal, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), deviceName, calSupported)
end

function DAQmxInitExtCal(deviceName, password, calHandle)
    ccall((:DAQmxInitExtCal, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, Ptr{CalHandle}), deviceName, password, calHandle)
end

function DAQmxCloseExtCal(calHandle, action)
    ccall((:DAQmxCloseExtCal, NIDAQmx), int32, (CalHandle, int32), calHandle, action)
end

function DAQmxChangeExtCalPassword(deviceName, password, newPassword)
    ccall((:DAQmxChangeExtCalPassword, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), deviceName, password, newPassword)
end

function DAQmxDSASetCalTemp(calHandle, temperature)
    ccall((:DAQmxDSASetCalTemp, NIDAQmx), int32, (CalHandle, float64), calHandle, temperature)
end

function DAQmxAdjustDSAAICal(calHandle, referenceVoltage)
    ccall((:DAQmxAdjustDSAAICal, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxAdjustDSAAICalEx(calHandle, referenceVoltage, inputsShorted)
    ccall((:DAQmxAdjustDSAAICalEx, NIDAQmx), int32, (CalHandle, float64, bool32), calHandle, referenceVoltage, inputsShorted)
end

function DAQmxAdjustDSAAICalWithGainAndCoupling(calHandle, coupling, gain, referenceVoltage)
    ccall((:DAQmxAdjustDSAAICalWithGainAndCoupling, NIDAQmx), int32, (CalHandle, int32, float64, float64), calHandle, coupling, gain, referenceVoltage)
end

function DAQmxAdjustDSAAOCal(calHandle, channel, requestedLowVoltage, actualLowVoltage, requestedHighVoltage, actualHighVoltage, gainSetting)
    ccall((:DAQmxAdjustDSAAOCal, NIDAQmx), int32, (CalHandle, uInt32, float64, float64, float64, float64, float64), calHandle, channel, requestedLowVoltage, actualLowVoltage, requestedHighVoltage, actualHighVoltage, gainSetting)
end

function DAQmxAdjust4610Cal(calHandle, channelName, gain, offset)
    ccall((:DAQmxAdjust4610Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelName, gain, offset)
end

function DAQmxAdjustDSATimebaseCal(calHandle, referenceFrequency)
    ccall((:DAQmxAdjustDSATimebaseCal, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceFrequency)
end

function DAQmxAdjustDSAAOTimebaseCal(calHandle, measuredFrequency, calComplete)
    ccall((:DAQmxAdjustDSAAOTimebaseCal, NIDAQmx), int32, (CalHandle, float64, Ptr{bool32}), calHandle, measuredFrequency, calComplete)
end

function DAQmxSetupDSAAOTimebaseCal(calHandle, expectedFrequency)
    ccall((:DAQmxSetupDSAAOTimebaseCal, NIDAQmx), int32, (CalHandle, Ptr{float64}), calHandle, expectedFrequency)
end

function DAQmxGet4463AdjustPoints(calHandle, terminalConfig, gain, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4463AdjustPoints, NIDAQmx), int32, (CalHandle, int32, float64, Ptr{float64}, uInt32), calHandle, terminalConfig, gain, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4463Cal(calHandle, channelNames, referenceVoltage)
    ccall((:DAQmxAdjust4463Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, referenceVoltage)
end

function DAQmxSetup4463Cal(calHandle, channelNames, terminalConfig, gain, outputVoltage)
    ccall((:DAQmxSetup4463Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32, float64, float64), calHandle, channelNames, terminalConfig, gain, outputVoltage)
end

function DAQmxSetup4480Cal(calHandle, channelNames, calMode)
    ccall((:DAQmxSetup4480Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, calMode)
end

function DAQmxAdjustTIOTimebaseCal(calHandle, referenceFrequency)
    ccall((:DAQmxAdjustTIOTimebaseCal, NIDAQmx), int32, (CalHandle, float64), calHandle, referenceFrequency)
end

function DAQmxAdjust4204Cal(calHandle, channelNames, lowPassFreq, trackHoldEnabled, inputVal)
    ccall((:DAQmxAdjust4204Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, bool32, float64), calHandle, channelNames, lowPassFreq, trackHoldEnabled, inputVal)
end

function DAQmxAdjust4220Cal(calHandle, channelNames, gain, inputVal)
    ccall((:DAQmxAdjust4220Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelNames, gain, inputVal)
end

function DAQmxAdjust4224Cal(calHandle, channelNames, gain, inputVal)
    ccall((:DAQmxAdjust4224Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelNames, gain, inputVal)
end

function DAQmxAdjust4225Cal(calHandle, channelNames, gain, inputVal)
    ccall((:DAQmxAdjust4225Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelNames, gain, inputVal)
end

function DAQmxSetup433xCal(calHandle, channelNames, excitationVoltage)
    ccall((:DAQmxSetup433xCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, excitationVoltage)
end

function DAQmxAdjust433xCal(calHandle, refVoltage, refExcitation, shuntLocation)
    ccall((:DAQmxAdjust433xCal, NIDAQmx), int32, (CalHandle, float64, float64, int32), calHandle, refVoltage, refExcitation, shuntLocation)
end

function DAQmxSetup4339Cal(calHandle, channelNames, calMode, rangeMax, rangeMin, excitationVoltage)
    ccall((:DAQmxSetup4339Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32, float64, float64, float64), calHandle, channelNames, calMode, rangeMax, rangeMin, excitationVoltage)
end

function DAQmxAdjust4339Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4339Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxGet4339CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4339CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4300Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4300Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxSetup4302Cal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxSetup4302Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxGet4302CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4302CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4302Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4302Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxSetup4303Cal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxSetup4303Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxGet4303CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4303CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4303Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4303Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxSetup4304Cal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxSetup4304Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxGet4304CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4304CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4304Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4304Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxSetup4305Cal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxSetup4305Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxGet4305CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4305CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4305Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4305Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxAdjust4309Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4309Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxAdjust4310Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4310Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxAdjust4311Cal(calHandle, rangeMax, rangeMin, refVoltage)
    ccall((:DAQmxAdjust4311Cal, NIDAQmx), int32, (CalHandle, float64, float64, float64), calHandle, rangeMax, rangeMin, refVoltage)
end

function DAQmxAdjust4353Cal(calHandle, channelNames, refVal)
    ccall((:DAQmxAdjust4353Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, refVal)
end

function DAQmxAdjust4357Cal(calHandle, channelNames, refVals, numRefVals)
    ccall((:DAQmxAdjust4357Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, Ptr{float64}, int32), calHandle, channelNames, refVals, numRefVals)
end

function DAQmxSetup4322Cal(calHandle, channelNames, outputType, outputVal)
    ccall((:DAQmxSetup4322Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32, float64), calHandle, channelNames, outputType, outputVal)
end

function DAQmxAdjust4322Cal(calHandle, channelNames, refVal)
    ccall((:DAQmxAdjust4322Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, refVal)
end

function DAQmxGet4322CalAdjustPoints(calHandle, outputType, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4322CalAdjustPoints, NIDAQmx), int32, (CalHandle, int32, Ptr{float64}, uInt32), calHandle, outputType, adjustmentPoints, bufferSize)
end

function DAQmxConnectSCExpressCalAccChans(calHandle, channelNames, connection)
    ccall((:DAQmxConnectSCExpressCalAccChans, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, Ptr{Cchar}), calHandle, channelNames, connection)
end

function DAQmxDisconnectSCExpressCalAccChans(calHandle)
    ccall((:DAQmxDisconnectSCExpressCalAccChans, NIDAQmx), int32, (CalHandle,), calHandle)
end

function DAQmxGetPossibleSCExpressCalAccConnections(deviceName, channelNames, connections, connectionsBufferSize)
    ccall((:DAQmxGetPossibleSCExpressCalAccConnections, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, uInt32), deviceName, channelNames, connections, connectionsBufferSize)
end

function DAQmxSetSCExpressCalAccBridgeOutput(calHandle, voltsPerVolt)
    ccall((:DAQmxSetSCExpressCalAccBridgeOutput, NIDAQmx), int32, (CalHandle, float64), calHandle, voltsPerVolt)
end

function DAQmxFieldDAQSetCalTemp(calHandle, temperature)
    ccall((:DAQmxFieldDAQSetCalTemp, NIDAQmx), int32, (CalHandle, float64), calHandle, temperature)
end

function DAQmxGet11601CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11601CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11601Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11601Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet11603CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11603CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11603Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11603Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxSetup11605Cal(calHandle, rangeMin, rangeMax)
    ccall((:DAQmxSetup11605Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, rangeMin, rangeMax)
end

function DAQmxGet11605CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11605CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11605Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11605Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet11613CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11613CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11613Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11613Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet11614CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11614CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11614Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11614Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxSetup11634Cal(calHandle, rangeMin, rangeMax)
    ccall((:DAQmxSetup11634Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, rangeMin, rangeMax)
end

function DAQmxGet11634CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11634CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11634Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11634Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxSetup11637Cal(calHandle, channelNames, bridgeConfig, voltageExcitation)
    ccall((:DAQmxSetup11637Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32, float64), calHandle, channelNames, bridgeConfig, voltageExcitation)
end

function DAQmxAdjust11637Cal(calHandle, value, actualReading, asFoundGainError, asFoundOffsetError)
    ccall((:DAQmxAdjust11637Cal, NIDAQmx), int32, (CalHandle, float64, Ptr{float64}, Ptr{float64}, Ptr{float64}), calHandle, value, actualReading, asFoundGainError, asFoundOffsetError)
end

function DAQmxGet9201CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9201CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxCSeriesSetCalTemp(calHandle, temperature)
    ccall((:DAQmxCSeriesSetCalTemp, NIDAQmx), int32, (CalHandle, float64), calHandle, temperature)
end

function DAQmxAdjust9201Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9201Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9202CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9202CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9202Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9202Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9203CalAdjustPoints(calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9203CalAdjustPoints, NIDAQmx), int32, (CalHandle, float64, float64, Ptr{float64}, uInt32), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9203GainCal(calHandle, channelNames, rangeMin, rangeMax, value)
    ccall((:DAQmxAdjust9203GainCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64, float64), calHandle, channelNames, rangeMin, rangeMax, value)
end

function DAQmxAdjust9203OffsetCal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxAdjust9203OffsetCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxAdjust9204Cal(calHandle, value)
    ccall((:DAQmxAdjust9204Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, value)
end

function DAQmxAdjust9205Cal(calHandle, value)
    ccall((:DAQmxAdjust9205Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, value)
end

function DAQmxAdjust9206Cal(calHandle, value)
    ccall((:DAQmxAdjust9206Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, value)
end

function DAQmxGet9207CalAdjustPoints(calHandle, channelNames, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9207CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, Ptr{float64}, uInt32), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9207GainCal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9207GainCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9207OffsetCal(calHandle, channelNames)
    ccall((:DAQmxAdjust9207OffsetCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}), calHandle, channelNames)
end

function DAQmxGet9208CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9208CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9208GainCal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9208GainCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9208OffsetCal(calHandle, channelNames)
    ccall((:DAQmxAdjust9208OffsetCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}), calHandle, channelNames)
end

function DAQmxGet9209CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9209CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9209GainCal(calHandle, channelNames, terminalConfig, value)
    ccall((:DAQmxAdjust9209GainCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32, float64), calHandle, channelNames, terminalConfig, value)
end

function DAQmxAdjust9209OffsetCal(calHandle, channelNames)
    ccall((:DAQmxAdjust9209OffsetCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}), calHandle, channelNames)
end

function DAQmxAdjust9210Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9210Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9211Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9211Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9212CalAdjustPoints(calHandle, channelNames, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9212CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, Ptr{float64}, uInt32), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9212Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9212Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9213CalAdjustPoints(calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9213CalAdjustPoints, NIDAQmx), int32, (CalHandle, float64, float64, Ptr{float64}, uInt32), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9213Cal(calHandle, channelNames, rangeMin, rangeMax, value)
    ccall((:DAQmxAdjust9213Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64, float64), calHandle, channelNames, rangeMin, rangeMax, value)
end

function DAQmxGet9214CalAdjustPoints(calHandle, channelNames, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9214CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, Ptr{float64}, uInt32), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9214Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9214Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9215CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9215CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9215Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9215Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9216CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9216CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9216Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9216Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9217CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9217CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9217Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9217Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxSetup9218Cal(calHandle, channelNames, rangeMin, rangeMax, measType)
    ccall((:DAQmxSetup9218Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64, int32), calHandle, channelNames, rangeMin, rangeMax, measType)
end

function DAQmxGet9218CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9218CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9218Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9218Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxSetup9219Cal(calHandle, channelNames, rangeMin, rangeMax, measType, bridgeConfig)
    ccall((:DAQmxSetup9219Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64, int32, int32), calHandle, channelNames, rangeMin, rangeMax, measType, bridgeConfig)
end

function DAQmxGet9219CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9219CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9219Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9219Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9220CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9220CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9220Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9220Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9221CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9221CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9221Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9221Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9222CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9222CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9222Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9222Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9223CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9223CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9223Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9223Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9224CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9224CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9224Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9224Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9225CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9225CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9225Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9225Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9226CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9226CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9226Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9226Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9227CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9227CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9227Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9227Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9228CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9228CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9228Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9228Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9229CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9229CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9229Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9229Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9230CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9230CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9230Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9230Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9231CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9231CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9231Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9231Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9232CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9232CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9232Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9232Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9234CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9234CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9234GainCal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9234GainCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9234OffsetCal(calHandle, channelNames)
    ccall((:DAQmxAdjust9234OffsetCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}), calHandle, channelNames)
end

function DAQmxGet9238CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9238CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9238Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9238Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9239CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9239CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9239Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9239Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9242CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9242CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9242Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9242Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9242Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9242Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9244CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9244CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9244Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9244Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9244Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9244Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9246CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9246CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9246Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9246Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9247CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9247CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9247Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9247Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9250CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9250CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9250Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9250Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9251CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9251CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9251Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9251Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9252CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9252CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9252Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9252Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9253CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9253CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9253Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9253Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9260CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9260CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9260Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9260Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9260Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9260Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9262CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9262CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9262Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9262Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9262Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9262Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9263CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9263CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9263Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9263Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9263Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9263Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9264CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9264CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9264Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9264Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9264Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9264Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9265CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9265CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9265Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9265Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9265Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9265Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9266CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9266CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9266Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9266Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9266Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9266Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9269CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9269CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9269Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9269Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9269Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9269Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9313CalAdjustPoints(calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9313CalAdjustPoints, NIDAQmx), int32, (CalHandle, float64, float64, Ptr{float64}, uInt32), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9313Cal(calHandle, channelNames, rangeMin, rangeMax, value)
    ccall((:DAQmxAdjust9313Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64, float64), calHandle, channelNames, rangeMin, rangeMax, value)
end

function DAQmxGet9320CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9320CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9320Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9320Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9628AICalAdjustPoints(calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9628AICalAdjustPoints, NIDAQmx), int32, (CalHandle, float64, float64, Ptr{float64}, uInt32), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9628AICal(calHandle, channelNames, rangeMin, rangeMax, value)
    ccall((:DAQmxAdjust9628AICal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64, float64), calHandle, channelNames, rangeMin, rangeMax, value)
end

function DAQmxGet9629AICalAdjustPoints(calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9629AICalAdjustPoints, NIDAQmx), int32, (CalHandle, float64, float64, Ptr{float64}, uInt32), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9629AICal(calHandle, channelNames, rangeMin, rangeMax, value)
    ccall((:DAQmxAdjust9629AICal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64, float64), calHandle, channelNames, rangeMin, rangeMax, value)
end

function DAQmxGet9638AICalAdjustPoints(calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9638AICalAdjustPoints, NIDAQmx), int32, (CalHandle, float64, float64, Ptr{float64}, uInt32), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9638AICal(calHandle, channelNames, rangeMin, rangeMax, value)
    ccall((:DAQmxAdjust9638AICal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64, float64), calHandle, channelNames, rangeMin, rangeMax, value)
end

function DAQmxGet9628AOCalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9628AOCalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9628AOCal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9628AOCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9628AOCal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9628AOCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9629AOCalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9629AOCalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9629AOCal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9629AOCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9629AOCal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9629AOCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9638AOCalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9638AOCalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9638AOCal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9638AOCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9638AOCal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9638AOCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxGet9775CalAdjustPoints(calHandle, coupling, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9775CalAdjustPoints, NIDAQmx), int32, (CalHandle, uInt32, Ptr{float64}, uInt32), calHandle, coupling, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9775Cal(calHandle, channelNames, value, coupling)
    ccall((:DAQmxAdjust9775Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, uInt32), calHandle, channelNames, value, coupling)
end

function DAQmxGet15110CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet15110CalAdjustPoints, NIDAQmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup15110Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup15110Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust15110Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust15110Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust15100Cal(calHandle, value)
    ccall((:DAQmxAdjust15100Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, value)
end

function DAQmxGet15200CalAdjustPoints(calHandle, powerCalibrationType, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet15200CalAdjustPoints, NIDAQmx), int32, (CalHandle, int32, Ptr{float64}, uInt32), calHandle, powerCalibrationType, adjustmentPoints, bufferSize)
end

function DAQmxSetup15200Cal(calHandle, channelNames, adjustmentPoint, powerCalibrationType)
    ccall((:DAQmxSetup15200Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, int32), calHandle, channelNames, adjustmentPoint, powerCalibrationType)
end

function DAQmxAdjust15200Cal(calHandle, channelNames, referenceValue, powerCalibrationType)
    ccall((:DAQmxAdjust15200Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, int32), calHandle, channelNames, referenceValue, powerCalibrationType)
end

function DAQmxSetup1102Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1102Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1102Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1102Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1104Cal(calHandle, channelName)
    ccall((:DAQmxSetup1104Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}), calHandle, channelName)
end

function DAQmxAdjust1104Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1104Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1112Cal(calHandle, channelName)
    ccall((:DAQmxSetup1112Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}), calHandle, channelName)
end

function DAQmxAdjust1112Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1112Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1122Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1122Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1122Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1122Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1124Cal(calHandle, channelName, range, dacValue)
    ccall((:DAQmxSetup1124Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, int32, uInt32), calHandle, channelName, range, dacValue)
end

function DAQmxAdjust1124Cal(calHandle, measOutput)
    ccall((:DAQmxAdjust1124Cal, NIDAQmx), int32, (CalHandle, float64), calHandle, measOutput)
end

function DAQmxSetup1125Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1125Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1125Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1125Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1126Cal(calHandle, channelName, upperFreqLimit)
    ccall((:DAQmxSetup1126Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, upperFreqLimit)
end

function DAQmxAdjust1126Cal(calHandle, refFreq, measOutput)
    ccall((:DAQmxAdjust1126Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refFreq, measOutput)
end

function DAQmxSetup1141Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1141Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1141Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1141Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1142Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1142Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1142Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1142Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1143Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1143Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1143Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1143Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1502Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1502Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1502Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1502Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1503Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1503Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1503Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1503Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxAdjust1503CurrentCal(calHandle, channelName, measCurrent)
    ccall((:DAQmxAdjust1503CurrentCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, measCurrent)
end

function DAQmxSetup1520Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1520Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1520Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1520Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1521Cal(calHandle, channelName)
    ccall((:DAQmxSetup1521Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}), calHandle, channelName)
end

function DAQmxAdjust1521Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1521Cal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup153xCal(calHandle, channelName, gain)
    ccall((:DAQmxSetup153xCal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust153xCal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust153xCal, NIDAQmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1540Cal(calHandle, channelName, excitationVoltage, excitationFreq)
    ccall((:DAQmxSetup1540Cal, NIDAQmx), int32, (CalHandle, Ptr{Cchar}, float64, float64), calHandle, channelName, excitationVoltage, excitationFreq)
end

function DAQmxAdjust1540Cal(calHandle, refVoltage, measOutput, inputCalSource)
    ccall((:DAQmxAdjust1540Cal, NIDAQmx), int32, (CalHandle, float64, float64, int32), calHandle, refVoltage, measOutput, inputCalSource)
end

function DAQmxConfigureTEDS(physicalChannel, filePath)
    ccall((:DAQmxConfigureTEDS, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}), physicalChannel, filePath)
end

function DAQmxClearTEDS(physicalChannel)
    ccall((:DAQmxClearTEDS, NIDAQmx), int32, (Ptr{Cchar},), physicalChannel)
end

function DAQmxWriteToTEDSFromArray(physicalChannel, bitStream, arraySize, basicTEDSOptions)
    ccall((:DAQmxWriteToTEDSFromArray, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt8}, uInt32, int32), physicalChannel, bitStream, arraySize, basicTEDSOptions)
end

function DAQmxWriteToTEDSFromFile(physicalChannel, filePath, basicTEDSOptions)
    ccall((:DAQmxWriteToTEDSFromFile, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, int32), physicalChannel, filePath, basicTEDSOptions)
end

function DAQmxWriteIDPinMemory(deviceName, idPinName, data, arraySize, formatCode)
    ccall((:DAQmxWriteIDPinMemory, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, Ptr{uInt8}, uInt32, uInt32), deviceName, idPinName, data, arraySize, formatCode)
end

function DAQmxReadIDPinMemory(deviceName, idPinName, data, arraySize, dataLengthRead, formatCode)
    ccall((:DAQmxReadIDPinMemory, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, Ptr{uInt8}, uInt32, Ptr{uInt32}, Ptr{uInt32}), deviceName, idPinName, data, arraySize, dataLengthRead, formatCode)
end

function DAQmxWaitForNextSampleClock(taskHandle, timeout, isLate)
    ccall((:DAQmxWaitForNextSampleClock, NIDAQmx), int32, (TaskHandle, float64, Ptr{bool32}), taskHandle, timeout, isLate)
end

function DAQmxResetRealTimeAttribute(taskHandle, attribute)
    ccall((:DAQmxResetRealTimeAttribute, NIDAQmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxIsReadOrWriteLate(errorCode)
    ccall((:DAQmxIsReadOrWriteLate, NIDAQmx), bool32, (int32,), errorCode)
end

function DAQmxSaveTask(taskHandle, saveAs, author, options)
    ccall((:DAQmxSaveTask, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, saveAs, author, options)
end

function DAQmxSaveGlobalChan(taskHandle, channelName, saveAs, author, options)
    ccall((:DAQmxSaveGlobalChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channelName, saveAs, author, options)
end

function DAQmxSaveScale(scaleName, saveAs, author, options)
    ccall((:DAQmxSaveScale, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, uInt32), scaleName, saveAs, author, options)
end

function DAQmxDeleteSavedTask(taskName)
    ccall((:DAQmxDeleteSavedTask, NIDAQmx), int32, (Ptr{Cchar},), taskName)
end

function DAQmxDeleteSavedGlobalChan(channelName)
    ccall((:DAQmxDeleteSavedGlobalChan, NIDAQmx), int32, (Ptr{Cchar},), channelName)
end

function DAQmxDeleteSavedScale(scaleName)
    ccall((:DAQmxDeleteSavedScale, NIDAQmx), int32, (Ptr{Cchar},), scaleName)
end

function DAQmxSetDigitalPowerUpStatesEx(channelNames, stateArray, arraySize)
    ccall((:DAQmxSetDigitalPowerUpStatesEx, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), channelNames, stateArray, arraySize)
end

function DAQmxGetDigitalPowerUpStatesEx(channelNames, stateArray, arraySizePtr)
    ccall((:DAQmxGetDigitalPowerUpStatesEx, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, Ptr{uInt32}), channelNames, stateArray, arraySizePtr)
end

function DAQmxSetDigitalPullUpPullDownStatesEx(channelNames, stateArray, arraySize)
    ccall((:DAQmxSetDigitalPullUpPullDownStatesEx, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), channelNames, stateArray, arraySize)
end

function DAQmxGetDigitalPullUpPullDownStatesEx(channelNames, stateArray, arraySizePtr)
    ccall((:DAQmxGetDigitalPullUpPullDownStatesEx, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, Ptr{uInt32}), channelNames, stateArray, arraySizePtr)
end

function DAQmxSetAnalogPowerUpStatesWithOutputType(channelNames, stateArray, channelTypeArray, arraySize)
    ccall((:DAQmxSetAnalogPowerUpStatesWithOutputType, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, Ptr{int32}, uInt32), channelNames, stateArray, channelTypeArray, arraySize)
end

function DAQmxGetAnalogPowerUpStatesWithOutputType(channelNames, stateArray, channelTypeArray, arraySizePtr)
    ccall((:DAQmxGetAnalogPowerUpStatesWithOutputType, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, Ptr{int32}, Ptr{uInt32}), channelNames, stateArray, channelTypeArray, arraySizePtr)
end

function DAQmxSetDigitalLogicFamilyPowerUpState(deviceName, logicFamily)
    ccall((:DAQmxSetDigitalLogicFamilyPowerUpState, NIDAQmx), int32, (Ptr{Cchar}, int32), deviceName, logicFamily)
end

function DAQmxGetDigitalLogicFamilyPowerUpState(deviceName, logicFamily)
    ccall((:DAQmxGetDigitalLogicFamilyPowerUpState, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), deviceName, logicFamily)
end

function DAQmxAddNetworkDevice(IPAddress, deviceName, attemptReservation, timeout, deviceNameOut, deviceNameOutBufferSize)
    ccall((:DAQmxAddNetworkDevice, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, bool32, float64, Ptr{Cchar}, uInt32), IPAddress, deviceName, attemptReservation, timeout, deviceNameOut, deviceNameOutBufferSize)
end

function DAQmxDeleteNetworkDevice(deviceName)
    ccall((:DAQmxDeleteNetworkDevice, NIDAQmx), int32, (Ptr{Cchar},), deviceName)
end

function DAQmxReserveNetworkDevice(deviceName, overrideReservation)
    ccall((:DAQmxReserveNetworkDevice, NIDAQmx), int32, (Ptr{Cchar}, bool32), deviceName, overrideReservation)
end

function DAQmxUnreserveNetworkDevice(deviceName)
    ccall((:DAQmxUnreserveNetworkDevice, NIDAQmx), int32, (Ptr{Cchar},), deviceName)
end

function DAQmxAutoConfigureCDAQSyncConnections(chassisDevicesPorts, timeout)
    ccall((:DAQmxAutoConfigureCDAQSyncConnections, NIDAQmx), int32, (Ptr{Cchar}, float64), chassisDevicesPorts, timeout)
end

function DAQmxGetAutoConfiguredCDAQSyncConnections(portList, portListSize)
    ccall((:DAQmxGetAutoConfiguredCDAQSyncConnections, NIDAQmx), int32, (Ptr{Cchar}, uInt32), portList, portListSize)
end

function DAQmxAreConfiguredCDAQSyncPortsDisconnected(chassisDevicesPorts, timeout, disconnectedPortsExist)
    ccall((:DAQmxAreConfiguredCDAQSyncPortsDisconnected, NIDAQmx), int32, (Ptr{Cchar}, float64, Ptr{bool32}), chassisDevicesPorts, timeout, disconnectedPortsExist)
end

function DAQmxGetDisconnectedCDAQSyncPorts(portList, portListSize)
    ccall((:DAQmxGetDisconnectedCDAQSyncPorts, NIDAQmx), int32, (Ptr{Cchar}, uInt32), portList, portListSize)
end

function DAQmxAddCDAQSyncConnection(portList)
    ccall((:DAQmxAddCDAQSyncConnection, NIDAQmx), int32, (Ptr{Cchar},), portList)
end

function DAQmxRemoveCDAQSyncConnection(portList)
    ccall((:DAQmxRemoveCDAQSyncConnection, NIDAQmx), int32, (Ptr{Cchar},), portList)
end

function DAQmxGetErrorString(errorCode, errorString, bufferSize)
    ccall((:DAQmxGetErrorString, NIDAQmx), int32, (int32, Ptr{Cchar}, uInt32), errorCode, errorString, bufferSize)
end

function DAQmxGetExtendedErrorInfo(errorString, bufferSize)
    ccall((:DAQmxGetExtendedErrorInfo, NIDAQmx), int32, (Ptr{Cchar}, uInt32), errorString, bufferSize)
end

function DAQmxGetBufInputBufSize(taskHandle, data)
    ccall((:DAQmxGetBufInputBufSize, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetBufInputBufSize(taskHandle, data)
    ccall((:DAQmxSetBufInputBufSize, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetBufInputBufSize(taskHandle)
    ccall((:DAQmxResetBufInputBufSize, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetBufInputOnbrdBufSize(taskHandle, data)
    ccall((:DAQmxGetBufInputOnbrdBufSize, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetBufOutputBufSize(taskHandle, data)
    ccall((:DAQmxGetBufOutputBufSize, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetBufOutputBufSize(taskHandle, data)
    ccall((:DAQmxSetBufOutputBufSize, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetBufOutputBufSize(taskHandle)
    ccall((:DAQmxResetBufOutputBufSize, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetBufOutputOnbrdBufSize(taskHandle, data)
    ccall((:DAQmxGetBufOutputOnbrdBufSize, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetBufOutputOnbrdBufSize(taskHandle, data)
    ccall((:DAQmxSetBufOutputOnbrdBufSize, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetBufOutputOnbrdBufSize(taskHandle)
    ccall((:DAQmxResetBufOutputOnbrdBufSize, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSelfCalSupported(deviceName, data)
    ccall((:DAQmxGetSelfCalSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), deviceName, data)
end

function DAQmxGetSelfCalLastTemp(deviceName, data)
    ccall((:DAQmxGetSelfCalLastTemp, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), deviceName, data)
end

function DAQmxGetExtCalRecommendedInterval(deviceName, data)
    ccall((:DAQmxGetExtCalRecommendedInterval, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetExtCalLastTemp(deviceName, data)
    ccall((:DAQmxGetExtCalLastTemp, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), deviceName, data)
end

function DAQmxGetCalUserDefinedInfo(deviceName, data, bufferSize)
    ccall((:DAQmxGetCalUserDefinedInfo, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), deviceName, data, bufferSize)
end

function DAQmxSetCalUserDefinedInfo(deviceName, data)
    ccall((:DAQmxSetCalUserDefinedInfo, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}), deviceName, data)
end

function DAQmxGetCalUserDefinedInfoMaxSize(deviceName, data)
    ccall((:DAQmxGetCalUserDefinedInfoMaxSize, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetCalDevTemp(deviceName, data)
    ccall((:DAQmxGetCalDevTemp, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), deviceName, data)
end

function DAQmxGetCalAccConnectionCount(deviceName, data)
    ccall((:DAQmxGetCalAccConnectionCount, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), deviceName, data)
end

function DAQmxSetCalAccConnectionCount(deviceName, data)
    ccall((:DAQmxSetCalAccConnectionCount, NIDAQmx), int32, (Ptr{Cchar}, uInt32), deviceName, data)
end

function DAQmxGetCalRecommendedAccConnectionCountLimit(deviceName, data)
    ccall((:DAQmxGetCalRecommendedAccConnectionCountLimit, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetAIMax(taskHandle, channel, data)
    ccall((:DAQmxGetAIMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIMax(taskHandle, channel, data)
    ccall((:DAQmxSetAIMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIMax(taskHandle, channel)
    ccall((:DAQmxResetAIMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIMin(taskHandle, channel, data)
    ccall((:DAQmxGetAIMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIMin(taskHandle, channel, data)
    ccall((:DAQmxSetAIMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIMin(taskHandle, channel)
    ccall((:DAQmxResetAIMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAICustomScaleName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAICustomScaleName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAICustomScaleName(taskHandle, channel, data)
    ccall((:DAQmxSetAICustomScaleName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetAICustomScaleName(taskHandle, channel)
    ccall((:DAQmxResetAICustomScaleName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIMeasType(taskHandle, channel, data)
    ccall((:DAQmxGetAIMeasType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIVoltageUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIVoltageUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIVoltageUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIVoltageUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIVoltageUnits(taskHandle, channel)
    ccall((:DAQmxResetAIVoltageUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIVoltagedBRef(taskHandle, channel, data)
    ccall((:DAQmxGetAIVoltagedBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIVoltagedBRef(taskHandle, channel, data)
    ccall((:DAQmxSetAIVoltagedBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIVoltagedBRef(taskHandle, channel)
    ccall((:DAQmxResetAIVoltagedBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIVoltageACRMSUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIVoltageACRMSUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIVoltageACRMSUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIVoltageACRMSUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIVoltageACRMSUnits(taskHandle, channel)
    ccall((:DAQmxResetAIVoltageACRMSUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAITempUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAITempUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAITempUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAITempUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAITempUnits(taskHandle, channel)
    ccall((:DAQmxResetAITempUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIThrmcplType(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIThrmcplType(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmcplType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIThrmcplType(taskHandle, channel)
    ccall((:DAQmxResetAIThrmcplType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIThrmcplScaleType(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplScaleType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIThrmcplScaleType(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmcplScaleType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIThrmcplScaleType(taskHandle, channel)
    ccall((:DAQmxResetAIThrmcplScaleType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIThrmcplCJCSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplCJCSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIThrmcplCJCVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplCJCVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmcplCJCVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmcplCJCVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmcplCJCVal(taskHandle, channel)
    ccall((:DAQmxResetAIThrmcplCJCVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIThrmcplCJCChan(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIThrmcplCJCChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxGetAIRTDType(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRTDType(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRTDType(taskHandle, channel)
    ccall((:DAQmxResetAIRTDType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRTDR0(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDR0, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRTDR0(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDR0, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRTDR0(taskHandle, channel)
    ccall((:DAQmxResetAIRTDR0, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRTDA(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDA, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRTDA(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDA, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRTDA(taskHandle, channel)
    ccall((:DAQmxResetAIRTDA, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRTDB(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDB, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRTDB(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDB, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRTDB(taskHandle, channel)
    ccall((:DAQmxResetAIRTDB, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRTDC(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDC, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRTDC(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDC, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRTDC(taskHandle, channel)
    ccall((:DAQmxResetAIRTDC, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIThrmstrA(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmstrA, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmstrA(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmstrA, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmstrA(taskHandle, channel)
    ccall((:DAQmxResetAIThrmstrA, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIThrmstrB(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmstrB, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmstrB(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmstrB, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmstrB(taskHandle, channel)
    ccall((:DAQmxResetAIThrmstrB, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIThrmstrC(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmstrC, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmstrC(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmstrC, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmstrC(taskHandle, channel)
    ccall((:DAQmxResetAIThrmstrC, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIThrmstrR1(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmstrR1, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmstrR1(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmstrR1, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmstrR1(taskHandle, channel)
    ccall((:DAQmxResetAIThrmstrR1, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIForceReadFromChan(taskHandle, channel, data)
    ccall((:DAQmxGetAIForceReadFromChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIForceReadFromChan(taskHandle, channel, data)
    ccall((:DAQmxSetAIForceReadFromChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIForceReadFromChan(taskHandle, channel)
    ccall((:DAQmxResetAIForceReadFromChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAICurrentUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAICurrentUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAICurrentUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAICurrentUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAICurrentUnits(taskHandle, channel)
    ccall((:DAQmxResetAICurrentUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAICurrentACRMSUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAICurrentACRMSUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAICurrentACRMSUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAICurrentACRMSUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAICurrentACRMSUnits(taskHandle, channel)
    ccall((:DAQmxResetAICurrentACRMSUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIStrainUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIStrainUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIStrainUnits(taskHandle, channel)
    ccall((:DAQmxResetAIStrainUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIStrainGageForceReadFromChan(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainGageForceReadFromChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIStrainGageForceReadFromChan(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainGageForceReadFromChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIStrainGageForceReadFromChan(taskHandle, channel)
    ccall((:DAQmxResetAIStrainGageForceReadFromChan, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIStrainGageGageFactor(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainGageGageFactor, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIStrainGageGageFactor(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainGageGageFactor, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIStrainGageGageFactor(taskHandle, channel)
    ccall((:DAQmxResetAIStrainGageGageFactor, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIStrainGagePoissonRatio(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainGagePoissonRatio, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIStrainGagePoissonRatio(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainGagePoissonRatio, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIStrainGagePoissonRatio(taskHandle, channel)
    ccall((:DAQmxResetAIStrainGagePoissonRatio, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIStrainGageCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainGageCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIStrainGageCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainGageCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIStrainGageCfg(taskHandle, channel)
    ccall((:DAQmxResetAIStrainGageCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRosetteStrainGageRosetteType(taskHandle, channel, data)
    ccall((:DAQmxGetAIRosetteStrainGageRosetteType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIRosetteStrainGageOrientation(taskHandle, channel, data)
    ccall((:DAQmxGetAIRosetteStrainGageOrientation, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRosetteStrainGageOrientation(taskHandle, channel, data)
    ccall((:DAQmxSetAIRosetteStrainGageOrientation, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRosetteStrainGageOrientation(taskHandle, channel)
    ccall((:DAQmxResetAIRosetteStrainGageOrientation, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRosetteStrainGageStrainChans(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIRosetteStrainGageStrainChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxGetAIRosetteStrainGageRosetteMeasType(taskHandle, channel, data)
    ccall((:DAQmxGetAIRosetteStrainGageRosetteMeasType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRosetteStrainGageRosetteMeasType(taskHandle, channel, data)
    ccall((:DAQmxSetAIRosetteStrainGageRosetteMeasType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRosetteStrainGageRosetteMeasType(taskHandle, channel)
    ccall((:DAQmxResetAIRosetteStrainGageRosetteMeasType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIResistanceUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIResistanceUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIResistanceUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIResistanceUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIResistanceUnits(taskHandle, channel)
    ccall((:DAQmxResetAIResistanceUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIFreqUnits(taskHandle, channel)
    ccall((:DAQmxResetAIFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIFreqThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetAIFreqThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIFreqThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetAIFreqThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIFreqThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetAIFreqThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIFreqHyst(taskHandle, channel, data)
    ccall((:DAQmxGetAIFreqHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIFreqHyst(taskHandle, channel, data)
    ccall((:DAQmxSetAIFreqHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIFreqHyst(taskHandle, channel)
    ccall((:DAQmxResetAIFreqHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILVDTUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAILVDTUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAILVDTUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAILVDTUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAILVDTUnits(taskHandle, channel)
    ccall((:DAQmxResetAILVDTUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILVDTSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAILVDTSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAILVDTSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAILVDTSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAILVDTSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAILVDTSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILVDTSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAILVDTSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAILVDTSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAILVDTSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAILVDTSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAILVDTSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRVDTUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIRVDTUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRVDTUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIRVDTUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRVDTUnits(taskHandle, channel)
    ccall((:DAQmxResetAIRVDTUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRVDTSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIRVDTSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRVDTSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIRVDTSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRVDTSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIRVDTSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRVDTSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIRVDTSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRVDTSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIRVDTSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRVDTSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIRVDTSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIEddyCurrentProxProbeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIEddyCurrentProxProbeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIEddyCurrentProxProbeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIEddyCurrentProxProbeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIEddyCurrentProxProbeUnits(taskHandle, channel)
    ccall((:DAQmxResetAIEddyCurrentProxProbeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIEddyCurrentProxProbeSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIEddyCurrentProxProbeSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIEddyCurrentProxProbeSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIEddyCurrentProxProbeSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIEddyCurrentProxProbeSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIEddyCurrentProxProbeSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIPowerUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIPowerUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIPowerUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIPowerUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIPowerUnits(taskHandle, channel)
    ccall((:DAQmxResetAIPowerUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAICalculatedPowerVoltageMax(taskHandle, channel, data)
    ccall((:DAQmxGetAICalculatedPowerVoltageMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAICalculatedPowerVoltageMax(taskHandle, channel, data)
    ccall((:DAQmxSetAICalculatedPowerVoltageMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAICalculatedPowerVoltageMax(taskHandle, channel)
    ccall((:DAQmxResetAICalculatedPowerVoltageMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAICalculatedPowerVoltageMin(taskHandle, channel, data)
    ccall((:DAQmxGetAICalculatedPowerVoltageMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAICalculatedPowerVoltageMin(taskHandle, channel, data)
    ccall((:DAQmxSetAICalculatedPowerVoltageMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAICalculatedPowerVoltageMin(taskHandle, channel)
    ccall((:DAQmxResetAICalculatedPowerVoltageMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAICalculatedPowerCurrentMax(taskHandle, channel, data)
    ccall((:DAQmxGetAICalculatedPowerCurrentMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAICalculatedPowerCurrentMax(taskHandle, channel, data)
    ccall((:DAQmxSetAICalculatedPowerCurrentMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAICalculatedPowerCurrentMax(taskHandle, channel)
    ccall((:DAQmxResetAICalculatedPowerCurrentMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAICalculatedPowerCurrentMin(taskHandle, channel, data)
    ccall((:DAQmxGetAICalculatedPowerCurrentMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAICalculatedPowerCurrentMin(taskHandle, channel, data)
    ccall((:DAQmxSetAICalculatedPowerCurrentMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAICalculatedPowerCurrentMin(taskHandle, channel)
    ccall((:DAQmxResetAICalculatedPowerCurrentMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAISoundPressureMaxSoundPressureLvl(taskHandle, channel, data)
    ccall((:DAQmxGetAISoundPressureMaxSoundPressureLvl, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAISoundPressureMaxSoundPressureLvl(taskHandle, channel, data)
    ccall((:DAQmxSetAISoundPressureMaxSoundPressureLvl, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAISoundPressureMaxSoundPressureLvl(taskHandle, channel)
    ccall((:DAQmxResetAISoundPressureMaxSoundPressureLvl, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAISoundPressureUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAISoundPressureUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAISoundPressureUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAISoundPressureUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAISoundPressureUnits(taskHandle, channel)
    ccall((:DAQmxResetAISoundPressureUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAISoundPressuredBRef(taskHandle, channel, data)
    ccall((:DAQmxGetAISoundPressuredBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAISoundPressuredBRef(taskHandle, channel, data)
    ccall((:DAQmxSetAISoundPressuredBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAISoundPressuredBRef(taskHandle, channel)
    ccall((:DAQmxResetAISoundPressuredBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIMicrophoneSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIMicrophoneSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIMicrophoneSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIMicrophoneSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIMicrophoneSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIMicrophoneSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAccelUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAccelUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAccelUnits(taskHandle, channel)
    ccall((:DAQmxResetAIAccelUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAcceldBRef(taskHandle, channel, data)
    ccall((:DAQmxGetAIAcceldBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAcceldBRef(taskHandle, channel, data)
    ccall((:DAQmxSetAIAcceldBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAcceldBRef(taskHandle, channel)
    ccall((:DAQmxResetAIAcceldBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAccel4WireDCVoltageSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAccel4WireDCVoltageSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAccel4WireDCVoltageSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAccel4WireDCVoltageSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAccel4WireDCVoltageSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAccel4WireDCVoltageSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAccelSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAccelSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAccelSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIAccelSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAccelSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAccelSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAccelSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIAccelSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAccelChargeSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelChargeSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAccelChargeSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelChargeSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAccelChargeSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIAccelChargeSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAccelChargeSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelChargeSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAccelChargeSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelChargeSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAccelChargeSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIAccelChargeSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIVelocityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIVelocityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIVelocityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIVelocityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIVelocityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIVelocityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIVelocityIEPESensordBRef(taskHandle, channel, data)
    ccall((:DAQmxGetAIVelocityIEPESensordBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIVelocityIEPESensordBRef(taskHandle, channel, data)
    ccall((:DAQmxSetAIVelocityIEPESensordBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIVelocityIEPESensordBRef(taskHandle, channel)
    ccall((:DAQmxResetAIVelocityIEPESensordBRef, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIVelocityIEPESensorSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIVelocityIEPESensorSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIVelocityIEPESensorSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIVelocityIEPESensorSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIVelocityIEPESensorSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIVelocityIEPESensorSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIForceUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIForceUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIForceUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIForceUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIForceUnits(taskHandle, channel)
    ccall((:DAQmxResetAIForceUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIForceIEPESensorSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIForceIEPESensorSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIForceIEPESensorSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIForceIEPESensorSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIForceIEPESensorSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIForceIEPESensorSensitivity, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIForceIEPESensorSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIForceIEPESensorSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIForceIEPESensorSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIForceIEPESensorSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIForceIEPESensorSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIForceIEPESensorSensitivityUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIPressureUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIPressureUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIPressureUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIPressureUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIPressureUnits(taskHandle, channel)
    ccall((:DAQmxResetAIPressureUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAITorqueUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAITorqueUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAITorqueUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAITorqueUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAITorqueUnits(taskHandle, channel)
    ccall((:DAQmxResetAITorqueUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeUnits(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeElectricalUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeElectricalUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeElectricalUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeElectricalUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeElectricalUnits(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeElectricalUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgePhysicalUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgePhysicalUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgePhysicalUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgePhysicalUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgePhysicalUnits(taskHandle, channel)
    ccall((:DAQmxResetAIBridgePhysicalUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeScaleType(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeScaleType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeScaleType(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeScaleType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeScaleType(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeScaleType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeTwoPointLinFirstElectricalVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstElectricalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeTwoPointLinFirstElectricalVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstElectricalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeTwoPointLinFirstElectricalVal(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstElectricalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeTwoPointLinSecondElectricalVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondElectricalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeTwoPointLinSecondElectricalVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeTwoPointLinSecondElectricalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeTwoPointLinSecondElectricalVal(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTwoPointLinSecondElectricalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeTableElectricalVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIBridgeTableElectricalVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIBridgeTableElectricalVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIBridgeTableElectricalVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIBridgeTableElectricalVals(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTableElectricalVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeTablePhysicalVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIBridgeTablePhysicalVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIBridgeTablePhysicalVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIBridgeTablePhysicalVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIBridgeTablePhysicalVals(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTablePhysicalVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgePolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIBridgePolyForwardCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIBridgePolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIBridgePolyForwardCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIBridgePolyForwardCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIBridgePolyForwardCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgePolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIBridgePolyReverseCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIBridgePolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIBridgePolyReverseCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIBridgePolyReverseCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIBridgePolyReverseCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChargeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIChargeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIChargeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIChargeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIChargeUnits(taskHandle, channel)
    ccall((:DAQmxResetAIChargeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIIsTEDS(taskHandle, channel, data)
    ccall((:DAQmxGetAIIsTEDS, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetAITEDSUnits(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAITEDSUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxGetAICoupling(taskHandle, channel, data)
    ccall((:DAQmxGetAICoupling, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAICoupling(taskHandle, channel, data)
    ccall((:DAQmxSetAICoupling, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAICoupling(taskHandle, channel)
    ccall((:DAQmxResetAICoupling, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIImpedance(taskHandle, channel, data)
    ccall((:DAQmxGetAIImpedance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIImpedance(taskHandle, channel, data)
    ccall((:DAQmxSetAIImpedance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIImpedance(taskHandle, channel)
    ccall((:DAQmxResetAIImpedance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAITermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAITermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAITermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAITermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAITermCfg(taskHandle, channel)
    ccall((:DAQmxResetAITermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIInputSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIInputSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAIInputSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAIInputSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetAIInputSrc(taskHandle, channel)
    ccall((:DAQmxResetAIInputSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIResistanceCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAIResistanceCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIResistanceCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAIResistanceCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIResistanceCfg(taskHandle, channel)
    ccall((:DAQmxResetAIResistanceCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILeadWireResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAILeadWireResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAILeadWireResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAILeadWireResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAILeadWireResistance(taskHandle, channel)
    ccall((:DAQmxResetAILeadWireResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeCfg(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeNomResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeNomResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeNomResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeNomResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeNomResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeNomResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeInitialVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeInitialVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeInitialVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeInitialVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeInitialVoltage(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeInitialVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeInitialRatio(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeInitialRatio, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeInitialRatio(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeInitialRatio, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeInitialRatio(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeInitialRatio, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalEnable(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalSelect(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalSelect, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalSelect(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalSelect, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalSelect(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalSelect, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalASrc(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalASrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalASrc(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalASrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalASrc(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalASrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalGainAdjust(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalGainAdjust, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalGainAdjust(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalGainAdjust, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalGainAdjust(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalGainAdjust, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalAResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalAResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalAResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalAActualResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAActualResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalAActualResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAActualResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalAActualResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAActualResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalBResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalBResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalBResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalBActualResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBActualResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalBActualResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBActualResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalBActualResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBActualResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeBalanceCoarsePot(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeBalanceCoarsePot, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeBalanceCoarsePot(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeBalanceCoarsePot, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeBalanceCoarsePot(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeBalanceCoarsePot, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIBridgeBalanceFinePot(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeBalanceFinePot, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeBalanceFinePot(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeBalanceFinePot, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeBalanceFinePot(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeBalanceFinePot, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAICurrentShuntLoc(taskHandle, channel, data)
    ccall((:DAQmxGetAICurrentShuntLoc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAICurrentShuntLoc(taskHandle, channel, data)
    ccall((:DAQmxSetAICurrentShuntLoc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAICurrentShuntLoc(taskHandle, channel)
    ccall((:DAQmxResetAICurrentShuntLoc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAICurrentShuntResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAICurrentShuntResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAICurrentShuntResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAICurrentShuntResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAICurrentShuntResistance(taskHandle, channel)
    ccall((:DAQmxResetAICurrentShuntResistance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIExcitSense(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitSense, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitSense(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitSense, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitSense(taskHandle, channel)
    ccall((:DAQmxResetAIExcitSense, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIExcitSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitSrc(taskHandle, channel)
    ccall((:DAQmxResetAIExcitSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIExcitVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIExcitVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIExcitVal(taskHandle, channel)
    ccall((:DAQmxResetAIExcitVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIExcitUseForScaling(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitUseForScaling, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitUseForScaling(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitUseForScaling, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIExcitUseForScaling(taskHandle, channel)
    ccall((:DAQmxResetAIExcitUseForScaling, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIExcitUseMultiplexed(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitUseMultiplexed, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitUseMultiplexed(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitUseMultiplexed, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIExcitUseMultiplexed(taskHandle, channel)
    ccall((:DAQmxResetAIExcitUseMultiplexed, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIExcitActualVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitActualVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIExcitActualVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitActualVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIExcitActualVal(taskHandle, channel)
    ccall((:DAQmxResetAIExcitActualVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIExcitDCorAC(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitDCorAC, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitDCorAC(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitDCorAC, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitDCorAC(taskHandle, channel)
    ccall((:DAQmxResetAIExcitDCorAC, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIExcitVoltageOrCurrent(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitVoltageOrCurrent, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitVoltageOrCurrent(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitVoltageOrCurrent, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitVoltageOrCurrent(taskHandle, channel)
    ccall((:DAQmxResetAIExcitVoltageOrCurrent, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIExcitIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitIdleOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitIdleOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitIdleOutputBehavior(taskHandle, channel)
    ccall((:DAQmxResetAIExcitIdleOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIACExcitFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIACExcitFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIACExcitFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIACExcitFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIACExcitFreq(taskHandle, channel)
    ccall((:DAQmxResetAIACExcitFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIACExcitSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIACExcitSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIACExcitSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIACExcitSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIACExcitSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetAIACExcitSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIACExcitWireMode(taskHandle, channel, data)
    ccall((:DAQmxGetAIACExcitWireMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIACExcitWireMode(taskHandle, channel, data)
    ccall((:DAQmxSetAIACExcitWireMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIACExcitWireMode(taskHandle, channel)
    ccall((:DAQmxResetAIACExcitWireMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAISensorPowerVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetAISensorPowerVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAISensorPowerVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetAISensorPowerVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAISensorPowerVoltage(taskHandle, channel)
    ccall((:DAQmxResetAISensorPowerVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAISensorPowerCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAISensorPowerCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAISensorPowerCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAISensorPowerCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAISensorPowerCfg(taskHandle, channel)
    ccall((:DAQmxResetAISensorPowerCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAISensorPowerType(taskHandle, channel, data)
    ccall((:DAQmxGetAISensorPowerType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAISensorPowerType(taskHandle, channel, data)
    ccall((:DAQmxSetAISensorPowerType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAISensorPowerType(taskHandle, channel)
    ccall((:DAQmxResetAISensorPowerType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIOpenThrmcplDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIOpenThrmcplDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIOpenThrmcplDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIOpenThrmcplDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIOpenThrmcplDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIOpenThrmcplDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIThrmcplLeadOffsetVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplLeadOffsetVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmcplLeadOffsetVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmcplLeadOffsetVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmcplLeadOffsetVoltage(taskHandle, channel)
    ccall((:DAQmxResetAIThrmcplLeadOffsetVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAtten(taskHandle, channel, data)
    ccall((:DAQmxGetAIAtten, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAtten(taskHandle, channel, data)
    ccall((:DAQmxSetAIAtten, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAtten(taskHandle, channel)
    ccall((:DAQmxResetAIAtten, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIProbeAtten(taskHandle, channel, data)
    ccall((:DAQmxGetAIProbeAtten, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIProbeAtten(taskHandle, channel, data)
    ccall((:DAQmxSetAIProbeAtten, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIProbeAtten(taskHandle, channel)
    ccall((:DAQmxResetAIProbeAtten, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILowpassEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAILowpassEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAILowpassEnable(taskHandle, channel)
    ccall((:DAQmxResetAILowpassEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILowpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassCutoffFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAILowpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassCutoffFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAILowpassCutoffFreq(taskHandle, channel)
    ccall((:DAQmxResetAILowpassCutoffFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILowpassSwitchCapClkSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassSwitchCapClkSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAILowpassSwitchCapClkSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassSwitchCapClkSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAILowpassSwitchCapClkSrc(taskHandle, channel)
    ccall((:DAQmxResetAILowpassSwitchCapClkSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILowpassSwitchCapExtClkFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassSwitchCapExtClkFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAILowpassSwitchCapExtClkFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassSwitchCapExtClkFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAILowpassSwitchCapExtClkFreq(taskHandle, channel)
    ccall((:DAQmxResetAILowpassSwitchCapExtClkFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILowpassSwitchCapExtClkDiv(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassSwitchCapExtClkDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAILowpassSwitchCapExtClkDiv(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassSwitchCapExtClkDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAILowpassSwitchCapExtClkDiv(taskHandle, channel)
    ccall((:DAQmxResetAILowpassSwitchCapExtClkDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILowpassSwitchCapOutClkDiv(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassSwitchCapOutClkDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAILowpassSwitchCapOutClkDiv(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassSwitchCapOutClkDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAILowpassSwitchCapOutClkDiv(taskHandle, channel)
    ccall((:DAQmxResetAILowpassSwitchCapOutClkDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrType(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrType(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrType(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrResponse(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrResponse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrResponse(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrResponse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrResponse(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrResponse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrOrder(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrOrder, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrOrder(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrOrder, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrOrder(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrOrder, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrLowpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrLowpassCutoffFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrLowpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrLowpassCutoffFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrLowpassCutoffFreq(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrLowpassCutoffFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrHighpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrHighpassCutoffFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrHighpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrHighpassCutoffFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrHighpassCutoffFreq(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrHighpassCutoffFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrBandpassCenterFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrBandpassCenterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrBandpassCenterFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrBandpassCenterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrBandpassCenterFreq(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrBandpassCenterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrBandpassWidth(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrBandpassWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrBandpassWidth(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrBandpassWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrBandpassWidth(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrBandpassWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrNotchCenterFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrNotchCenterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrNotchCenterFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrNotchCenterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrNotchCenterFreq(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrNotchCenterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrNotchWidth(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrNotchWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrNotchWidth(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrNotchWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrNotchWidth(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrNotchWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDigFltrCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIDigFltrCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIDigFltrCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIDigFltrCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIDigFltrCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIFilterEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIFilterEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIFilterEnable(taskHandle, channel)
    ccall((:DAQmxResetAIFilterEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIFilterFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIFilterFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIFilterFreq(taskHandle, channel)
    ccall((:DAQmxResetAIFilterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIFilterResponse(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterResponse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIFilterResponse(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterResponse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIFilterResponse(taskHandle, channel)
    ccall((:DAQmxResetAIFilterResponse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIFilterOrder(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterOrder, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIFilterOrder(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterOrder, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIFilterOrder(taskHandle, channel)
    ccall((:DAQmxResetAIFilterOrder, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxGetAIFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIFilterDelayUnits(taskHandle, channel)
    ccall((:DAQmxResetAIFilterDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRemoveFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxGetAIRemoveFilterDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIRemoveFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxSetAIRemoveFilterDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIRemoveFilterDelay(taskHandle, channel)
    ccall((:DAQmxResetAIRemoveFilterDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIFilterDelayAdjustment(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterDelayAdjustment, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIFilterDelayAdjustment(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterDelayAdjustment, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIFilterDelayAdjustment(taskHandle, channel)
    ccall((:DAQmxResetAIFilterDelayAdjustment, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAveragingWinSize(taskHandle, channel, data)
    ccall((:DAQmxGetAIAveragingWinSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIAveragingWinSize(taskHandle, channel, data)
    ccall((:DAQmxSetAIAveragingWinSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIAveragingWinSize(taskHandle, channel)
    ccall((:DAQmxResetAIAveragingWinSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIResolutionUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIResolutionUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIResolution(taskHandle, channel, data)
    ccall((:DAQmxGetAIResolution, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxGetAIRawSampSize(taskHandle, channel, data)
    ccall((:DAQmxGetAIRawSampSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetAIRawSampJustification(taskHandle, channel, data)
    ccall((:DAQmxGetAIRawSampJustification, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIADCTimingMode(taskHandle, channel, data)
    ccall((:DAQmxGetAIADCTimingMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIADCTimingMode(taskHandle, channel, data)
    ccall((:DAQmxSetAIADCTimingMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIADCTimingMode(taskHandle, channel)
    ccall((:DAQmxResetAIADCTimingMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIADCCustomTimingMode(taskHandle, channel, data)
    ccall((:DAQmxGetAIADCCustomTimingMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIADCCustomTimingMode(taskHandle, channel, data)
    ccall((:DAQmxSetAIADCCustomTimingMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIADCCustomTimingMode(taskHandle, channel)
    ccall((:DAQmxResetAIADCCustomTimingMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDitherEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIDitherEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIDitherEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIDitherEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIDitherEnable(taskHandle, channel)
    ccall((:DAQmxResetAIDitherEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalHasValidCalInfo(taskHandle, channel, data)
    ccall((:DAQmxGetAIChanCalHasValidCalInfo, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetAIChanCalEnableCal(taskHandle, channel, data)
    ccall((:DAQmxGetAIChanCalEnableCal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIChanCalEnableCal(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalEnableCal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIChanCalEnableCal(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalEnableCal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalApplyCalIfExp(taskHandle, channel, data)
    ccall((:DAQmxGetAIChanCalApplyCalIfExp, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIChanCalApplyCalIfExp(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalApplyCalIfExp, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIChanCalApplyCalIfExp(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalApplyCalIfExp, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalScaleType(taskHandle, channel, data)
    ccall((:DAQmxGetAIChanCalScaleType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIChanCalScaleType(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalScaleType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIChanCalScaleType(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalScaleType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalTablePreScaledVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalTablePreScaledVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalTablePreScaledVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalTablePreScaledVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalTablePreScaledVals(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalTablePreScaledVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalTableScaledVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalTableScaledVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalTableScaledVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalTableScaledVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalTableScaledVals(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalTableScaledVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalPolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalPolyForwardCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalPolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalPolyForwardCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalPolyForwardCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalPolyForwardCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalPolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalPolyReverseCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalPolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalPolyReverseCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalPolyReverseCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalPolyReverseCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalOperatorName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIChanCalOperatorName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAIChanCalOperatorName(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalOperatorName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetAIChanCalOperatorName(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalOperatorName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalDesc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIChanCalDesc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAIChanCalDesc(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalDesc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetAIChanCalDesc(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalDesc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalVerifRefVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalVerifRefVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalVerifRefVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalVerifRefVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalVerifRefVals(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalVerifRefVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChanCalVerifAcqVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalVerifAcqVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalVerifAcqVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalVerifAcqVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalVerifAcqVals(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalVerifAcqVals, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRngHigh(taskHandle, channel, data)
    ccall((:DAQmxGetAIRngHigh, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRngHigh(taskHandle, channel, data)
    ccall((:DAQmxSetAIRngHigh, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRngHigh(taskHandle, channel)
    ccall((:DAQmxResetAIRngHigh, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRngLow(taskHandle, channel, data)
    ccall((:DAQmxGetAIRngLow, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRngLow(taskHandle, channel, data)
    ccall((:DAQmxSetAIRngLow, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRngLow(taskHandle, channel)
    ccall((:DAQmxResetAIRngLow, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDCOffset(taskHandle, channel, data)
    ccall((:DAQmxGetAIDCOffset, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDCOffset(taskHandle, channel, data)
    ccall((:DAQmxSetAIDCOffset, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDCOffset(taskHandle, channel)
    ccall((:DAQmxResetAIDCOffset, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIGain(taskHandle, channel, data)
    ccall((:DAQmxGetAIGain, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIGain(taskHandle, channel, data)
    ccall((:DAQmxSetAIGain, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIGain(taskHandle, channel)
    ccall((:DAQmxResetAIGain, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAISampAndHoldEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAISampAndHoldEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAISampAndHoldEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAISampAndHoldEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAISampAndHoldEnable(taskHandle, channel)
    ccall((:DAQmxResetAISampAndHoldEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIAutoZeroMode(taskHandle, channel, data)
    ccall((:DAQmxGetAIAutoZeroMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAutoZeroMode(taskHandle, channel, data)
    ccall((:DAQmxSetAIAutoZeroMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAutoZeroMode(taskHandle, channel)
    ccall((:DAQmxResetAIAutoZeroMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIChopEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIChopEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIChopEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIChopEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIChopEnable(taskHandle, channel)
    ccall((:DAQmxResetAIChopEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDataXferMaxRate(taskHandle, channel, data)
    ccall((:DAQmxGetAIDataXferMaxRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDataXferMaxRate(taskHandle, channel, data)
    ccall((:DAQmxSetAIDataXferMaxRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDataXferMaxRate(taskHandle, channel)
    ccall((:DAQmxResetAIDataXferMaxRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetAIDataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetAIDataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIDataXferMech(taskHandle, channel)
    ccall((:DAQmxResetAIDataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetAIDataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetAIDataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIDataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetAIDataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDataXferCustomThreshold(taskHandle, channel, data)
    ccall((:DAQmxGetAIDataXferCustomThreshold, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIDataXferCustomThreshold(taskHandle, channel, data)
    ccall((:DAQmxSetAIDataXferCustomThreshold, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIDataXferCustomThreshold(taskHandle, channel)
    ccall((:DAQmxResetAIDataXferCustomThreshold, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetAIUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetAIUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetAIUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetAIUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetAIUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetAIUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetAIMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIRawDataCompressionType(taskHandle, channel, data)
    ccall((:DAQmxGetAIRawDataCompressionType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRawDataCompressionType(taskHandle, channel, data)
    ccall((:DAQmxSetAIRawDataCompressionType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRawDataCompressionType(taskHandle, channel)
    ccall((:DAQmxResetAIRawDataCompressionType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAILossyLSBRemovalCompressedSampSize(taskHandle, channel, data)
    ccall((:DAQmxGetAILossyLSBRemovalCompressedSampSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAILossyLSBRemovalCompressedSampSize(taskHandle, channel, data)
    ccall((:DAQmxSetAILossyLSBRemovalCompressedSampSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAILossyLSBRemovalCompressedSampSize(taskHandle, channel)
    ccall((:DAQmxResetAILossyLSBRemovalCompressedSampSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIDevScalingCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIDevScalingCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxGetAIEnhancedAliasRejectionEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIEnhancedAliasRejectionEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIEnhancedAliasRejectionEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIEnhancedAliasRejectionEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIEnhancedAliasRejectionEnable(taskHandle, channel)
    ccall((:DAQmxResetAIEnhancedAliasRejectionEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIOpenChanDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIOpenChanDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIOpenChanDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIOpenChanDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIOpenChanDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIOpenChanDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIInputLimitsFaultDetectUpperLimit(taskHandle, channel, data)
    ccall((:DAQmxGetAIInputLimitsFaultDetectUpperLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIInputLimitsFaultDetectUpperLimit(taskHandle, channel, data)
    ccall((:DAQmxSetAIInputLimitsFaultDetectUpperLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIInputLimitsFaultDetectUpperLimit(taskHandle, channel)
    ccall((:DAQmxResetAIInputLimitsFaultDetectUpperLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIInputLimitsFaultDetectLowerLimit(taskHandle, channel, data)
    ccall((:DAQmxGetAIInputLimitsFaultDetectLowerLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIInputLimitsFaultDetectLowerLimit(taskHandle, channel, data)
    ccall((:DAQmxSetAIInputLimitsFaultDetectLowerLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAIInputLimitsFaultDetectLowerLimit(taskHandle, channel)
    ccall((:DAQmxResetAIInputLimitsFaultDetectLowerLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIInputLimitsFaultDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIInputLimitsFaultDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIInputLimitsFaultDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIInputLimitsFaultDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIInputLimitsFaultDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIInputLimitsFaultDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIPowerSupplyFaultDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIPowerSupplyFaultDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIPowerSupplyFaultDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIPowerSupplyFaultDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIPowerSupplyFaultDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIPowerSupplyFaultDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAIOvercurrentDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIOvercurrentDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIOvercurrentDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIOvercurrentDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIOvercurrentDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIOvercurrentDetectEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOMax(taskHandle, channel, data)
    ccall((:DAQmxGetAOMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOMax(taskHandle, channel, data)
    ccall((:DAQmxSetAOMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOMax(taskHandle, channel)
    ccall((:DAQmxResetAOMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOMin(taskHandle, channel, data)
    ccall((:DAQmxGetAOMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOMin(taskHandle, channel, data)
    ccall((:DAQmxSetAOMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOMin(taskHandle, channel)
    ccall((:DAQmxResetAOMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOCustomScaleName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAOCustomScaleName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAOCustomScaleName(taskHandle, channel, data)
    ccall((:DAQmxSetAOCustomScaleName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetAOCustomScaleName(taskHandle, channel)
    ccall((:DAQmxResetAOCustomScaleName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOOutputType(taskHandle, channel, data)
    ccall((:DAQmxGetAOOutputType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAOVoltageUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAOVoltageUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOVoltageUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAOVoltageUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAOVoltageUnits(taskHandle, channel)
    ccall((:DAQmxResetAOVoltageUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOVoltageCurrentLimit(taskHandle, channel, data)
    ccall((:DAQmxGetAOVoltageCurrentLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOVoltageCurrentLimit(taskHandle, channel, data)
    ccall((:DAQmxSetAOVoltageCurrentLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOVoltageCurrentLimit(taskHandle, channel)
    ccall((:DAQmxResetAOVoltageCurrentLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOCurrentUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAOCurrentUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOCurrentUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAOCurrentUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAOCurrentUnits(taskHandle, channel)
    ccall((:DAQmxResetAOCurrentUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFuncGenType(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenType(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenType(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFuncGenFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenFreq(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFuncGenAmplitude(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenAmplitude, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenAmplitude(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenAmplitude, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenAmplitude(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenAmplitude, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFuncGenOffset(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenOffset, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenOffset(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenOffset, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenOffset(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenOffset, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFuncGenStartPhase(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenStartPhase, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenStartPhase(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenStartPhase, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenStartPhase(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenStartPhase, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFuncGenSquareDutyCycle(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenSquareDutyCycle, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenSquareDutyCycle(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenSquareDutyCycle, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenSquareDutyCycle(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenSquareDutyCycle, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFuncGenModulationType(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenModulationType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenModulationType(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenModulationType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenModulationType(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenModulationType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFuncGenFMDeviation(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenFMDeviation, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenFMDeviation(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenFMDeviation, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenFMDeviation(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenFMDeviation, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOOutputImpedance(taskHandle, channel, data)
    ccall((:DAQmxGetAOOutputImpedance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOOutputImpedance(taskHandle, channel, data)
    ccall((:DAQmxSetAOOutputImpedance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOOutputImpedance(taskHandle, channel)
    ccall((:DAQmxResetAOOutputImpedance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOLoadImpedance(taskHandle, channel, data)
    ccall((:DAQmxGetAOLoadImpedance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOLoadImpedance(taskHandle, channel, data)
    ccall((:DAQmxSetAOLoadImpedance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOLoadImpedance(taskHandle, channel)
    ccall((:DAQmxResetAOLoadImpedance, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetAOIdleOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetAOIdleOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAOIdleOutputBehavior(taskHandle, channel)
    ccall((:DAQmxResetAOIdleOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAOTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAOTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAOTermCfg(taskHandle, channel)
    ccall((:DAQmxResetAOTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOCommonModeOffset(taskHandle, channel, data)
    ccall((:DAQmxGetAOCommonModeOffset, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOCommonModeOffset(taskHandle, channel, data)
    ccall((:DAQmxSetAOCommonModeOffset, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOCommonModeOffset(taskHandle, channel)
    ccall((:DAQmxResetAOCommonModeOffset, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOResolutionUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAOResolutionUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOResolutionUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAOResolutionUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAOResolutionUnits(taskHandle, channel)
    ccall((:DAQmxResetAOResolutionUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOResolution(taskHandle, channel, data)
    ccall((:DAQmxGetAOResolution, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxGetAODACRngHigh(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRngHigh, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAODACRngHigh(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRngHigh, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAODACRngHigh(taskHandle, channel)
    ccall((:DAQmxResetAODACRngHigh, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODACRngLow(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRngLow, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAODACRngLow(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRngLow, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAODACRngLow(taskHandle, channel)
    ccall((:DAQmxResetAODACRngLow, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODACRefConnToGnd(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRefConnToGnd, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAODACRefConnToGnd(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefConnToGnd, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAODACRefConnToGnd(taskHandle, channel)
    ccall((:DAQmxResetAODACRefConnToGnd, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODACRefAllowConnToGnd(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRefAllowConnToGnd, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAODACRefAllowConnToGnd(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefAllowConnToGnd, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAODACRefAllowConnToGnd(taskHandle, channel)
    ccall((:DAQmxResetAODACRefAllowConnToGnd, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODACRefSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRefSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAODACRefSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAODACRefSrc(taskHandle, channel)
    ccall((:DAQmxResetAODACRefSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODACRefExtSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAODACRefExtSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAODACRefExtSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefExtSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetAODACRefExtSrc(taskHandle, channel)
    ccall((:DAQmxResetAODACRefExtSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODACRefVal(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRefVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAODACRefVal(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAODACRefVal(taskHandle, channel)
    ccall((:DAQmxResetAODACRefVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODACOffsetSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAODACOffsetSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAODACOffsetSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAODACOffsetSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAODACOffsetSrc(taskHandle, channel)
    ccall((:DAQmxResetAODACOffsetSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODACOffsetExtSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAODACOffsetExtSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAODACOffsetExtSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAODACOffsetExtSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetAODACOffsetExtSrc(taskHandle, channel)
    ccall((:DAQmxResetAODACOffsetExtSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODACOffsetVal(taskHandle, channel, data)
    ccall((:DAQmxGetAODACOffsetVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAODACOffsetVal(taskHandle, channel, data)
    ccall((:DAQmxSetAODACOffsetVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAODACOffsetVal(taskHandle, channel)
    ccall((:DAQmxResetAODACOffsetVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOReglitchEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAOReglitchEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAOReglitchEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAOReglitchEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAOReglitchEnable(taskHandle, channel)
    ccall((:DAQmxResetAOReglitchEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxGetAOFilterDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxSetAOFilterDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFilterDelay(taskHandle, channel)
    ccall((:DAQmxResetAOFilterDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAOFilterDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAOFilterDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAOFilterDelayUnits(taskHandle, channel)
    ccall((:DAQmxResetAOFilterDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOFilterDelayAdjustment(taskHandle, channel, data)
    ccall((:DAQmxGetAOFilterDelayAdjustment, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFilterDelayAdjustment(taskHandle, channel, data)
    ccall((:DAQmxSetAOFilterDelayAdjustment, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFilterDelayAdjustment(taskHandle, channel)
    ccall((:DAQmxResetAOFilterDelayAdjustment, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOGain(taskHandle, channel, data)
    ccall((:DAQmxGetAOGain, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOGain(taskHandle, channel, data)
    ccall((:DAQmxSetAOGain, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetAOGain(taskHandle, channel)
    ccall((:DAQmxResetAOGain, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxGetAOUseOnlyOnBrdMem, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxSetAOUseOnlyOnBrdMem, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAOUseOnlyOnBrdMem(taskHandle, channel)
    ccall((:DAQmxResetAOUseOnlyOnBrdMem, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetAODataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetAODataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAODataXferMech(taskHandle, channel)
    ccall((:DAQmxResetAODataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetAODataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetAODataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetAODataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetAODataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetAOUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetAOUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAOUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetAOUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetAOUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetAOUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAOUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetAOUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAOMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAOMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAOMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetAOMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetAODevScalingCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAODevScalingCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxGetAOEnhancedImageRejectionEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAOEnhancedImageRejectionEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAOEnhancedImageRejectionEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAOEnhancedImageRejectionEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetAOEnhancedImageRejectionEnable(taskHandle, channel)
    ccall((:DAQmxResetAOEnhancedImageRejectionEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIInvertLines(taskHandle, channel, data)
    ccall((:DAQmxGetDIInvertLines, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIInvertLines(taskHandle, channel, data)
    ccall((:DAQmxSetDIInvertLines, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIInvertLines(taskHandle, channel)
    ccall((:DAQmxResetDIInvertLines, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDINumLines(taskHandle, channel, data)
    ccall((:DAQmxGetDINumLines, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetDIDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetDIDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIDigFltrEnableBusMode(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigFltrEnableBusMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIDigFltrEnableBusMode(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrEnableBusMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrEnableBusMode(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrEnableBusMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetDIDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetDIDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetDIDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetDIDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDITristate(taskHandle, channel, data)
    ccall((:DAQmxGetDITristate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDITristate(taskHandle, channel, data)
    ccall((:DAQmxSetDITristate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDITristate(taskHandle, channel)
    ccall((:DAQmxResetDITristate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDILogicFamily(taskHandle, channel, data)
    ccall((:DAQmxGetDILogicFamily, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDILogicFamily(taskHandle, channel, data)
    ccall((:DAQmxSetDILogicFamily, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDILogicFamily(taskHandle, channel)
    ccall((:DAQmxResetDILogicFamily, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetDIDataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetDIDataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDIDataXferMech(taskHandle, channel)
    ccall((:DAQmxResetDIDataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetDIDataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetDIDataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDIDataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetDIDataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetDIUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetDIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetDIUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetDIUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetDIUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetDIUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetDIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetDIUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetDIUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetDIUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetDIMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetDIMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetDIMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDIAcquireOn(taskHandle, channel, data)
    ccall((:DAQmxGetDIAcquireOn, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDIAcquireOn(taskHandle, channel, data)
    ccall((:DAQmxSetDIAcquireOn, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDIAcquireOn(taskHandle, channel)
    ccall((:DAQmxResetDIAcquireOn, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOOutputDriveType(taskHandle, channel, data)
    ccall((:DAQmxGetDOOutputDriveType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOOutputDriveType(taskHandle, channel, data)
    ccall((:DAQmxSetDOOutputDriveType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDOOutputDriveType(taskHandle, channel)
    ccall((:DAQmxResetDOOutputDriveType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOInvertLines(taskHandle, channel, data)
    ccall((:DAQmxGetDOInvertLines, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOInvertLines(taskHandle, channel, data)
    ccall((:DAQmxSetDOInvertLines, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOInvertLines(taskHandle, channel)
    ccall((:DAQmxResetDOInvertLines, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDONumLines(taskHandle, channel, data)
    ccall((:DAQmxGetDONumLines, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetDOTristate(taskHandle, channel, data)
    ccall((:DAQmxGetDOTristate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOTristate(taskHandle, channel, data)
    ccall((:DAQmxSetDOTristate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOTristate(taskHandle, channel)
    ccall((:DAQmxResetDOTristate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOLineStatesStartState(taskHandle, channel, data)
    ccall((:DAQmxGetDOLineStatesStartState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOLineStatesStartState(taskHandle, channel, data)
    ccall((:DAQmxSetDOLineStatesStartState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDOLineStatesStartState(taskHandle, channel)
    ccall((:DAQmxResetDOLineStatesStartState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOLineStatesPausedState(taskHandle, channel, data)
    ccall((:DAQmxGetDOLineStatesPausedState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOLineStatesPausedState(taskHandle, channel, data)
    ccall((:DAQmxSetDOLineStatesPausedState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDOLineStatesPausedState(taskHandle, channel)
    ccall((:DAQmxResetDOLineStatesPausedState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOLineStatesDoneState(taskHandle, channel, data)
    ccall((:DAQmxGetDOLineStatesDoneState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOLineStatesDoneState(taskHandle, channel, data)
    ccall((:DAQmxSetDOLineStatesDoneState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDOLineStatesDoneState(taskHandle, channel)
    ccall((:DAQmxResetDOLineStatesDoneState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOLogicFamily(taskHandle, channel, data)
    ccall((:DAQmxGetDOLogicFamily, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOLogicFamily(taskHandle, channel, data)
    ccall((:DAQmxSetDOLogicFamily, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDOLogicFamily(taskHandle, channel)
    ccall((:DAQmxResetDOLogicFamily, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOOvercurrentLimit(taskHandle, channel, data)
    ccall((:DAQmxGetDOOvercurrentLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetDOOvercurrentLimit(taskHandle, channel, data)
    ccall((:DAQmxSetDOOvercurrentLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetDOOvercurrentLimit(taskHandle, channel)
    ccall((:DAQmxResetDOOvercurrentLimit, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOOvercurrentAutoReenable(taskHandle, channel, data)
    ccall((:DAQmxGetDOOvercurrentAutoReenable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOOvercurrentAutoReenable(taskHandle, channel, data)
    ccall((:DAQmxSetDOOvercurrentAutoReenable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOOvercurrentAutoReenable(taskHandle, channel)
    ccall((:DAQmxResetDOOvercurrentAutoReenable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOOvercurrentReenablePeriod(taskHandle, channel, data)
    ccall((:DAQmxGetDOOvercurrentReenablePeriod, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetDOOvercurrentReenablePeriod(taskHandle, channel, data)
    ccall((:DAQmxSetDOOvercurrentReenablePeriod, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetDOOvercurrentReenablePeriod(taskHandle, channel)
    ccall((:DAQmxResetDOOvercurrentReenablePeriod, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxGetDOUseOnlyOnBrdMem, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxSetDOUseOnlyOnBrdMem, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOUseOnlyOnBrdMem(taskHandle, channel)
    ccall((:DAQmxResetDOUseOnlyOnBrdMem, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetDODataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetDODataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDODataXferMech(taskHandle, channel)
    ccall((:DAQmxResetDODataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetDODataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetDODataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDODataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetDODataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetDOUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetDOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetDOUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetDOUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetDOUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetDOUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetDOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetDOUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetDOUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetDOUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetDOMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetDOMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetDOMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDOGenerateOn(taskHandle, channel, data)
    ccall((:DAQmxGetDOGenerateOn, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOGenerateOn(taskHandle, channel, data)
    ccall((:DAQmxSetDOGenerateOn, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetDOGenerateOn(taskHandle, channel)
    ccall((:DAQmxResetDOGenerateOn, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIMax(taskHandle, channel, data)
    ccall((:DAQmxGetCIMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIMax(taskHandle, channel, data)
    ccall((:DAQmxSetCIMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIMax(taskHandle, channel)
    ccall((:DAQmxResetCIMax, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIMin(taskHandle, channel, data)
    ccall((:DAQmxGetCIMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIMin(taskHandle, channel, data)
    ccall((:DAQmxSetCIMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIMin(taskHandle, channel)
    ccall((:DAQmxResetCIMin, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICustomScaleName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICustomScaleName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICustomScaleName(taskHandle, channel, data)
    ccall((:DAQmxSetCICustomScaleName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICustomScaleName(taskHandle, channel)
    ccall((:DAQmxResetCICustomScaleName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIMeasType(taskHandle, channel, data)
    ccall((:DAQmxGetCIMeasType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetCIFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqUnits(taskHandle, channel)
    ccall((:DAQmxResetCIFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIFreqTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIFreqTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIFreqTerm(taskHandle, channel)
    ccall((:DAQmxResetCIFreqTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIFreqTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIFreqLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIFreqThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIFreqThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetCIFreqThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqHyst(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIFreqHyst(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIFreqHyst(taskHandle, channel)
    ccall((:DAQmxResetCIFreqHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIFreqDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIFreqDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCIFreqStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqMeasMeth(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqMeasMeth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqMeasMeth(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqMeasMeth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqMeasMeth(taskHandle, channel)
    ccall((:DAQmxResetCIFreqMeasMeth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqEnableAveraging(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqEnableAveraging, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqEnableAveraging(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqEnableAveraging, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIFreqEnableAveraging(taskHandle, channel)
    ccall((:DAQmxResetCIFreqEnableAveraging, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqMeasTime(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqMeasTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIFreqMeasTime(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqMeasTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIFreqMeasTime(taskHandle, channel)
    ccall((:DAQmxResetCIFreqMeasTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFreqDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIFreqDiv(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodUnits(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPeriodTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPeriodTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPeriodTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPeriodThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodHyst(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodHyst(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPeriodHyst(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPeriodDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPeriodDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodMeasMeth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodMeasMeth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodMeasMeth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodMeasMeth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodMeasMeth(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodMeasMeth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodEnableAveraging(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodEnableAveraging, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodEnableAveraging(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodEnableAveraging, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodEnableAveraging(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodEnableAveraging, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodMeasTime(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodMeasTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodMeasTime(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodMeasTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPeriodMeasTime(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodMeasTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPeriodDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDiv(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesTerm(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesHyst(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesHyst(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesHyst(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDir(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDir, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDir(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDir, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDir(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDir, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDirTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesDirTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesDirTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDirTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDirTerm(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDirTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirHyst(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirHyst(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirHyst(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesInitialCnt(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesInitialCnt, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesInitialCnt(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesInitialCnt, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesInitialCnt(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesInitialCnt, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesActiveEdge(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetResetCount(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetResetCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetResetCount(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetResetCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetResetCount(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetResetCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesCountResetTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesCountResetTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetTerm(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetHyst(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetHyst(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetHyst(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetActiveEdge(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesGateTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesGateTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateTerm(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateHyst(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateHyst(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateHyst(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateHyst, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesGateDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesGateDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateWhen(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateWhen, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateWhen(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateWhen, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateWhen(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateWhen, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIDutyCycleTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIDutyCycleTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleTerm(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIDutyCycleDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIDutyCycleDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIAngEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIAngEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIAngEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIAngEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIAngEncoderUnits(taskHandle, channel)
    ccall((:DAQmxResetCIAngEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIAngEncoderPulsesPerRev(taskHandle, channel, data)
    ccall((:DAQmxGetCIAngEncoderPulsesPerRev, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIAngEncoderPulsesPerRev(taskHandle, channel, data)
    ccall((:DAQmxSetCIAngEncoderPulsesPerRev, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIAngEncoderPulsesPerRev(taskHandle, channel)
    ccall((:DAQmxResetCIAngEncoderPulsesPerRev, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIAngEncoderInitialAngle(taskHandle, channel, data)
    ccall((:DAQmxGetCIAngEncoderInitialAngle, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIAngEncoderInitialAngle(taskHandle, channel, data)
    ccall((:DAQmxSetCIAngEncoderInitialAngle, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIAngEncoderInitialAngle(taskHandle, channel)
    ccall((:DAQmxResetCIAngEncoderInitialAngle, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCILinEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCILinEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCILinEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCILinEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCILinEncoderUnits(taskHandle, channel)
    ccall((:DAQmxResetCILinEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCILinEncoderDistPerPulse(taskHandle, channel, data)
    ccall((:DAQmxGetCILinEncoderDistPerPulse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCILinEncoderDistPerPulse(taskHandle, channel, data)
    ccall((:DAQmxSetCILinEncoderDistPerPulse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCILinEncoderDistPerPulse(taskHandle, channel)
    ccall((:DAQmxResetCILinEncoderDistPerPulse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCILinEncoderInitialPos(taskHandle, channel, data)
    ccall((:DAQmxGetCILinEncoderInitialPos, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCILinEncoderInitialPos(taskHandle, channel, data)
    ccall((:DAQmxSetCILinEncoderInitialPos, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCILinEncoderInitialPos(taskHandle, channel)
    ccall((:DAQmxResetCILinEncoderInitialPos, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderDecodingType(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderDecodingType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderDecodingType(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderDecodingType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderDecodingType(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderDecodingType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderAInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderAInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderAInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderAInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderBInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderBInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderBInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderBInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderZInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderZInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderZInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderZInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZIndexEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZIndexEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZIndexEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZIndexEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZIndexEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZIndexEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZIndexVal(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZIndexVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZIndexVal(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZIndexVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZIndexVal(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZIndexVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIEncoderZIndexPhase(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZIndexPhase, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZIndexPhase(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZIndexPhase, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZIndexPhase(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZIndexPhase, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthUnits(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseWidthTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseWidthTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseWidthDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseWidthDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITimestampUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCITimestampUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITimestampUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCITimestampUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCITimestampUnits(taskHandle, channel)
    ccall((:DAQmxResetCITimestampUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITimestampInitialSeconds(taskHandle, channel, data)
    ccall((:DAQmxGetCITimestampInitialSeconds, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCITimestampInitialSeconds(taskHandle, channel, data)
    ccall((:DAQmxSetCITimestampInitialSeconds, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCITimestampInitialSeconds(taskHandle, channel)
    ccall((:DAQmxResetCITimestampInitialSeconds, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIGPSSyncMethod(taskHandle, channel, data)
    ccall((:DAQmxGetCIGPSSyncMethod, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIGPSSyncMethod(taskHandle, channel, data)
    ccall((:DAQmxSetCIGPSSyncMethod, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIGPSSyncMethod(taskHandle, channel)
    ccall((:DAQmxResetCIGPSSyncMethod, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIGPSSyncSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIGPSSyncSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIGPSSyncSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIGPSSyncSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIGPSSyncSrc(taskHandle, channel)
    ccall((:DAQmxResetCIGPSSyncSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityAngEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityAngEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityAngEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityAngEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityAngEncoderUnits(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityAngEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityAngEncoderPulsesPerRev(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityAngEncoderPulsesPerRev, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityAngEncoderPulsesPerRev(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityAngEncoderPulsesPerRev, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityAngEncoderPulsesPerRev(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityAngEncoderPulsesPerRev, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityLinEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityLinEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityLinEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityLinEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityLinEncoderUnits(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityLinEncoderUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityLinEncoderDistPerPulse(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityLinEncoderDistPerPulse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityLinEncoderDistPerPulse(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityLinEncoderDistPerPulse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityLinEncoderDistPerPulse(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityLinEncoderDistPerPulse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderDecodingType(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderDecodingType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderDecodingType(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderDecodingType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderDecodingType(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderDecodingType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIVelocityEncoderAInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIVelocityEncoderAInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIVelocityEncoderBInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIVelocityEncoderBInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityMeasTime(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityMeasTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityMeasTime(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityMeasTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityMeasTime(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityMeasTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIVelocityDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityDiv(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepUnits(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCITwoEdgeSepFirstTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCITwoEdgeSepFirstTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstTerm(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstEdge(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCITwoEdgeSepSecondTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCITwoEdgeSepSecondTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondTerm(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondEdge(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodUnits(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCISemiPeriodTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCISemiPeriodTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodTerm(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCISemiPeriodDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCISemiPeriodDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodStartingEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqUnits(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseFreqTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseFreqTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseFreqDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseFreqDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqStartEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqStartEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqStartEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqStartEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqStartEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqStartEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeUnits(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseTimeTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseTimeTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseTimeDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseTimeDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeStartEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeStartEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeStartEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeStartEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeStartEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeStartEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseTicksTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseTicksTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksTermCfg, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksLogicLvlBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseTicksDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseTicksDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksStartEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksStartEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksStartEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksStartEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksStartEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksStartEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICtrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICtrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseActiveEdge(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICtrTimebaseDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetCIThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetCIThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetCIThreshVoltage, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFilterEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIFilterEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIFilterEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIFilterEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIFilterEnable(taskHandle, channel)
    ccall((:DAQmxResetCIFilterEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFilterFreq(taskHandle, channel, data)
    ccall((:DAQmxGetCIFilterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIFilterFreq(taskHandle, channel, data)
    ccall((:DAQmxSetCIFilterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIFilterFreq(taskHandle, channel)
    ccall((:DAQmxResetCIFilterFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFilterResponse(taskHandle, channel, data)
    ccall((:DAQmxGetCIFilterResponse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFilterResponse(taskHandle, channel, data)
    ccall((:DAQmxSetCIFilterResponse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFilterResponse(taskHandle, channel)
    ccall((:DAQmxResetCIFilterResponse, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFilterOrder(taskHandle, channel, data)
    ccall((:DAQmxGetCIFilterOrder, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIFilterOrder(taskHandle, channel, data)
    ccall((:DAQmxSetCIFilterOrder, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIFilterOrder(taskHandle, channel)
    ccall((:DAQmxResetCIFilterOrder, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxGetCIFilterDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxGetCIFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIFilterDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIFilterDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFilterDelayUnits(taskHandle, channel)
    ccall((:DAQmxResetCIFilterDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCICount(taskHandle, channel, data)
    ccall((:DAQmxGetCICount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetCIOutputState(taskHandle, channel, data)
    ccall((:DAQmxGetCIOutputState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetCITCReached(taskHandle, channel, data)
    ccall((:DAQmxGetCITCReached, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetCICtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseMasterTimebaseDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseMasterTimebaseDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseMasterTimebaseDiv(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseMasterTimebaseDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISampClkOverrunBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCISampClkOverrunBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISampClkOverrunBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCISampClkOverrunBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCISampClkOverrunBehavior(taskHandle, channel)
    ccall((:DAQmxResetCISampClkOverrunBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCISampClkOverrunSentinelVal(taskHandle, channel, data)
    ccall((:DAQmxGetCISampClkOverrunSentinelVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISampClkOverrunSentinelVal(taskHandle, channel, data)
    ccall((:DAQmxSetCISampClkOverrunSentinelVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCISampClkOverrunSentinelVal(taskHandle, channel)
    ccall((:DAQmxResetCISampClkOverrunSentinelVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetCIDataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetCIDataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDataXferMech(taskHandle, channel)
    ccall((:DAQmxResetCIDataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetCIDataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetCIDataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetCIDataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetCIUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetCIUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetCIUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetCIUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetCIUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetCIUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetCIMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCINumPossiblyInvalidSamps(taskHandle, channel, data)
    ccall((:DAQmxGetCINumPossiblyInvalidSamps, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetCIDupCountPrevent(taskHandle, channel, data)
    ccall((:DAQmxGetCIDupCountPrevent, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIDupCountPrevent(taskHandle, channel, data)
    ccall((:DAQmxSetCIDupCountPrevent, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIDupCountPrevent(taskHandle, channel)
    ccall((:DAQmxResetCIDupCountPrevent, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIPrescaler(taskHandle, channel, data)
    ccall((:DAQmxGetCIPrescaler, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIPrescaler(taskHandle, channel, data)
    ccall((:DAQmxSetCIPrescaler, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIPrescaler(taskHandle, channel)
    ccall((:DAQmxResetCIPrescaler, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCIMaxMeasPeriod(taskHandle, channel, data)
    ccall((:DAQmxGetCIMaxMeasPeriod, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIMaxMeasPeriod(taskHandle, channel, data)
    ccall((:DAQmxSetCIMaxMeasPeriod, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCIMaxMeasPeriod(taskHandle, channel)
    ccall((:DAQmxResetCIMaxMeasPeriod, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOOutputType(taskHandle, channel, data)
    ccall((:DAQmxGetCOOutputType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetCOPulseIdleState(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseIdleState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseIdleState(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseIdleState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCOPulseIdleState(taskHandle, channel)
    ccall((:DAQmxResetCOPulseIdleState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCOPulseTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCOPulseTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCOPulseTerm(taskHandle, channel)
    ccall((:DAQmxResetCOPulseTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseTimeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseTimeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseTimeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseTimeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCOPulseTimeUnits(taskHandle, channel)
    ccall((:DAQmxResetCOPulseTimeUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseHighTime(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseHighTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseHighTime(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseHighTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseHighTime(taskHandle, channel)
    ccall((:DAQmxResetCOPulseHighTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseLowTime(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseLowTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseLowTime(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseLowTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseLowTime(taskHandle, channel)
    ccall((:DAQmxResetCOPulseLowTime, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseTimeInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseTimeInitialDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseTimeInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseTimeInitialDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseTimeInitialDelay(taskHandle, channel)
    ccall((:DAQmxResetCOPulseTimeInitialDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseDutyCyc(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseDutyCyc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseDutyCyc(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseDutyCyc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseDutyCyc(taskHandle, channel)
    ccall((:DAQmxResetCOPulseDutyCyc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCOPulseFreqUnits(taskHandle, channel)
    ccall((:DAQmxResetCOPulseFreqUnits, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseFreq(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseFreq(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseFreq(taskHandle, channel)
    ccall((:DAQmxResetCOPulseFreq, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseFreqInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseFreqInitialDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseFreqInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseFreqInitialDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseFreqInitialDelay(taskHandle, channel)
    ccall((:DAQmxResetCOPulseFreqInitialDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseHighTicks(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseHighTicks, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseHighTicks(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseHighTicks, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOPulseHighTicks(taskHandle, channel)
    ccall((:DAQmxResetCOPulseHighTicks, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseLowTicks(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseLowTicks, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseLowTicks(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseLowTicks, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOPulseLowTicks(taskHandle, channel)
    ccall((:DAQmxResetCOPulseLowTicks, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseTicksInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseTicksInitialDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseTicksInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseTicksInitialDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOPulseTicksInitialDelay(taskHandle, channel)
    ccall((:DAQmxResetCOPulseTicksInitialDelay, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCOCtrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCOCtrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseActiveEdge(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCount(taskHandle, channel, data)
    ccall((:DAQmxGetCOCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetCOOutputState(taskHandle, channel, data)
    ccall((:DAQmxGetCOOutputState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetCOAutoIncrCnt(taskHandle, channel, data)
    ccall((:DAQmxGetCOAutoIncrCnt, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOAutoIncrCnt(taskHandle, channel, data)
    ccall((:DAQmxSetCOAutoIncrCnt, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOAutoIncrCnt(taskHandle, channel)
    ccall((:DAQmxResetCOAutoIncrCnt, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseMasterTimebaseDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseMasterTimebaseDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseMasterTimebaseDiv(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseMasterTimebaseDiv, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPulseDone(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseDone, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetCOEnableInitialDelayOnRetrigger(taskHandle, channel, data)
    ccall((:DAQmxGetCOEnableInitialDelayOnRetrigger, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOEnableInitialDelayOnRetrigger(taskHandle, channel, data)
    ccall((:DAQmxSetCOEnableInitialDelayOnRetrigger, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOEnableInitialDelayOnRetrigger(taskHandle, channel)
    ccall((:DAQmxResetCOEnableInitialDelayOnRetrigger, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOConstrainedGenMode(taskHandle, channel, data)
    ccall((:DAQmxGetCOConstrainedGenMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOConstrainedGenMode(taskHandle, channel, data)
    ccall((:DAQmxSetCOConstrainedGenMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCOConstrainedGenMode(taskHandle, channel)
    ccall((:DAQmxResetCOConstrainedGenMode, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxGetCOUseOnlyOnBrdMem, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxSetCOUseOnlyOnBrdMem, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOUseOnlyOnBrdMem(taskHandle, channel)
    ccall((:DAQmxResetCOUseOnlyOnBrdMem, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetCODataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetCODataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCODataXferMech(taskHandle, channel)
    ccall((:DAQmxResetCODataXferMech, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetCODataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetCODataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetCODataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetCODataXferReqCond, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetCOUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetCOUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetCOUsbXferReqSize, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetCOUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetCOUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetCOUsbXferReqCount, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCOMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCOMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetCOMemMapEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCOPrescaler(taskHandle, channel, data)
    ccall((:DAQmxGetCOPrescaler, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOPrescaler(taskHandle, channel, data)
    ccall((:DAQmxSetCOPrescaler, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOPrescaler(taskHandle, channel)
    ccall((:DAQmxResetCOPrescaler, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetCORdyForNewVal(taskHandle, channel, data)
    ccall((:DAQmxGetCORdyForNewVal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetPwrVoltageSetpoint(taskHandle, channel, data)
    ccall((:DAQmxGetPwrVoltageSetpoint, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetPwrVoltageSetpoint(taskHandle, channel, data)
    ccall((:DAQmxSetPwrVoltageSetpoint, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetPwrVoltageSetpoint(taskHandle, channel)
    ccall((:DAQmxResetPwrVoltageSetpoint, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetPwrVoltageDevScalingCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetPwrVoltageDevScalingCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxGetPwrCurrentSetpoint(taskHandle, channel, data)
    ccall((:DAQmxGetPwrCurrentSetpoint, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetPwrCurrentSetpoint(taskHandle, channel, data)
    ccall((:DAQmxSetPwrCurrentSetpoint, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, channel, data)
end

function DAQmxResetPwrCurrentSetpoint(taskHandle, channel)
    ccall((:DAQmxResetPwrCurrentSetpoint, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetPwrCurrentDevScalingCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetPwrCurrentDevScalingCoeff, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxGetPwrOutputEnable(taskHandle, channel, data)
    ccall((:DAQmxGetPwrOutputEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetPwrOutputEnable(taskHandle, channel, data)
    ccall((:DAQmxSetPwrOutputEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, channel, data)
end

function DAQmxResetPwrOutputEnable(taskHandle, channel)
    ccall((:DAQmxResetPwrOutputEnable, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetPwrOutputState(taskHandle, channel, data)
    ccall((:DAQmxGetPwrOutputState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetPwrIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetPwrIdleOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetPwrIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetPwrIdleOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetPwrIdleOutputBehavior(taskHandle, channel)
    ccall((:DAQmxResetPwrIdleOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetPwrRemoteSense(taskHandle, channel, data)
    ccall((:DAQmxGetPwrRemoteSense, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetPwrRemoteSense(taskHandle, channel, data)
    ccall((:DAQmxSetPwrRemoteSense, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetPwrRemoteSense(taskHandle, channel)
    ccall((:DAQmxResetPwrRemoteSense, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetChanType(taskHandle, channel, data)
    ccall((:DAQmxGetChanType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetPhysicalChanName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetPhysicalChanName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetPhysicalChanName(taskHandle, channel, data)
    ccall((:DAQmxSetPhysicalChanName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxGetChanDescr(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetChanDescr, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetChanDescr(taskHandle, channel, data)
    ccall((:DAQmxSetChanDescr, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, channel, data)
end

function DAQmxResetChanDescr(taskHandle, channel)
    ccall((:DAQmxResetChanDescr, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetChanIsGlobal(taskHandle, channel, data)
    ccall((:DAQmxGetChanIsGlobal, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetChanSyncUnlockBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetChanSyncUnlockBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetChanSyncUnlockBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetChanSyncUnlockBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, channel, data)
end

function DAQmxResetChanSyncUnlockBehavior(taskHandle, channel)
    ccall((:DAQmxResetChanSyncUnlockBehavior, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, channel)
end

function DAQmxGetDevIsSimulated(device, data)
    ccall((:DAQmxGetDevIsSimulated, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), device, data)
end

function DAQmxGetDevProductCategory(device, data)
    ccall((:DAQmxGetDevProductCategory, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), device, data)
end

function DAQmxGetDevProductType(device, data, bufferSize)
    ccall((:DAQmxGetDevProductType, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevProductNum(device, data)
    ccall((:DAQmxGetDevProductNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevSerialNum(device, data)
    ccall((:DAQmxGetDevSerialNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAccessoryProductTypes(device, data, bufferSize)
    ccall((:DAQmxGetDevAccessoryProductTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevAccessoryProductNums(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAccessoryProductNums, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAccessorySerialNums(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAccessorySerialNums, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetCarrierSerialNum(device, data)
    ccall((:DAQmxGetCarrierSerialNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetFieldDAQDevName(device, data, bufferSize)
    ccall((:DAQmxGetFieldDAQDevName, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetFieldDAQBankDevNames(device, data, bufferSize)
    ccall((:DAQmxGetFieldDAQBankDevNames, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevIDPinPinNames(device, data, bufferSize)
    ccall((:DAQmxGetDevIDPinPinNames, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevIDPinPinStatuses(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevIDPinPinStatuses, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevIDPinMemFamilyCodes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevIDPinMemFamilyCodes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevIDPinMemSerialNums(device, data, bufferSize)
    ccall((:DAQmxGetDevIDPinMemSerialNums, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevIDPinMemSizes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevIDPinMemSizes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevChassisModuleDevNames(device, data, bufferSize)
    ccall((:DAQmxGetDevChassisModuleDevNames, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevAnlgTrigSupported(device, data)
    ccall((:DAQmxGetDevAnlgTrigSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), device, data)
end

function DAQmxGetDevDigTrigSupported(device, data)
    ccall((:DAQmxGetDevDigTrigSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), device, data)
end

function DAQmxGetDevTimeTrigSupported(device, data)
    ccall((:DAQmxGetDevTimeTrigSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), device, data)
end

function DAQmxGetDevAIPhysicalChans(device, data, bufferSize)
    ccall((:DAQmxGetDevAIPhysicalChans, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevAISupportedMeasTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAISupportedMeasTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIMaxSingleChanRate(device, data)
    ccall((:DAQmxGetDevAIMaxSingleChanRate, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), device, data)
end

function DAQmxGetDevAIMaxMultiChanRate(device, data)
    ccall((:DAQmxGetDevAIMaxMultiChanRate, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), device, data)
end

function DAQmxGetDevAIMinRate(device, data)
    ccall((:DAQmxGetDevAIMinRate, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), device, data)
end

function DAQmxGetDevAISimultaneousSamplingSupported(device, data)
    ccall((:DAQmxGetDevAISimultaneousSamplingSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), device, data)
end

function DAQmxGetDevAINumSampTimingEngines(device, data)
    ccall((:DAQmxGetDevAINumSampTimingEngines, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAISampModes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAISampModes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAINumSyncPulseSrcs(device, data)
    ccall((:DAQmxGetDevAINumSyncPulseSrcs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAITrigUsage(device, data)
    ccall((:DAQmxGetDevAITrigUsage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), device, data)
end

function DAQmxGetDevAIVoltageRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIVoltageRngs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIVoltageIntExcitDiscreteVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIVoltageIntExcitDiscreteVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIVoltageIntExcitRangeVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIVoltageIntExcitRangeVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIChargeRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIChargeRngs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAICurrentRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAICurrentRngs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAICurrentIntExcitDiscreteVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAICurrentIntExcitDiscreteVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIBridgeRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIBridgeRngs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIResistanceRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIResistanceRngs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIFreqRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIFreqRngs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIGains(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIGains, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAICouplings(device, data)
    ccall((:DAQmxGetDevAICouplings, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), device, data)
end

function DAQmxGetDevAILowpassCutoffFreqDiscreteVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAILowpassCutoffFreqDiscreteVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAILowpassCutoffFreqRangeVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAILowpassCutoffFreqRangeVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetAIDigFltrTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetAIDigFltrTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIDigFltrLowpassCutoffFreqDiscreteVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqDiscreteVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIDigFltrLowpassCutoffFreqRangeVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqRangeVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAOPhysicalChans(device, data, bufferSize)
    ccall((:DAQmxGetDevAOPhysicalChans, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevAOSupportedOutputTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOSupportedOutputTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAOMaxRate(device, data)
    ccall((:DAQmxGetDevAOMaxRate, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), device, data)
end

function DAQmxGetDevAOMinRate(device, data)
    ccall((:DAQmxGetDevAOMinRate, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), device, data)
end

function DAQmxGetDevAOSampClkSupported(device, data)
    ccall((:DAQmxGetDevAOSampClkSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), device, data)
end

function DAQmxGetDevAONumSampTimingEngines(device, data)
    ccall((:DAQmxGetDevAONumSampTimingEngines, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAOSampModes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOSampModes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAONumSyncPulseSrcs(device, data)
    ccall((:DAQmxGetDevAONumSyncPulseSrcs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAOTrigUsage(device, data)
    ccall((:DAQmxGetDevAOTrigUsage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), device, data)
end

function DAQmxGetDevAOVoltageRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOVoltageRngs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAOCurrentRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOCurrentRngs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAOGains(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOGains, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevDILines(device, data, bufferSize)
    ccall((:DAQmxGetDevDILines, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevDIPorts(device, data, bufferSize)
    ccall((:DAQmxGetDevDIPorts, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevDIMaxRate(device, data)
    ccall((:DAQmxGetDevDIMaxRate, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), device, data)
end

function DAQmxGetDevDINumSampTimingEngines(device, data)
    ccall((:DAQmxGetDevDINumSampTimingEngines, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevDITrigUsage(device, data)
    ccall((:DAQmxGetDevDITrigUsage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), device, data)
end

function DAQmxGetDevDOLines(device, data, bufferSize)
    ccall((:DAQmxGetDevDOLines, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevDOPorts(device, data, bufferSize)
    ccall((:DAQmxGetDevDOPorts, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevDOMaxRate(device, data)
    ccall((:DAQmxGetDevDOMaxRate, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), device, data)
end

function DAQmxGetDevDONumSampTimingEngines(device, data)
    ccall((:DAQmxGetDevDONumSampTimingEngines, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevDOTrigUsage(device, data)
    ccall((:DAQmxGetDevDOTrigUsage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), device, data)
end

function DAQmxGetDevCIPhysicalChans(device, data, bufferSize)
    ccall((:DAQmxGetDevCIPhysicalChans, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevCISupportedMeasTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevCISupportedMeasTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevCITrigUsage(device, data)
    ccall((:DAQmxGetDevCITrigUsage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), device, data)
end

function DAQmxGetDevCISampClkSupported(device, data)
    ccall((:DAQmxGetDevCISampClkSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), device, data)
end

function DAQmxGetDevCISampModes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevCISampModes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevCIMaxSize(device, data)
    ccall((:DAQmxGetDevCIMaxSize, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevCIMaxTimebase(device, data)
    ccall((:DAQmxGetDevCIMaxTimebase, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), device, data)
end

function DAQmxGetDevCOPhysicalChans(device, data, bufferSize)
    ccall((:DAQmxGetDevCOPhysicalChans, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevCOSupportedOutputTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevCOSupportedOutputTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevCOSampClkSupported(device, data)
    ccall((:DAQmxGetDevCOSampClkSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), device, data)
end

function DAQmxGetDevCOSampModes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevCOSampModes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevCOTrigUsage(device, data)
    ccall((:DAQmxGetDevCOTrigUsage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), device, data)
end

function DAQmxGetDevCOMaxSize(device, data)
    ccall((:DAQmxGetDevCOMaxSize, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevCOMaxTimebase(device, data)
    ccall((:DAQmxGetDevCOMaxTimebase, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), device, data)
end

function DAQmxGetDevTEDSHWTEDSSupported(device, data)
    ccall((:DAQmxGetDevTEDSHWTEDSSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), device, data)
end

function DAQmxGetDevNumDMAChans(device, data)
    ccall((:DAQmxGetDevNumDMAChans, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevBusType(device, data)
    ccall((:DAQmxGetDevBusType, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), device, data)
end

function DAQmxGetDevPCIBusNum(device, data)
    ccall((:DAQmxGetDevPCIBusNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevPCIDevNum(device, data)
    ccall((:DAQmxGetDevPCIDevNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevPXIChassisNum(device, data)
    ccall((:DAQmxGetDevPXIChassisNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevPXISlotNum(device, data)
    ccall((:DAQmxGetDevPXISlotNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevCompactDAQChassisDevName(device, data, bufferSize)
    ccall((:DAQmxGetDevCompactDAQChassisDevName, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevCompactDAQSlotNum(device, data)
    ccall((:DAQmxGetDevCompactDAQSlotNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevCompactRIOChassisDevName(device, data, bufferSize)
    ccall((:DAQmxGetDevCompactRIOChassisDevName, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevCompactRIOSlotNum(device, data)
    ccall((:DAQmxGetDevCompactRIOSlotNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevTCPIPHostname(device, data, bufferSize)
    ccall((:DAQmxGetDevTCPIPHostname, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevTCPIPEthernetIP(device, data, bufferSize)
    ccall((:DAQmxGetDevTCPIPEthernetIP, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevTCPIPWirelessIP(device, data, bufferSize)
    ccall((:DAQmxGetDevTCPIPWirelessIP, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevTerminals(device, data, bufferSize)
    ccall((:DAQmxGetDevTerminals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), device, data, bufferSize)
end

function DAQmxGetDevNumTimeTrigs(device, data)
    ccall((:DAQmxGetDevNumTimeTrigs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevNumTimestampEngines(device, data)
    ccall((:DAQmxGetDevNumTimestampEngines, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), device, data)
end

function DAQmxGetExportedAIConvClkOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedAIConvClkOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedAIConvClkOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedAIConvClkOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedAIConvClkOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedAIConvClkOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAIConvClkPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedAIConvClkPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxGetExported10MHzRefClkOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExported10MHzRefClkOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExported10MHzRefClkOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExported10MHzRefClkOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExported10MHzRefClkOutputTerm(taskHandle)
    ccall((:DAQmxResetExported10MHzRefClkOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExported20MHzTimebaseOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExported20MHzTimebaseOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExported20MHzTimebaseOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExported20MHzTimebaseOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExported20MHzTimebaseOutputTerm(taskHandle)
    ccall((:DAQmxResetExported20MHzTimebaseOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkOutputBehavior(taskHandle, data)
    ccall((:DAQmxGetExportedSampClkOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedSampClkOutputBehavior(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkOutputBehavior, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedSampClkOutputBehavior(taskHandle)
    ccall((:DAQmxResetExportedSampClkOutputBehavior, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedSampClkOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedSampClkOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedSampClkOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedSampClkOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkDelayOffset(taskHandle, data)
    ccall((:DAQmxGetExportedSampClkDelayOffset, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedSampClkDelayOffset(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkDelayOffset, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedSampClkDelayOffset(taskHandle)
    ccall((:DAQmxResetExportedSampClkDelayOffset, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedSampClkPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedSampClkPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkPulsePolarity, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedSampClkPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedSampClkPulsePolarity, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkTimebaseOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedSampClkTimebaseOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedSampClkTimebaseOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkTimebaseOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedSampClkTimebaseOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedSampClkTimebaseOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedDividedSampClkTimebaseOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedDividedSampClkTimebaseOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedDividedSampClkTimebaseOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedDividedSampClkTimebaseOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedDividedSampClkTimebaseOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedDividedSampClkTimebaseOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvTrigOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedAdvTrigOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedAdvTrigOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedAdvTrigOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedAdvTrigOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedAdvTrigOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedAdvTrigPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxGetExportedAdvTrigPulseWidthUnits(taskHandle, data)
    ccall((:DAQmxGetExportedAdvTrigPulseWidthUnits, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedAdvTrigPulseWidthUnits(taskHandle, data)
    ccall((:DAQmxSetExportedAdvTrigPulseWidthUnits, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedAdvTrigPulseWidthUnits(taskHandle)
    ccall((:DAQmxResetExportedAdvTrigPulseWidthUnits, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvTrigPulseWidth(taskHandle, data)
    ccall((:DAQmxGetExportedAdvTrigPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedAdvTrigPulseWidth(taskHandle, data)
    ccall((:DAQmxSetExportedAdvTrigPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedAdvTrigPulseWidth(taskHandle)
    ccall((:DAQmxResetExportedAdvTrigPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedPauseTrigOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedPauseTrigOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedPauseTrigOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedPauseTrigOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedPauseTrigOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedPauseTrigOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedPauseTrigLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxGetExportedPauseTrigLvlActiveLvl, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedPauseTrigLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxSetExportedPauseTrigLvlActiveLvl, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedPauseTrigLvlActiveLvl(taskHandle)
    ccall((:DAQmxResetExportedPauseTrigLvlActiveLvl, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRefTrigOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedRefTrigOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedRefTrigOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedRefTrigOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedRefTrigOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedRefTrigOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRefTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedRefTrigPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedRefTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedRefTrigPulsePolarity, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedRefTrigPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedRefTrigPulsePolarity, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedStartTrigOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedStartTrigOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedStartTrigOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedStartTrigOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedStartTrigOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedStartTrigOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedStartTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedStartTrigPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedStartTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedStartTrigPulsePolarity, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedStartTrigPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedStartTrigPulsePolarity, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvCmpltEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedAdvCmpltEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedAdvCmpltEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedAdvCmpltEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvCmpltEventDelay(taskHandle, data)
    ccall((:DAQmxGetExportedAdvCmpltEventDelay, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedAdvCmpltEventDelay(taskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventDelay, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedAdvCmpltEventDelay(taskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventDelay, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvCmpltEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedAdvCmpltEventPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedAdvCmpltEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventPulsePolarity, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedAdvCmpltEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventPulsePolarity, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvCmpltEventPulseWidth(taskHandle, data)
    ccall((:DAQmxGetExportedAdvCmpltEventPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedAdvCmpltEventPulseWidth(taskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedAdvCmpltEventPulseWidth(taskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAIHoldCmpltEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedAIHoldCmpltEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedAIHoldCmpltEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedAIHoldCmpltEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedAIHoldCmpltEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedAIHoldCmpltEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAIHoldCmpltEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedAIHoldCmpltEventPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedAIHoldCmpltEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedAIHoldCmpltEventPulsePolarity, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedAIHoldCmpltEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedAIHoldCmpltEventPulsePolarity, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedChangeDetectEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedChangeDetectEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedChangeDetectEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedChangeDetectEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedChangeDetectEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedChangeDetectEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedChangeDetectEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedChangeDetectEventPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedChangeDetectEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedChangeDetectEventPulsePolarity, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedChangeDetectEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedChangeDetectEventPulsePolarity, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedCtrOutEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedCtrOutEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedCtrOutEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedCtrOutEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedCtrOutEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedCtrOutEventOutputBehavior(taskHandle, data)
    ccall((:DAQmxGetExportedCtrOutEventOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedCtrOutEventOutputBehavior(taskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventOutputBehavior, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedCtrOutEventOutputBehavior(taskHandle)
    ccall((:DAQmxResetExportedCtrOutEventOutputBehavior, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedCtrOutEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedCtrOutEventPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedCtrOutEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventPulsePolarity, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedCtrOutEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedCtrOutEventPulsePolarity, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedCtrOutEventToggleIdleState(taskHandle, data)
    ccall((:DAQmxGetExportedCtrOutEventToggleIdleState, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedCtrOutEventToggleIdleState(taskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventToggleIdleState, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedCtrOutEventToggleIdleState(taskHandle)
    ccall((:DAQmxResetExportedCtrOutEventToggleIdleState, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedHshkEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedHshkEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedHshkEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedHshkEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventOutputBehavior(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventOutputBehavior, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedHshkEventOutputBehavior(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventOutputBehavior, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedHshkEventOutputBehavior(taskHandle)
    ccall((:DAQmxResetExportedHshkEventOutputBehavior, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventDelay(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventDelay, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedHshkEventDelay(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventDelay, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedHshkEventDelay(taskHandle)
    ccall((:DAQmxResetExportedHshkEventDelay, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventInterlockedAssertedLvl(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertedLvl, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedHshkEventInterlockedAssertedLvl(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertedLvl, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedHshkEventInterlockedAssertedLvl(taskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertedLvl, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventInterlockedAssertOnStart(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertOnStart, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetExportedHshkEventInterlockedAssertOnStart(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertOnStart, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetExportedHshkEventInterlockedAssertOnStart(taskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertOnStart, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventInterlockedDeassertDelay(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventInterlockedDeassertDelay, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedHshkEventInterlockedDeassertDelay(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventInterlockedDeassertDelay, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedHshkEventInterlockedDeassertDelay(taskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedDeassertDelay, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventPulsePolarity, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedHshkEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventPulsePolarity, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedHshkEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedHshkEventPulsePolarity, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventPulseWidth(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedHshkEventPulseWidth(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedHshkEventPulseWidth(taskHandle)
    ccall((:DAQmxResetExportedHshkEventPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForXferEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedRdyForXferEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedRdyForXferEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedRdyForXferEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForXferEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxGetExportedRdyForXferEventLvlActiveLvl, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedRdyForXferEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventLvlActiveLvl, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedRdyForXferEventLvlActiveLvl(taskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventLvlActiveLvl, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForXferEventDeassertCond(taskHandle, data)
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCond, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedRdyForXferEventDeassertCond(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventDeassertCond, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedRdyForXferEventDeassertCond(taskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventDeassertCond, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle, data)
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventDeassertCondCustomThreshold, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedDataActiveEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedDataActiveEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedDataActiveEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedDataActiveEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedDataActiveEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedDataActiveEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedDataActiveEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxGetExportedDataActiveEventLvlActiveLvl, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedDataActiveEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxSetExportedDataActiveEventLvlActiveLvl, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedDataActiveEventLvlActiveLvl(taskHandle)
    ccall((:DAQmxResetExportedDataActiveEventLvlActiveLvl, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForStartEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedRdyForStartEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedRdyForStartEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForStartEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedRdyForStartEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedRdyForStartEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForStartEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxGetExportedRdyForStartEventLvlActiveLvl, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedRdyForStartEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForStartEventLvlActiveLvl, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedRdyForStartEventLvlActiveLvl(taskHandle)
    ccall((:DAQmxResetExportedRdyForStartEventLvlActiveLvl, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSyncPulseEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedSyncPulseEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedSyncPulseEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedSyncPulseEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedSyncPulseEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedSyncPulseEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedWatchdogExpiredEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedWatchdogExpiredEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedWatchdogExpiredEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedWatchdogExpiredEventOutputTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetExportedWatchdogExpiredEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedWatchdogExpiredEventOutputTerm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetPersistedChanAuthor(channel, data, bufferSize)
    ccall((:DAQmxGetPersistedChanAuthor, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), channel, data, bufferSize)
end

function DAQmxGetPersistedChanAllowInteractiveEditing(channel, data)
    ccall((:DAQmxGetPersistedChanAllowInteractiveEditing, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), channel, data)
end

function DAQmxGetPersistedChanAllowInteractiveDeletion(channel, data)
    ccall((:DAQmxGetPersistedChanAllowInteractiveDeletion, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), channel, data)
end

function DAQmxGetPersistedScaleAuthor(scaleName, data, bufferSize)
    ccall((:DAQmxGetPersistedScaleAuthor, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), scaleName, data, bufferSize)
end

function DAQmxGetPersistedScaleAllowInteractiveEditing(scaleName, data)
    ccall((:DAQmxGetPersistedScaleAllowInteractiveEditing, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), scaleName, data)
end

function DAQmxGetPersistedScaleAllowInteractiveDeletion(scaleName, data)
    ccall((:DAQmxGetPersistedScaleAllowInteractiveDeletion, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), scaleName, data)
end

function DAQmxGetPersistedTaskAuthor(taskName, data, bufferSize)
    ccall((:DAQmxGetPersistedTaskAuthor, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), taskName, data, bufferSize)
end

function DAQmxGetPersistedTaskAllowInteractiveEditing(taskName, data)
    ccall((:DAQmxGetPersistedTaskAllowInteractiveEditing, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), taskName, data)
end

function DAQmxGetPersistedTaskAllowInteractiveDeletion(taskName, data)
    ccall((:DAQmxGetPersistedTaskAllowInteractiveDeletion, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), taskName, data)
end

function DAQmxGetPhysicalChanAISupportedMeasTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAISupportedMeasTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAITermCfgs(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAITermCfgs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAIInputSrcs(physicalChannel, data, bufferSize)
    ccall((:DAQmxGetPhysicalChanAIInputSrcs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), physicalChannel, data, bufferSize)
end

function DAQmxGetPhysicalChanAISensorPowerTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAISensorPowerTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAISensorPowerVoltageRangeVals(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAISensorPowerVoltageRangeVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAIPowerControlVoltage(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAIPowerControlVoltage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), physicalChannel, data)
end

function DAQmxSetPhysicalChanAIPowerControlVoltage(physicalChannel, data)
    ccall((:DAQmxSetPhysicalChanAIPowerControlVoltage, NIDAQmx), int32, (Ptr{Cchar}, float64), physicalChannel, data)
end

function DAQmxResetPhysicalChanAIPowerControlVoltage(physicalChannel)
    ccall((:DAQmxResetPhysicalChanAIPowerControlVoltage, NIDAQmx), int32, (Ptr{Cchar},), physicalChannel)
end

function DAQmxGetPhysicalChanAIPowerControlEnable(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAIPowerControlEnable, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxSetPhysicalChanAIPowerControlEnable(physicalChannel, data)
    ccall((:DAQmxSetPhysicalChanAIPowerControlEnable, NIDAQmx), int32, (Ptr{Cchar}, bool32), physicalChannel, data)
end

function DAQmxResetPhysicalChanAIPowerControlEnable(physicalChannel)
    ccall((:DAQmxResetPhysicalChanAIPowerControlEnable, NIDAQmx), int32, (Ptr{Cchar},), physicalChannel)
end

function DAQmxGetPhysicalChanAIPowerControlType(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAIPowerControlType, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), physicalChannel, data)
end

function DAQmxSetPhysicalChanAIPowerControlType(physicalChannel, data)
    ccall((:DAQmxSetPhysicalChanAIPowerControlType, NIDAQmx), int32, (Ptr{Cchar}, int32), physicalChannel, data)
end

function DAQmxResetPhysicalChanAIPowerControlType(physicalChannel)
    ccall((:DAQmxResetPhysicalChanAIPowerControlType, NIDAQmx), int32, (Ptr{Cchar},), physicalChannel)
end

function DAQmxGetPhysicalChanAISensorPowerOpenChan(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAISensorPowerOpenChan, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAISensorPowerOvercurrent(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAISensorPowerOvercurrent, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAOSupportedOutputTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAOSupportedOutputTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAOSupportedPowerUpOutputTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAOSupportedPowerUpOutputTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAOTermCfgs(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOTermCfgs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAOManualControlEnable(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOManualControlEnable, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxSetPhysicalChanAOManualControlEnable(physicalChannel, data)
    ccall((:DAQmxSetPhysicalChanAOManualControlEnable, NIDAQmx), int32, (Ptr{Cchar}, bool32), physicalChannel, data)
end

function DAQmxResetPhysicalChanAOManualControlEnable(physicalChannel)
    ccall((:DAQmxResetPhysicalChanAOManualControlEnable, NIDAQmx), int32, (Ptr{Cchar},), physicalChannel)
end

function DAQmxGetPhysicalChanAOManualControlShortDetected(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOManualControlShortDetected, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAOManualControlAmplitude(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOManualControlAmplitude, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAOManualControlFreq(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOManualControlFreq, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), physicalChannel, data)
end

function DAQmxGetAOPowerAmpChannelEnable(physicalChannel, data)
    ccall((:DAQmxGetAOPowerAmpChannelEnable, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxSetAOPowerAmpChannelEnable(physicalChannel, data)
    ccall((:DAQmxSetAOPowerAmpChannelEnable, NIDAQmx), int32, (Ptr{Cchar}, bool32), physicalChannel, data)
end

function DAQmxResetAOPowerAmpChannelEnable(physicalChannel)
    ccall((:DAQmxResetAOPowerAmpChannelEnable, NIDAQmx), int32, (Ptr{Cchar},), physicalChannel)
end

function DAQmxGetAOPowerAmpScalingCoeff(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetAOPowerAmpScalingCoeff, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetAOPowerAmpOvercurrent(physicalChannel, data)
    ccall((:DAQmxGetAOPowerAmpOvercurrent, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetAOPowerAmpGain(physicalChannel, data)
    ccall((:DAQmxGetAOPowerAmpGain, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), physicalChannel, data)
end

function DAQmxGetAOPowerAmpOffset(physicalChannel, data)
    ccall((:DAQmxGetAOPowerAmpOffset, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDIPortWidth(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDIPortWidth, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDISampClkSupported(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDISampClkSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDISampModes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanDISampModes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanDIChangeDetectSupported(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDIChangeDetectSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDOPortWidth(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDOPortWidth, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDOSampClkSupported(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDOSampClkSupported, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDOSampModes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanDOSampModes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanCISupportedMeasTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanCISupportedMeasTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanCOSupportedOutputTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanCOSupportedOutputTypes, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanDigPortLogicFamily(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDigPortLogicFamily, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), physicalChannel, data)
end

function DAQmxSetPhysicalChanDigPortLogicFamily(physicalChannel, data)
    ccall((:DAQmxSetPhysicalChanDigPortLogicFamily, NIDAQmx), int32, (Ptr{Cchar}, int32), physicalChannel, data)
end

function DAQmxResetPhysicalChanDigPortLogicFamily(physicalChannel)
    ccall((:DAQmxResetPhysicalChanDigPortLogicFamily, NIDAQmx), int32, (Ptr{Cchar},), physicalChannel)
end

function DAQmxGetPhysicalChanTEDSMfgID(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanTEDSMfgID, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanTEDSModelNum(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanTEDSModelNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanTEDSSerialNum(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanTEDSSerialNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanTEDSVersionNum(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanTEDSVersionNum, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanTEDSVersionLetter(physicalChannel, data, bufferSize)
    ccall((:DAQmxGetPhysicalChanTEDSVersionLetter, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), physicalChannel, data, bufferSize)
end

function DAQmxGetPhysicalChanTEDSBitStream(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanTEDSBitStream, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt8}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanTEDSTemplateIDs(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanTEDSTemplateIDs, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetReadRelativeTo(taskHandle, data)
    ccall((:DAQmxGetReadRelativeTo, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetReadRelativeTo(taskHandle, data)
    ccall((:DAQmxSetReadRelativeTo, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetReadRelativeTo(taskHandle)
    ccall((:DAQmxResetReadRelativeTo, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadOffset(taskHandle, data)
    ccall((:DAQmxGetReadOffset, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetReadOffset(taskHandle, data)
    ccall((:DAQmxSetReadOffset, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetReadOffset(taskHandle)
    ccall((:DAQmxResetReadOffset, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadChannelsToRead(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadChannelsToRead, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetReadChannelsToRead(taskHandle, data)
    ccall((:DAQmxSetReadChannelsToRead, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetReadChannelsToRead(taskHandle)
    ccall((:DAQmxResetReadChannelsToRead, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadReadAllAvailSamp(taskHandle, data)
    ccall((:DAQmxGetReadReadAllAvailSamp, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetReadReadAllAvailSamp(taskHandle, data)
    ccall((:DAQmxSetReadReadAllAvailSamp, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetReadReadAllAvailSamp(taskHandle)
    ccall((:DAQmxResetReadReadAllAvailSamp, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadAutoStart(taskHandle, data)
    ccall((:DAQmxGetReadAutoStart, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetReadAutoStart(taskHandle, data)
    ccall((:DAQmxSetReadAutoStart, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetReadAutoStart(taskHandle)
    ccall((:DAQmxResetReadAutoStart, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadOverWrite(taskHandle, data)
    ccall((:DAQmxGetReadOverWrite, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetReadOverWrite(taskHandle, data)
    ccall((:DAQmxSetReadOverWrite, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetReadOverWrite(taskHandle)
    ccall((:DAQmxResetReadOverWrite, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingFilePath(taskHandle, data, bufferSize)
    ccall((:DAQmxGetLoggingFilePath, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetLoggingFilePath(taskHandle, data)
    ccall((:DAQmxSetLoggingFilePath, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetLoggingFilePath(taskHandle)
    ccall((:DAQmxResetLoggingFilePath, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingMode(taskHandle, data)
    ccall((:DAQmxGetLoggingMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetLoggingMode(taskHandle, data)
    ccall((:DAQmxSetLoggingMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetLoggingMode(taskHandle)
    ccall((:DAQmxResetLoggingMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingTDMSGroupName(taskHandle, data, bufferSize)
    ccall((:DAQmxGetLoggingTDMSGroupName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetLoggingTDMSGroupName(taskHandle, data)
    ccall((:DAQmxSetLoggingTDMSGroupName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetLoggingTDMSGroupName(taskHandle)
    ccall((:DAQmxResetLoggingTDMSGroupName, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingTDMSOperation(taskHandle, data)
    ccall((:DAQmxGetLoggingTDMSOperation, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetLoggingTDMSOperation(taskHandle, data)
    ccall((:DAQmxSetLoggingTDMSOperation, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetLoggingTDMSOperation(taskHandle)
    ccall((:DAQmxResetLoggingTDMSOperation, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingPause(taskHandle, data)
    ccall((:DAQmxGetLoggingPause, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetLoggingPause(taskHandle, data)
    ccall((:DAQmxSetLoggingPause, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetLoggingPause(taskHandle)
    ccall((:DAQmxResetLoggingPause, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingSampsPerFile(taskHandle, data)
    ccall((:DAQmxGetLoggingSampsPerFile, NIDAQmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxSetLoggingSampsPerFile(taskHandle, data)
    ccall((:DAQmxSetLoggingSampsPerFile, NIDAQmx), int32, (TaskHandle, uInt64), taskHandle, data)
end

function DAQmxResetLoggingSampsPerFile(taskHandle)
    ccall((:DAQmxResetLoggingSampsPerFile, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingFileWriteSize(taskHandle, data)
    ccall((:DAQmxGetLoggingFileWriteSize, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetLoggingFileWriteSize(taskHandle, data)
    ccall((:DAQmxSetLoggingFileWriteSize, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetLoggingFileWriteSize(taskHandle)
    ccall((:DAQmxResetLoggingFileWriteSize, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingFilePreallocationSize(taskHandle, data)
    ccall((:DAQmxGetLoggingFilePreallocationSize, NIDAQmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxSetLoggingFilePreallocationSize(taskHandle, data)
    ccall((:DAQmxSetLoggingFilePreallocationSize, NIDAQmx), int32, (TaskHandle, uInt64), taskHandle, data)
end

function DAQmxResetLoggingFilePreallocationSize(taskHandle)
    ccall((:DAQmxResetLoggingFilePreallocationSize, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadCurrReadPos(taskHandle, data)
    ccall((:DAQmxGetReadCurrReadPos, NIDAQmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxGetReadAvailSampPerChan(taskHandle, data)
    ccall((:DAQmxGetReadAvailSampPerChan, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetReadTotalSampPerChanAcquired(taskHandle, data)
    ccall((:DAQmxGetReadTotalSampPerChanAcquired, NIDAQmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxGetReadCommonModeRangeErrorChansExist(taskHandle, data)
    ccall((:DAQmxGetReadCommonModeRangeErrorChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadCommonModeRangeErrorChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadCommonModeRangeErrorChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadExcitFaultChansExist(taskHandle, data)
    ccall((:DAQmxGetReadExcitFaultChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadExcitFaultChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadExcitFaultChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOvercurrentChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOvercurrentChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOvercurrentChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOvercurrentChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOvertemperatureChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOvertemperatureChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOvertemperatureChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOvertemperatureChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOpenChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOpenChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOpenChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOpenChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOpenChansDetails(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOpenChansDetails, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOpenCurrentLoopChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOpenCurrentLoopChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOpenCurrentLoopChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOpenCurrentLoopChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOpenThrmcplChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOpenThrmcplChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOpenThrmcplChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOpenThrmcplChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOverloadedChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOverloadedChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOverloadedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOverloadedChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadInputLimitsFaultChansExist(taskHandle, data)
    ccall((:DAQmxGetReadInputLimitsFaultChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadInputLimitsFaultChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadInputLimitsFaultChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadPLLUnlockedChansExist(taskHandle, data)
    ccall((:DAQmxGetReadPLLUnlockedChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadPLLUnlockedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadPLLUnlockedChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadPowerSupplyFaultChansExist(taskHandle, data)
    ccall((:DAQmxGetReadPowerSupplyFaultChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadPowerSupplyFaultChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadPowerSupplyFaultChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadSyncUnlockedChansExist(taskHandle, data)
    ccall((:DAQmxGetReadSyncUnlockedChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadSyncUnlockedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadSyncUnlockedChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadAccessoryInsertionOrRemovalDetected(taskHandle, data)
    ccall((:DAQmxGetReadAccessoryInsertionOrRemovalDetected, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadDevsWithInsertedOrRemovedAccessories(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadDevsWithInsertedOrRemovedAccessories, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetRemoteSenseErrorChansExist(taskHandle, data)
    ccall((:DAQmxGetRemoteSenseErrorChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetRemoteSenseErrorChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetRemoteSenseErrorChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetAuxPowerErrorChansExist(taskHandle, data)
    ccall((:DAQmxGetAuxPowerErrorChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetAuxPowerErrorChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAuxPowerErrorChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReverseVoltageErrorChansExist(taskHandle, data)
    ccall((:DAQmxGetReverseVoltageErrorChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReverseVoltageErrorChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReverseVoltageErrorChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadChangeDetectHasOverflowed(taskHandle, data)
    ccall((:DAQmxGetReadChangeDetectHasOverflowed, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadRawDataWidth(taskHandle, data)
    ccall((:DAQmxGetReadRawDataWidth, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetReadNumChans(taskHandle, data)
    ccall((:DAQmxGetReadNumChans, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetReadDigitalLinesBytesPerChan(taskHandle, data)
    ccall((:DAQmxGetReadDigitalLinesBytesPerChan, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetReadWaitMode(taskHandle, data)
    ccall((:DAQmxGetReadWaitMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetReadWaitMode(taskHandle, data)
    ccall((:DAQmxSetReadWaitMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetReadWaitMode(taskHandle)
    ccall((:DAQmxResetReadWaitMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadSleepTime(taskHandle, data)
    ccall((:DAQmxGetReadSleepTime, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetReadSleepTime(taskHandle, data)
    ccall((:DAQmxSetReadSleepTime, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetReadSleepTime(taskHandle)
    ccall((:DAQmxResetReadSleepTime, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeConvLateErrorsToWarnings(taskHandle, data)
    ccall((:DAQmxGetRealTimeConvLateErrorsToWarnings, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRealTimeConvLateErrorsToWarnings(taskHandle, data)
    ccall((:DAQmxSetRealTimeConvLateErrorsToWarnings, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRealTimeConvLateErrorsToWarnings(taskHandle)
    ccall((:DAQmxResetRealTimeConvLateErrorsToWarnings, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeNumOfWarmupIters(taskHandle, data)
    ccall((:DAQmxGetRealTimeNumOfWarmupIters, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetRealTimeNumOfWarmupIters(taskHandle, data)
    ccall((:DAQmxSetRealTimeNumOfWarmupIters, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetRealTimeNumOfWarmupIters(taskHandle)
    ccall((:DAQmxResetRealTimeNumOfWarmupIters, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeWaitForNextSampClkWaitMode(taskHandle, data)
    ccall((:DAQmxGetRealTimeWaitForNextSampClkWaitMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetRealTimeWaitForNextSampClkWaitMode(taskHandle, data)
    ccall((:DAQmxSetRealTimeWaitForNextSampClkWaitMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetRealTimeWaitForNextSampClkWaitMode(taskHandle)
    ccall((:DAQmxResetRealTimeWaitForNextSampClkWaitMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeReportMissedSamp(taskHandle, data)
    ccall((:DAQmxGetRealTimeReportMissedSamp, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRealTimeReportMissedSamp(taskHandle, data)
    ccall((:DAQmxSetRealTimeReportMissedSamp, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRealTimeReportMissedSamp(taskHandle)
    ccall((:DAQmxResetRealTimeReportMissedSamp, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeWriteRecoveryMode(taskHandle, data)
    ccall((:DAQmxGetRealTimeWriteRecoveryMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetRealTimeWriteRecoveryMode(taskHandle, data)
    ccall((:DAQmxSetRealTimeWriteRecoveryMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetRealTimeWriteRecoveryMode(taskHandle)
    ccall((:DAQmxResetRealTimeWriteRecoveryMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetScaleDescr(scaleName, data, bufferSize)
    ccall((:DAQmxGetScaleDescr, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), scaleName, data, bufferSize)
end

function DAQmxSetScaleDescr(scaleName, data)
    ccall((:DAQmxSetScaleDescr, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}), scaleName, data)
end

function DAQmxGetScaleScaledUnits(scaleName, data, bufferSize)
    ccall((:DAQmxGetScaleScaledUnits, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), scaleName, data, bufferSize)
end

function DAQmxSetScaleScaledUnits(scaleName, data)
    ccall((:DAQmxSetScaleScaledUnits, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}), scaleName, data)
end

function DAQmxGetScalePreScaledUnits(scaleName, data)
    ccall((:DAQmxGetScalePreScaledUnits, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), scaleName, data)
end

function DAQmxSetScalePreScaledUnits(scaleName, data)
    ccall((:DAQmxSetScalePreScaledUnits, NIDAQmx), int32, (Ptr{Cchar}, int32), scaleName, data)
end

function DAQmxGetScaleType(scaleName, data)
    ccall((:DAQmxGetScaleType, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), scaleName, data)
end

function DAQmxGetScaleLinSlope(scaleName, data)
    ccall((:DAQmxGetScaleLinSlope, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleLinSlope(scaleName, data)
    ccall((:DAQmxSetScaleLinSlope, NIDAQmx), int32, (Ptr{Cchar}, float64), scaleName, data)
end

function DAQmxGetScaleLinYIntercept(scaleName, data)
    ccall((:DAQmxGetScaleLinYIntercept, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleLinYIntercept(scaleName, data)
    ccall((:DAQmxSetScaleLinYIntercept, NIDAQmx), int32, (Ptr{Cchar}, float64), scaleName, data)
end

function DAQmxGetScaleMapScaledMax(scaleName, data)
    ccall((:DAQmxGetScaleMapScaledMax, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleMapScaledMax(scaleName, data)
    ccall((:DAQmxSetScaleMapScaledMax, NIDAQmx), int32, (Ptr{Cchar}, float64), scaleName, data)
end

function DAQmxGetScaleMapPreScaledMax(scaleName, data)
    ccall((:DAQmxGetScaleMapPreScaledMax, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleMapPreScaledMax(scaleName, data)
    ccall((:DAQmxSetScaleMapPreScaledMax, NIDAQmx), int32, (Ptr{Cchar}, float64), scaleName, data)
end

function DAQmxGetScaleMapScaledMin(scaleName, data)
    ccall((:DAQmxGetScaleMapScaledMin, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleMapScaledMin(scaleName, data)
    ccall((:DAQmxSetScaleMapScaledMin, NIDAQmx), int32, (Ptr{Cchar}, float64), scaleName, data)
end

function DAQmxGetScaleMapPreScaledMin(scaleName, data)
    ccall((:DAQmxGetScaleMapPreScaledMin, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleMapPreScaledMin(scaleName, data)
    ccall((:DAQmxSetScaleMapPreScaledMin, NIDAQmx), int32, (Ptr{Cchar}, float64), scaleName, data)
end

function DAQmxGetScalePolyForwardCoeff(scaleName, data, arraySizeInElements)
    ccall((:DAQmxGetScalePolyForwardCoeff, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxSetScalePolyForwardCoeff(scaleName, data, arraySizeInElements)
    ccall((:DAQmxSetScalePolyForwardCoeff, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxGetScalePolyReverseCoeff(scaleName, data, arraySizeInElements)
    ccall((:DAQmxGetScalePolyReverseCoeff, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxSetScalePolyReverseCoeff(scaleName, data, arraySizeInElements)
    ccall((:DAQmxSetScalePolyReverseCoeff, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxGetScaleTableScaledVals(scaleName, data, arraySizeInElements)
    ccall((:DAQmxGetScaleTableScaledVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxSetScaleTableScaledVals(scaleName, data, arraySizeInElements)
    ccall((:DAQmxSetScaleTableScaledVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxGetScaleTablePreScaledVals(scaleName, data, arraySizeInElements)
    ccall((:DAQmxGetScaleTablePreScaledVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxSetScaleTablePreScaledVals(scaleName, data, arraySizeInElements)
    ccall((:DAQmxSetScaleTablePreScaledVals, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxGetSwitchChanUsage(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanUsage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{int32}), switchChannelName, data)
end

function DAQmxSetSwitchChanUsage(switchChannelName, data)
    ccall((:DAQmxSetSwitchChanUsage, NIDAQmx), int32, (Ptr{Cchar}, int32), switchChannelName, data)
end

function DAQmxGetSwitchChanAnlgBusSharingEnable(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanAnlgBusSharingEnable, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), switchChannelName, data)
end

function DAQmxSetSwitchChanAnlgBusSharingEnable(switchChannelName, data)
    ccall((:DAQmxSetSwitchChanAnlgBusSharingEnable, NIDAQmx), int32, (Ptr{Cchar}, bool32), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACCarryCurrent(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACCarryCurrent, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACSwitchCurrent(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACSwitchCurrent, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACCarryPwr(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACCarryPwr, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACSwitchPwr(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACSwitchPwr, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCCarryCurrent(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCCarryCurrent, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCSwitchCurrent(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCSwitchCurrent, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCCarryPwr(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCCarryPwr, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCSwitchPwr(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCSwitchPwr, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACVoltage(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACVoltage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCVoltage(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCVoltage, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanWireMode(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanWireMode, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), switchChannelName, data)
end

function DAQmxGetSwitchChanBandwidth(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanBandwidth, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanImpedance(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanImpedance, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchDevSettlingTime(deviceName, data)
    ccall((:DAQmxGetSwitchDevSettlingTime, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), deviceName, data)
end

function DAQmxSetSwitchDevSettlingTime(deviceName, data)
    ccall((:DAQmxSetSwitchDevSettlingTime, NIDAQmx), int32, (Ptr{Cchar}, float64), deviceName, data)
end

function DAQmxGetSwitchDevAutoConnAnlgBus(deviceName, data)
    ccall((:DAQmxGetSwitchDevAutoConnAnlgBus, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), deviceName, data)
end

function DAQmxSetSwitchDevAutoConnAnlgBus(deviceName, data)
    ccall((:DAQmxSetSwitchDevAutoConnAnlgBus, NIDAQmx), int32, (Ptr{Cchar}, bool32), deviceName, data)
end

function DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName, data)
    ccall((:DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), deviceName, data)
end

function DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName, data)
    ccall((:DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling, NIDAQmx), int32, (Ptr{Cchar}, bool32), deviceName, data)
end

function DAQmxGetSwitchDevSettled(deviceName, data)
    ccall((:DAQmxGetSwitchDevSettled, NIDAQmx), int32, (Ptr{Cchar}, Ptr{bool32}), deviceName, data)
end

function DAQmxGetSwitchDevRelayList(deviceName, data, bufferSize)
    ccall((:DAQmxGetSwitchDevRelayList, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), deviceName, data, bufferSize)
end

function DAQmxGetSwitchDevNumRelays(deviceName, data)
    ccall((:DAQmxGetSwitchDevNumRelays, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetSwitchDevSwitchChanList(deviceName, data, bufferSize)
    ccall((:DAQmxGetSwitchDevSwitchChanList, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), deviceName, data, bufferSize)
end

function DAQmxGetSwitchDevNumSwitchChans(deviceName, data)
    ccall((:DAQmxGetSwitchDevNumSwitchChans, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetSwitchDevNumRows(deviceName, data)
    ccall((:DAQmxGetSwitchDevNumRows, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetSwitchDevNumColumns(deviceName, data)
    ccall((:DAQmxGetSwitchDevNumColumns, NIDAQmx), int32, (Ptr{Cchar}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetSwitchDevTopology(deviceName, data, bufferSize)
    ccall((:DAQmxGetSwitchDevTopology, NIDAQmx), int32, (Ptr{Cchar}, Ptr{Cchar}, uInt32), deviceName, data, bufferSize)
end

function DAQmxGetSwitchDevTemperature(deviceName, data)
    ccall((:DAQmxGetSwitchDevTemperature, NIDAQmx), int32, (Ptr{Cchar}, Ptr{float64}), deviceName, data)
end

function DAQmxGetSwitchScanBreakMode(taskHandle, data)
    ccall((:DAQmxGetSwitchScanBreakMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSwitchScanBreakMode(taskHandle, data)
    ccall((:DAQmxSetSwitchScanBreakMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSwitchScanBreakMode(taskHandle)
    ccall((:DAQmxResetSwitchScanBreakMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSwitchScanRepeatMode(taskHandle, data)
    ccall((:DAQmxGetSwitchScanRepeatMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSwitchScanRepeatMode(taskHandle, data)
    ccall((:DAQmxSetSwitchScanRepeatMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSwitchScanRepeatMode(taskHandle)
    ccall((:DAQmxResetSwitchScanRepeatMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSwitchScanWaitingForAdv(taskHandle, data)
    ccall((:DAQmxGetSwitchScanWaitingForAdv, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetSysGlobalChans(data, bufferSize)
    ccall((:DAQmxGetSysGlobalChans, NIDAQmx), int32, (Ptr{Cchar}, uInt32), data, bufferSize)
end

function DAQmxGetSysScales(data, bufferSize)
    ccall((:DAQmxGetSysScales, NIDAQmx), int32, (Ptr{Cchar}, uInt32), data, bufferSize)
end

function DAQmxGetSysTasks(data, bufferSize)
    ccall((:DAQmxGetSysTasks, NIDAQmx), int32, (Ptr{Cchar}, uInt32), data, bufferSize)
end

function DAQmxGetSysDevNames(data, bufferSize)
    ccall((:DAQmxGetSysDevNames, NIDAQmx), int32, (Ptr{Cchar}, uInt32), data, bufferSize)
end

function DAQmxGetSysNIDAQMajorVersion(data)
    ccall((:DAQmxGetSysNIDAQMajorVersion, NIDAQmx), int32, (Ptr{uInt32},), data)
end

function DAQmxGetSysNIDAQMinorVersion(data)
    ccall((:DAQmxGetSysNIDAQMinorVersion, NIDAQmx), int32, (Ptr{uInt32},), data)
end

function DAQmxGetSysNIDAQUpdateVersion(data)
    ccall((:DAQmxGetSysNIDAQUpdateVersion, NIDAQmx), int32, (Ptr{uInt32},), data)
end

function DAQmxGetTaskName(taskHandle, data, bufferSize)
    ccall((:DAQmxGetTaskName, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetTaskChannels(taskHandle, data, bufferSize)
    ccall((:DAQmxGetTaskChannels, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetTaskNumChans(taskHandle, data)
    ccall((:DAQmxGetTaskNumChans, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetTaskDevices(taskHandle, data, bufferSize)
    ccall((:DAQmxGetTaskDevices, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetTaskNumDevices(taskHandle, data)
    ccall((:DAQmxGetTaskNumDevices, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetTaskComplete(taskHandle, data)
    ccall((:DAQmxGetTaskComplete, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetSampQuantSampMode(taskHandle, data)
    ccall((:DAQmxGetSampQuantSampMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampQuantSampMode(taskHandle, data)
    ccall((:DAQmxSetSampQuantSampMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampQuantSampMode(taskHandle)
    ccall((:DAQmxResetSampQuantSampMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampQuantSampPerChan(taskHandle, data)
    ccall((:DAQmxGetSampQuantSampPerChan, NIDAQmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxSetSampQuantSampPerChan(taskHandle, data)
    ccall((:DAQmxSetSampQuantSampPerChan, NIDAQmx), int32, (TaskHandle, uInt64), taskHandle, data)
end

function DAQmxResetSampQuantSampPerChan(taskHandle)
    ccall((:DAQmxResetSampQuantSampPerChan, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampTimingType(taskHandle, data)
    ccall((:DAQmxGetSampTimingType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampTimingType(taskHandle, data)
    ccall((:DAQmxSetSampTimingType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampTimingType(taskHandle)
    ccall((:DAQmxResetSampTimingType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkRate(taskHandle, data)
    ccall((:DAQmxGetSampClkRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSampClkRate(taskHandle, data)
    ccall((:DAQmxSetSampClkRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSampClkRate(taskHandle)
    ccall((:DAQmxResetSampClkRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkMaxRate(taskHandle, data)
    ccall((:DAQmxGetSampClkMaxRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxGetSampClkSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetSampClkSrc(taskHandle, data)
    ccall((:DAQmxSetSampClkSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetSampClkSrc(taskHandle)
    ccall((:DAQmxResetSampClkSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkActiveEdge(taskHandle, data)
    ccall((:DAQmxGetSampClkActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkActiveEdge(taskHandle, data)
    ccall((:DAQmxSetSampClkActiveEdge, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkActiveEdge(taskHandle)
    ccall((:DAQmxResetSampClkActiveEdge, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkOverrunBehavior(taskHandle, data)
    ccall((:DAQmxGetSampClkOverrunBehavior, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkOverrunBehavior(taskHandle, data)
    ccall((:DAQmxSetSampClkOverrunBehavior, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkOverrunBehavior(taskHandle)
    ccall((:DAQmxResetSampClkOverrunBehavior, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkUnderflowBehavior(taskHandle, data)
    ccall((:DAQmxGetSampClkUnderflowBehavior, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkUnderflowBehavior(taskHandle, data)
    ccall((:DAQmxSetSampClkUnderflowBehavior, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkUnderflowBehavior(taskHandle)
    ccall((:DAQmxResetSampClkUnderflowBehavior, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseDiv(taskHandle, data)
    ccall((:DAQmxGetSampClkTimebaseDiv, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetSampClkTimebaseDiv(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseDiv, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetSampClkTimebaseDiv(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseDiv, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetSampClkTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetSampClkTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSampClkTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSampClkTimebaseRate(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetSampClkTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetSampClkTimebaseSrc(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseActiveEdge(taskHandle, data)
    ccall((:DAQmxGetSampClkTimebaseActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkTimebaseActiveEdge(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseActiveEdge, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkTimebaseActiveEdge(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseActiveEdge, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseMasterTimebaseDiv(taskHandle, data)
    ccall((:DAQmxGetSampClkTimebaseMasterTimebaseDiv, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetSampClkTimebaseMasterTimebaseDiv(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseMasterTimebaseDiv, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetSampClkTimebaseMasterTimebaseDiv(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseMasterTimebaseDiv, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkTimebaseTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetSampClkDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetSampClkDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetSampClkDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetSampClkDigFltrEnable(taskHandle)
    ccall((:DAQmxResetSampClkDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetSampClkDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSampClkDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSampClkDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetSampClkDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetSampClkDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetSampClkDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetSampClkDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetSampClkDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSampClkDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSampClkDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetSampClkDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetSampClkDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetSampClkDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetSampClkDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetSampClkDigSyncEnable(taskHandle)
    ccall((:DAQmxResetSampClkDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkWriteWfmUseInitialWfmDT(taskHandle, data)
    ccall((:DAQmxGetSampClkWriteWfmUseInitialWfmDT, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetSampClkWriteWfmUseInitialWfmDT(taskHandle, data)
    ccall((:DAQmxSetSampClkWriteWfmUseInitialWfmDT, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetSampClkWriteWfmUseInitialWfmDT(taskHandle)
    ccall((:DAQmxResetSampClkWriteWfmUseInitialWfmDT, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetHshkDelayAfterXfer(taskHandle, data)
    ccall((:DAQmxGetHshkDelayAfterXfer, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetHshkDelayAfterXfer(taskHandle, data)
    ccall((:DAQmxSetHshkDelayAfterXfer, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetHshkDelayAfterXfer(taskHandle)
    ccall((:DAQmxResetHshkDelayAfterXfer, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetHshkStartCond(taskHandle, data)
    ccall((:DAQmxGetHshkStartCond, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetHshkStartCond(taskHandle, data)
    ccall((:DAQmxSetHshkStartCond, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetHshkStartCond(taskHandle)
    ccall((:DAQmxResetHshkStartCond, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetHshkSampleInputDataWhen(taskHandle, data)
    ccall((:DAQmxGetHshkSampleInputDataWhen, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetHshkSampleInputDataWhen(taskHandle, data)
    ccall((:DAQmxSetHshkSampleInputDataWhen, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetHshkSampleInputDataWhen(taskHandle)
    ccall((:DAQmxResetHshkSampleInputDataWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetChangeDetectDIRisingEdgePhysicalChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetChangeDetectDIRisingEdgePhysicalChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetChangeDetectDIRisingEdgePhysicalChans(taskHandle, data)
    ccall((:DAQmxSetChangeDetectDIRisingEdgePhysicalChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetChangeDetectDIRisingEdgePhysicalChans(taskHandle)
    ccall((:DAQmxResetChangeDetectDIRisingEdgePhysicalChans, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetChangeDetectDIFallingEdgePhysicalChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetChangeDetectDIFallingEdgePhysicalChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetChangeDetectDIFallingEdgePhysicalChans(taskHandle, data)
    ccall((:DAQmxSetChangeDetectDIFallingEdgePhysicalChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetChangeDetectDIFallingEdgePhysicalChans(taskHandle)
    ccall((:DAQmxResetChangeDetectDIFallingEdgePhysicalChans, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetChangeDetectDITristate(taskHandle, data)
    ccall((:DAQmxGetChangeDetectDITristate, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetChangeDetectDITristate(taskHandle, data)
    ccall((:DAQmxSetChangeDetectDITristate, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetChangeDetectDITristate(taskHandle)
    ccall((:DAQmxResetChangeDetectDITristate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetOnDemandSimultaneousAOEnable(taskHandle, data)
    ccall((:DAQmxGetOnDemandSimultaneousAOEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetOnDemandSimultaneousAOEnable(taskHandle, data)
    ccall((:DAQmxSetOnDemandSimultaneousAOEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetOnDemandSimultaneousAOEnable(taskHandle)
    ccall((:DAQmxResetOnDemandSimultaneousAOEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetImplicitUnderflowBehavior(taskHandle, data)
    ccall((:DAQmxGetImplicitUnderflowBehavior, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetImplicitUnderflowBehavior(taskHandle, data)
    ccall((:DAQmxSetImplicitUnderflowBehavior, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetImplicitUnderflowBehavior(taskHandle)
    ccall((:DAQmxResetImplicitUnderflowBehavior, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvRate(taskHandle, data)
    ccall((:DAQmxGetAIConvRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAIConvRate(taskHandle, data)
    ccall((:DAQmxSetAIConvRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAIConvRate(taskHandle)
    ccall((:DAQmxResetAIConvRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvRateEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvRateEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvRateEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvRateEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetAIConvMaxRate(taskHandle, data)
    ccall((:DAQmxGetAIConvMaxRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxGetAIConvMaxRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvMaxRateEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxGetAIConvSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAIConvSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAIConvSrc(taskHandle, data)
    ccall((:DAQmxSetAIConvSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAIConvSrc(taskHandle)
    ccall((:DAQmxResetAIConvSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvSrcEx(taskHandle, deviceNames, data, bufferSize)
    ccall((:DAQmxGetAIConvSrcEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, deviceNames, data, bufferSize)
end

function DAQmxSetAIConvSrcEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvSrcEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvSrcEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvSrcEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetAIConvActiveEdge(taskHandle, data)
    ccall((:DAQmxGetAIConvActiveEdge, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAIConvActiveEdge(taskHandle, data)
    ccall((:DAQmxSetAIConvActiveEdge, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAIConvActiveEdge(taskHandle)
    ccall((:DAQmxResetAIConvActiveEdge, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvActiveEdgeEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvActiveEdgeEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvActiveEdgeEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvActiveEdgeEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvActiveEdgeEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvActiveEdgeEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetAIConvTimebaseDiv(taskHandle, data)
    ccall((:DAQmxGetAIConvTimebaseDiv, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetAIConvTimebaseDiv(taskHandle, data)
    ccall((:DAQmxSetAIConvTimebaseDiv, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetAIConvTimebaseDiv(taskHandle)
    ccall((:DAQmxResetAIConvTimebaseDiv, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvTimebaseDivEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvTimebaseDivEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{uInt32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvTimebaseDivEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvTimebaseDivEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvTimebaseDivEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvTimebaseDivEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetAIConvTimebaseSrc(taskHandle, data)
    ccall((:DAQmxGetAIConvTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAIConvTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAIConvTimebaseSrc, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAIConvTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAIConvTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvTimebaseSrcEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvTimebaseSrcEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvTimebaseSrcEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvTimebaseSrcEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvTimebaseSrcEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvTimebaseSrcEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetDelayFromSampClkDelayUnits(taskHandle, data)
    ccall((:DAQmxGetDelayFromSampClkDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDelayFromSampClkDelayUnits(taskHandle, data)
    ccall((:DAQmxSetDelayFromSampClkDelayUnits, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDelayFromSampClkDelayUnits(taskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelayUnits, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDelayFromSampClkDelayUnitsEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetDelayFromSampClkDelayUnitsEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, deviceNames, data)
end

function DAQmxSetDelayFromSampClkDelayUnitsEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetDelayFromSampClkDelayUnitsEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, deviceNames, data)
end

function DAQmxResetDelayFromSampClkDelayUnitsEx(taskHandle, deviceNames)
    ccall((:DAQmxResetDelayFromSampClkDelayUnitsEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetDelayFromSampClkDelay(taskHandle, data)
    ccall((:DAQmxGetDelayFromSampClkDelay, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDelayFromSampClkDelay(taskHandle, data)
    ccall((:DAQmxSetDelayFromSampClkDelay, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDelayFromSampClkDelay(taskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelay, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDelayFromSampClkDelayEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetDelayFromSampClkDelayEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxSetDelayFromSampClkDelayEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetDelayFromSampClkDelayEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, deviceNames, data)
end

function DAQmxResetDelayFromSampClkDelayEx(taskHandle, deviceNames)
    ccall((:DAQmxResetDelayFromSampClkDelayEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAIConvDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAIConvDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAIConvDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAIConvDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigFltrEnableEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvDigFltrEnableEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvDigFltrEnableEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigFltrEnableEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigFltrEnableEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigFltrEnableEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAIConvDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAIConvDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAIConvDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigFltrMinPulseWidthEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidthEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvDigFltrMinPulseWidthEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigFltrMinPulseWidthEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigFltrMinPulseWidthEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigFltrMinPulseWidthEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAIConvDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAIConvDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAIConvDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAIConvDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigFltrTimebaseSrcEx(taskHandle, deviceNames, data, bufferSize)
    ccall((:DAQmxGetAIConvDigFltrTimebaseSrcEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}, uInt32), taskHandle, deviceNames, data, bufferSize)
end

function DAQmxSetAIConvDigFltrTimebaseSrcEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseSrcEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{Cchar}), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigFltrTimebaseSrcEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigFltrTimebaseSrcEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAIConvDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAIConvDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAIConvDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAIConvDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigFltrTimebaseRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvDigFltrTimebaseRateEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvDigFltrTimebaseRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRateEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigFltrTimebaseRateEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigFltrTimebaseRateEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAIConvDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAIConvDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAIConvDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAIConvDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAIConvDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigSyncEnableEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvDigSyncEnableEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{bool32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvDigSyncEnableEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigSyncEnableEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, bool32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigSyncEnableEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigSyncEnableEx, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, deviceNames)
end

function DAQmxGetMasterTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetMasterTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetMasterTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetMasterTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetMasterTimebaseRate(taskHandle)
    ccall((:DAQmxResetMasterTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetMasterTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetMasterTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetMasterTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetMasterTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetMasterTimebaseSrc(taskHandle)
    ccall((:DAQmxResetMasterTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefClkRate(taskHandle, data)
    ccall((:DAQmxGetRefClkRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetRefClkRate(taskHandle, data)
    ccall((:DAQmxSetRefClkRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetRefClkRate(taskHandle)
    ccall((:DAQmxResetRefClkRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefClkSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetRefClkSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetRefClkSrc(taskHandle, data)
    ccall((:DAQmxSetRefClkSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetRefClkSrc(taskHandle)
    ccall((:DAQmxResetRefClkSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseType(taskHandle, data)
    ccall((:DAQmxGetSyncPulseType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSyncPulseType(taskHandle, data)
    ccall((:DAQmxSetSyncPulseType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSyncPulseType(taskHandle)
    ccall((:DAQmxResetSyncPulseType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSyncPulseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetSyncPulseSrc(taskHandle, data)
    ccall((:DAQmxSetSyncPulseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetSyncPulseSrc(taskHandle)
    ccall((:DAQmxResetSyncPulseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseTimeWhen(taskHandle, data)
    ccall((:DAQmxGetSyncPulseTimeWhen, NIDAQmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxSetSyncPulseTimeWhen(taskHandle, data)
    ccall((:DAQmxSetSyncPulseTimeWhen, NIDAQmx), int32, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function DAQmxResetSyncPulseTimeWhen(taskHandle)
    ccall((:DAQmxResetSyncPulseTimeWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseTimeTimescale(taskHandle, data)
    ccall((:DAQmxGetSyncPulseTimeTimescale, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSyncPulseTimeTimescale(taskHandle, data)
    ccall((:DAQmxSetSyncPulseTimeTimescale, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSyncPulseTimeTimescale(taskHandle)
    ccall((:DAQmxResetSyncPulseTimeTimescale, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseSyncTime(taskHandle, data)
    ccall((:DAQmxGetSyncPulseSyncTime, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxGetSyncPulseMinDelayToStart(taskHandle, data)
    ccall((:DAQmxGetSyncPulseMinDelayToStart, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSyncPulseMinDelayToStart(taskHandle, data)
    ccall((:DAQmxSetSyncPulseMinDelayToStart, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSyncPulseMinDelayToStart(taskHandle)
    ccall((:DAQmxResetSyncPulseMinDelayToStart, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseResetTime(taskHandle, data)
    ccall((:DAQmxGetSyncPulseResetTime, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxGetSyncPulseResetDelay(taskHandle, data)
    ccall((:DAQmxGetSyncPulseResetDelay, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSyncPulseResetDelay(taskHandle, data)
    ccall((:DAQmxSetSyncPulseResetDelay, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSyncPulseResetDelay(taskHandle)
    ccall((:DAQmxResetSyncPulseResetDelay, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSyncPulseTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetSyncClkInterval(taskHandle, data)
    ccall((:DAQmxGetSyncClkInterval, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetSyncClkInterval(taskHandle, data)
    ccall((:DAQmxSetSyncClkInterval, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetSyncClkInterval(taskHandle)
    ccall((:DAQmxResetSyncClkInterval, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampTimingEngine(taskHandle, data)
    ccall((:DAQmxGetSampTimingEngine, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetSampTimingEngine(taskHandle, data)
    ccall((:DAQmxSetSampTimingEngine, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetSampTimingEngine(taskHandle)
    ccall((:DAQmxResetSampTimingEngine, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampTimestampEnable(taskHandle, data)
    ccall((:DAQmxGetFirstSampTimestampEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetFirstSampTimestampEnable(taskHandle, data)
    ccall((:DAQmxSetFirstSampTimestampEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetFirstSampTimestampEnable(taskHandle)
    ccall((:DAQmxResetFirstSampTimestampEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampTimestampTimescale(taskHandle, data)
    ccall((:DAQmxGetFirstSampTimestampTimescale, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetFirstSampTimestampTimescale(taskHandle, data)
    ccall((:DAQmxSetFirstSampTimestampTimescale, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetFirstSampTimestampTimescale(taskHandle)
    ccall((:DAQmxResetFirstSampTimestampTimescale, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampTimestampVal(taskHandle, data)
    ccall((:DAQmxGetFirstSampTimestampVal, NIDAQmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxGetFirstSampClkWhen(taskHandle, data)
    ccall((:DAQmxGetFirstSampClkWhen, NIDAQmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxSetFirstSampClkWhen(taskHandle, data)
    ccall((:DAQmxSetFirstSampClkWhen, NIDAQmx), int32, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function DAQmxResetFirstSampClkWhen(taskHandle)
    ccall((:DAQmxResetFirstSampClkWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampClkTimescale(taskHandle, data)
    ccall((:DAQmxGetFirstSampClkTimescale, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetFirstSampClkTimescale(taskHandle, data)
    ccall((:DAQmxSetFirstSampClkTimescale, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetFirstSampClkTimescale(taskHandle)
    ccall((:DAQmxResetFirstSampClkTimescale, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampClkOffset(taskHandle, data)
    ccall((:DAQmxGetFirstSampClkOffset, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetFirstSampClkOffset(taskHandle, data)
    ccall((:DAQmxSetFirstSampClkOffset, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetFirstSampClkOffset(taskHandle)
    ccall((:DAQmxResetFirstSampClkOffset, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigType(taskHandle, data)
    ccall((:DAQmxGetStartTrigType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetStartTrigType(taskHandle, data)
    ccall((:DAQmxSetStartTrigType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetStartTrigType(taskHandle)
    ccall((:DAQmxResetStartTrigType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetStartTrigTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetDigEdgeStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigEdge, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigEdge, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigEdge, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigPatternStartTrigSrc(taskHandle)
    ccall((:DAQmxResetDigPatternStartTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternStartTrigPattern(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternStartTrigPattern, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternStartTrigPattern(taskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigPattern, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigPatternStartTrigPattern(taskHandle)
    ccall((:DAQmxResetDigPatternStartTrigPattern, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternStartTrigWhen(taskHandle, data)
    ccall((:DAQmxGetDigPatternStartTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigPatternStartTrigWhen(taskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigWhen, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigPatternStartTrigWhen(taskHandle)
    ccall((:DAQmxResetDigPatternStartTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgEdgeStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgEdgeStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigSlope(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigSlope, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigSlope(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigSlope, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigSlope(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigSlope, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigLvl(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigLvl, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigLvl(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigLvl, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigLvl(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigLvl, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigHyst(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigHyst, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigHyst(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigHyst, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigHyst(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigHyst, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigCoupling, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigCoupling, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigCoupling, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigSrcs(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigSrcs, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgMultiEdgeStartTrigSrcs(taskHandle, data)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigSrcs, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgMultiEdgeStartTrigSrcs(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigSrcs, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigSlopes(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigSlopes, NIDAQmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeStartTrigSlopes(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigSlopes, NIDAQmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeStartTrigSlopes(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigSlopes, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigLvls(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigLvls, NIDAQmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeStartTrigLvls(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigLvls, NIDAQmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeStartTrigLvls(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigLvls, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigHysts(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigHysts, NIDAQmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeStartTrigHysts(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigHysts, NIDAQmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeStartTrigHysts(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigHysts, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigCouplings(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigCouplings, NIDAQmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeStartTrigCouplings(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigCouplings, NIDAQmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeStartTrigCouplings(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigCouplings, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigWhen(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigWhen(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigWhen, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigWhen(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigTop(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigTop, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigTop(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigTop, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigTop(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigTop, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigBtm(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigBtm, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigBtm(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigBtm, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigBtm(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigBtm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigCoupling, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigCoupling, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigCoupling, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTrigWhen(taskHandle, data)
    ccall((:DAQmxGetStartTrigTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxSetStartTrigTrigWhen(taskHandle, data)
    ccall((:DAQmxSetStartTrigTrigWhen, NIDAQmx), int32, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function DAQmxResetStartTrigTrigWhen(taskHandle)
    ccall((:DAQmxResetStartTrigTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTimescale(taskHandle, data)
    ccall((:DAQmxGetStartTrigTimescale, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetStartTrigTimescale(taskHandle, data)
    ccall((:DAQmxSetStartTrigTimescale, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetStartTrigTimescale(taskHandle)
    ccall((:DAQmxResetStartTrigTimescale, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxGetStartTrigTimestampEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetStartTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxSetStartTrigTimestampEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetStartTrigTimestampEnable(taskHandle)
    ccall((:DAQmxResetStartTrigTimestampEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxGetStartTrigTimestampTimescale, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetStartTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxSetStartTrigTimestampTimescale, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetStartTrigTimestampTimescale(taskHandle)
    ccall((:DAQmxResetStartTrigTimestampTimescale, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTimestampVal(taskHandle, data)
    ccall((:DAQmxGetStartTrigTimestampVal, NIDAQmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxGetStartTrigDelay(taskHandle, data)
    ccall((:DAQmxGetStartTrigDelay, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetStartTrigDelay(taskHandle, data)
    ccall((:DAQmxSetStartTrigDelay, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetStartTrigDelay(taskHandle)
    ccall((:DAQmxResetStartTrigDelay, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigDelayUnits(taskHandle, data)
    ccall((:DAQmxGetStartTrigDelayUnits, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetStartTrigDelayUnits(taskHandle, data)
    ccall((:DAQmxSetStartTrigDelayUnits, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetStartTrigDelayUnits(taskHandle)
    ccall((:DAQmxResetStartTrigDelayUnits, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigRetriggerable(taskHandle, data)
    ccall((:DAQmxGetStartTrigRetriggerable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetStartTrigRetriggerable(taskHandle, data)
    ccall((:DAQmxSetStartTrigRetriggerable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetStartTrigRetriggerable(taskHandle)
    ccall((:DAQmxResetStartTrigRetriggerable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTrigWin(taskHandle, data)
    ccall((:DAQmxGetStartTrigTrigWin, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetStartTrigTrigWin(taskHandle, data)
    ccall((:DAQmxSetStartTrigTrigWin, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetStartTrigTrigWin(taskHandle)
    ccall((:DAQmxResetStartTrigTrigWin, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigRetriggerWin(taskHandle, data)
    ccall((:DAQmxGetStartTrigRetriggerWin, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetStartTrigRetriggerWin(taskHandle, data)
    ccall((:DAQmxSetStartTrigRetriggerWin, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetStartTrigRetriggerWin(taskHandle)
    ccall((:DAQmxResetStartTrigRetriggerWin, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigMaxNumTrigsToDetect(taskHandle, data)
    ccall((:DAQmxGetStartTrigMaxNumTrigsToDetect, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetStartTrigMaxNumTrigsToDetect(taskHandle, data)
    ccall((:DAQmxSetStartTrigMaxNumTrigsToDetect, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetStartTrigMaxNumTrigsToDetect(taskHandle)
    ccall((:DAQmxResetStartTrigMaxNumTrigsToDetect, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigType(taskHandle, data)
    ccall((:DAQmxGetRefTrigType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetRefTrigType(taskHandle, data)
    ccall((:DAQmxSetRefTrigType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetRefTrigType(taskHandle)
    ccall((:DAQmxResetRefTrigType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigPretrigSamples(taskHandle, data)
    ccall((:DAQmxGetRefTrigPretrigSamples, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetRefTrigPretrigSamples(taskHandle, data)
    ccall((:DAQmxSetRefTrigPretrigSamples, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetRefTrigPretrigSamples(taskHandle)
    ccall((:DAQmxResetRefTrigPretrigSamples, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetRefTrigTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetDigEdgeRefTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeRefTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeRefTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigEdge, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigEdge, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigEdge, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternRefTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternRefTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternRefTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigPatternRefTrigSrc(taskHandle)
    ccall((:DAQmxResetDigPatternRefTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternRefTrigPattern(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternRefTrigPattern, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternRefTrigPattern(taskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigPattern, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigPatternRefTrigPattern(taskHandle)
    ccall((:DAQmxResetDigPatternRefTrigPattern, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternRefTrigWhen(taskHandle, data)
    ccall((:DAQmxGetDigPatternRefTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigPatternRefTrigWhen(taskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigWhen, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigPatternRefTrigWhen(taskHandle)
    ccall((:DAQmxResetDigPatternRefTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgEdgeRefTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgEdgeRefTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigSlope(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigSlope, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigSlope(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigSlope, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigSlope(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigSlope, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigLvl(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigLvl, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigLvl(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigLvl, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigLvl(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigLvl, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigHyst(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigHyst, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigHyst(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigHyst, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigHyst(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigHyst, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigCoupling, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigCoupling, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigCoupling, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigSrcs(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigSrcs, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgMultiEdgeRefTrigSrcs(taskHandle, data)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigSrcs, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgMultiEdgeRefTrigSrcs(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigSrcs, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigSlopes(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigSlopes, NIDAQmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeRefTrigSlopes(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigSlopes, NIDAQmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeRefTrigSlopes(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigSlopes, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigLvls(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigLvls, NIDAQmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeRefTrigLvls(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigLvls, NIDAQmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeRefTrigLvls(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigLvls, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigHysts(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigHysts, NIDAQmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeRefTrigHysts(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigHysts, NIDAQmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeRefTrigHysts(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigHysts, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigCouplings(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigCouplings, NIDAQmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeRefTrigCouplings(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigCouplings, NIDAQmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeRefTrigCouplings(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigCouplings, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinRefTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinRefTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigWhen(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigWhen(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigWhen, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigWhen(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigTop(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigTop, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigTop(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigTop, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigTop(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigTop, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigBtm(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigBtm, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigBtm(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigBtm, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigBtm(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigBtm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigCoupling, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigCoupling, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigCoupling, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigAutoTrigEnable(taskHandle, data)
    ccall((:DAQmxGetRefTrigAutoTrigEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRefTrigAutoTrigEnable(taskHandle, data)
    ccall((:DAQmxSetRefTrigAutoTrigEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRefTrigAutoTrigEnable(taskHandle)
    ccall((:DAQmxResetRefTrigAutoTrigEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigAutoTriggered(taskHandle, data)
    ccall((:DAQmxGetRefTrigAutoTriggered, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetRefTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxGetRefTrigTimestampEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRefTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxSetRefTrigTimestampEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRefTrigTimestampEnable(taskHandle)
    ccall((:DAQmxResetRefTrigTimestampEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxGetRefTrigTimestampTimescale, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetRefTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxSetRefTrigTimestampTimescale, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetRefTrigTimestampTimescale(taskHandle)
    ccall((:DAQmxResetRefTrigTimestampTimescale, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigTimestampVal(taskHandle, data)
    ccall((:DAQmxGetRefTrigTimestampVal, NIDAQmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxGetRefTrigDelay(taskHandle, data)
    ccall((:DAQmxGetRefTrigDelay, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetRefTrigDelay(taskHandle, data)
    ccall((:DAQmxSetRefTrigDelay, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetRefTrigDelay(taskHandle)
    ccall((:DAQmxResetRefTrigDelay, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigRetriggerable(taskHandle, data)
    ccall((:DAQmxGetRefTrigRetriggerable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRefTrigRetriggerable(taskHandle, data)
    ccall((:DAQmxSetRefTrigRetriggerable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRefTrigRetriggerable(taskHandle)
    ccall((:DAQmxResetRefTrigRetriggerable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigTrigWin(taskHandle, data)
    ccall((:DAQmxGetRefTrigTrigWin, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetRefTrigTrigWin(taskHandle, data)
    ccall((:DAQmxSetRefTrigTrigWin, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetRefTrigTrigWin(taskHandle)
    ccall((:DAQmxResetRefTrigTrigWin, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigRetriggerWin(taskHandle, data)
    ccall((:DAQmxGetRefTrigRetriggerWin, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetRefTrigRetriggerWin(taskHandle, data)
    ccall((:DAQmxSetRefTrigRetriggerWin, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetRefTrigRetriggerWin(taskHandle)
    ccall((:DAQmxResetRefTrigRetriggerWin, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigMaxNumTrigsToDetect(taskHandle, data)
    ccall((:DAQmxGetRefTrigMaxNumTrigsToDetect, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetRefTrigMaxNumTrigsToDetect(taskHandle, data)
    ccall((:DAQmxSetRefTrigMaxNumTrigsToDetect, NIDAQmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetRefTrigMaxNumTrigsToDetect(taskHandle)
    ccall((:DAQmxResetRefTrigMaxNumTrigsToDetect, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAdvTrigType(taskHandle, data)
    ccall((:DAQmxGetAdvTrigType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAdvTrigType(taskHandle, data)
    ccall((:DAQmxSetAdvTrigType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAdvTrigType(taskHandle)
    ccall((:DAQmxResetAdvTrigType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeAdvTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeAdvTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeAdvTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeAdvTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigEdgeAdvTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeAdvTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeAdvTrigEdge, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeAdvTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeAdvTrigEdge, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeAdvTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigEdge, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeAdvTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeAdvTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeAdvTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeAdvTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeAdvTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetHshkTrigType(taskHandle, data)
    ccall((:DAQmxGetHshkTrigType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetHshkTrigType(taskHandle, data)
    ccall((:DAQmxSetHshkTrigType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetHshkTrigType(taskHandle)
    ccall((:DAQmxResetHshkTrigType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetInterlockedHshkTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetInterlockedHshkTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetInterlockedHshkTrigSrc(taskHandle, data)
    ccall((:DAQmxSetInterlockedHshkTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetInterlockedHshkTrigSrc(taskHandle)
    ccall((:DAQmxResetInterlockedHshkTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetInterlockedHshkTrigAssertedLvl(taskHandle, data)
    ccall((:DAQmxGetInterlockedHshkTrigAssertedLvl, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetInterlockedHshkTrigAssertedLvl(taskHandle, data)
    ccall((:DAQmxSetInterlockedHshkTrigAssertedLvl, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetInterlockedHshkTrigAssertedLvl(taskHandle)
    ccall((:DAQmxResetInterlockedHshkTrigAssertedLvl, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetPauseTrigType(taskHandle, data)
    ccall((:DAQmxGetPauseTrigType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetPauseTrigType(taskHandle, data)
    ccall((:DAQmxSetPauseTrigType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetPauseTrigType(taskHandle)
    ccall((:DAQmxResetPauseTrigType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetPauseTrigTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetPauseTrigTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetAnlgLvlPauseTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgLvlPauseTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgLvlPauseTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigWhen, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigWhen(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigLvl(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigLvl, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigLvl(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigLvl, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigLvl(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigLvl, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigHyst(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigHyst, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigHyst(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigHyst, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigHyst(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigHyst, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigCoupling, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigCoupling, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigCoupling, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinPauseTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinPauseTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigWhen, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigWhen(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigTop(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigTop, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigTop(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigTop, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigTop(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigTop, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigBtm(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigBtm, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigBtm(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigBtm, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigBtm(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigBtm, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigCoupling, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigCoupling, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigCoupling, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigLvlPauseTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigLvlPauseTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigSrc(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigWhen, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigWhen(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternPauseTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternPauseTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternPauseTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigPatternPauseTrigSrc(taskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternPauseTrigPattern(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternPauseTrigPattern, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternPauseTrigPattern(taskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigPattern, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigPatternPauseTrigPattern(taskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigPattern, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxGetDigPatternPauseTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigPatternPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigWhen, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigPatternPauseTrigWhen(taskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigType(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetArmStartTrigType(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetArmStartTrigType(taskHandle)
    ccall((:DAQmxResetArmStartTrigType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetArmStartTerm, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetDigEdgeArmStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeArmStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeArmStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigEdge, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigEdge, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigEdge, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrMinPulseWidth, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseRate, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigSyncEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTrigWhen(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTrigWhen, NIDAQmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxSetArmStartTrigTrigWhen(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigTrigWhen, NIDAQmx), int32, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function DAQmxResetArmStartTrigTrigWhen(taskHandle)
    ccall((:DAQmxResetArmStartTrigTrigWhen, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTimescale(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTimescale, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetArmStartTrigTimescale(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigTimescale, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetArmStartTrigTimescale(taskHandle)
    ccall((:DAQmxResetArmStartTrigTimescale, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTimestampEnable, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetArmStartTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigTimestampEnable, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetArmStartTrigTimestampEnable(taskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampEnable, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTimestampTimescale, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetArmStartTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigTimestampTimescale, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetArmStartTrigTimestampTimescale(taskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampTimescale, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTimestampVal(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTimestampVal, NIDAQmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxGetTriggerSyncType(taskHandle, data)
    ccall((:DAQmxGetTriggerSyncType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetTriggerSyncType(taskHandle, data)
    ccall((:DAQmxSetTriggerSyncType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetTriggerSyncType(taskHandle)
    ccall((:DAQmxResetTriggerSyncType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWatchdogTimeout(taskHandle, data)
    ccall((:DAQmxGetWatchdogTimeout, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetWatchdogTimeout(taskHandle, data)
    ccall((:DAQmxSetWatchdogTimeout, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetWatchdogTimeout(taskHandle)
    ccall((:DAQmxResetWatchdogTimeout, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWatchdogExpirTrigType(taskHandle, data)
    ccall((:DAQmxGetWatchdogExpirTrigType, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWatchdogExpirTrigType(taskHandle, data)
    ccall((:DAQmxSetWatchdogExpirTrigType, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWatchdogExpirTrigType(taskHandle)
    ccall((:DAQmxResetWatchdogExpirTrigType, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle, data)
    ccall((:DAQmxGetWatchdogExpirTrigTrigOnNetworkConnLoss, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle, data)
    ccall((:DAQmxSetWatchdogExpirTrigTrigOnNetworkConnLoss, NIDAQmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle)
    ccall((:DAQmxResetWatchdogExpirTrigTrigOnNetworkConnLoss, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeWatchdogExpirTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeWatchdogExpirTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeWatchdogExpirTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeWatchdogExpirTrigSrc, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, data)
end

function DAQmxResetDigEdgeWatchdogExpirTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeWatchdogExpirTrigSrc, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeWatchdogExpirTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeWatchdogExpirTrigEdge, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeWatchdogExpirTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeWatchdogExpirTrigEdge, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeWatchdogExpirTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeWatchdogExpirTrigEdge, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWatchdogDOExpirState(taskHandle, lines, data)
    ccall((:DAQmxGetWatchdogDOExpirState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, lines, data)
end

function DAQmxSetWatchdogDOExpirState(taskHandle, lines, data)
    ccall((:DAQmxSetWatchdogDOExpirState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, lines, data)
end

function DAQmxResetWatchdogDOExpirState(taskHandle, lines)
    ccall((:DAQmxResetWatchdogDOExpirState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, lines)
end

function DAQmxGetWatchdogAOOutputType(taskHandle, lines, data)
    ccall((:DAQmxGetWatchdogAOOutputType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, lines, data)
end

function DAQmxSetWatchdogAOOutputType(taskHandle, lines, data)
    ccall((:DAQmxSetWatchdogAOOutputType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, lines, data)
end

function DAQmxResetWatchdogAOOutputType(taskHandle, lines)
    ccall((:DAQmxResetWatchdogAOOutputType, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, lines)
end

function DAQmxGetWatchdogAOExpirState(taskHandle, lines, data)
    ccall((:DAQmxGetWatchdogAOExpirState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{float64}), taskHandle, lines, data)
end

function DAQmxSetWatchdogAOExpirState(taskHandle, lines, data)
    ccall((:DAQmxSetWatchdogAOExpirState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, float64), taskHandle, lines, data)
end

function DAQmxResetWatchdogAOExpirState(taskHandle, lines)
    ccall((:DAQmxResetWatchdogAOExpirState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, lines)
end

function DAQmxGetWatchdogCOExpirState(taskHandle, lines, data)
    ccall((:DAQmxGetWatchdogCOExpirState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, Ptr{int32}), taskHandle, lines, data)
end

function DAQmxSetWatchdogCOExpirState(taskHandle, lines, data)
    ccall((:DAQmxSetWatchdogCOExpirState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, int32), taskHandle, lines, data)
end

function DAQmxResetWatchdogCOExpirState(taskHandle, lines)
    ccall((:DAQmxResetWatchdogCOExpirState, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}), taskHandle, lines)
end

function DAQmxGetWatchdogHasExpired(taskHandle, data)
    ccall((:DAQmxGetWatchdogHasExpired, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteRelativeTo(taskHandle, data)
    ccall((:DAQmxGetWriteRelativeTo, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWriteRelativeTo(taskHandle, data)
    ccall((:DAQmxSetWriteRelativeTo, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWriteRelativeTo(taskHandle)
    ccall((:DAQmxResetWriteRelativeTo, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteOffset(taskHandle, data)
    ccall((:DAQmxGetWriteOffset, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWriteOffset(taskHandle, data)
    ccall((:DAQmxSetWriteOffset, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWriteOffset(taskHandle)
    ccall((:DAQmxResetWriteOffset, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteRegenMode(taskHandle, data)
    ccall((:DAQmxGetWriteRegenMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWriteRegenMode(taskHandle, data)
    ccall((:DAQmxSetWriteRegenMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWriteRegenMode(taskHandle)
    ccall((:DAQmxResetWriteRegenMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteCurrWritePos(taskHandle, data)
    ccall((:DAQmxGetWriteCurrWritePos, NIDAQmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxGetWriteOvercurrentChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteOvercurrentChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteOvercurrentChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteOvercurrentChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteOvertemperatureChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteOvertemperatureChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteOvertemperatureChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteOvertemperatureChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteExternalOvervoltageChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteExternalOvervoltageChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteExternalOvervoltageChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteExternalOvervoltageChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteOverloadedChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteOverloadedChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteOverloadedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteOverloadedChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteOpenCurrentLoopChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteOpenCurrentLoopChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteOpenCurrentLoopChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteOpenCurrentLoopChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWritePowerSupplyFaultChansExist(taskHandle, data)
    ccall((:DAQmxGetWritePowerSupplyFaultChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWritePowerSupplyFaultChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWritePowerSupplyFaultChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteSyncUnlockedChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteSyncUnlockedChansExist, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteSyncUnlockedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteSyncUnlockedChans, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteSpaceAvail(taskHandle, data)
    ccall((:DAQmxGetWriteSpaceAvail, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetWriteTotalSampPerChanGenerated(taskHandle, data)
    ccall((:DAQmxGetWriteTotalSampPerChanGenerated, NIDAQmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxGetWriteAccessoryInsertionOrRemovalDetected(taskHandle, data)
    ccall((:DAQmxGetWriteAccessoryInsertionOrRemovalDetected, NIDAQmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteDevsWithInsertedOrRemovedAccessories(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteDevsWithInsertedOrRemovedAccessories, NIDAQmx), int32, (TaskHandle, Ptr{Cchar}, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteRawDataWidth(taskHandle, data)
    ccall((:DAQmxGetWriteRawDataWidth, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetWriteNumChans(taskHandle, data)
    ccall((:DAQmxGetWriteNumChans, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetWriteWaitMode(taskHandle, data)
    ccall((:DAQmxGetWriteWaitMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWriteWaitMode(taskHandle, data)
    ccall((:DAQmxSetWriteWaitMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWriteWaitMode(taskHandle)
    ccall((:DAQmxResetWriteWaitMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteSleepTime(taskHandle, data)
    ccall((:DAQmxGetWriteSleepTime, NIDAQmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetWriteSleepTime(taskHandle, data)
    ccall((:DAQmxSetWriteSleepTime, NIDAQmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetWriteSleepTime(taskHandle)
    ccall((:DAQmxResetWriteSleepTime, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteDigitalLinesBytesPerChan(taskHandle, data)
    ccall((:DAQmxGetWriteDigitalLinesBytesPerChan, NIDAQmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetSampClkTimingResponseMode(taskHandle, data)
    ccall((:DAQmxGetSampClkTimingResponseMode, NIDAQmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkTimingResponseMode(taskHandle, data)
    ccall((:DAQmxSetSampClkTimingResponseMode, NIDAQmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkTimingResponseMode(taskHandle)
    ccall((:DAQmxResetSampClkTimingResponseMode, NIDAQmx), int32, (TaskHandle,), taskHandle)
end

