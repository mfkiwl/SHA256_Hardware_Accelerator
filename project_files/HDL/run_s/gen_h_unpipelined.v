/**
 * \file gen_h_unpipelined.v
 * \author Soumil Krishnanand Heble
 * \date 11/23/2018
 * \brief Generate H for the SHA256 Algorithm - Unpipelined
 */
 
`define ADV_ADD			1	//Uncomment to use Designware Parallel Prefix Adders (use set_implementation pparch <module_name> after read.tcl in synthesis)
`define ADV_ADD_WINDOWS	1	//In Addition to Uncommenting ADV_ADD Uncomment if Simulating on Windows Modelsim
//`define ONEHOT_ENC			1	//Uncomment to switch to One Hot Encoding State Machine

`ifdef ADV_ADD_WINDOWS
	`include "./DW01_add.v"
`elsif ADV_ADD
	`include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW01_add.v"
`endif
 
 module gen_h_unpipelined	(	/** Inputs */
								input clock,
								input reset,
								input main_go_sig,
								input local_go_sig,
								input [31:0] k_data_in,
								input [31:0] w_data_in,
								input [31:0] h_data_in,
								
								/** Outputs */
								output reg [5:0] regop_k_mem_addr,
								output reg regop_k_mem_en,
								output reg [5:0] regop_w_mem_addr,
								output reg regop_w_mem_en,
								output reg [2:0] regop_h_mem_addr,
								output reg [31:0] regop_h_mem_wdata,
								output reg regop_h_mem_en,
								output reg regop_h_mem_rw,
								output reg regop_finish
							);

`ifdef ADV_ADD
	parameter width3 = 3;
	parameter width6 = 6;
`endif

/** Internal Variable Declarations */
/** Storage Elements */

reg [31:0] ah_regf [0:7];

`ifdef ONEHOT_ENC
	reg [3:0] current_state;		/** Current State of the State Machine */
`else
	reg [2:0] current_state;		/** Current State of the State Machine */
`endif

reg [2:0] curr_addr_h;			/** Current Access Address - H SRAM */
reg [5:0] curr_h_iter;			/** Current H Iteration */
reg [5:0] curr_addr_kw;			/** Current KW Read Address */

reg we_ah_reg;					/** Write Enable for the AH Register */
reg we_ah_reg_hold0;			/** Write Enable Hold 0 for the AH Register */

reg [2:0] ah_reg_addr;			/** AH Register Address */
reg [2:0] ah_reg_addr_hold0;	/** AH Register Address Hold 0 */

reg [5:0] k_addr_hold0;			/** Hold 0 K SRAM Access Address */
reg [5:0] k_addr_hold1;			/** Hold 1 K SRAM Access Address */
reg k_mem_en_hold0;				/** Hold 0 K SRAM Enable */
reg k_mem_en_hold1;				/** Hold 1 K SRAM Enable */

/** Registered Inputs */
reg regin_main_go_sig;			/** Go Signal IP Register */
reg [31:0] regin_msg_mem_data;	/** Message Data IP Register */
reg regin_local_go_sig;			/** Local Go Signal IP Register */
reg [31:0] regin_k_data_in;		/** K SRAM Data IP Register */
reg [31:0] regin_w_data_in;		/** W Memory Data IP Register */
reg regin_reset;				/** Registered Reset */

`ifdef ADV_ADD
	wire [2:0] h_add_sum_wire;	/** H Address Addition Sum Wire */
	wire h_add_cout_wire;		/** H Address Addition Carry Out Wire */
	wire [5:0] kw_add_sum_wire;
	wire kw_add_cout_wire;
	wire [5:0] h_iter_sum_wire;
	wire h_iter_cout_wire;
`endif

/** "Regs" */

`ifdef ONEHOT_ENC
	reg [3:0] next_state;			/** Next State Signal */
`else
	reg [2:0] next_state;			/** Next State Signal */
`endif

/** State Machine Parameter Declaration */

`ifdef ONEHOT_ENC
	parameter [3:0]
		S0 = 4'b0001,	/** Idle State */
		S1 = 4'b0010,	/** Clear Access Address State */
		S2 = 4'b0100,	/** Start Incrementing Request Address, Check for Next Address State, Assert SRAM Enable and Enable Pad Register WE */
		S3 = 4'b1000;	/** Wait for Next Go */
`else
	parameter [2:0]
	S0 = 3'b000,	/** Idle State */
	S1 = 3'b001,	/** Clear Access Address State */
	S2 = 3'b010,	/** Start Incrementing Request Address, Check for Next Address State, Assert SRAM Enable and Enable Pad Register WE */
	S3 = 3'b011,	/** Wait for Local Go */
	S4 = 3'b100,
	S5 = 3'b101,
	S6 = 3'b110,
	S7 = 3'b111;
	
`endif

