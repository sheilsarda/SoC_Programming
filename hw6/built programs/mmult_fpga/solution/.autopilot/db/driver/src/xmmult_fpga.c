// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xmmult_fpga.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMmult_fpga_CfgInitialize(XMmult_fpga *InstancePtr, XMmult_fpga_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMmult_fpga_Start(XMmult_fpga *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMmult_fpga_IsDone(XMmult_fpga *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMmult_fpga_IsIdle(XMmult_fpga *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMmult_fpga_IsReady(XMmult_fpga *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMmult_fpga_Continue(XMmult_fpga *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XMmult_fpga_EnableAutoRestart(XMmult_fpga *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XMmult_fpga_DisableAutoRestart(XMmult_fpga *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_AP_CTRL, 0);
}

void XMmult_fpga_Set_A(XMmult_fpga *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_A_DATA, (u32)(Data));
    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XMmult_fpga_Get_A(XMmult_fpga *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_A_DATA);
    Data += (u64)XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XMmult_fpga_Set_B(XMmult_fpga *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_B_DATA, (u32)(Data));
    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XMmult_fpga_Get_B(XMmult_fpga *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_B_DATA);
    Data += (u64)XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XMmult_fpga_Set_C(XMmult_fpga *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_C_DATA, (u32)(Data));
    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_C_DATA + 4, (u32)(Data >> 32));
}

u64 XMmult_fpga_Get_C(XMmult_fpga *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_C_DATA);
    Data += (u64)XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_C_DATA + 4) << 32;
    return Data;
}

void XMmult_fpga_InterruptGlobalEnable(XMmult_fpga *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_GIE, 1);
}

void XMmult_fpga_InterruptGlobalDisable(XMmult_fpga *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_GIE, 0);
}

void XMmult_fpga_InterruptEnable(XMmult_fpga *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_IER);
    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_IER, Register | Mask);
}

void XMmult_fpga_InterruptDisable(XMmult_fpga *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_IER);
    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_IER, Register & (~Mask));
}

void XMmult_fpga_InterruptClear(XMmult_fpga *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmult_fpga_WriteReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_ISR, Mask);
}

u32 XMmult_fpga_InterruptGetEnabled(XMmult_fpga *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_IER);
}

u32 XMmult_fpga_InterruptGetStatus(XMmult_fpga *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMmult_fpga_ReadReg(InstancePtr->Control_BaseAddress, XMMULT_FPGA_CONTROL_ADDR_ISR);
}

