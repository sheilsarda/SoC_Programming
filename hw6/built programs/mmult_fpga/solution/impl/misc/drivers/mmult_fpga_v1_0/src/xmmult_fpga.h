// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XMMULT_FPGA_H
#define XMMULT_FPGA_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xmmult_fpga_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XMmult_fpga_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XMmult_fpga;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMmult_fpga_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMmult_fpga_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMmult_fpga_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMmult_fpga_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XMmult_fpga_Initialize(XMmult_fpga *InstancePtr, u16 DeviceId);
XMmult_fpga_Config* XMmult_fpga_LookupConfig(u16 DeviceId);
int XMmult_fpga_CfgInitialize(XMmult_fpga *InstancePtr, XMmult_fpga_Config *ConfigPtr);
#else
int XMmult_fpga_Initialize(XMmult_fpga *InstancePtr, const char* InstanceName);
int XMmult_fpga_Release(XMmult_fpga *InstancePtr);
#endif

void XMmult_fpga_Start(XMmult_fpga *InstancePtr);
u32 XMmult_fpga_IsDone(XMmult_fpga *InstancePtr);
u32 XMmult_fpga_IsIdle(XMmult_fpga *InstancePtr);
u32 XMmult_fpga_IsReady(XMmult_fpga *InstancePtr);
void XMmult_fpga_Continue(XMmult_fpga *InstancePtr);
void XMmult_fpga_EnableAutoRestart(XMmult_fpga *InstancePtr);
void XMmult_fpga_DisableAutoRestart(XMmult_fpga *InstancePtr);

void XMmult_fpga_Set_A(XMmult_fpga *InstancePtr, u64 Data);
u64 XMmult_fpga_Get_A(XMmult_fpga *InstancePtr);
void XMmult_fpga_Set_B(XMmult_fpga *InstancePtr, u64 Data);
u64 XMmult_fpga_Get_B(XMmult_fpga *InstancePtr);
void XMmult_fpga_Set_C(XMmult_fpga *InstancePtr, u64 Data);
u64 XMmult_fpga_Get_C(XMmult_fpga *InstancePtr);

void XMmult_fpga_InterruptGlobalEnable(XMmult_fpga *InstancePtr);
void XMmult_fpga_InterruptGlobalDisable(XMmult_fpga *InstancePtr);
void XMmult_fpga_InterruptEnable(XMmult_fpga *InstancePtr, u32 Mask);
void XMmult_fpga_InterruptDisable(XMmult_fpga *InstancePtr, u32 Mask);
void XMmult_fpga_InterruptClear(XMmult_fpga *InstancePtr, u32 Mask);
u32 XMmult_fpga_InterruptGetEnabled(XMmult_fpga *InstancePtr);
u32 XMmult_fpga_InterruptGetStatus(XMmult_fpga *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
