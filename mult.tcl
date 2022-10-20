### If you want to run this tcl script in dc_shell, run as: dc_shell -f synth_tcl_file.tcl

# Standard cell library settings
set link_library /eda/synopsys/2020-21/RHELx86/SYN_2020.09-SP2/libraries/syn/lsi_10k.db
set target_library /eda/synopsys/2020-21/RHELx86/SYN_2020.09-SP2/libraries/syn/lsi_10k.db
set symbol_library ""

# read, analyze and elaborate the rtl code
read_file -format sverilog {/home/uriaz/misc/mult/mult_8x8.sv}
analyze -library WORK -format sverilog {/home/uriaz/misc/mult/mult_8x8.sv}
elaborate mult_8x8 -architecture sverilog -library WORK

# provide constraints
create_clock -name "clk" -period 2 -waveform {1 2}
set_max_area 5000
set_max_fanout 10 mult_8x8
set_max_transition 10 mult_8x8

# compile the rtl
compile -exact_map

# report generation
file mkdir report_mult_8x8
write -hierarchy -format verilog -output /home/uriaz/misc/mult/report_mult_8x8/mult_8x8_gtlvl.v
write_sdc -nosplit -version 2.0 /home/uriaz/misc/mult/report_mult_8x8/mult_8x8.sdc
report_area -hierarchy > /home/uriaz/misc/mult/report_mult_8x8/mult_8x8.area
report_timing > /home/uriaz/misc/mult/report_mult_8x8/mult_8x8.timing
report_power > /home/uriaz/misc/mult/report_mult_8x8/mult_8x8.power
report_cell > /home/uriaz/misc/mult/report_mult_8x8/mult_8x8.cell

# start gui
gui_start
