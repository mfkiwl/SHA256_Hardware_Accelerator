module testfixture();

reg clock;
reg reset;
reg [31:0] in1;
reg [31:0] in2;
reg [31:0] in3;
reg [31:0] in4;
wire [31:0] res_out;

initial
begin
	clock = 1'b0;
	reset = 1'b1;
	in1 = 32'b0;
	in2 = 32'b0;
	in3 = 32'b0;
	in4 = 32'b0;

	#15 reset = 1'b0;
	in1 = 32'h384b5d26;
	in2 = 32'h384b5d26;
	in3 = 32'h384b5d26;
	in4 = 32'h384b5d26;

	#100 $finish;
end

always #5 clock = ~clock;

//w_op U1 (.clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .ops_out(res_out));
//fp_1 U2 (.clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .ops_out(res_out));
fp_2 U3 (.clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .ops_out(res_out));

endmodule
