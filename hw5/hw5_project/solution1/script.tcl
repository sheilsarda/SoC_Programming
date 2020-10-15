############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hw5_project
set_top mmult
add_files hls/MatrixMultiplication.h
add_files hls/MatrixMultiplication.cpp
add_files -tb hls/Testbench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vitis
set_part {xcvu9p-flgb2104-2-i}
create_clock -period 8ns -name default
config_interface  -default_slave_interface s_axilite -m_axi_addr64 -m_axi_alignment_byte_size 64  -m_axi_latency 64 -m_axi_max_widen_bitwidth 512 -m_axi_offset off -register_io off 
config_rtl   -module_auto_prefix  -register_reset_num 3 -reset control  -reset_level high
config_compile  -name_max_length 80  -pipeline_loops 0 -pipeline_style stp  
source "./hw5_project/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format xo
