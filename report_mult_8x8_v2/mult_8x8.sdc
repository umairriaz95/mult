###################################################################

# Created by write_sdc on Sat Oct 15 12:47:44 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance 1.000000e+04kOhm -capacitance 1.000000e-04pF -voltage V -current uA
set_max_transition 10 [current_design]
set_max_fanout 10 [current_design]
set_max_area 5000
create_clock -name clk  -period 2  -waveform {1 2}
