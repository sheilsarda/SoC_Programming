#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_aximm1 "../tv/cdatafile/c.mmult.autotvin_aximm1.dat"
#define AUTOTB_TVOUT_aximm1 "../tv/cdatafile/c.mmult.autotvout_aximm1.dat"
// wrapc file define:
#define AUTOTB_TVIN_aximm2 "../tv/cdatafile/c.mmult.autotvin_aximm2.dat"
#define AUTOTB_TVOUT_aximm2 "../tv/cdatafile/c.mmult.autotvout_aximm2.dat"
// wrapc file define:
#define AUTOTB_TVIN_Input_1 "../tv/cdatafile/c.mmult.autotvin_Input_1.dat"
#define AUTOTB_TVOUT_Input_1 "../tv/cdatafile/c.mmult.autotvout_Input_1.dat"
// wrapc file define:
#define AUTOTB_TVIN_Input_2 "../tv/cdatafile/c.mmult.autotvin_Input_2.dat"
#define AUTOTB_TVOUT_Input_2 "../tv/cdatafile/c.mmult.autotvout_Input_2.dat"
// wrapc file define:
#define AUTOTB_TVIN_Output "../tv/cdatafile/c.mmult.autotvin_Output_r.dat"
#define AUTOTB_TVOUT_Output "../tv/cdatafile/c.mmult.autotvout_Output_r.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_aximm1 "../tv/rtldatafile/rtl.mmult.autotvout_aximm1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_aximm2 "../tv/rtldatafile/rtl.mmult.autotvout_aximm2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_Input_1 "../tv/rtldatafile/rtl.mmult.autotvout_Input_1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_Input_2 "../tv/rtldatafile/rtl.mmult.autotvout_Input_2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_Output "../tv/rtldatafile/rtl.mmult.autotvout_Output_r.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  aximm1_depth = 0;
  aximm2_depth = 0;
  Input_1_depth = 0;
  Input_2_depth = 0;
  Output_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{aximm1 " << aximm1_depth << "}\n";
  total_list << "{aximm2 " << aximm2_depth << "}\n";
  total_list << "{Input_1 " << Input_1_depth << "}\n";
  total_list << "{Input_2 " << Input_2_depth << "}\n";
  total_list << "{Output_r " << Output_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
  public:
    int aximm1_depth;
    int aximm2_depth;
    int Input_1_depth;
    int Input_2_depth;
    int Output_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
struct __cosim_s40__ { char data[64]; };
extern "C" void mmult_hw_stub(volatile void *, volatile void *, volatile void *);

