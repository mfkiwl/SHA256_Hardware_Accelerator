//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
// DUT


`define MSG_LENGTH 7

`define ADV_ADD			1
`define ADV_ADD_PADDED	1
`define ADV_ADD_W		1
`define ADV_ADD_H		1

// synopsys translate_off
`ifdef	ADV_ADD
	`include "./DW01_add.v"
`endif
// synopsys translate_on


module MyDesign	#(parameter OUTPUT_LENGTH       = 8,
                  parameter MAX_MESSAGE_LENGTH  = 55,
                  parameter NUMBER_OF_Ks        = 64,
                  parameter NUMBER_OF_Hs        = 8 ,
                  parameter SYMBOL_WIDTH        = 8  )
				(
					//---------------------------------------------------------------------------
					// Control
					//
					output reg                                   dut__xxx__finish     ,
					input  wire                                  xxx__dut__go         ,  
					input  wire  [ $clog2(MAX_MESSAGE_LENGTH):0] xxx__dut__msg_length ,

					//---------------------------------------------------------------------------
					// Message memory interface
					//
					output reg  [ $clog2(MAX_MESSAGE_LENGTH)-1:0]   dut__msg__address  ,  // address of letter
					output reg                                      dut__msg__enable   ,
					output reg                                      dut__msg__write    ,
					input  wire [7:0]                               msg__dut__data     ,  // read each letter
					
					//---------------------------------------------------------------------------
					// K memory interface
					//
					output reg  [ $clog2(NUMBER_OF_Ks)-1:0]     dut__kmem__address  ,
					output reg                                  dut__kmem__enable   ,
					output reg                                  dut__kmem__write    ,
					input  wire [31:0]                          kmem__dut__data     ,  // read data

					//---------------------------------------------------------------------------
					// H memory interface
					//
					output reg  [ $clog2(NUMBER_OF_Hs)-1:0]     dut__hmem__address  ,
					output reg                                  dut__hmem__enable   ,
					output reg                                  dut__hmem__write    ,
					input  wire [31:0]                          hmem__dut__data     ,  // read data


					//---------------------------------------------------------------------------
					// Output data memory 
					//
					output reg  [ $clog2(OUTPUT_LENGTH)-1:0]    dut__dom__address  ,
					output reg  [31:0]                          dut__dom__data     ,  // write data
					output reg                                  dut__dom__enable   ,
					output reg                                  dut__dom__write    ,


					//-------------------------------
					// General
					//
					input  wire                 clk             ,
					input  wire                 reset
				);


				
				
				
/** Adder Parameters */
parameter width3 = 3;
parameter width6 = 6;
parameter width32 = 32;

/** Registered Inputs Global */
reg regin_reset;
reg regin_xxx__dut__go;
reg [ $clog2(MAX_MESSAGE_LENGTH):0] regin_xxx__dut__msg_length;
reg [7:0] regin_msg__dut__data;
reg [31:0] regin_kmem__dut__data;
reg [31:0] regin_hmem__dut__data;

/****************************** Internal Variable Declarations ******************************/
/****************************** Storage Elements ******************************/

/*>>>>> gen_padded module ******/
reg [2:0] current_state_padded;		/** Current State of the State Machine */
reg [511:0] regop_pad_reg;			/** 512B Wide Register with the Padded Message - Registered Output */
reg regop_pad_rdy;					/** Padded Message Ready Signal - Registered Output */

reg [5:0] curr_addr;			/** Current Read Address */
reg [5:0] comp_addr;			/** Message Length Address */
reg we_pad_reg;					/** Write Enable for the Pad Register */
reg we_pad_reg_hold;			/** Write Enable Hold for the Pad Register */
reg [5:0] pad_reg_addr;			/** Pad Register Address */
reg [5:0] pad_reg_addr_hold_0;	/** Pad Register Address Hold */

