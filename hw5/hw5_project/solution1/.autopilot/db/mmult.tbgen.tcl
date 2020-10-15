set moduleName mmult
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mmult}
set C_modelType { void 0 }
set C_modelArgList {
	{ aximm1 int 512 regular {axi_master 2}  }
	{ aximm2 int 512 regular {axi_master 0}  }
	{ Input_1 int 64 regular {axi_slave 0}  }
	{ Input_2 int 64 regular {axi_slave 0}  }
	{ Output_r int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "aximm1", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "Input_1","cData": "int512","bit_use": { "low": 0,"up": 511},"offset": { "type": "dynamic","port_name": "Input_1","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 255,"step" : 1}]},{"cName": "Output","cData": "int512","bit_use": { "low": 0,"up": 511},"offset": { "type": "dynamic","port_name": "Output_r","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 255,"step" : 1}]}]}]} , 
 	{ "Name" : "aximm2", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "Input_2","cData": "int512","bit_use": { "low": 0,"up": 511},"offset": { "type": "dynamic","port_name": "Input_2","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 255,"step" : 1}]}]}]} , 
 	{ "Name" : "Input_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "Input_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "Output_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_aximm1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_aximm1_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_WDATA sc_out sc_lv 512 signal 0 } 
	{ m_axi_aximm1_WSTRB sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm1_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm1_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_aximm1_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_RDATA sc_in sc_lv 512 signal 0 } 
	{ m_axi_aximm1_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm1_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm1_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm2_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm2_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_aximm2_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm2_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm2_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm2_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm2_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_WDATA sc_out sc_lv 512 signal 1 } 
	{ m_axi_aximm2_WSTRB sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm2_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm2_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_aximm2_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm2_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm2_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm2_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm2_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_RDATA sc_in sc_lv 512 signal 1 } 
	{ m_axi_aximm2_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm2_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm2_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm2_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm2_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm2_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"mmult","role":"start","value":"0","valid_bit":"0"},{"name":"mmult","role":"continue","value":"0","valid_bit":"4"},{"name":"mmult","role":"auto_start","value":"0","valid_bit":"7"},{"name":"Input_1","role":"data","value":"16"},{"name":"Input_2","role":"data","value":"28"},{"name":"Output_r","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"mmult","role":"start","value":"0","valid_bit":"0"},{"name":"mmult","role":"done","value":"0","valid_bit":"1"},{"name":"mmult","role":"idle","value":"0","valid_bit":"2"},{"name":"mmult","role":"ready","value":"0","valid_bit":"3"},{"name":"mmult","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_aximm1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_aximm1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_aximm1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_aximm1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_aximm1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_aximm1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_aximm1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_aximm1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_aximm1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_aximm1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WVALID" }} , 
 	{ "name": "m_axi_aximm1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WREADY" }} , 
 	{ "name": "m_axi_aximm1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "aximm1", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WID" }} , 
 	{ "name": "m_axi_aximm1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_aximm1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_aximm1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_aximm1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_aximm1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_aximm1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_aximm1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_aximm1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_aximm1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_aximm1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RVALID" }} , 
 	{ "name": "m_axi_aximm1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RREADY" }} , 
 	{ "name": "m_axi_aximm1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "aximm1", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RID" }} , 
 	{ "name": "m_axi_aximm1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BID" }} , 
 	{ "name": "m_axi_aximm1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BUSER" }} , 
 	{ "name": "m_axi_aximm2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm2", "role": "AWLEN" }} , 
 	{ "name": "m_axi_aximm2_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm2", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_aximm2_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "AWBURST" }} , 
 	{ "name": "m_axi_aximm2_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_aximm2_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_aximm2_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm2", "role": "AWPROT" }} , 
 	{ "name": "m_axi_aximm2_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "AWQOS" }} , 
 	{ "name": "m_axi_aximm2_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "AWREGION" }} , 
 	{ "name": "m_axi_aximm2_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWUSER" }} , 
 	{ "name": "m_axi_aximm2_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WVALID" }} , 
 	{ "name": "m_axi_aximm2_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WREADY" }} , 
 	{ "name": "m_axi_aximm2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "aximm2", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WID" }} , 
 	{ "name": "m_axi_aximm2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm2", "role": "ARLEN" }} , 
 	{ "name": "m_axi_aximm2_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm2", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_aximm2_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "ARBURST" }} , 
 	{ "name": "m_axi_aximm2_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_aximm2_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_aximm2_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm2", "role": "ARPROT" }} , 
 	{ "name": "m_axi_aximm2_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "ARQOS" }} , 
 	{ "name": "m_axi_aximm2_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "ARREGION" }} , 
 	{ "name": "m_axi_aximm2_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARUSER" }} , 
 	{ "name": "m_axi_aximm2_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RVALID" }} , 
 	{ "name": "m_axi_aximm2_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RREADY" }} , 
 	{ "name": "m_axi_aximm2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "aximm2", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RID" }} , 
 	{ "name": "m_axi_aximm2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BID" }} , 
 	{ "name": "m_axi_aximm2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65"],
		"CDFG" : "mmult",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19240", "EstimateLatencyMax" : "19240",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "aximm1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "aximm2", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "aximm2_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "aximm2_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "Input_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "Input_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "Output_r", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.aximm1_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.aximm2_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Buffer_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Buffer_2_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U2", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U3", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U4", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U5", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U6", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U7", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U8", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U9", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U10", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U11", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U12", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U13", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U14", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U15", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U16", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U17", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U18", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U19", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U20", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_full_dsp_1_U21", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U22", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U23", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U24", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U25", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U26", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U27", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U28", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U29", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U30", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U31", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U32", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U33", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U34", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U35", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U36", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U37", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U38", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U39", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U40", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U41", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U42", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U43", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_6ns_13_1_1_U44", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_6ns_5ns_6_10_seq_1_U45", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U46", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U47", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U48", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U49", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U50", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U51", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U52", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U53", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U54", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U55", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U56", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U57", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U58", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U59", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10ns_8ns_17_1_1_U60", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mmult {
		aximm1 {Type IO LastRead 92 FirstWrite 103}
		aximm2 {Type I LastRead 91 FirstWrite -1}
		Input_1 {Type I LastRead 0 FirstWrite -1}
		Input_2 {Type I LastRead 0 FirstWrite -1}
		Output_r {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "19240", "Max" : "19240"}
	, {"Name" : "Interval", "Min" : "19241", "Max" : "19241"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	aximm1 { m_axi {  { m_axi_aximm1_AWVALID VALID 1 1 }  { m_axi_aximm1_AWREADY READY 0 1 }  { m_axi_aximm1_AWADDR ADDR 1 64 }  { m_axi_aximm1_AWID ID 1 1 }  { m_axi_aximm1_AWLEN LEN 1 8 }  { m_axi_aximm1_AWSIZE SIZE 1 3 }  { m_axi_aximm1_AWBURST BURST 1 2 }  { m_axi_aximm1_AWLOCK LOCK 1 2 }  { m_axi_aximm1_AWCACHE CACHE 1 4 }  { m_axi_aximm1_AWPROT PROT 1 3 }  { m_axi_aximm1_AWQOS QOS 1 4 }  { m_axi_aximm1_AWREGION REGION 1 4 }  { m_axi_aximm1_AWUSER USER 1 1 }  { m_axi_aximm1_WVALID VALID 1 1 }  { m_axi_aximm1_WREADY READY 0 1 }  { m_axi_aximm1_WDATA DATA 1 512 }  { m_axi_aximm1_WSTRB STRB 1 64 }  { m_axi_aximm1_WLAST LAST 1 1 }  { m_axi_aximm1_WID ID 1 1 }  { m_axi_aximm1_WUSER USER 1 1 }  { m_axi_aximm1_ARVALID VALID 1 1 }  { m_axi_aximm1_ARREADY READY 0 1 }  { m_axi_aximm1_ARADDR ADDR 1 64 }  { m_axi_aximm1_ARID ID 1 1 }  { m_axi_aximm1_ARLEN LEN 1 8 }  { m_axi_aximm1_ARSIZE SIZE 1 3 }  { m_axi_aximm1_ARBURST BURST 1 2 }  { m_axi_aximm1_ARLOCK LOCK 1 2 }  { m_axi_aximm1_ARCACHE CACHE 1 4 }  { m_axi_aximm1_ARPROT PROT 1 3 }  { m_axi_aximm1_ARQOS QOS 1 4 }  { m_axi_aximm1_ARREGION REGION 1 4 }  { m_axi_aximm1_ARUSER USER 1 1 }  { m_axi_aximm1_RVALID VALID 0 1 }  { m_axi_aximm1_RREADY READY 1 1 }  { m_axi_aximm1_RDATA DATA 0 512 }  { m_axi_aximm1_RLAST LAST 0 1 }  { m_axi_aximm1_RID ID 0 1 }  { m_axi_aximm1_RUSER USER 0 1 }  { m_axi_aximm1_RRESP RESP 0 2 }  { m_axi_aximm1_BVALID VALID 0 1 }  { m_axi_aximm1_BREADY READY 1 1 }  { m_axi_aximm1_BRESP RESP 0 2 }  { m_axi_aximm1_BID ID 0 1 }  { m_axi_aximm1_BUSER USER 0 1 } } }
	aximm2 { m_axi {  { m_axi_aximm2_AWVALID VALID 1 1 }  { m_axi_aximm2_AWREADY READY 0 1 }  { m_axi_aximm2_AWADDR ADDR 1 64 }  { m_axi_aximm2_AWID ID 1 1 }  { m_axi_aximm2_AWLEN LEN 1 8 }  { m_axi_aximm2_AWSIZE SIZE 1 3 }  { m_axi_aximm2_AWBURST BURST 1 2 }  { m_axi_aximm2_AWLOCK LOCK 1 2 }  { m_axi_aximm2_AWCACHE CACHE 1 4 }  { m_axi_aximm2_AWPROT PROT 1 3 }  { m_axi_aximm2_AWQOS QOS 1 4 }  { m_axi_aximm2_AWREGION REGION 1 4 }  { m_axi_aximm2_AWUSER USER 1 1 }  { m_axi_aximm2_WVALID VALID 1 1 }  { m_axi_aximm2_WREADY READY 0 1 }  { m_axi_aximm2_WDATA DATA 1 512 }  { m_axi_aximm2_WSTRB STRB 1 64 }  { m_axi_aximm2_WLAST LAST 1 1 }  { m_axi_aximm2_WID ID 1 1 }  { m_axi_aximm2_WUSER USER 1 1 }  { m_axi_aximm2_ARVALID VALID 1 1 }  { m_axi_aximm2_ARREADY READY 0 1 }  { m_axi_aximm2_ARADDR ADDR 1 64 }  { m_axi_aximm2_ARID ID 1 1 }  { m_axi_aximm2_ARLEN LEN 1 8 }  { m_axi_aximm2_ARSIZE SIZE 1 3 }  { m_axi_aximm2_ARBURST BURST 1 2 }  { m_axi_aximm2_ARLOCK LOCK 1 2 }  { m_axi_aximm2_ARCACHE CACHE 1 4 }  { m_axi_aximm2_ARPROT PROT 1 3 }  { m_axi_aximm2_ARQOS QOS 1 4 }  { m_axi_aximm2_ARREGION REGION 1 4 }  { m_axi_aximm2_ARUSER USER 1 1 }  { m_axi_aximm2_RVALID VALID 0 1 }  { m_axi_aximm2_RREADY READY 1 1 }  { m_axi_aximm2_RDATA DATA 0 512 }  { m_axi_aximm2_RLAST LAST 0 1 }  { m_axi_aximm2_RID ID 0 1 }  { m_axi_aximm2_RUSER USER 0 1 }  { m_axi_aximm2_RRESP RESP 0 2 }  { m_axi_aximm2_BVALID VALID 0 1 }  { m_axi_aximm2_BREADY READY 1 1 }  { m_axi_aximm2_BRESP RESP 0 2 }  { m_axi_aximm2_BID ID 0 1 }  { m_axi_aximm2_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ aximm1 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ aximm2 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ aximm1 64 }
	{ aximm2 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ aximm1 64 }
	{ aximm2 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
