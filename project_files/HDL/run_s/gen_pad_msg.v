/**
 * \file gen_pad_msg.v
 * \author Soumil Krishnanand Heble
 * \date 10/29/2018
 * \brief Generate Message with Padding Compliant with the SHA256 Algorithm
 */

module gen_pad_msg (	input clock,
			input reset,
			input go_sig,			/** Go Signal to Compute SHA256 */
			input [5:0] msg_len,		/** Message Length in Number of Characters */
			input [7:0] msg_mem_data,	/** Data from Message SRAM */

			output reg msg_mem_en,		/** Enable Signal for Message SRAM */
			output reg [5:0] msg_mem_addr,	/** Address Signal for Message SRAM */
			output reg [511:0] pad_mem,	/** 512B Wide Register with the Padded Message */
			output reg pad_msg_rdy 		/** Padded Message Ready Signal */
		   );

/** Internal Variable Declarations */
reg [2:0] current_state;
reg [5:0] curr_addr;
reg [5:0] comp_addr;

reg [2:0] next_state;
reg [7:0] data_sel;
reg [7:0] next_addr;
reg access_dat;

/** State Machine Parameter Declaration */
parameter [2:0]
	S0 = 3'b000,	/** Idle State */
	S1 = 3'b001,	/** Load Message Length and Clear Address Counter State */
	S2 = 3'b010,	/** Copy SRAM Message State */
	S3 = 3'b011,	/** Pad with 1 Stage */
	S4 = 3'b100,	/** Pad with 0x80 State */
	S5 = 3'b101,	/** Pad with Message Length MSB State */
	S6 = 3'b110,	/** Pad with Message Length LSB State */
	S7 = 3'b111;	/** Set Pad Message Ready and Wait for Go State */

/** State Machine Procedural Block */
always@(posedge clock)
begin
	if(reset)
	begin
		current_state <= 3'b0;
	end
	else
	begin
		current_state <= next_state;
	end
end

/** Address Counter Procedural Block */
always@(posedge clock)
begin
	if(reset)
	begin
		curr_addr <= 6'b0;
		comp_addr <= 6'b0;
	end
	else
	begin
		curr_addr <= next_addr;
		if(current_state==S1)
		begin
			comp_addr <= msg_len;
		end
	end
end