/*>>>>> gen_w module ******/
reg [31:0] w_regf [0:15];               /** W Register File */
reg [1:0] current_state_w;              /** State Machine Current State */
reg [5:0] current_serving;              /** Current W being Served */
reg [31:0] w_min_16;                    /** W[current_calculation-16] */
reg [31:0] w_min_15;                    /** W[current_calculation-15] */
reg [31:0] w_min_7;                     /** W[current_calculation-7] */
reg [31:0] w_min_2;                     /** W[current_calculation-2] */
reg regop_w_reg_rdy;					/** W Ready To Send Data */
reg [31:0] regop_w_reg_data;			/** Requested Adddress Data from W Module */

/** Pipelined W Calculations */
reg [31:0] add0_op_hold;                /** Sigma 0 Add Pipeline Register */
reg [31:0] add1_op_hold;                /** Sigma 1 Add Pipeline Register */

/*>>>>> gen_h module ******/
reg [3:0] main_current_state;	/** Main State Machine State Variable */
reg [5:0] regop_w_mem_addr;		/** W Module Address */
reg regop_w_mem_en;				/** W Module Enable */

/** Pipelined Iteration Registers */
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

reg [2:0] curr_addr_hop;	/** Current H/Output SRAM Access Address */
reg [5:0] curr_addr_kw;		/** Current K SRAM/W Module Read Address */
reg [5:0] curr_sha_iter;	/** Current SHA Iteration */
reg [31:0] ah_regf [0:7];	/** SHA a-h Register File */
reg [2:0] ah_regf_addr;		/** a-h Register File Address */
reg ah_regf_wen;			/** ah Register File Write Enable Register */

/****************************** Registered Inputs ******************************/

/*>>>>> gen_padded module ******/
reg regin_finish_sig;									/** Finish Signal IP Register */

/*>>>>> gen_w module ******/
reg regip_pad_rdy_sig;                                 /** Internal Go Signal IP Register */
reg regip_w_reg_read;                                   /** Registered W Register File Read Enable */
reg [5:0] regip_w_reg_addr;                             /** Registered W Register File Address */

/*>>>>> gen_h module ******/
reg regin_w_rdy_sig;
reg [31:0] regin_w_data_in;

/****************************** "Regs" ******************************/

/*>>>>> gen_padded module ******/
reg [2:0] next_state_padded;			/** Next State Signal */
reg [7:0] next_data;			/** Signal Carrying the Next Data in the Pad Register */
reg [5:0] next_addr;			/** Signal Carrying the Next Addredd to the Pad Register */
reg we_pad_reg_sig;				/** Signal Carrying Write Enable for the Pad Register */
reg msg_mem_en;					/** Enable SRAM Signal */
reg pad_rdy_sig;				/** Pad Register Ready Signal */

/*>>>>> gen_w module ******/
reg w_reg_rdy_sig;
reg [1:0] next_state_w;
reg [31:0] w_ip_reg13;                                  /** Input To Register 13 */

/*>>>>> gen_h module ******/
reg [3:0] main_next_state;		/** Main State Machine Next State */
reg finish_signal;
reg ah_access_sig;

/****************************** Wires ******************************/

/*>>>>> gen_padded module ******/
`ifdef	ADV_ADD_PADDED
	wire [5:0] next_addr_out_wire;
`endif

/*>>>>> gen_w module ******/
wire [31:0] add0_out_wire;
wire [31:0] add1_out_wire;
wire [31:0] final_add_op_wire;
wire [5:0] addr_inc_wire;
wire addr_inc_cout_wire;

/*>>>>> gen_h module ******/
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





/****************************** State Machine States ******************************/

/*>>>>> gen_padded module ******/
parameter [2:0]
	P0 = 3'b000,	/** Idle State */
	P1 = 3'b001,	/** Load Message Length, Clear Address Counter State, Assert SRAM Enable Signal State and Enable Pad Register Write Enable State */
	P2 = 3'b010,	/** Start Incrementing Request Address, Check for Next Address State, Assert SRAM Enable Signal and Enable Pad Register Write Enable */
	P3 = 3'b011,	/** Deassert SRAM Enable Signal and Deassert Pad Register Write Enable */
	P4 = 3'b100,	/** Next Data is 0x80 */
	P5 = 3'b101,	/** Wait for Next Go */
	P6 = 3'b110,	/** Empty State */
	P7 = 3'b111;	/** Empty State */

