/**
 * \file gen_padded.v
 * \author Soumil Krishnanand Heble
 * \date 11/4/2018
 * \brief Generate Message with Padding Compliant with the SHA256 Algorithm
 */

module gen_padded	(	/** Inputs */
						input clock,
						input reset,
						input main_go_sig,						/** Go Signal to Compute SHA256 */
						input [5:0] msg_len,					/** Message Length in Number of Characters */
						input [7:0] msg_mem_data,				/** Data from Message SRAM */
					
						/** Ouptuts */
						output reg regop_msg_mem_en,			/** Enable Signal for Message SRAM - Registered Output */
						output reg [5:0] regop_msg_mem_addr,	/** Address Signal for Message SRAM - Registered Output */
						output reg [511:0] regop_pad_reg,		/** 512B Wide Register with the Padded Message - Registered Output */
						output reg regop_pad_rdy 				/** Padded Message Ready Signal - Registered Output */
					);

/** Internal Variable Declarations */
/** Storage Elements */
reg [3:0] current_state;		/** Current State of the State Machine */
reg [5:0] curr_addr;			/** Next State of the State MAchine */
reg [5:0] comp_addr;			/** Message Length Address */
reg we_pad_reg;					/** Write Enable for the Pad Register */
reg we_pad_reg_hold;			/** Write Enable Hold for the Pad Register */
reg [5:0] pad_reg_addr;			/** Pad Register Address */
reg [5:0] pad_reg_addr_hold_0;	/** Pad Register Address Hold */

/** Registered Inputs */
reg regin_main_go_sig;			/** Go Signal IP Register */
reg [5:0] regin_msg_len;		/** Message Length IP Register */
reg [7:0] regin_msg_mem_data;	/** Message Data IP Register */
reg regin_reset;				/** Registered Reset */

/** "Regs" */
reg [3:0] next_state;			/** Next State Signal */
reg [7:0] next_data;			/** Signal Carrying the Next Data in the Pad Register */
reg [7:0] next_addr;			/** Signal Carrying the Next Addredd to the Pad Register */
reg we_pad_reg_sig;				/** Signal Carrying Write Enable for the Pad Register */
reg msg_mem_en;					/** Enable SRAM Signal */
reg pad_rdy_sig;				/** Pad Register Ready Signal */


/** State Machine Parameter Declaration */
parameter [3:0]
	S0 = 4'b0000,	/** Idle State */
	S1 = 4'b0001,	/** Load Message Length and Clear Address Counter State */
	S2 = 4'b0010,	/** Start Incrementing Request Address, Assert SRAM Enable Signal State and Enable Pad Register Write Enable State */
	S3 = 4'b0011,	/** Hold State */
	S4 = 4'b0100,	/** Check for Next Address State */
	S5 = 4'b0101,	/** Deassert SRAM Enable Signal */
	S6 = 4'b0110,	/** Next Address 0x62 State */
	S7 = 4'b0111,	/** Next Address 0x63 State and Next Data 0x80 */
	S8 = 4'b1000,	/** Next Address 0x00 State and Disable Pad Register Write Enable State */
	S9 = 4'b1001,	/** Hold State */
	S10 = 4'b1010,	/** Hold State */
	S11 = 4'b1011,	/** Finish and Wait State */
	S12 = 4'b1100,	/** Empty State */
	S13 = 4'b1101,	/** Empty State */
	S14 = 4'b1110,	/** Empty State */
	S15 = 4'b1111;	/** Empty State */

/** State Machine Procedural Block */
always@(posedge clock)
begin
	if(regin_reset)
	begin
		current_state <= 4'b0;
	end
	else
	begin
		current_state <= next_state;
	end
end

/** Address Counter Procedural Block */
always@(posedge clock)
begin
	/** Always Register Inputs */
	regin_main_go_sig <= main_go_sig;
	regin_msg_len <= msg_len;
	regin_msg_mem_data <= msg_mem_data;
	regin_reset <= reset;
	
	if(regin_reset)
	begin
		curr_addr <= 6'b0;
		comp_addr <= 6'b0;
		we_pad_reg <= 1'b0;
		we_pad_reg_hold <= 1'b0;
		pad_reg_addr <= 6'b0;
		pad_reg_addr_hold_0 <= 6'b0;
		
		/** Clear Registered Outputs */
		regop_msg_mem_en <= 1'b0;
		regop_msg_mem_addr <= 6'b0;
		regop_pad_rdy <= 1'b0;
	end
	else
	begin
		curr_addr <= next_addr;
		
		/** Pad Register Address Hold */
		pad_reg_addr_hold_0 <= curr_addr;
		pad_reg_addr <= pad_reg_addr_hold_0;
		
		/** Pad Register Write Enable Hold */
		we_pad_reg_hold <= we_pad_reg_sig;
		we_pad_reg <= we_pad_reg_hold;
		
		/** Register Outputs */
		regop_msg_mem_en <= msg_mem_en;
		regop_msg_mem_addr <= curr_addr;
		regop_pad_rdy <= pad_rdy_sig;
		
		if(current_state==S1)
		begin
			comp_addr <= regin_msg_len;
		end
	end
