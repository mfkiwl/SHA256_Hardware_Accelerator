# setup name of the clock in your design.
set clkname clk
#set clkname clock

# set variable "modname" to the name of topmost module in design
set modname MyDesign
#set modname gen_h

# set variable "RTL_DIR" to the HDL directory w.r.t synthesis directory
#set RTL_DIR    ./..
set RTL_DIR ../../HDL/run_s

# set variable "type" to a name that distinguishes this synthesis run
set type test
#set type genh

#set the number of digits to be used for delay results
set report_default_significant_digits 4

set CLK_PER 6
