
Û
v++_link_mmult$6146faac-c753-4246-9ccd-a9c9420d8480Ÿv++ --xp param:compiler.lockFlowCritSlackThreshold=0 --xp vivado_param:hd.routingContainmentAreaExpansion=true --xp vivado_param:hd.supportClockNetCrossDiffReconfigurablePartitions=1 --xp vivado_param:bitstream.enablePR=4123 --xp vivado_param:physynth.ultraRAMOptOutput=false --xp vivado_prop:run.__KERNEL__.{STEPS.SYNTH_DESIGN.ARGS.MAX_URAM_CASCADE_HEIGHT}={1} --xp vivado_param:synth.elaboration.rodinMoreOptions={rt::set_parameter disableOregPackingUram true}  -t sw_emu --config design.cfg --jobs 8 --optimize 3 -l -ommult.xclbin mmult.xo *Q"M/home/centos/ESE532_Projects/hw5/_x/reports/link/v++_link_mmult_guidance.html2B">/home/centos/ESE532_Projects/hw5/_x/v++_link_mmult_guidance.pbBé

design.cfgÚplatform=xilinx_aws-vu9p-f1_shell-v04261818_201920_2
debug=1
profile_kernel=data:all:all:all
save-temps=1

[connectivity]
nk=mmult:1:mmult_1
sp=mmult_1.Input_1:DDR[1]
sp=mmult_1.Input_2:DDR[2]
sp=mmult_1.Output:DDR[1]
