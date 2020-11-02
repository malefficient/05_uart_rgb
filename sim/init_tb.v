// Adapted from: https://people.ece.cornell.edu/land/courses/ece5760/Verilog/LatticeTestbenchPrimer.pdf
`timescale 1ns/1ps
//--Tell simulator timescale: I kind of prefer something wacky, and like, human-scaled. (1/10th of a second per time unit!)
//  But turns out that wouldn't really matter, because the whole simulation is done up front (not real time)
//  Since these simulations don't perform any timing analysis at this point, the timescaled specified above is really
//  only relevant to a) the units displayed inside wave simulator
//                   b) The size of the waveform files generated and stored up front.
//  Also: this is apparently what all the modules included in the UNISIM library (Xilinx equivalent of libc)  are used to.
module init_tb();
// defines this module using module_tb naming scheme. 

//--First things first: we need a clock. We call ours 'testbecnch_clk'
//  testbench clk toggles every 5 time-units during simulation, shown below.
reg tb_clk = 1'b1;

//--We probably want the simulator to provide some simple static inputs to get things started. 
//--Simulator will provide this 16-bit register with value 0x4142 at time T0
//reg tb_init_data[15:0] = 16'h4142; //Note the '=' operator for this simulator magic.

/* -- Initial and Always Blocks
 * Always and initial blocks are two sequential control blocks that operate on reg types in a
 * Verilog simulation. Each initial and always block executes concurrently in every module
 * at the start of simulation. 
 * https://people.ece.cornell.edu/land/courses/ece5760/Verilog/LatticeTestbenchPrimer.pdf
 */
always
begin
    #5 tb_clk <= ~tb_clk;
end
/* 
 * Initial blocks start executing sequentially at simulation time 0. Starting with the first line
 * between the "begin end pair" each line executes from top to bottom until a delay is
 * reached. When a delay is reached, the execution of this block waits until the delay time
 * has passed and then picks up execution again. Each initial and always block executes
 * concurrently, so while this block is stalled between time 0 and 20, other blocks in the
 * design are executing. The initial block in Figure 3, starts by printing << Starting the
 * Simulation >> to the screen, and initializes the reg types clk_50 and rst_l to 0 at time 0.
 * The simulation time wheel then advances to time index 20, and the value on rst_l changes
 * to a 1. This simple block of code initializes the clk_50 and rst_l reg types at the
 * beginning of simulation and causes a reset pulse from low to high for 20 ns in a
 * simulation.
 */ 
endmodule