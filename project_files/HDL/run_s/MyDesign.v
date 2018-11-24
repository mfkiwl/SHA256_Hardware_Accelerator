//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
// DUT


`define MSG_LENGTH 5


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

/** Registered Inputs */
reg regin_reset;
reg regin_xxx__dut__go;
reg [ $clog2(MAX_MESSAGE_LENGTH):0] regin_xxx__dut__msg_length;
reg [7:0] regin_msg__dut__data;
reg [31:0] regin_kmem__dut__data;
reg [31:0] regin_hmem__dut__data;

/** Registered Outputs */

endmodule