/*>>>>> gen_w module ******/
parameter [1:0]
	W0 = 2'b00,             /** Idle State */
	W1 = 2'b01,             /** Load State */
	W2 = 2'b10,             /** Run State */
	W3 = 2'b11;             /** Wait For Go State */

/*>>>>> gen_h module ******/		
parameter [3:0]
	M0 = 4'b0000,	/** Wait for Global Main Signal */
	M1 = 4'b0001,	/** Copy H SRAM Contents to ah Register File - Tested - Works for One Character Message - Wait for Overflow*/
	M2 = 4'b0010,	/** Wait for W Module to be Ready */
	M3 = 4'b0011,	/** Send Address and Enable to Fetch First K and W For SHA Iterations */
	M4 = 4'b0100,	/** Wait For W & K to Reach Module's Input Register */
	M5 = 4'b0101,	/** Wait For W & K to Reach Module's Input Register */
	M6 = 4'b0110,	/** Wait For W & K to Reach Module's Input Register */
	M7 = 4'b0111,	/** Send Address and Enable to Fetch Next K and W - Perform First Stage Operations */
	M8 = 4'b1000,	/** Perform Second Stage Operations */
	M9 = 4'b1001,	/** Perform Third Stage Operations */
	M10 = 4'b1010,	/** Perform Final Stage Operations - Increment Iteration Counter and Check for Overflow */
	M11 = 4'b1011,	/** Read H SRAM and Add To Computed AH Registers - Wait for Overflow */
	M12 = 4'b1100,	/** Wait For Additions to Finish */
	M13 = 4'b1101,	/** Wait For Additions to Finish */
	M14 = 4'b1110,	/** Write AH to Output SRAM */
	M15 = 4'b1111;	/** Finish - Wait for Next Global Main Signal */





