/*
 * Name: sram_controller_test.v
 * Date/Time: 10/28/2018 02:30
 * Author: Soumil Krishnanand Heble
 * ECE564 Final Project Pipelined SRAM Controller
 */

module test_sramcontroller();

parameter CLK_PHASE		= 5;
parameter MAX_MESSAGE_LENGTH	= 8;
parameter SYMBOL_WIDTH		= 32;

reg	clk;
reg	reset;
reg	enable_sig;
reg	rw_sig;
reg	[$clog2(MAX_MESSAGE_LENGTH)-1:0] addr_sig;
reg	[SYMBOL_WIDTH-1:0] write_data_sig;

wire	[SYMBOL_WIDTH-1:0] sram_out_signal;

wire	dat_ready_sig;
wire	[SYMBOL_WIDTH-1:0] out_data_sig;

wire	sram_enable_sig;
wire	sram_rw_sig;
wire	[SYMBOL_WIDTH-1:0] sram_wdata_sig;
wire	[$clog2(MAX_MESSAGE_LENGTH)-1:0] sram_addr_sig;

initial
	begin

	$dumpfile("sram_controller_test.vcd");
	$dumpvars;

	clk = 1'b0;
	reset = 1;
	enable_sig = 0;
	rw_sig = 0;
	addr_sig = {$clog2( MAX_MESSAGE_LENGTH)-1{1'b0}};
	write_data_sig = {SYMBOL_WIDTH{1'b0}};

	#5 reset = 0;
	addr_sig = 3'd1;
	enable_sig = 1'b1;
	
	#10 addr_sig = 3'd2;
	enable_sig = 1'b1;

	#10 enable_sig = 1'b0;

	#10 enable_sig = 1'b1;
	rw_sig = 1'b1;
	addr_sig = 3'd3;
	write_data_sig = 32'h56789ABC;

	#10 enable_sig = 1'b1;
	rw_sig = 1'b0;
	addr_sig = 3'd3;

	#10 enable_sig = 1'b0;
	rw_sig = 1'b0;

	#100 $finish;
	end

always #CLK_PHASE clk = ~clk;

sram	#(.ADDR_WIDTH ( $clog2( MAX_MESSAGE_LENGTH ) ),
	  .DATA_WIDTH ( SYMBOL_WIDTH ),
	  .MEM_INIT_FILE ( "../../HDL/run_s/sram_controller_test.dat" ))
	  msg_mem (
	  .address	( sram_addr_sig ),
	  .write_data	( sram_wdata_sig ), 
	  .read_data	( sram_out_signal ), 
	  .enable	( sram_enable_sig ),
	  .write	( sram_rw_sig ),
          .clock	( clk ));

sram_controller	#(.ADDR_WIDTH ( $clog2( MAX_MESSAGE_LENGTH ) ),
		  .DATA_WIDTH ( SYMBOL_WIDTH ))
		  message_mem_sram_controller (
		  //Input to the SRAM Controller
		  .clock 		( clk ),
		  .reset 		( reset ),
		  .memctrl_enable	( enable_sig ),
		  .memctrl_rw 		( rw_sig ),
		  .memctrl_addr 	( addr_sig ),
		  .memctrl_write_data	( write_data_sig ),
		  //Input from the SRAM to SRAM Controller
		  .sram_out_data 	( sram_out_signal ),
		  //Output from the SRAM Controller
		  .dat_ready 		( dat_ready_sig ),
		  .memctrl_out_data	( out_data_sig ),
		  //Output from the SRAM Controller to SRAM
		  .sram_enable		( sram_enable_sig ),
		  .sram_rw		( sram_rw_sig ),
		  .sram_write_data	( sram_wdata_sig ),
		  .sram_addr 		( sram_addr_sig ));

endmodule