/**
 * \file gen_w_less.v
 * \author Soumil Krishnanand Heble
 * \date 11/21/2018
 * \brief Generate W array for the SHA256 Algorithm
 */
 
//`include "./DW01_add.v"
 
 module gen_w_less (	/** Inputs */
						input clock,
						input reset,
						input local_go_sig,
						input [511:0] pad_reg,
						input w_reg_read,
						input [5:0] w_reg_addr,
						
						/** Outputs */
						output reg regop_w_reg_rdy,
						output reg [31:0] regop_w_reg_data
					);

/** Internal Variable Declarations */
/** Storage Elements */
reg [31:0] w_regf [0:15];		/** W Register File */
reg [1:0] current_state;		/** State Machine Current State */
reg [5:0] current_serving;		/** Current W being Served */

/** Pipelined W Calculations */
reg [31:0] add0_op_hold;		/** Sigma 0 Add Pipeline Register */
reg [31:0] add1_op_hold;		/** Sigma 0 Add Pipeline Register */

/** Registered Inputs */
reg regip_reset;						/** Registered Reset */ 
reg regip_local_go_sig;					/** Internal Go Signal IP Register */
reg regip_w_reg_read;					/** Registered W Register File Read Enable */
reg [5:0] regip_w_reg_addr;				/** Registered W Register File Address */

/** "Regs" */
//reg read_addr_match_sig;
reg w_reg_rdy_sig;
reg [1:0] next_state;
reg [31:0] w_min_16;					/** W[current_calculation-16] */
reg [31:0] w_min_15;					/** W[current_calculation-15] */
reg [31:0] w_min_7;						/** W[current_calculation-7] */
reg [31:0] w_min_2;						/** W[current_calculation-2] */
reg [31:0] w_ip_reg13;					/** Input To Register 13 */

wire [31:0] add0_out_wire;
wire [31:0] add1_out_wire;
wire [31:0] final_add_op_wire;
wire [5:0] addr_inc_wire;
wire addr_inc_cout_wire;

parameter width32 = 32;
parameter width6 = 6;

/** State Machine States */
parameter [1:0]
	S0 = 2'b00,		/** Idle State */
	S1 = 2'b01,		/** Load State */
	S2 = 2'b10,		/** Run State */
	S3 = 2'b11;		/** Wait For Go State */

/** FSM and Storage Operation Procedural Block */
always@(posedge clock)
begin

	/** Always Register Inputs */
	regip_reset <= reset;
	regip_local_go_sig <= local_go_sig;
	regip_w_reg_read <= w_reg_read;
	regip_w_reg_addr <= w_reg_addr;

	if(regip_reset)
	begin
		current_state <= 2'b0;
		current_serving <= 6'b0;
		regop_w_reg_rdy <= 1'b0;
		regop_w_reg_data <= 32'b0;
	end
	else
	begin
		current_state <= next_state;
		regop_w_reg_rdy <= w_reg_rdy_sig;
	
		if(current_state==S1)
		begin
			w_regf[0] <= pad_reg[511:480];
			w_regf[1] <= pad_reg[479:448];
			w_regf[2] <= pad_reg[447:416];
			w_regf[3] <= pad_reg[415:384];
			w_regf[4] <= pad_reg[383:352];
			w_regf[5] <= pad_reg[351:320];
			w_regf[6] <= pad_reg[319:288];
			w_regf[7] <= pad_reg[287:256];
			w_regf[8] <= pad_reg[255:224];
			w_regf[9] <= pad_reg[223:192];
			w_regf[10] <= pad_reg[191:160];
			w_regf[11] <= pad_reg[159:128];
			w_regf[12] <= pad_reg[127:96];
			w_regf[13] <= pad_reg[95:64];
			w_regf[14] <= pad_reg[63:32];
			w_regf[15] <= pad_reg[31:0];
		end
		else
		//if(regip_w_reg_read)
		if((current_serving==regip_w_reg_addr) & regip_w_reg_read)
		begin
			current_serving <= addr_inc_wire;
			
			/** Push Out The Top W To Output */
			regop_w_reg_data <= w_regf[0];
			
			/** Shift Registers */
			w_regf[0] <= w_regf[1];
			w_regf[1] <= w_regf[2];
			w_regf[2] <= w_regf[3];
			w_regf[3] <= w_regf[4];
			w_regf[4] <= w_regf[5];
			w_regf[5] <= w_regf[6];
			w_regf[6] <= w_regf[7];
			w_regf[7] <= w_regf[8];
			w_regf[8] <= w_regf[9];
			w_regf[9] <= w_regf[10];
			w_regf[10] <= w_regf[11];
			w_regf[11] <= w_regf[12];
			w_regf[12] <= w_regf[13];
			w_regf[13] <= w_regf[14];
			if(|current_serving)
			begin
				w_regf[14] <= final_add_op_wire;
			end
			else
			begin
				w_regf[14] <= w_regf[15];
			end
			
			/** W Operation Pipelined */
			add0_op_hold <= add0_out_wire;
			add1_op_hold <= add1_out_wire;
		end
	end
end

/** State Machine Combinational Procedural Block */
always@(*)
begin
	/** Defaults To Avoid Latches */
	w_reg_rdy_sig = 1'b0;

	case(current_state)
		S0:	begin
				if(regip_local_go_sig)
				begin
					next_state = S1;
				end
				else
				begin
					next_state = S0;
				end
		end
		
		S1:	begin
				next_state = S2;
		end
		
		S2:	begin
				w_reg_rdy_sig = 1'b1;
				
				if(addr_inc_cout_wire)
				begin
					next_state = S3;
				end
				else
				begin
					next_state = S2;
				end
		end
		
		S3:	begin
				if(regip_local_go_sig)
				begin
					next_state = S3;
				end
				else
				begin
					next_state = S0;
				end
		end
	endcase
end

DW01_add #(width32) U4 (.A({w_regf[1][6:0],w_regf[1][31:7]}^{w_regf[1][17:0],w_regf[1][31:18]}^{{3{1'b0}},w_regf[1][31:3]}), .B(w_regf[0]), .CI(1'b0), .SUM(add0_out_wire));
DW01_add #(width32) U5 (.A({w_regf[14][16:0],w_regf[14][31:17]}^{w_regf[14][18:0],w_regf[14][31:19]}^{{10{1'b0}},w_regf[14][31:10]}), .B(w_regf[9]), .CI(1'b0), .SUM(add1_out_wire));
DW01_add #(width32) U6 (.A(add0_op_hold), .B(add1_op_hold), .CI(1'b0), .SUM(final_add_op_wire));
DW01_add #(width6) U7 (.A(current_serving), .B(6'b1), .CI(1'b0), .SUM(addr_inc_wire), .CO(addr_inc_cout_wire));

endmodule
