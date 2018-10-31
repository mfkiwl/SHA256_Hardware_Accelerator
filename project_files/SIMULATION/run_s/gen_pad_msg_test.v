/**
 * \file gen_pad_msg_test.v
 * \date 10/30/2018
 * \author Soumil Krishnanand Heble
 * \brief SHA256 Padded Message Generator Test Bench
 */

module test_genpadmsg();

parameter CLK_PHASE=5;
parameter MAX_MESSAGE_LENGTH=55;
parameter SYMBOL_WIDTH=8;

reg clock;
reg reset;
reg dut_go;
reg [$clog2(MAX_MESSAGE_LENGTH)-1:0] sha_msg_length;
wire finish_sig;
wire [$clog2(MAX_MESSAGE_LENGTH)-1:0] mem_sram_addr;
wire mem_sram_en;
wire [SYMBOL_WIDTH-1:0] mem_sram_data;
wire [511:0] mem_pad_mem;

initial
begin
	$dumpfile("wave_genpadmsg.vcd");
	$dumpvars;

	clock=1'b0;
	reset=1'b1;
	dut_go = 1'b0;
	sha_msg_length = 6'd7;

	#8 reset = 0;
	dut_go = 1'b1;

	#7 dut_go = 1'b0;

	#1000 $finish;
end

always #CLK_PHASE clock = ~clock;

sram #( .ADDR_WIDTH    ($clog2(MAX_MESSAGE_LENGTH)),
	.DATA_WIDTH    ( SYMBOL_WIDTH ),
	.MEM_INIT_FILE ( "../../HDL/run_s/message.dat" ))
	msg_mem (
			.address      ( mem_sram_addr ),
          		.write_data   ( {SYMBOL_WIDTH {1'b0}} ),
          		.read_data    ( mem_sram_data ),
          		.enable       ( mem_sram_en ),
          		.write        ( 1'b0 ),
			.clock        ( clock )
		);

gen_pad_msg U0 (.clock(clock), .reset(reset), .go_sig(dut_go), .msg_len(sha_msg_length), .msg_mem_data(mem_sram_data), .pad_msg_rdy(finish_sig), .msg_mem_en(mem_sram_en), .msg_mem_addr(mem_sram_addr), .pad_mem(mem_pad_mem));

endmodule