/****************************** State Machine and Sequential Logic Procedural Block ******************************/
always@(posedge clk)
begin
	/** Always Register Inputs */
	/*>>>>> Global Inputs ******/
	regin_reset <= reset;
	regin_xxx__dut__go <= xxx__dut__go;
	regin_xxx__dut__msg_length <= xxx__dut__msg_length;
	regin_msg__dut__data <= msg__dut__data;
	regin_kmem__dut__data <= kmem__dut__data;
	regin_hmem__dut__data <= hmem__dut__data;
	
	/*>>>>> gen_padded module ******/
	regin_finish_sig <= finish_signal;
	
	/*>>>>> gen_w module ******/
	regip_pad_rdy_sig <= regop_pad_rdy;
	regip_w_reg_read <= regop_w_mem_en;
	regip_w_reg_addr <= regop_w_mem_addr;
	
	/*>>>>> gen_h module ******/
	regin_w_rdy_sig <= regop_w_reg_rdy;
	regin_w_data_in <= regop_w_reg_data;
	
	dut__msg__write <= 1'b0;
	dut__kmem__write <= 1'b0;
	dut__hmem__write <= 1'b0;
	dut__dom__write <= 1'b1;
	
	if(regin_reset)
	begin
		/*>>>>> gen_padded module ******/
		current_state_padded <= 3'b0;
	
		curr_addr <= 6'b0;
		comp_addr <= 6'b0;
		we_pad_reg <= 1'b0;
		we_pad_reg_hold <= 1'b0;
		pad_reg_addr <= 6'b0;
		pad_reg_addr_hold_0 <= 6'b0;
		
		/** Clear Registered Outputs */
		dut__msg__enable <= 1'b0;
		dut__msg__address <= 6'b0;
		regop_pad_rdy <= 1'b0;
		
		/*>>>>> gen_w module ******/
		current_state_w <= 2'b0;
		current_serving <= 6'b0;
		regop_w_reg_rdy <= 1'b0;
		regop_w_reg_data <= 32'b0;
		
		/*>>>>> gen_h module ******/
		/** Clear State Variables */
		main_current_state <= 4'b0;
		
		/** Important Output and Pipeline Registers */
		/** Enables Can Mess With SRAM's and Register File Hence Deassert */
		k_en_hold0 <= 1'b0;
		k_en_hold1 <= 1'b0;
		dut__kmem__enable <= 1'b0;
		regop_w_mem_en <= 1'b0;
		dut__hmem__enable <= 1'b0;
		dut__dom__enable <= 1'b0;
		ah_regf_wen <= 1'b0;
		ah_regf_wen_hold0 <= 1'b0;
		dut__xxx__finish <= 1'b0;
		
		/** Address Counters */
		curr_addr_hop <= 3'b0;
		curr_addr_kw <= 6'b0;
		curr_sha_iter <= 6'b0;
	end
	else
	begin
		/*>>>>> gen_padded module ******/
		current_state_padded <= next_state_padded;
	
		curr_addr <= next_addr;
		
		/** Pad Register Address Hold */
		pad_reg_addr_hold_0 <= curr_addr;
		pad_reg_addr <= pad_reg_addr_hold_0;
		
		/** Pad Register Write Enable Hold */
		we_pad_reg_hold <= we_pad_reg_sig;
		we_pad_reg <= we_pad_reg_hold;
		
		/** Register Outputs */
		dut__msg__enable <= msg_mem_en;
		dut__msg__address <= curr_addr;
		regop_pad_rdy <= pad_rdy_sig;
		
		if(current_state_padded==P1)
		begin
			comp_addr <= regin_xxx__dut__msg_length;
		end
		
		/*>>>>> gen_w module ******/
		current_state_w <= next_state_w;
		regop_w_reg_rdy <= w_reg_rdy_sig;
		
		if(current_state_w==W1)
		begin
				w_regf[0] <= regop_pad_reg[511:480];
				w_regf[1] <= regop_pad_reg[479:448];
				w_regf[2] <= regop_pad_reg[447:416];
				w_regf[3] <= regop_pad_reg[415:384];
				w_regf[4] <= regop_pad_reg[383:352];
				w_regf[5] <= regop_pad_reg[351:320];
				w_regf[6] <= regop_pad_reg[319:288];
				w_regf[7] <= regop_pad_reg[287:256];
				w_regf[8] <= regop_pad_reg[255:224];
				w_regf[9] <= regop_pad_reg[223:192];
				w_regf[10] <= regop_pad_reg[191:160];
				w_regf[11] <= regop_pad_reg[159:128];
				w_regf[12] <= regop_pad_reg[127:96];
				w_regf[13] <= regop_pad_reg[95:64];
				w_regf[14] <= regop_pad_reg[63:32];
				w_regf[15] <= regop_pad_reg[31:0];
				current_serving <= 6'b0;	//CHANGED
		end
		else
		if((current_serving==regip_w_reg_addr) & regip_w_reg_read)
		begin
				current_serving <= addr_inc_wire;

				/** Push Out The Top W To Output */
				regop_w_reg_data <= w_regf[0];
				
				w_min_15 <= {w_regf[1][6:0],w_regf[1][31:7]}^{w_regf[1][17:0],w_regf[1][31:18]}^{{3{1'b0}},w_regf[1][31:3]};
				w_min_16 <= w_regf[0];
				w_min_7 <= w_regf[9];

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
				if(|current_serving[5:1])
				begin
						w_min_2 <= {final_add_op_wire[16:0],final_add_op_wire[31:17]}^{final_add_op_wire[18:0],final_add_op_wire[31:19]}^{{10{1'b0}},final_add_op_wire[31:10]};
						w_regf[13] <= final_add_op_wire;
				end
				else
				begin
						w_min_2 <= {w_regf[14][16:0],w_regf[14][31:17]}^{w_regf[14][18:0],w_regf[14][31:19]}^{{10{1'b0}},w_regf[14][31:10]};
						w_regf[13] <= w_regf[14];
				end
				w_regf[14] <= w_regf[15];

				/** W Operation Pipelined */
				add0_op_hold <= add0_out_wire;
				add1_op_hold <= add1_out_wire;
		end
		
		/*>>>>> gen_h module ******/
		/** Take FSM To Next State */
		main_current_state <= main_next_state;
	
		/** Feed Holding Registers */
		k_en_hold1 <= k_en_hold0;
		dut__kmem__enable <= k_en_hold1;
		
		ah_regf_wen <= ah_regf_wen_hold0;
		ah_regf_addr <= ah_regf_addr_hold0;
		
		dut__xxx__finish <= finish_signal;
		
		regop_w_mem_addr <= curr_addr_kw;
		k_addr_hold0 <= curr_addr_kw;
		k_addr_hold1 <= k_addr_hold0;
		dut__kmem__address <= k_addr_hold1;
		
		dut__hmem__address <= curr_addr_hop;
		ah_regf_addr_hold0 <= curr_addr_hop;
		dut__dom__address <= curr_addr_hop;
		
		if(ah_regf_wen)
		begin
			if(ah_access_sig)
			begin
				ah_regf[ah_regf_addr] <= ah_addr_sum_wire;
			end
			else
			begin
				ah_regf[ah_regf_addr] <= regin_hmem__dut__data;
			end
		end
			
		
		case(main_current_state)
			M1:	begin
					curr_addr_hop <= hop_addr_sum_wire;
					dut__hmem__enable <= 1'b1;
					ah_regf_wen_hold0 <= 1'b1;
					curr_addr_kw <= 6'b0;	//CHANGED
			end
			
			M3:	begin
					curr_addr_kw <= kw_addr_sum_wire;
					regop_w_mem_en <= 1'b1;
					k_en_hold0 <= 1'b1;
			end
			
			M7:	begin
					curr_addr_kw <= kw_addr_sum_wire;
					regop_w_mem_en <= 1'b1;
					k_en_hold0 <= 1'b1;
					
					wk_add_1 <= wk_add_sum_wire;
					sig1_e_1 <= ({ah_regf[4][5:0],ah_regf[4][31:6]}^{ah_regf[4][10:0],ah_regf[4][31:11]}^{ah_regf[4][24:0],ah_regf[4][31:25]});
					ch_efg_1 <= (ah_regf[4]&ah_regf[5])^((~ah_regf[4])&ah_regf[6]);
					sig0_a_1 <= ({ah_regf[0][1:0],ah_regf[0][31:2]}^{ah_regf[0][12:0],ah_regf[0][31:13]}^{ah_regf[0][21:0],ah_regf[0][31:22]});
					maj_abc_1 <= ((ah_regf[0]&ah_regf[1])^(ah_regf[0]&ah_regf[2])^(ah_regf[1]&ah_regf[2]));
			end
			
			M8:	begin
					wkh_add_2 <= wkh_add_2_sum_wire;
					sig1ch_add_2 <= sig1ch_add_2_sum_wire;
					T2_2 <= T2_2_sum_wire;
			end
			
			M9:	begin
					T1_3 <= T1_3_sum_wire;
			end
			
			M10:	begin
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
			
			M11:	begin
						curr_addr_hop <= hop_addr_sum_wire;
						dut__hmem__enable <= 1'b1;
						ah_regf_wen_hold0 <= 1'b1;
			end
			
			M14:	begin
						curr_addr_hop <= hop_addr_sum_wire;
						dut__dom__enable <= 1'b1;
						dut__dom__data <= ah_regf[curr_addr_hop];
			end
			
			default:	begin
							ah_regf_wen_hold0 <= 1'b0;
							dut__hmem__enable <= 1'b0;
							regop_w_mem_en <= 1'b0;
							k_en_hold0 <= 1'b0;
							dut__dom__enable <= 1'b0;
			end
		endcase
	end
end

/****************************** State Machine Procedural Block ******************************/
always@(*)
begin
	
	/*>>>>> gen_padded module ******/
	/** Defaults to Prevent Latches */
	next_addr = 6'b0;
	next_data = 8'b0;
	msg_mem_en = 1'b0;
	pad_rdy_sig = 1'b0;
	we_pad_reg_sig = 1'b0;
	
	case(current_state_padded)
		P0: begin
			if(regin_xxx__dut__go==1'b1)
			begin
				next_state_padded = P1;
			end
			else
			begin
				next_state_padded = P0;
			end
		end
		
		P1: begin
			next_state_padded = P2;
		end
		
		P2: begin
		
		`ifdef ADV_ADD_PADDED
			next_addr = next_addr_out_wire;
		`else
			next_addr = curr_addr + 1;
		`endif
			
			next_data = regin_msg__dut__data;
			we_pad_reg_sig = 1'b1;
			msg_mem_en = 1'b1;
			if(curr_addr==comp_addr)
			begin
				next_state_padded = P3;
			end
			else
			begin
				next_state_padded = P2;
			end
		end
		
		P3: begin
		
		`ifdef ADV_ADD_PADDED
			next_addr = next_addr_out_wire;
		`else
			next_addr = curr_addr + 1;
		`endif
		
			next_data = regin_msg__dut__data;
			next_state_padded = P4;
		end
		
		P4: begin
			next_data = 8'b10000000;
			next_state_padded = P5;
		end
		
		P5: begin
			pad_rdy_sig = 1'b1;
			if(regin_xxx__dut__go & regin_finish_sig)
			begin
				next_state_padded = P1;
			end
			else
			begin
				next_state_padded = P5;
			end
		end
		
		default: next_state_padded = P1;
	endcase
	
	/*>>>>> gen_w module ******/
	/** Defaults To Avoid Latches */
    w_reg_rdy_sig = 1'b0;
	
	case(current_state_w)
		W0:     begin
						if(regip_pad_rdy_sig)
						begin
								next_state_w = W1;
						end
						else
						begin
								next_state_w = W0;
						end
		end

		W1:     begin
						next_state_w = W2;
		end

		W2:     begin
						w_reg_rdy_sig = 1'b1;

						if(addr_inc_cout_wire)
						begin
								next_state_w = W3;
						end
						else
						begin
								next_state_w = W2;
						end
		end

		W3:     begin
						if(regip_pad_rdy_sig)
						begin
								next_state_w = W3;
						end
						else
						begin
								next_state_w = W0;
						end
		end
	endcase
	
	/*>>>>> gen_h module ******/
	/** Defaults to Avoid Latches */
	finish_signal = 1'b0;
	ah_access_sig = 1'b0;
	
	case(main_current_state)
		M0:	begin
				if(regin_xxx__dut__go)
				begin
					main_next_state = M1;
				end
				else
				begin
					main_next_state = M0;
				end
		end
		
		M1:	begin	//Copy a-h from H SRAM (2 Reg Address - Load First, 2 Reg WEN - Load First)
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
				if(regin_w_rdy_sig)
				begin
					main_next_state = M3;
				end
				else
				begin
					main_next_state = M2;
				end
		end
		
		M3: begin	// +1 to KW Address and En -> 1
				main_next_state = M4;
		end
		
		M4:	begin
				main_next_state = M5;
		end
		
		M5:	begin
				main_next_state = M6;
		end
		
		M6:	begin
			main_next_state = M7;
		end
		
		M7:	begin	// +1 KW Address and En -> 1
			main_next_state = M8;
		end
		
		M8:	begin
				main_next_state = M9;
		end
		
		M9:	begin
				main_next_state = M10;
		end
		
		M10:	begin
					ah_access_sig = 1'b1;
					if(sha_iter_cout_wire)
					begin
						main_next_state = M11;
					end
					else
					begin
						main_next_state = M7;
					end
		end
		
		M11:	begin	/** Addition H and AH */
					ah_access_sig = 1'b1;
					if(hop_addr_cout_wire)
					begin
						main_next_state = M12;
					end
					else
					begin
						main_next_state = M11;
					end
		end
		
		M12:	begin
					ah_access_sig = 1'b1;
					main_next_state = M13;
		end
		
		M13:	begin
					ah_access_sig = 1'b1;
					main_next_state = M14;
		end
		
		M14:	begin
					if(hop_addr_cout_wire)
					begin
						main_next_state = M15;
					end
					else
					begin
						main_next_state = M14;
					end
		end
		
		M15:	begin
					finish_signal = 1'b1;
					if(regin_xxx__dut__go)
					begin
						main_next_state = M1;
					end
					else
					begin
						main_next_state = M15;
					end
		end
	endcase
end

/****************************** Pad Register Access Procedural Block ******************************/
always@(posedge clk)
begin
	if(regin_reset)
	begin
		regop_pad_reg <= 512'b0;
	end
	else
	if(current_state_padded==P1)
	begin
		regop_pad_reg[511:64] <= 448'b0;
	end
	else
	begin
		if(current_state_padded==P2)
		begin
			regop_pad_reg[7:3] <= comp_addr[4:0];
			regop_pad_reg[8] <= comp_addr[5];
		end
		
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
				
				default: begin
					regop_pad_reg[71:64] <= next_data;
				end
			endcase
		end
	end
end



/****************************** Designware Adders ******************************/

/*>>>>> gen_padded module ******/
`ifdef ADV_ADD_PADDED
	DW01_add #(width6) PPADD1 		(.A(curr_addr), .B(6'b1), .CI(1'b0), .SUM(next_addr_out_wire));
`endif

/*>>>>> gen_w module ******/
	DW01_add #(width32)	PPADD2 		(.A(w_min_15), .B(w_min_16), .CI(1'b0), .SUM(add0_out_wire));
	DW01_add #(width32)	PPADD3 		(.A(w_min_2), .B(w_min_7), .CI(1'b0), .SUM(add1_out_wire));
	DW01_add #(width32)	PPADD4 		(.A(add0_op_hold), .B(add1_op_hold), .CI(1'b0), .SUM(final_add_op_wire));
	DW01_add #(width6)	PPADD5 		(.A(current_serving), .B(6'b1), .CI(1'b0), .SUM(addr_inc_wire), .CO(addr_inc_cout_wire));

/*>>>>> gen_h module ******/
	DW01_add #(width3)	PPADD6	 	(.A(curr_addr_hop), .B(3'b1), .CI(1'b0), .SUM(hop_addr_sum_wire), .CO(hop_addr_cout_wire));
	DW01_add #(width6)	PPADD7 		(.A(curr_sha_iter), .B(6'b1), .CI(1'b0), .SUM(sha_iter_sum_wire), .CO(sha_iter_cout_wire));
	DW01_add #(width32)	PPADD8 		(.A(regin_hmem__dut__data), .B(ah_regf[ah_regf_addr]), .CI(1'b0), .SUM(ah_addr_sum_wire));
	DW01_add #(width6)	PPADD9 		(.A(curr_addr_kw), .B(6'b1), .CI(1'b0), .SUM(kw_addr_sum_wire), .CO(kw_addr_cout_wire));
	DW01_add #(width32)	PPADD10 	(.A(regin_w_data_in), .B(regin_kmem__dut__data), .CI(1'b0), .SUM(wk_add_sum_wire));
	DW01_add #(width32)	PPADD11 	(.A(wk_add_1), .B(ah_regf[7]), .CI(1'b0), .SUM(wkh_add_2_sum_wire));
	DW01_add #(width32)	PPADD12 	(.A(ch_efg_1), .B(sig1_e_1), .CI(1'b0), .SUM(sig1ch_add_2_sum_wire));
	DW01_add #(width32)	PPADD13 	(.A(maj_abc_1), .B(sig0_a_1), .CI(1'b0), .SUM(T2_2_sum_wire));
	DW01_add #(width32)	PPADD14 	(.A(sig1ch_add_2), .B(wkh_add_2), .CI(1'b0), .SUM(T1_3_sum_wire));
	DW01_add #(width32)	PPADD15 	(.A(T1_3), .B(T2_2), .CI(1'b0), .SUM(ah_regf0_sum_wire));
	DW01_add #(width32)	PPADD16 	(.A(T1_3), .B(ah_regf[3]), .CI(1'b0), .SUM(ah_regf4_sum_wire));

endmodule