/** State Machine Procedural Block */
always@(*)
begin
	/** Defaults to Prevent Latches */
	msg_mem_addr = curr_addr;
	msg_mem_en = 1'b0;
	pad_msg_rdy = 1'b0;
	data_sel = 8'b0;
	next_addr = curr_addr + 1'b1;
	access_dat = 1'b0;
	case(current_state)
		S0: begin
			next_addr = 6'b0;
			if(go_sig==1)
			begin
				next_state = S1;
			end
			else
			begin
				next_state = S0;
			end
		end

		S1: begin
			next_addr = 6'b0;
			msg_mem_en = 1'b1;
			next_state = S2;
		end

		S2: begin
			msg_mem_en = 1'b1;
			access_dat = 1'b1;
			if(curr_addr == comp_addr)
			begin
				data_sel = 8'b10000000;
				next_state = S3;
			end
			else
			begin
				data_sel = msg_mem_data;
				next_state = S2;
			end
		end

		S3: begin
			access_dat = 1'b1;
			if(curr_addr==8'd61)
			begin
				next_state = S4;
			end
			else
			begin
				next_state = S3;
			end
		end

		S4: begin
			access_dat = 1'b1;
			data_sel = comp_addr[5];
			next_state = S5;
		end

		S5: begin
			access_dat = 1'b1;
			data_sel = {comp_addr[4:0],{3{1'b0}}};
			next_state = S6;
		end

		S6: begin
			pad_msg_rdy = 1'b1;
			next_addr = 6'b0;
			if(go_sig==1'b1)
			begin
				next_state = S1;
			end
			else
			begin
				next_state = S6;
			end
		end

		default: begin
			next_state = S0;
		end
	endcase
end

/** Register Access Procedural Block */
always@(posedge clock)
begin
	if(reset)
	begin
		pad_mem <= 512'b0;
	end
	else
	begin
		if(access_dat)
		begin
			case(curr_addr)
                                6'd0: begin
                                        pad_mem[7:0] <= data_sel;
                                end

                                6'd1: begin
                                        pad_mem[15:8] <= data_sel;
                                end

                                6'd2: begin
                                        pad_mem[23:16] <= data_sel;
                                end

                                6'd3: begin
                                        pad_mem[31:24] <= data_sel;
                                end

                                6'd4: begin
                                        pad_mem[39:32] <= data_sel;
                                end

                                6'd5: begin
                                        pad_mem[47:40] <= data_sel;
                                end

                                6'd6: begin
                                        pad_mem[55:48] <= data_sel;
                                end

                                6'd7: begin
                                        pad_mem[63:56] <= data_sel;
                                end

                                6'd8: begin
                                        pad_mem[71:64] <= data_sel;
                                end

                                6'd9: begin
                                        pad_mem[79:72] <= data_sel;
                                end

                                6'd10: begin
                                        pad_mem[87:80] <= data_sel;
                                end

                                6'd11: begin
                                        pad_mem[95:88] <= data_sel;
                                end

                                6'd12: begin
                                        pad_mem[103:96] <= data_sel;
                                end

                                6'd13: begin
                                        pad_mem[111:104] <= data_sel;
                                end

                                6'd14: begin
                                        pad_mem[119:112] <= data_sel;
                                end

                                6'd15: begin
                                        pad_mem[127:120] <= data_sel;
                                end

                                6'd16: begin
                                        pad_mem[135:128] <= data_sel;
                                end

                                6'd17: begin
                                        pad_mem[143:136] <= data_sel;
                                end

                                6'd18: begin
                                        pad_mem[151:144] <= data_sel;
                                end

                                6'd19: begin
                                        pad_mem[159:152] <= data_sel;
                                end

                                6'd20: begin
                                        pad_mem[167:160] <= data_sel;
                                end

                                6'd21: begin
                                        pad_mem[175:168] <= data_sel;
                                end

                                6'd22: begin
                                        pad_mem[183:176] <= data_sel;
                                end

                                6'd23: begin
                                        pad_mem[191:184] <= data_sel;
                                end

                                6'd24: begin
                                        pad_mem[199:192] <= data_sel;
                                end

                                6'd25: begin
                                        pad_mem[207:200] <= data_sel;
                                end

                                6'd26: begin
                                        pad_mem[215:208] <= data_sel;
                                end

                                6'd27: begin
                                        pad_mem[223:216] <= data_sel;
                                end

                                6'd28: begin
                                        pad_mem[231:224] <= data_sel;
                                end

                                6'd29: begin
                                        pad_mem[239:232] <= data_sel;
                                end

                                6'd30: begin
                                        pad_mem[247:240] <= data_sel;
                                end

                                6'd31: begin
                                        pad_mem[255:248] <= data_sel;
                                end

                                6'd32: begin
                                        pad_mem[263:256] <= data_sel;
                                end

                                6'd33: begin
                                        pad_mem[271:264] <= data_sel;
                                end

                                6'd34: begin
                                        pad_mem[279:272] <= data_sel;
                                end

                                6'd35: begin
                                        pad_mem[287:280] <= data_sel;
                                end

                                6'd36: begin
                                        pad_mem[295:288] <= data_sel;
                                end

                                6'd37: begin
                                        pad_mem[303:296] <= data_sel;
                                end

                                6'd38: begin
                                        pad_mem[311:304] <= data_sel;
                                end

                                6'd39: begin
                                        pad_mem[319:312] <= data_sel;
                                end

                                6'd40: begin
                                        pad_mem[327:320] <= data_sel;
                                end

                                6'd41: begin
                                        pad_mem[335:328] <= data_sel;
                                end

                                6'd42: begin
                                        pad_mem[343:336] <= data_sel;
                                end

                                6'd43: begin
                                        pad_mem[351:344] <= data_sel;
                                end

                                6'd44: begin
                                        pad_mem[359:352] <= data_sel;
                                end

                                6'd45: begin
                                        pad_mem[367:360] <= data_sel;
                                end

                                6'd46: begin
                                        pad_mem[375:368] <= data_sel;
                                end

                                6'd47: begin
                                        pad_mem[383:376] <= data_sel;
                                end

                                6'd48: begin
                                        pad_mem[391:384] <= data_sel;
                                end

                                6'd49: begin
                                        pad_mem[399:392] <= data_sel;
                                end

                                6'd50: begin
                                        pad_mem[407:400] <= data_sel;
                                end

                                6'd51: begin
                                        pad_mem[415:408] <= data_sel;
                                end

                                6'd52: begin
                                        pad_mem[423:416] <= data_sel;
                                end

                                6'd53: begin
                                        pad_mem[431:424] <= data_sel;
                                end

                                6'd54: begin
                                        pad_mem[439:432] <= data_sel;
                                end

                                6'd55: begin
                                        pad_mem[447:440] <= data_sel;
                                end

                                6'd56: begin
                                        pad_mem[455:448] <= data_sel;
                                end

                                6'd57: begin
                                        pad_mem[463:456] <= data_sel;
                                end

                                6'd58: begin
                                        pad_mem[471:464] <= data_sel;
                                end

                                6'd59: begin
                                        pad_mem[479:472] <= data_sel;
                                end

                                6'd60: begin
                                        pad_mem[487:480] <= data_sel;
                                end

                                6'd61: begin
                                        pad_mem[495:488] <= data_sel;
                                end

                                6'd62: begin
                                        pad_mem[503:496] <= data_sel;
                                end

                                6'd63: begin
                                        pad_mem[511:504] <= data_sel;
                                end
			endcase
		end
	end
end
endmodule
