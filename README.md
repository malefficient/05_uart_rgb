# fpga_templ

My attempt to make a minimalistic project template that can be used in Xilinx Vivado (Arty-A7) and the lattice (IceBreaker 1.0e) with minimal toe stepping.

Basic layout:
* ./project_d/ - The Xilinx 'project' directory (contains .xpr file, as well as many others). This is why we can't have nice things.
* ./src/ - Your run of the mill .v verilog files
* ./sim/  - Test bench specific
* ./syn/ -  Synthesis related. I.e. Arty_Master.xdc | icebreaker.pcf
