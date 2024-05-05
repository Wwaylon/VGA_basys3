vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../ipstatic" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/clk_wiz_0_conv_funs_pkg.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/clk_wiz_0_proc_common_pkg.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/clk_wiz_0_ipif_pkg.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_mon.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/clk_wiz_0_family_support.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/clk_wiz_0_family.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/clk_wiz_0_soft_reset.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/clk_wiz_0_pselect_f.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/clk_wiz_0_address_decoder.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/clk_wiz_0_slave_attachment.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/clk_wiz_0_axi_lite_ipif.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz_drp.vhd" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_axi_clk_config.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../../VGA_Basys3.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