/** State Machine and Storage Element Update Procedural Block */
always@(posedge clock)
begin

	/** Always Register Inputs */
	regin_main_go_sig <= main_go_sig;			/** Go Signal IP Register */
	regin_msg_mem_data <= h_data_in;			/** Message Data IP Register */
	regin_reset <= reset;						/** Registered Reset */
	regin_local_go_sig <= local_go_sig;			/** Registered Go Signal */
	regin_k_data_in <= k_data_in;				/** Registered K Data */
	regin_w_data_in <= w_data_in;				/** Registered W Data */
	
	if(regin_reset)
	begin
	`ifdef ONEHOT_ENC
		current_state <= 4'b0;
	`else
		current_state <= 3'b0;
	`endif
	
		regop_k_mem_addr <= 6'b0;
		regop_k_mem_en <= 1'b0;
		regop_w_mem_addr <= 6'b0;
		regop_w_mem_en <= 1'b0;
		regop_h_mem_addr <= 3'b0;
		regop_h_mem_en <= 1'b0;
		regop_h_mem_rw <= 1'b0;
		regop_h_mem_wdata <= 32'b0;
		regop_finish <= 1'b0;
		
		curr_h_iter <= 6'b0;
		curr_addr_kw <= 6'b0;
		
		we_ah_reg_hold0 <= 1'b0;
		we_ah_reg <= 1'b0;
		
		ah_reg_addr_hold0 <= 2'b0;
		ah_reg_addr <= 2'b0;
		
		k_addr_hold0 <= 6'b0;
		k_addr_hold1 <= 6'b0;
		
		k_mem_en_hold0 <= 1'b0;
		k_mem_en_hold1 <= 1'b0;
	end
	else
	begin
		current_state <= next_state;
		
		casex(current_state)
			S2: begin
					curr_addr_h <= h_add_sum_wire;
					regop_h_mem_en <= 1'b1;
					regop_h_mem_rw <= 1'b0;
					regop_h_mem_addr <= curr_addr_h;
					
					we_ah_reg_hold0 <= 1'b1;
					
					ah_reg_addr_hold0 <= curr_addr_h;
					
					ah_regf[ah_reg_addr] <= we_ah_reg ? regin_msg_mem_data : ah_regf[ah_reg_addr];
			end
			
			S3:	begin
					ah_regf[ah_reg_addr] <= we_ah_reg ? regin_msg_mem_data : ah_regf[ah_reg_addr];
			end
			
			S4:	begin	
					curr_addr_kw <= kw_add_sum_wire;
					k_addr_hold0 <= curr_addr_kw;
					regop_w_mem_addr <= curr_addr_kw;
					regop_w_mem_en <= 1'b1;
					k_mem_en_hold0 <= 1'b1;
			end
			
			S5:	begin	
					curr_addr_kw <= kw_add_sum_wire;
					k_addr_hold0 <= curr_addr_kw;
					regop_w_mem_addr <= curr_addr_kw;
					regop_w_mem_en <= 1'b1;
					k_mem_en_hold0 <= 1'b1;
					curr_h_iter <= h_iter_sum_wire;
					
					ah_regf[4] <= ((ah_regf[4]&ah_regf[5])^((~ah_regf[4])&ah_regf[6])) + ({ah_regf[4][5:0],ah_regf[4][31:6]}^{ah_regf[4][10:0],ah_regf[4][31:11]}^{ah_regf[4][24:0],ah_regf[4][31:25]}) + ah_regf[7] + regin_w_data_in + regin_k_data_in + ah_regf[3];
					ah_regf[0] <= ({ah_regf[0][1:0],ah_regf[0][31:2]}^{ah_regf[0][12:0],ah_regf[0][31:13]}^{ah_regf[0][21:0],ah_regf[0][31:22]}) + ((ah_regf[0]&ah_regf[1])^(ah_regf[0]&ah_regf[2])^(ah_regf[1]&ah_regf[2])) + ((ah_regf[4]&ah_regf[5])^((~ah_regf[4])&ah_regf[6])) + ({ah_regf[4][5:0],ah_regf[4][31:6]}^{ah_regf[4][10:0],ah_regf[4][31:11]}^{ah_regf[4][24:0],ah_regf[4][31:25]}) + ah_regf[7] + regin_w_data_in + regin_k_data_in;
					
					ah_regf[1] <= ah_regf[0];
					ah_regf[2] <= ah_regf[1];
					ah_regf[3] <= ah_regf[2];
					ah_regf[5] <= ah_regf[4];
					ah_regf[6] <= ah_regf[5];
					ah_regf[7] <= ah_regf[6];
			end
			
			S6:	begin
					curr_h_iter <= h_iter_sum_wire;
					
					ah_regf[4] <= ((ah_regf[4]&ah_regf[5])^((~ah_regf[4])&ah_regf[6])) + ({ah_regf[4][5:0],ah_regf[4][31:6]}^{ah_regf[4][10:0],ah_regf[4][31:11]}^{ah_regf[4][24:0],ah_regf[4][31:25]}) + ah_regf[7] + regin_w_data_in + regin_k_data_in + ah_regf[3];
					ah_regf[0] <= ({ah_regf[0][1:0],ah_regf[0][31:2]}^{ah_regf[0][12:0],ah_regf[0][31:13]}^{ah_regf[0][21:0],ah_regf[0][31:22]}) + ((ah_regf[0]&ah_regf[1])^(ah_regf[0]&ah_regf[2])^(ah_regf[1]&ah_regf[2])) + ((ah_regf[4]&ah_regf[5])^((~ah_regf[4])&ah_regf[6])) + ({ah_regf[4][5:0],ah_regf[4][31:6]}^{ah_regf[4][10:0],ah_regf[4][31:11]}^{ah_regf[4][24:0],ah_regf[4][31:25]}) + ah_regf[7] + regin_w_data_in + regin_k_data_in;
					
					ah_regf[1] <= ah_regf[0];
					ah_regf[2] <= ah_regf[1];
					ah_regf[3] <= ah_regf[2];
					ah_regf[5] <= ah_regf[4];
					ah_regf[6] <= ah_regf[5];
					ah_regf[7] <= ah_regf[6];
			end
			
			S7:	begin
					regop_finish <= 1'b1;
			end
			
			default:	begin
							curr_addr_h <= 2'b0;
							curr_addr_kw <= 6'b0;
							regop_h_mem_en <= 1'b0;
							regop_h_mem_rw <= 1'b0;
							regop_h_mem_addr <= 3'b0;
							regop_w_mem_addr <= 6'b0;
							regop_w_mem_en <= 1'b0;
							curr_h_iter <= 6'b0;
							regop_finish <= 1'b0;
							
							we_ah_reg_hold0 <= 1'b0;
							ah_reg_addr_hold0 <= 3'b0;
							k_addr_hold0 <= 6'b0;
							k_mem_en_hold0 <= 1'b0;
			end
		endcase
		
		we_ah_reg <= we_ah_reg_hold0;
		ah_reg_addr <= ah_reg_addr_hold0;
		
		k_mem_en_hold1 <= k_mem_en_hold0;
		regop_k_mem_en <= k_mem_en_hold1;
		
		k_addr_hold1 <= k_addr_hold0;
		regop_k_mem_addr <= k_addr_hold1;
	end
end

/** State Machine Procedural Block */
always@(*)
begin
	case(current_state)
		S0:	begin
				if(regin_main_go_sig==1'b1)
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
				if(h_add_cout_wire)
				begin
					next_state = S3;
				end
				else
				begin
					next_state = S2;
				end
		end
		
		S3:	begin
				if(regin_local_go_sig==1'b1)
				begin
					next_state = S4;
				end
				else
				begin
					next_state = S3;
				end
		end
		
		S4:	begin
				if(&curr_addr_kw[1:0])
				begin
					next_state = S5;
				end
				else
				begin
					next_state = S4;
				end
		end
		
		S5:	begin
				if(kw_add_cout_wire)
				begin
					next_state = S6;
				end
				else
				begin
					next_state = S5;
				end
		end
		
		S6: begin
				if(h_iter_cout_wire)
				begin
					next_state = S7;
				end
				else
				begin
					next_state = S6;
				end
		end
		
		S7:	begin
				if(regin_main_go_sig)
				begin
					next_state = S1;
				end
				else
				begin
					next_state = S7;
				end
		end
		
		default:	begin
						next_state = S0;
		end
	endcase
end

`ifdef ADV_ADD
	DW01_add #(width3) PPADD1 (.A(curr_addr_h), .B(3'b1), .CI(1'b0), .SUM(h_add_sum_wire), .CO(h_add_cout_wire));
	DW01_add #(width6) PPADD2 (.A(curr_addr_kw), .B(6'b1), .CI(1'b0), .SUM(kw_add_sum_wire), .CO(kw_add_cout_wire));
	DW01_add #(width6) PPADD3 (.A(curr_h_iter), .B(6'b1), .CI(1'b0), .SUM(h_iter_sum_wire), .CO(h_iter_cout_wire));
`endif

endmodule