extern "C" void apatb_mmult_hw(volatile void * __xlx_apatb_param_Input_1, volatile void * __xlx_apatb_param_Input_2, volatile void * __xlx_apatb_param_Output) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_aximm1);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<512> > aximm1_pc_buffer(512);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "aximm1");
  
            // push token into output port buffer
            if (AESL_token != "") {
              aximm1_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {((long long*)__xlx_apatb_param_Input_1)[j*8+0] = aximm1_pc_buffer[i].range(63,0).to_int64();
((long long*)__xlx_apatb_param_Input_1)[j*8+1] = aximm1_pc_buffer[i].range(127,64).to_int64();
((long long*)__xlx_apatb_param_Input_1)[j*8+2] = aximm1_pc_buffer[i].range(191,128).to_int64();
((long long*)__xlx_apatb_param_Input_1)[j*8+3] = aximm1_pc_buffer[i].range(255,192).to_int64();
((long long*)__xlx_apatb_param_Input_1)[j*8+4] = aximm1_pc_buffer[i].range(319,256).to_int64();
((long long*)__xlx_apatb_param_Input_1)[j*8+5] = aximm1_pc_buffer[i].range(383,320).to_int64();
((long long*)__xlx_apatb_param_Input_1)[j*8+6] = aximm1_pc_buffer[i].range(447,384).to_int64();
((long long*)__xlx_apatb_param_Input_1)[j*8+7] = aximm1_pc_buffer[i].range(511,448).to_int64();
}
            for (int j = 0, e = 256; j < e; j += 1, ++i) {((long long*)__xlx_apatb_param_Output)[j*8+0] = aximm1_pc_buffer[i].range(63,0).to_int64();
((long long*)__xlx_apatb_param_Output)[j*8+1] = aximm1_pc_buffer[i].range(127,64).to_int64();
((long long*)__xlx_apatb_param_Output)[j*8+2] = aximm1_pc_buffer[i].range(191,128).to_int64();
((long long*)__xlx_apatb_param_Output)[j*8+3] = aximm1_pc_buffer[i].range(255,192).to_int64();
((long long*)__xlx_apatb_param_Output)[j*8+4] = aximm1_pc_buffer[i].range(319,256).to_int64();
((long long*)__xlx_apatb_param_Output)[j*8+5] = aximm1_pc_buffer[i].range(383,320).to_int64();
((long long*)__xlx_apatb_param_Output)[j*8+6] = aximm1_pc_buffer[i].range(447,384).to_int64();
((long long*)__xlx_apatb_param_Output)[j*8+7] = aximm1_pc_buffer[i].range(511,448).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//aximm1
aesl_fh.touch(AUTOTB_TVIN_aximm1);
aesl_fh.touch(AUTOTB_TVOUT_aximm1);
//aximm2
aesl_fh.touch(AUTOTB_TVIN_aximm2);
aesl_fh.touch(AUTOTB_TVOUT_aximm2);
//Input_1
aesl_fh.touch(AUTOTB_TVIN_Input_1);
aesl_fh.touch(AUTOTB_TVOUT_Input_1);
//Input_2
aesl_fh.touch(AUTOTB_TVIN_Input_2);
aesl_fh.touch(AUTOTB_TVOUT_Input_2);
//Output
aesl_fh.touch(AUTOTB_TVIN_Output);
aesl_fh.touch(AUTOTB_TVOUT_Output);
CodeState = DUMP_INPUTS;
// print aximm1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_aximm1, __xlx_sprintf_buffer.data());
  {  if (__xlx_apatb_param_Input_1) {
    for (int j = 0, e = 256; j != e; ++j) {
sc_bv<512> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_Input_1)[j*8+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_Input_1)[j*8+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_Input_1)[j*8+2];
__xlx_tmp_lv.range(255,192) = ((long long*)__xlx_apatb_param_Input_1)[j*8+3];
__xlx_tmp_lv.range(319,256) = ((long long*)__xlx_apatb_param_Input_1)[j*8+4];
__xlx_tmp_lv.range(383,320) = ((long long*)__xlx_apatb_param_Input_1)[j*8+5];
__xlx_tmp_lv.range(447,384) = ((long long*)__xlx_apatb_param_Input_1)[j*8+6];
__xlx_tmp_lv.range(511,448) = ((long long*)__xlx_apatb_param_Input_1)[j*8+7];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_aximm1, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_Output) {
    for (int j = 0, e = 256; j != e; ++j) {
sc_bv<512> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_Output)[j*8+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_Output)[j*8+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_Output)[j*8+2];
__xlx_tmp_lv.range(255,192) = ((long long*)__xlx_apatb_param_Output)[j*8+3];
__xlx_tmp_lv.range(319,256) = ((long long*)__xlx_apatb_param_Output)[j*8+4];
__xlx_tmp_lv.range(383,320) = ((long long*)__xlx_apatb_param_Output)[j*8+5];
__xlx_tmp_lv.range(447,384) = ((long long*)__xlx_apatb_param_Output)[j*8+6];
__xlx_tmp_lv.range(511,448) = ((long long*)__xlx_apatb_param_Output)[j*8+7];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_aximm1, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(512, &tcl_file.aximm1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_aximm1, __xlx_sprintf_buffer.data());
}
// print aximm2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_aximm2, __xlx_sprintf_buffer.data());
  {  if (__xlx_apatb_param_Input_2) {
    for (int j = 0, e = 256; j != e; ++j) {
sc_bv<512> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_Input_2)[j*8+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_Input_2)[j*8+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_Input_2)[j*8+2];
__xlx_tmp_lv.range(255,192) = ((long long*)__xlx_apatb_param_Input_2)[j*8+3];
__xlx_tmp_lv.range(319,256) = ((long long*)__xlx_apatb_param_Input_2)[j*8+4];
__xlx_tmp_lv.range(383,320) = ((long long*)__xlx_apatb_param_Input_2)[j*8+5];
__xlx_tmp_lv.range(447,384) = ((long long*)__xlx_apatb_param_Input_2)[j*8+6];
__xlx_tmp_lv.range(511,448) = ((long long*)__xlx_apatb_param_Input_2)[j*8+7];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_aximm2, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.aximm2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_aximm2, __xlx_sprintf_buffer.data());
}
// print Input_1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_Input_1, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_Input_1, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.Input_1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_Input_1, __xlx_sprintf_buffer.data());
}
// print Input_2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_Input_2, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_Input_2, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.Input_2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_Input_2, __xlx_sprintf_buffer.data());
}
// print Output Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_Output, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_Output, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.Output_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_Output, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
mmult_hw_stub(__xlx_apatb_param_Input_1, __xlx_apatb_param_Input_2, __xlx_apatb_param_Output);
CodeState = DUMP_OUTPUTS;
// print aximm1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_aximm1, __xlx_sprintf_buffer.data());
  {  if (__xlx_apatb_param_Input_1) {
    for (int j = 0, e = 256; j != e; ++j) {
sc_bv<512> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_Input_1)[j*8+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_Input_1)[j*8+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_Input_1)[j*8+2];
__xlx_tmp_lv.range(255,192) = ((long long*)__xlx_apatb_param_Input_1)[j*8+3];
__xlx_tmp_lv.range(319,256) = ((long long*)__xlx_apatb_param_Input_1)[j*8+4];
__xlx_tmp_lv.range(383,320) = ((long long*)__xlx_apatb_param_Input_1)[j*8+5];
__xlx_tmp_lv.range(447,384) = ((long long*)__xlx_apatb_param_Input_1)[j*8+6];
__xlx_tmp_lv.range(511,448) = ((long long*)__xlx_apatb_param_Input_1)[j*8+7];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_aximm1, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_Output) {
    for (int j = 0, e = 256; j != e; ++j) {
sc_bv<512> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_Output)[j*8+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_Output)[j*8+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_Output)[j*8+2];
__xlx_tmp_lv.range(255,192) = ((long long*)__xlx_apatb_param_Output)[j*8+3];
__xlx_tmp_lv.range(319,256) = ((long long*)__xlx_apatb_param_Output)[j*8+4];
__xlx_tmp_lv.range(383,320) = ((long long*)__xlx_apatb_param_Output)[j*8+5];
__xlx_tmp_lv.range(447,384) = ((long long*)__xlx_apatb_param_Output)[j*8+6];
__xlx_tmp_lv.range(511,448) = ((long long*)__xlx_apatb_param_Output)[j*8+7];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_aximm1, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(512, &tcl_file.aximm1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_aximm1, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
