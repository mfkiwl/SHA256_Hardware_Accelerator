/**
 * \file gen_padded.v
 * \date 11/4/2018
 * \author Soumil Krishnanand Heble
 * \brief SHA256 Padded Message Generator Test Bench
 */

module test_genw();

parameter CLK_PHASE=5;
parameter MAX_MESSAGE_LENGTH=55;
parameter SYMBOL_WIDTH=8;

reg clock;
reg dut_reset;
reg dut_go;
reg [$clog2(MAX_MESSAGE_LENGTH)-1:0] dut_msg_length;
wire [SYMBOL_WIDTH-1:0] dut_mem_sram_data;

wire dut_mem_sram_en;
wire [$clog2(MAX_MESSAGE_LENGTH)-1:0] dut_mem_sram_addr;
wire [511:0] dut_pad_reg;
wire dut_finish_sig;

wire [31:0] w_out_data;
wire w_finished;

/** Go Finish */
initial
begin
	$dumpfile("wave_genw.vcd");
	$dumpvars;

	clock=1'b0;
	dut_reset=1'b1;
	dut_go = 1'b0;
	dut_msg_length = 6'd7;

	#5 dut_reset=1'b1;
	
	#10 dut_reset = 1'b0;
	
	#10 dut_go = 1'b1;

	#10 dut_go = 1'b0;

	#1000 $finish;
end

/** Go Wait Go Finish */
/*
initial
begin
	$dumpfile("wave_genpadmsg.vcd");
	$dumpvars;

	clock=1'b0;
	dut_reset=1'b1;
	dut_go = 1'b0;
	dut_msg_length = 6'd7;

	#5 dut_reset=1'b1;
	
	#10 dut_reset = 1'b0;
	
	#10 dut_go = 1'b1;

	#10 dut_go = 1'b0;
	
	#10 dut_go = 1'b1;
	
	#20 dut_go = 1'b0;

	#1000 $finish;
end
*/

/** Go Finish Go Finish */
/*
initial
begin
	$dumpfile("wave_genpadmsg.vcd");
	$dumpvars;

	clock=1'b0;
	dut_reset=1'b1;
	dut_go = 1'b0;
	dut_msg_length = 6'd7;

	#5 dut_reset=1'b1;
	
	#10 dut_reset = 1'b0;
	
	#10 dut_go = 1'b1;

	#10 dut_go = 1'b0;

	#150 dut_go = 1'b1;
	
	#10 dut_go = 1'b0;
	
	#1000 $finish;
end
*/

/** Go Go Go Go Go */
/*
initial
begin
	$dumpfile("wave_genpadmsg.vcd");
	$dumpvars;

	clock=1'b0;
	dut_reset=1'b1;
	dut_go = 1'b0;
	dut_msg_length = 6'd7;

	#5 dut_reset=1'b1;
	
	#10 dut_reset = 1'b0;
	
	#10 dut_go = 1'b1;

	#1000 $finish;
end
*/

always #CLK_PHASE clock = ~clock;

sram #( .ADDR_WIDTH    ($clog2(MAX_MESSAGE_LENGTH)),
	.DATA_WIDTH    ( SYMBOL_WIDTH ),
	.MEM_INIT_FILE ( "../../HDL/run_s/message.dat" ))
	msg_mem	(
				.address      ( dut_mem_sram_addr ),
				.write_data   ( {SYMBOL_WIDTH {1'b0}} ),
				.read_data    ( dut_mem_sram_data ),
				.enable       ( dut_mem_sram_en ),
				.write        ( 1'b0 ),
				.clock        ( clock )
			);
			
gen_padded gen_padded	(	/** Inputs */
							.clock (clock),
							.reset (dut_reset),
							.main_go_sig (dut_go),						/** Go Signal to Compute SHA256 */
							.msg_len (dut_msg_length),					/** Message Length in Number of Characters */
							.msg_mem_data (dut_mem_sram_data),			/** Data from Message SRAM */
						
							/** Ouptuts */
							.regop_msg_mem_en (dut_mem_sram_en),		/** Enable Signal for Message SRAM - Registered Output */
							.regop_msg_mem_addr (dut_mem_sram_addr),	/** Address Signal for Message SRAM - Registered Output */
							.regop_pad_reg (dut_pad_reg),				/** 512B Wide Register with the Padded Message - Registered Output */
							.regop_pad_rdy (dut_finish_sig) 			/** Padded Message Ready Signal - Registered Output */
						);
						
gen_w 	gen_w			(	/** Inputs */
							.clock (clock),
							.reset (dut_reset),
							.local_go_sig (dut_finish_sig),
							.pad_reg (dut_pad_reg),
							.w_reg_read (1'b0),
							.w_reg_addr (6'b0),
				
							/** Outputs */
							.regop_w_reg_rdy (w_finished),
							.regop_w_reg_data (w_out_data)
						);

endmodule