`define ADV_ADD 1

// synopsys translate_off
`ifdef ADV_ADD
	`include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW01_add.v"
`endif
// synopsys translate_on

module w_op (	input clock,
				input reset,
				input [31:0] in1,
				input [31:0] in2,
				input [31:0] in3,
				input [31:0] in4,
				output reg [31:0] ops_out
			);

reg [31:0] shift_1;
reg [31:0] shift_2;

`ifdef ADV_ADD
	wire [31:0] adr_1_op;
	wire [31:0] adr_2_op;
	wire [31:0] adr_final_op;
`else
	reg [31:0] adr_1_op;
	reg [31:0] adr_2_op;
	reg [31:0] adr_final_op;
`endif

`ifdef ADV_ADD
	parameter width=32;
`endif

always@(posedge clock)
begin
	if(reset)
	begin
		ops_out <= 32'b0;
	end
	else
	begin
		ops_out <= adr_final_op;
	end
end

always@(*)
begin
	shift_1 = {{17{1'b0}},in1[31:17]}^{{19{1'b0}},in1[31:19]}^{in1[9:0],in1[31:10]};
	shift_2 = {{7{1'b0}},in2[31:7]}^{{18{1'b0}},in2[31:18]}^{in2[2:0],in2[31:3]};
	`ifndef ADV_ADD
		adr_1_op = shift_1+in3;
		adr_2_op = shift_2+in4;
		adr_final_op = adr_1_op + adr_2_op;
	`endif
end

`ifdef ADV_ADD
	DW01_add #(width) U4 (.A(shift_1), .B(in3), .CI(1'b0), .SUM(adr_1_op));
	DW01_add #(width) U5 (.A(shift_2), .B(in4), .CI(1'b0), .SUM(adr_2_op));
	DW01_add #(width) U6 (.A(adr_1_op), .B(adr_2_op), .CI(1'b0), .SUM(adr_final_op));
`endif

endmodule
