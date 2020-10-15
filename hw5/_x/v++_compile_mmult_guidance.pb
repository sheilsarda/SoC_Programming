
«
v++_compile_mmult$2daa1b36-cbbe-4984-adea-9600e7a473d0Åv++  -t sw_emu --config design.cfg --jobs 8 --optimize 3 -c -k mmult -I./common -I./hls/ -ommult.xo hls/MatrixMultiplication.cpp *U"Q/home/centos/ESE532_Projects/hw5/_x/reports/mmult/v++_compile_mmult_guidance.html2E"A/home/centos/ESE532_Projects/hw5/_x/v++_compile_mmult_guidance.pbBÈ

design.cfg⁄platform=xilinx_aws-vu9p-f1_shell-v04261818_201920_2
debug=1
profile_kernel=data:all:all:all
save-temps=1

[connectivity]
nk=mmult:1:mmult_1
sp=mmult_1.Input_1:DDR[1]
sp=mmult_1.Input_2:DDR[2]
sp=mmult_1.Output:DDR[1]
