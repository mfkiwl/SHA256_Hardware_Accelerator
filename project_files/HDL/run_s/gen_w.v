/**
 * \file gen_w.v
 * \author Soumil Krishnanand Heble
 * \date 11/4/2018
 * \brief Generate W array for the SHA256 Algorithm
 */
 
 module gen_w (	/** Inputs */
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
reg [31:0] w_regf [0:63];		/** W Register File */

reg [2:0] current_state;		/** Current State of the State Machine */

/** Current W Computation */
reg [5:0] curr_addr;			/** Next State of the State Machine */

/** Pipelined W Calculation */
//reg [31:0] shiftrx0_int;		/** Shift Rotate XOR 0 Pipeline Register */
//reg [31:0] shiftrx1_int;		/** Shift Rotate XOR 1 Pipeline Register */
//reg [31:0] int0_hold;			/** Sigma 0 Value Hold */
//reg [31:0] int1_hold;			/** Sigma 1 Value Hold */
reg [31:0] add0_int;			/** Mod32 Addition Pipeline Register 0 */
reg [31:0] add1_int;			/** Mod32 Addition Pipeline Register 1 */
reg [31:0] final_add_res;		/** Final Addition Result */

/** W Register File Write Address */
reg [5:0] w_reg_int_0_waddr;	/** W Register File Intermediate 0 Write Address */
//reg [5:0] w_reg_int_1_waddr;	/** W Register File Intermediate 1 Write Address */
reg [5:0] w_reg_waddr;			/** W Register File Write Address */

/** W REgister File Write Enable*/
reg we_w_reg_int_0;				/** Intermediate 0 Register Carrying Write Enable for the W Register File */
//reg we_w_reg_int_1;				/** Intermediate 1 Register Carrying Write Enable for the W Register File */
reg we_w_reg;					/** Register Carrying Write Enable for the W Register File */


/** Registered Inputs */
reg regip_reset;				/** Registered Reset */ 
reg regip_local_go_sig;			/** Internal Go Signal IP Register */
reg regip_w_reg_read;			/** Registered W Register File Read Enable */
reg [5:0] regip_w_reg_addr;		/** Registered W Register File Address */

/** "Regs" */
reg [2:0] next_state;			/** Next State Signal */

reg [7:0] next_addr;			/** Signal Carrying the Next Addredd to the Pad Register */

reg [31:0] shiftrx0_sig;		/** Signal Carrying Shift Rotate XOR 0 Input */
reg [31:0] shiftrx1_sig;		/** Signal Carrying Shift Rotate XOR 1 Input */
reg [31:0] int0_hold_sig;		/** Signal Carrying Sole Addition Element 0 */
reg [31:0] int1_hold_sig;		/** Signal Carrying Sole Addition Element 1 */

reg we_w_reg_sig;				/** Signal Carrying the WE Signal for W Register File */

reg w_reg_rdy;					/** Signal Carrying W Register File Ready */

/** State Machine Parameter Declaration */
parameter [2:0]
	S0 = 3'b000,	/** Idle State */
	S1 = 3'b001,	/** Load Pad Register and Load Compute Address 15 */
	S2 = 3'b010,	/** Increment Compute Address, Enable W Register File Write Enable State and Assert W Ready, Continue until carry set */
	S3 = 3'b011,	/** Increment Compute Address, Enable W Register File Write Enable State and Assert W Ready, Continue until carry set */
	S4 = 3'b100,	/** Increment Compute Address, Enable W Register File Write Enable State and Assert W Ready, Continue until carry set (Bypass) */
	S5 = 3'b101,	/** Wait for Local Go To Go Low */
	S6 = 3'b110,	/** Empty State */
	S7 = 3'b111;	/** Empty State */
	
/** State Machine Procedural Block */
always@(posedge clock)
begin
	if(regip_reset)
	begin
		current_state <= 2'b0;
	end
	else
	begin
		current_state <= next_state;
	end
end

/** Address Counter and Singals Procedural Block */
always@(posedge clock)
begin

	/** Always Register the Inputs */
	regip_reset <= reset;
	regip_local_go_sig <= local_go_sig;
	regip_w_reg_read <= w_reg_read;
	regip_w_reg_addr <= w_reg_addr;

	if(reset)
	begin
		/** Clear all Storage Elements */
		
		/** Registered Outputs */
		regop_w_reg_rdy <= 1'b0;
		regop_w_reg_data <= 32'b0;
		
		/** Internal Storage Elements */
		curr_addr <= 6'b0;
		
		//shiftrx0_int <= 32'b0;
		//shiftrx1_int <= 32'b0;
		//int0_hold <= 32'b0;
		//int1_hold <= 32'b0;
		add0_int <= 32'b0;	
		add1_int <= 32'b0;	
		final_add_res <= 32'b0;
		
		w_reg_int_0_waddr <= 6'b0;
		//w_reg_int_1_waddr <= 6'b0;
		w_reg_waddr <= 6'b0;	
		
		we_w_reg_int_0 <= 1'b0;
		//we_w_reg_int_1 <= 1'b0;
		we_w_reg <= 1'b0;
	end
	else
	begin
		
		/** If W Register Ready to Supply Initial Data and Read Signal is Enabled Supply the Data */
		if(w_reg_rdy & regip_w_reg_read)
		begin
			regop_w_reg_data <= w_regf[regip_w_reg_addr];
		end
	
		/** Next Address is Updated by The State Machine */
		curr_addr <= next_addr;
		
		/** W Calculation Operation */
		//shiftrx0_int <= shiftrx0_sig;
		//shiftrx1_int <= shiftrx1_sig;
		//int0_hold <= int0_hold_sig;
		//int1_hold <= int1_hold_sig;
		//add0_int <= shiftrx0_int + int0_hold;
		//add1_int <= shiftrx1_int + int1_hold;
		
		add0_int <= shiftrx0_sig + int0_hold_sig;
		add1_int <= shiftrx1_sig + int1_hold_sig;
		final_add_res <= add0_int + add1_int;
		
		/** W Register File Address Hold */
		w_reg_int_0_waddr <= curr_addr;
		//w_reg_int_1_waddr <= w_reg_int_0_waddr;
		//w_reg_waddr <= w_reg_int_1_waddr;
		w_reg_waddr <= w_reg_int_0_waddr;
		
		/** W Register File WE Hold */
		we_w_reg_int_0 <= we_w_reg_sig;
		//we_w_reg_int_1 <= we_w_reg_int_0;
		//we_w_reg <= we_w_reg_int_1;
		we_w_reg <= we_w_reg_int_0;
		
		/** Set Ready Flag if High */
		regop_w_reg_rdy <= w_reg_rdy;
	end
end

/** State Machine Procedural Block */
always@(*)
begin
	/** Defaults to Prevent Latches */
	next_addr = 6'd16;
	w_reg_rdy = 1'b0;
	we_w_reg_sig = 1'b0;
	shiftrx0_sig = 32'b0;
	shiftrx1_sig = 32'b0;
	int0_hold_sig = 32'b0;
	int1_hold_sig = 32'b0;
	
	case(current_state)
		S0: begin
			if(regip_local_go_sig==1'b1)
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
			w_reg_rdy = 1'b1;
		end
		
		S2: begin
			next_addr = curr_addr + 1;
			we_w_reg_sig = 1'b1;
			w_reg_rdy = 1'b1;
			
			shiftrx0_sig = {w_regf[curr_addr-15][6:0],w_regf[curr_addr-15][31:7]}^{w_regf[curr_addr-15][17:0],w_regf[curr_addr-15][31:18]}^{{3{1'b0}},w_regf[curr_addr-15][31:3]};
			shiftrx1_sig = {w_regf[curr_addr-2][16:0],w_regf[curr_addr-2][31:17]}^{w_regf[curr_addr-2][18:0],w_regf[curr_addr-2][31:19]}^{{10{1'b0}},w_regf[curr_addr-2][31:10]};
			int0_hold_sig = w_regf[curr_addr-16];
			int1_hold_sig = w_regf[curr_addr-7];
			
			next_state = S3;
		end
		
		S3: begin
			next_addr = curr_addr + 1;
			we_w_reg_sig = 1'b1;
			w_reg_rdy = 1'b1;
			
			shiftrx0_sig = {w_regf[curr_addr-15][6:0],w_regf[curr_addr-15][31:7]}^{w_regf[curr_addr-15][17:0],w_regf[curr_addr-15][31:18]}^{{3{1'b0}},w_regf[curr_addr-15][31:3]};
			shiftrx1_sig = {w_regf[curr_addr-2][16:0],w_regf[curr_addr-2][31:17]}^{w_regf[curr_addr-2][18:0],w_regf[curr_addr-2][31:19]}^{{10{1'b0}},w_regf[curr_addr-2][31:10]};
			int0_hold_sig = w_regf[curr_addr-16];
			int1_hold_sig = w_regf[curr_addr-7];
			
			next_state = S4;
		end
		
		S4: begin
			next_addr = curr_addr + 1;
			we_w_reg_sig = 1'b1;
			w_reg_rdy = 1'b1;
			
			shiftrx0_sig = {w_regf[curr_addr-15][6:0],w_regf[curr_addr-15][31:7]}^{w_regf[curr_addr-15][17:0],w_regf[curr_addr-15][31:18]}^{{3{1'b0}},w_regf[curr_addr-15][31:3]};
			shiftrx1_sig = {final_add_res[16:0],final_add_res[31:17]}^{final_add_res[18:0],final_add_res[31:19]}^{{10{1'b0}},final_add_res[31:10]};
			int0_hold_sig = w_regf[curr_addr-16];
			int1_hold_sig = w_regf[curr_addr-7];
			
			if(curr_addr==6'd63)
			begin
				next_state = S5;
			end
			else
			begin
				next_state = S4;
			end
		end
		
		S5:	begin
			w_reg_rdy = 1'b1;
			if(regip_local_go_sig==1'b1)
			begin
				next_state = S5;
			end
			else
			begin
				next_state = S0;
			end
		end
		
		default:	begin
					next_state = S0;
		end
	endcase
end

/** W Register File Access Procedural Block */
always@(posedge clock)
begin
	if(regip_reset)
	begin
		/** Zero W Register */
		w_regf[0] <= 32'b0;
		w_regf[1] <= 32'b0;
		w_regf[2] <= 32'b0;
		w_regf[3] <= 32'b0;
		w_regf[4] <= 32'b0;
		w_regf[5] <= 32'b0;
		w_regf[6] <= 32'b0;
		w_regf[7] <= 32'b0;
		w_regf[8] <= 32'b0;
		w_regf[9] <= 32'b0;
		w_regf[10] <= 32'b0;
		w_regf[11] <= 32'b0;
		w_regf[12] <= 32'b0;
		w_regf[13] <= 32'b0;
		w_regf[14] <= 32'b0;
		w_regf[15] <= 32'b0;
		w_regf[16] <= 32'b0;
		w_regf[17] <= 32'b0;
		w_regf[18] <= 32'b0;
		w_regf[19] <= 32'b0;
		w_regf[20] <= 32'b0;
		w_regf[21] <= 32'b0;
		w_regf[22] <= 32'b0;
		w_regf[23] <= 32'b0;
		w_regf[24] <= 32'b0;
		w_regf[25] <= 32'b0;
		w_regf[26] <= 32'b0;
		w_regf[27] <= 32'b0;
		w_regf[28] <= 32'b0;
		w_regf[29] <= 32'b0;
		w_regf[30] <= 32'b0;
		w_regf[31] <= 32'b0;
		w_regf[32] <= 32'b0;
		w_regf[33] <= 32'b0;
		w_regf[34] <= 32'b0;
		w_regf[35] <= 32'b0;
		w_regf[36] <= 32'b0;
		w_regf[37] <= 32'b0;
		w_regf[38] <= 32'b0;
		w_regf[39] <= 32'b0;
		w_regf[40] <= 32'b0;
		w_regf[41] <= 32'b0;
		w_regf[42] <= 32'b0;
		w_regf[43] <= 32'b0;
		w_regf[44] <= 32'b0;
		w_regf[45] <= 32'b0;
		w_regf[46] <= 32'b0;
		w_regf[47] <= 32'b0;
		w_regf[48] <= 32'b0;
		w_regf[49] <= 32'b0;
		w_regf[50] <= 32'b0;
		w_regf[51] <= 32'b0;
		w_regf[52] <= 32'b0;
		w_regf[53] <= 32'b0;
		w_regf[54] <= 32'b0;
		w_regf[55] <= 32'b0;
		w_regf[56] <= 32'b0;
		w_regf[57] <= 32'b0;
		w_regf[58] <= 32'b0;
		w_regf[59] <= 32'b0;
		w_regf[60] <= 32'b0;
		w_regf[61] <= 32'b0;
		w_regf[62] <= 32'b0;
		w_regf[63] <= 32'b0;
	end
	else
	begin
		/** If Current State = S0, Copy the Padded Message to the First 16 Locations of W Register File */
		if(current_state==S1)
		begin
			{w_regf[0],w_regf[1],w_regf[2],w_regf[3],w_regf[4],w_regf[5],w_regf[6],w_regf[7],w_regf[8],w_regf[9],w_regf[10],w_regf[11],w_regf[12],w_regf[13],w_regf[14],w_regf[15]} <= pad_reg[511:0];
		end
		else if(we_w_reg)	/** Write To W Register File Only If Write Enable is Asserted */
		begin
			w_regf[w_reg_waddr] <= final_add_res;
		end
	end
end
endmodule