end

/** State Machine Procedural Block */
always@(*)
begin
	/** Defaults to Prevent Latches */
	next_addr = 6'b0;
	next_data = 8'b0;
	msg_mem_en = 1'b0;
	pad_rdy_sig = 1'b0;
	we_pad_reg_sig = 1'b0;
	
	case(current_state)
		S0: begin
			if(regin_main_go_sig==1'b1)
			begin
				next_state = S1;
			end
			else
			begin
				next_state = S0;
			end
		end
		
		S1: begin
			next_state = S2;
		end
		
		S2: begin
			next_addr = curr_addr + 1;
			we_pad_reg_sig = 1'b1;
			msg_mem_en = 1'b1;
			
			next_state = S3;
		end
		
		S3: begin
			next_addr = curr_addr + 1;
			we_pad_reg_sig = 1'b1;
			msg_mem_en = 1'b1;
			
			next_state = S4;
		end
		
		S4: begin
			next_addr = curr_addr + 1;
			we_pad_reg_sig = 1'b1;
			msg_mem_en = 1'b1;
			next_data = regin_msg_mem_data;
			if(next_addr==comp_addr)
			begin
				next_state = S5;
			end
			else
			begin
				next_state = S4;
			end
		end
		
		S5: begin
			next_addr = 6'd62;
			we_pad_reg_sig = 1'b1;
			next_data = regin_msg_mem_data;
			
			next_state = S6;
		end
		
		S6: begin
			next_addr = 6'd63;
			we_pad_reg_sig = 1'b1;
			next_data = regin_msg_mem_data;
			
			next_state = S7;
		end
		
		S7: begin
			we_pad_reg_sig = 1'b1;
			next_data = 8'h80;
			
			next_state = S8;
		end
		
		S8: begin
			next_data = comp_addr[5];
			
			next_state = S9;
		end
		
		S9: begin
			next_data = {comp_addr[4:0],{3{1'b0}}};
			pad_rdy_sig = 1'b1;
			next_state = S10;
		end
		
		S10: begin
			pad_rdy_sig = 1'b1;
			if(regin_main_go_sig==1'b1)
			begin
				next_state = S1;
			end
			else
			begin
				next_state = S10;
			end
		end
		
		default: next_state = S1;
	endcase
end

/** Pad Register Access Procedural Block */
always@(posedge clock)
begin
	if(regin_reset || current_state==S1)
	begin
		regop_pad_reg <= 512'b0;
	end
	else
	begin
		if(we_pad_reg)
		begin
			case(pad_reg_addr)
                                6'd0: begin
                                        regop_pad_reg[511:504] <= next_data;
                                end

                                6'd1: begin
                                        regop_pad_reg[503:496] <= next_data;
                                end

                                6'd2: begin
                                        regop_pad_reg[495:488] <= next_data;
                                end

                                6'd3: begin
                                        regop_pad_reg[487:480] <= next_data;
                                end

                                6'd4: begin
                                        regop_pad_reg[479:472] <= next_data;
                                end

                                6'd5: begin
                                        regop_pad_reg[471:464] <= next_data;
                                end

                                6'd6: begin
                                        regop_pad_reg[463:456] <= next_data;
                                end

                                6'd7: begin
                                        regop_pad_reg[455:448] <= next_data;
                                end

                                6'd8: begin
                                        regop_pad_reg[447:440] <= next_data;
                                end

                                6'd9: begin
                                        regop_pad_reg[439:432] <= next_data;
                                end

                                6'd10: begin
                                        regop_pad_reg[431:424] <= next_data;
                                end

                                6'd11: begin
                                        regop_pad_reg[423:416] <= next_data;
                                end

                                6'd12: begin
                                        regop_pad_reg[415:408] <= next_data;
                                end

                                6'd13: begin
                                        regop_pad_reg[407:400] <= next_data;
                                end

                                6'd14: begin
                                        regop_pad_reg[399:392] <= next_data;
                                end

                                6'd15: begin
                                        regop_pad_reg[391:384] <= next_data;
                                end

                                6'd16: begin
                                        regop_pad_reg[383:376] <= next_data;
                                end

                                6'd17: begin
                                        regop_pad_reg[375:368] <= next_data;
                                end

                                6'd18: begin
                                        regop_pad_reg[367:360] <= next_data;
                                end

                                6'd19: begin
                                        regop_pad_reg[359:352] <= next_data;
                                end

                                6'd20: begin
                                        regop_pad_reg[351:344] <= next_data;
                                end

                                6'd21: begin
                                        regop_pad_reg[343:336] <= next_data;
                                end

                                6'd22: begin
                                        regop_pad_reg[335:328] <= next_data;
                                end

                                6'd23: begin
                                        regop_pad_reg[327:320] <= next_data;
                                end

                                6'd24: begin
                                        regop_pad_reg[319:312] <= next_data;
                                end

                                6'd25: begin
                                        regop_pad_reg[311:304] <= next_data;
                                end

                                6'd26: begin
                                        regop_pad_reg[303:296] <= next_data;
                                end

                                6'd27: begin
                                        regop_pad_reg[295:288] <= next_data;
                                end

                                6'd28: begin
                                        regop_pad_reg[287:280] <= next_data;
                                end

                                6'd29: begin
                                        regop_pad_reg[279:272] <= next_data;
                                end

                                6'd30: begin
                                        regop_pad_reg[271:264] <= next_data;
                                end

                                6'd31: begin
                                        regop_pad_reg[263:256] <= next_data;
                                end

                                6'd32: begin
                                        regop_pad_reg[255:248] <= next_data;
                                end

                                6'd33: begin
                                        regop_pad_reg[247:240] <= next_data;
                                end

                                6'd34: begin
                                        regop_pad_reg[239:232] <= next_data;
                                end

                                6'd35: begin
                                        regop_pad_reg[231:224] <= next_data;
                                end

                                6'd36: begin
                                        regop_pad_reg[223:216] <= next_data;
                                end

                                6'd37: begin
                                        regop_pad_reg[215:208] <= next_data;
                                end

                                6'd38: begin
                                        regop_pad_reg[207:200] <= next_data;
                                end

                                6'd39: begin
                                        regop_pad_reg[199:192] <= next_data;
                                end

                                6'd40: begin
                                        regop_pad_reg[191:184] <= next_data;
                                end

                                6'd41: begin
                                        regop_pad_reg[183:176] <= next_data;
                                end

                                6'd42: begin
                                        regop_pad_reg[175:168] <= next_data;
                                end

                                6'd43: begin
                                        regop_pad_reg[167:160] <= next_data;
                                end

                                6'd44: begin
                                        regop_pad_reg[159:152] <= next_data;
                                end

                                6'd45: begin
                                        regop_pad_reg[151:144] <= next_data;
                                end

                                6'd46: begin
                                        regop_pad_reg[143:136] <= next_data;
                                end

                                6'd47: begin
                                        regop_pad_reg[135:128] <= next_data;
                                end

                                6'd48: begin
                                        regop_pad_reg[127:120] <= next_data;
                                end

                                6'd49: begin
                                        regop_pad_reg[119:112] <= next_data;
                                end

                                6'd50: begin
                                        regop_pad_reg[111:104] <= next_data;
                                end

                                6'd51: begin
                                        regop_pad_reg[103:96] <= next_data;
                                end

                                6'd52: begin
                                        regop_pad_reg[95:88] <= next_data;
                                end

                                6'd53: begin
                                        regop_pad_reg[87:80] <= next_data;
                                end

                                6'd54: begin
                                        regop_pad_reg[79:72] <= next_data;
                                end

                                6'd55: begin
                                        regop_pad_reg[71:64] <= next_data;
                                end

                                6'd56: begin
                                        regop_pad_reg[63:56] <= next_data;
                                end

                                6'd57: begin
                                        regop_pad_reg[55:48] <= next_data;
                                end

                                6'd58: begin
                                        regop_pad_reg[47:40] <= next_data;
                                end

                                6'd59: begin
                                        regop_pad_reg[39:32] <= next_data;
                                end

                                6'd60: begin
                                        regop_pad_reg[31:24] <= next_data;
                                end

                                6'd61: begin
                                        regop_pad_reg[23:16] <= next_data;
                                end

                                6'd62: begin
                                        regop_pad_reg[15:8] <= next_data;
                                end

                                6'd63: begin
                                        regop_pad_reg[7:0] <= next_data;
                                end
			endcase
		end
	end
end
endmodule