/**
 * \file gen_h.v
 * \author Soumil Krishnanand Heble
 * \date 11/24/2018
 * \brief Generate H for the SHA256 Algorithm - Pipelined
 */
 
`define ADV_ADD			1	//Uncomment to use Designware Parallel Prefix Adders (use set_implementation pparch <module_name> after read.tcl in synthesis)
`define ADV_ADD_WINDOWS	1	//In Addition to Uncommenting ADV_ADD Uncomment if Simulating on Windows Modelsim
//`define ONEHOT_ENC			1	//Uncomment to switch to One Hot Encoding State Machine

`ifdef ADV_ADD_WINDOWS
	`include "./DW01_add.v"
`elsif ADV_ADD
	`include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW01_add.v"
`endif

module gen_h	(	/** Inputs */
					input clock,							/** Clock Signal */	
					input reset,							/** Reset Signal */
					input main_go_sig,						/** Go Signal To Calculate */
					input local_go_sig,						/** Go Signal from W Module */
					input [31:0] k_data_in,					/** Data From K SRAM */
					input [31:0] w_data_in,					/** Data From W Module */
					input [31:0] h_data_in,					/** Data From H SRAM */
					
					/** Outputs */
					output reg [5:0] regop_k_mem_addr,		/** K SRAM Address */
					output reg regop_k_mem_en,				/** K SRAM Enable */
					output reg [5:0] regop_w_mem_addr,		/** W Module Address */
					output reg regop_w_mem_en,				/** W Module Enable */
					output reg [2:0] regop_h_mem_addr,		/** H SRAM Address */
					output reg [2:0] regop_op_mem_addr,		/** Output SRAM Address */
					output reg [31:0] regop_op_mem_wdata,	/** Output SRAM Write Data */
					output reg regop_h_mem_en,				/** H SRAM Enable */
					output reg regop_op_mem_en,				/** Output SRAM Enable */
					output reg regop_finish					/** Finish Signal */
				);

/** Parameters */
parameter width3 = 3;
parameter width6 = 6;
parameter width32 = 32;

/** Main State Machine States */
parameter [3:0]
	M0 = 4'b0000,
	M1 = 4'b0001,
	M2 = 4'b0010,
	M3 = 4'b0011,
	M4 = 4'b0100,
	M5 = 4'b0101,
	M6 = 4'b0110,
	M7 = 4'b0111,
	M8 = 4'b1000,
	M9 = 4'b1001,
	M10 = 4'b1010,
	M11 = 4'b1011,
	M12 = 4'b1100,
	M13 = 4'b1101,
	M14 = 4'b1110,
	M15 = 4'b1111;
	
/** SHA State Machine */
parameter [2:0]
	S0 = 3'b000,
	S1 = 3'b001,
	S2 = 3'b010,
	S3 = 3'b011,
	S4 = 3'b100,
	S5 = 3'b101,
	S6 = 3'b110,
	S7 = 3'b111;
	
/** State Machine Variables */
reg [2:0] main_current_state;	/** Main State Machine State Variable */
reg [2:0] main_next_state;		/** Main State Machine Next State */

reg [2:0] sha_current_state;	/** SHA State Machine State Variable */
reg [2:0] sha_next_state;		/** SHA State Machine Next State */

/** Registered Input Variables */
reg regin_reset;
reg regin_main_go_sig;
reg regin_local_go_sig;
reg [31:0] regin_k_data_in;
reg [31:0] regin_w_data_in;
reg [31:0] regin_h_data_in;

/** Pipeline Registers */
reg [31:0] wk_add_1;		/** W and K Data Addition Pipeline Register */
reg [31:0] sig1_e_1;		/** S2 Computation Pipeline Register */
reg [31:0] ch_efg_1;		/** S1 Computation Pipeline Register */
reg [31:0] sig0_a_1;		/** S5 Computation Pipeline Register */
reg [31:0] maj_abc_1;		/** S4 Computation Pipeline Register */
reg [31:0] wkh_add_2;		/** Add WK Sum to h Pipeline Register */
reg [31:0] sig1ch_add_2;	/** Add S1 and S2 Result Pipeline Register */
reg [31:0] T2_2;			/** S6 Computation Pipeline Register */
reg [31:0] T1_3;			/** S3 Computation Pipeline Register */


/** Delay (Holding) Registers */
reg [5:0] k_addr_hold0;			/** K SRAM Address Hold 0 Register */
reg [5:0] k_addr_hold1;			/** K SRAM Address Hold 1 Register */
reg [5:0] k_en_hold0;			/** K SRAM Enable Hold 0 Register */
reg [5:0] k_en_hold1;			/** K SRAM Enable Hold 1 Register */
reg ah_regf_wen_hold0;			/** ah Register File Write Enable Hold 0 Register */
reg [5:0] ah_regf_addr_hold0;	/** a-h Register File Address Hold 0 */

/** Storage Elements */
reg [2:0] curr_addr_hop;	/** Current H/Output SRAM Access Address */
reg [5:0] curr_addr_kw;		/** Current K SRAM/W Module Read Address */
reg [5:0] curr_sha_iter;	/** Current SHA Iteration */
reg [31:0] ah_regf [0:7];	/** SHA a-h Register File */
reg [5:0] ah_regf_addr;		/** a-h Register File Address */
reg ah_regf_wen;			/** ah Register File Write Enable Register */

/** Signals */
reg go_iterate_sha;			/** Start SHA State Machine */
reg done_with_sha;			/** SHA Iteration Complete */
reg ah_access_select;		/** Control Which Data Line Gets Access to ah Register File */
reg main_state_ah_wen;		/** Main State Machine ah Write Enable */
reg sha_state_ah_wen;		/** SHA State Machine ah Write Enable */

/** Adder Module Wires */
wire [2:0] hop_addr_sum_wire;
wire hop_addr_cout_wire;

wire [5:0] sha_iter_sum_wire;
wire sha_iter_cout_wire;

wire [31:0] ah_addr_sum_wire;

wire [5:0] kw_addr_sum_wire;
wire kw_addr_cout_wire;

wire [31:0] wk_add_sum_wire;
wire [31:0] wkh_add_2_sum_wire;
wire [31:0] sig1ch_add_2_sum_wire;
wire [31:0] T2_2_sum_wire;
wire [31:0] T1_3_sum_wire;
wire [31:0] ah_regf0_sum_wire;
wire [31:0] ah_regf4_sum_wire;

/** Sequential Logic Procedural Block */
always@(posedge clock)
begin
	/** Always Register Inputs */
	regin_reset <= reset;
	regin_main_go_sig <= main_go_sig;
	regin_local_go_sig <= local_go_sig;
	regin_k_data_in <= k_data_in;
	regin_w_data_in <= w_data_in;
	regin_h_data_in <= h_data_in;
	
	/** Reset Required Registers */
	if(regin_reset)
	begin
		/** Clear State Variables */
		main_current_state <= 3'b0;
		sha_current_state <= 3'b0;
		
		/** Important Output and Pipeline Registers */
		k_en_hold0 <= 1'b0;
		k_en_hold1 <= 1'b0;
		regop_k_mem_en <= 1'b0;
		regop_w_mem_en <= 1'b0;
		regop_h_mem_en <= 1'b0;
		regop_op_mem_en <= 1'b0;
		regop_finish <= 1'b0;
		ah_regf_wen <= 1'b0;
		ah_regf_wen_hold0 <= 1'b0;
		
		/** Address Counters */
		curr_addr_hop <= 3'b0;
		curr_addr_kw <= 6'b0;
		curr_sha_iter <= 6'b0;
	end
	else
	begin
		/** Take FSM To Next State */
		main_current_state <= main_next_state;
		sha_current_state <= sha_next_state;
	
		/** Feed Holding Registers */
		k_en_hold1 <= k_en_hold0;
		regop_k_mem_en <= k_en_hold1;
		
		k_addr_hold1 <= k_addr_hold0;
		regop_k_mem_addr <= k_addr_hold1;
		
		ah_regf_wen <= ah_regf_wen_hold0;
		ah_regf_addr <= ah_regf_addr_hold0;
		
		k_addr_hold0 <= curr_addr_kw;
		regop_w_mem_addr <= curr_addr_kw;
		
		regop_w_mem_en <= 1'b0;
		k_en_hold0 <= 1'b0;
		
		if(ah_access_select)
		begin
			ah_regf_wen_hold0 <= sha_state_ah_wen;
		end
		else
		begin
			ah_regf_wen_hold0 <= main_state_ah_wen;
		end
		
		if(ah_regf_wen)
		begin
			if(ah_access_select)
			begin
				ah_regf[ah_regf_addr] <= ah_addr_sum_wire;
			end
			else
			begin
				ah_regf[ah_regf_addr] <= regin_h_data_in;
			end
		end
		
		if(main_current_state==M1|sha_current_state==S5)
		begin
			curr_addr_hop <= hop_addr_sum_wire;
			regop_h_mem_addr <= curr_addr_hop;
			regop_h_mem_en <= 1'b1;
			ah_regf_addr_hold0 <= curr_addr_hop;
		end
		else
		if((main_current_state==M3)|(sha_current_state==S1))
		begin
			curr_addr_kw <= kw_addr_sum_wire;
			regop_w_mem_en <= 1'b1;
			k_en_hold0 <= 1'b1;
		end
		else
		if(main_current_state==M7)
		begin
			curr_addr_hop <= hop_addr_sum_wire;
			regop_op_mem_addr <= curr_addr_hop;
			regop_op_mem_en <= 1'b1;
			regop_op_mem_wdata <= ah_regf[curr_addr_hop];
		end
		else
		if(main_current_state==M8)
		begin
			regop_finish <= 1'b1;
		end
		
		if(sha_current_state==S1)
		begin
			//curr_sha_iter <= sha_iter_sum_wire;
			wk_add_1 <= wk_add_sum_wire;
			sig1_e_1 <= ({ah_regf[4][5:0],ah_regf[4][31:6]}^{ah_regf[4][10:0],ah_regf[4][31:11]}^{ah_regf[4][24:0],ah_regf[4][31:25]});
			ch_efg_1 <= (ah_regf[4]&ah_regf[5])^((~ah_regf[4])&ah_regf[6]);
			sig0_a_1 <= ({ah_regf[0][1:0],ah_regf[0][31:2]}^{ah_regf[0][12:0],ah_regf[0][31:13]}^{ah_regf[0][21:0],ah_regf[0][31:22]});
			maj_abc_1 <= ((ah_regf[0]&ah_regf[1])^(ah_regf[0]&ah_regf[2])^(ah_regf[1]&ah_regf[2]));
		end
		else
		if(sha_current_state==S2)
		begin
			wkh_add_2 <= wkh_add_2_sum_wire;
			sig1ch_add_2 <= sig1ch_add_2_sum_wire;
			T2_2 <= T2_2_sum_wire;
		end
		else
		if(sha_current_state==S3)
		begin
			T1_3 <= T1_3_sum_wire;
		end
		else
		if(sha_current_state==S4)
		begin
			curr_sha_iter <= sha_iter_sum_wire;
			ah_regf[0] <= ah_regf0_sum_wire;
			ah_regf[1] <= ah_regf[0];
			ah_regf[2] <= ah_regf[1];
			ah_regf[3] <= ah_regf[2];
			ah_regf[4] <= ah_regf4_sum_wire;
			ah_regf[5] <= ah_regf[4];
			ah_regf[6] <= ah_regf[5];
			ah_regf[7] <= ah_regf[6];
		end
	end
end

/** Main and SHA State Machine Procedural Block */
always@(*)
begin
	/** Defaults To Avoid Latches */
	go_iterate_sha = 1'b0;
	ah_access_select = 1'b0;
	main_state_ah_wen = 1'b0;
	sha_state_ah_wen = 1'b0;
	done_with_sha = 1'b0;
	
	case(main_current_state)
		M0:	begin
				if(regin_main_go_sig)
				begin
					main_next_state = M1;
				end
				else
				begin
					main_next_state = M0;
				end
		end
		
		M1:	begin
				main_state_ah_wen = 1'b1;
				if(hop_addr_cout_wire)
				begin
					main_next_state = M2;
				end
				else
				begin
					main_next_state = M1;
				end
		end
		
		M2:	begin
				if(regin_local_go_sig)
				begin
					main_next_state = M3;
				end
				else
				begin
					main_next_state = M2;
				end
		end
		
		M3: begin
				main_next_state = M4;
		end
		
		M4:	begin
				main_next_state = M5;
		end
		
		M5:	begin
				main_next_state = M6;
		end
		
		M6:	begin
				go_iterate_sha = 1'b1;
				ah_access_select = 1'b1;
				if(done_with_sha)
				begin
					main_next_state = M7;
				end
				else
				begin
					main_next_state = M6;
				end
		end
		
		M7:	begin
				if(hop_addr_cout_wire)
				begin
					main_next_state = M8;
				end
				else
				begin
					main_next_state = M7;
				end
		end
		
		M8:	begin
				if(regin_main_go_sig)
				begin
					main_next_state = M1;	//REset ALL HEre
				end
				else
				begin
					main_next_state = M8;
				end
		end
		
		default:	begin
						main_next_state = M0;
		end
	endcase
	
	case(sha_current_state)
		S0:	begin
				done_with_sha = 1'b1;
				if(go_iterate_sha)
				begin
					sha_next_state = S1;
				end
				else
				begin
					sha_next_state = S0;
				end
		end
		
		S1:	begin
				sha_next_state = S2;
				/*
				if(sha_iter_cout_wire)
				begin
					sha_next_state = S5;
				end
				else
				begin
					sha_next_state = S2;
				end
				*/
		end
		
		S2: begin
				sha_next_state = S3;
		end
		
		S3:	begin
				sha_next_state = S4;
		end
		
		S4:	begin
				if(sha_iter_cout_wire)
				begin
					sha_next_state = S5;
				end
				else
				begin
					sha_next_state = S1;
				end
				//sha_next_state = S1;
		end
		
		S5:	begin
				sha_state_ah_wen = 1'b1;
				if(hop_addr_cout_wire)
				begin
					sha_next_state = S6;
				end
				else
				begin
					sha_next_state = S5;
				end
		end
		
		S6:	begin
				sha_next_state = S7;
		end
		
		S7:	begin
				done_with_sha = 1'b1;
				/*
				if(go_iterate_sha)
				begin
					sha_next_state = S1;
				end
				else
				begin
					sha_next_state = S7;
				end
				*/
		end
	endcase
end

DW01_add #(width3)	PPADD1	 	(.A(curr_addr_hop), .B(3'b1), .CI(1'b0), .SUM(hop_addr_sum_wire), .CO(hop_addr_cout_wire));
DW01_add #(width6)	PPADD2 		(.A(curr_sha_iter), .B(6'b1), .CI(1'b0), .SUM(sha_iter_sum_wire), .CO(sha_iter_cout_wire));
DW01_add #(width32)	PPADD3 		(.A(regin_h_data_in), .B(ah_regf[ah_regf_addr]), .CI(1'b0), .SUM(ah_addr_sum_wire));
DW01_add #(width6)	PPADD4 		(.A(curr_addr_kw), .B(6'b1), .CI(1'b0), .SUM(kw_addr_sum_wire), .CO(kw_addr_cout_wire));
DW01_add #(width32)	PPADD5 		(.A(regin_w_data_in), .B(regin_k_data_in), .CI(1'b0), .SUM(wk_add_sum_wire));
DW01_add #(width32)	PPADD6 		(.A(wk_add_1), .B(ah_regf[7]), .CI(1'b0), .SUM(wkh_add_2_sum_wire));
DW01_add #(width32)	PPADD7 		(.A(ch_efg_1), .B(sig1_e_1), .CI(1'b0), .SUM(sig1ch_add_2_sum_wire));
DW01_add #(width32)	PPADD8 		(.A(maj_abc_1), .B(sig0_a_1), .CI(1'b0), .SUM(T2_2_sum_wire));
DW01_add #(width32)	PPADD9 		(.A(sig1ch_add_2), .B(wkh_add_2), .CI(1'b0), .SUM(T1_3_sum_wire));
DW01_add #(width32)	PPADD10 	(.A(T1_3), .B(T2_2), .CI(1'b0), .SUM(ah_regf0_sum_wire));
DW01_add #(width32)	PPADD11 	(.A(T1_3), .B(ah_regf[3]), .CI(1'b0), .SUM(ah_regf4_sum_wire));

endmodule