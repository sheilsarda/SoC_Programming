// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xmmult_fpga.h"

extern XMmult_fpga_Config XMmult_fpga_ConfigTable[];

XMmult_fpga_Config *XMmult_fpga_LookupConfig(u16 DeviceId) {
	XMmult_fpga_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMMULT_FPGA_NUM_INSTANCES; Index++) {
		if (XMmult_fpga_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMmult_fpga_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMmult_fpga_Initialize(XMmult_fpga *InstancePtr, u16 DeviceId) {
	XMmult_fpga_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMmult_fpga_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMmult_fpga_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

