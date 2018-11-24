/**
 * \file gen_h_unpipelined_test.v
 * \date 11/23/2018
 * \author Soumil Krishnanand Heble
 * \brief Generate H for the SHA256 Algorithm - Unpipelined - Test
 */

module test_genhunpipelined();

parameter MSG_LENGTH 			= 6'd7;
parameter CLK_PHASE 			= 5;
parameter MAX_MESSAGE_LENGTH  	= 55;
parameter NUMBER_OF_Ks        	= 64;
parameter NUMBER_OF_Hs 			= 8 ;
parameter SYMBOL_WIDTH 			= 8;

/** General Inputs */
reg clock;
reg dut_reset;
reg dut_go;
reg [$clog2(MAX_MESSAGE_LENGTH)-1:0] dut_msg_len;
wire dut_finish;

/** Control Signals between Modules */
wire pad_to_w_go;
wire w_to_h_go;

/** MSG SRAM Signals */
wire dut_msg_mem_en;
wire [511:0] dut_pad_reg;
wire [SYMBOL_WIDTH-1:0] dut_msg_mem_data;
wire [$clog2(MAX_MESSAGE_LENGTH)-1:0] dut_msg_mem_addr;

/** W Register File Signals */
wire w_mem_en;
wire [$clog2(NUMBER_OF_Ks)-1:0] w_mem_addr;
wire [31:0] w_mem_data;

/** K SRAM Signals */
wire dut_k_mem_en;
wire [31:0] dut_k_mem_data;
wire [$clog2(NUMBER_OF_Ks)-1:0] dut_k_mem_addr;

/** H SRAM Signals */
wire dut_h_mem_en;
wire [31:0] dut_h_mem_rdata;
wire [31:0] dut_h_mem_wdata;
wire [$clog2(NUMBER_OF_Hs)-1:0] dut_h_mem_addr;
wire dut_h_mem_rw;

/** Go Finish */
initial
begin
	$dumpfile("wave_genpadmsg.vcd");
	$dumpvars;

	clock=1'b0;
	dut_reset=1'b1;
	dut_go = 1'b0;
	dut_msg_len = MSG_LENGTH;
	
	#15 dut_reset = 1'b0;
	
	#10 dut_go = 1'b1;

	#10 dut_go = 1'b0;

	#2000 $finish;
end

always #CLK_PHASE clock = ~clock;

sram 	#(	.ADDR_WIDTH    ($clog2(MAX_MESSAGE_LENGTH)),
			.DATA_WIDTH    ( SYMBOL_WIDTH ),
			.MEM_INIT_FILE ( "../../../../HDL/run_s/message.dat" ))
			msg_mem	(
						.address      ( dut_msg_mem_addr ),
						.write_data   ( {SYMBOL_WIDTH {1'b0}} ),
						.read_data    ( dut_msg_mem_data ),
						.enable       ( dut_msg_mem_en ),
						.write        ( 1'b0 ),
						.clock        ( clock )
					);
	
sram	#(	.ADDR_WIDTH    ($clog2(NUMBER_OF_Hs)),
			.DATA_WIDTH    (32),
			.MEM_INIT_FILE ("../../../../HDL/run_s/H.dat"))
			hmem_mem	(
							.address     (dut_h_mem_addr),
							.write_data  (dut_h_mem_wdata), 
							.read_data   (dut_h_mem_rdata), 
							.enable      (dut_h_mem_en),
							.write       (dut_h_mem_rw),
							.clock       (clock)
						);
						
sram  	#(	.ADDR_WIDTH    ( $clog2(NUMBER_OF_Ks)),
			.DATA_WIDTH    (32),
			.MEM_INIT_FILE ("../../../../HDL/run_s/K.dat"))
			kmem_mem	(
							.address     (dut_k_mem_addr),
							.write_data  (32'b0), 
							.read_data   (dut_k_mem_data), 
							.enable      (dut_k_mem_en),
							.write       (1'b0),
							.clock       (clock)
						);
						
gen_padded gen_padded	(	/** Inputs */
							.clock (clock),
							.reset (dut_reset),
							.main_go_sig (dut_go),						/** Go Signal to Compute SHA256 */
							.msg_len (dut_msg_len),						/** Message Length in Number of Characters */
							.msg_mem_data (dut_msg_mem_data),			/** Data from Message SRAM */
							.finish_sig(dut_finish),					/** Computation Finished Signal */
						
							/** Ouptuts */
							.regop_msg_mem_en (dut_msg_mem_en),		/** Enable Signal for Message SRAM - Registered Output */
							.regop_msg_mem_addr (dut_msg_mem_addr),	/** Address Signal for Message SRAM - Registered Output */
							.regop_pad_reg (dut_pad_reg),				/** 512B Wide Register with the Padded Message - Registered Output */
							.regop_pad_rdy (pad_to_w_go) 			/** Padded Message Ready Signal - Registered Output */
						);
						
gen_w_less 	gen_w_less	(	/** Inputs */
							.clock (clock),
							.reset (dut_reset),
							.local_go_sig (pad_to_w_go),
							.pad_reg (dut_pad_reg),
							.w_reg_read (w_mem_en),
							.w_reg_addr (w_mem_addr),
				
							/** Outputs */
							.regop_w_reg_rdy (w_to_h_go),
							.regop_w_reg_data (w_mem_data)
						);

gen_h_unpipelined	gen_h_unpipelined 	(	/** Inputs */
											.clock (clock),
											.reset (dut_reset),
											.main_go_sig (dut_go),
											.local_go_sig (w_to_h_go),
											.k_data_in(dut_k_mem_data),
											.w_data_in(w_mem_data),
											.h_data_in(dut_h_mem_rdata),
											
											/** Outputs */
											.regop_k_mem_addr(dut_k_mem_addr),
											.regop_k_mem_en(dut_k_mem_en),
											.regop_w_mem_addr(w_mem_addr),
											.regop_w_mem_en(w_mem_en),
											.regop_h_mem_addr(dut_h_mem_addr),
											.regop_h_mem_wdata(dut_h_mem_wdata),
											.regop_h_mem_en(dut_h_mem_en),
											.regop_h_mem_rw(dut_h_mem_rw),
											.regop_finish(dut_finish)
										);
endmodule






























