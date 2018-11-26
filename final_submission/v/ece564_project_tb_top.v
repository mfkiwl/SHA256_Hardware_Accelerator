/**
 * \file ece564_project_tb_top.v
 * \date 11/24/2018
 * \author Anonymous NCSU Author, Soumil Krishnanand Heble
 * \brief SHA256 Test Bench
 */

/** Set based on your message memory depth */
`define MSG_LENGTH 5

/*******************************************************************************
 * Test Case Selector - Uncomment one of the macro's below to select test cases
 * DEFAULT_TEST 	- Sample Test Case Provided on Moodle
 * GO_FINISH_TEST 	- Go -> Go -> Finish Test Case
 * GO_GO_TEST 		- Go -> Go -> Go -> ... Test Case
 *******************************************************************************/
`define DEFAULT_TEST		0
//`define GO_FINISH_TEST	0
//`define GO_GO_TEST		0

// synopsys translate_off
`include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW01_add.v"
// synopsys translate_on

//---------------------------------------------------------------------------
// Tesbench
// - instantiate the DUT and testbench
//---------------------------------------------------------------------------
module tb_top ();


  parameter CLK_PHASE=5  ;
  `ifdef ECE464
  parameter OUTPUT_LENGTH       = 16 ;
  `else
  parameter OUTPUT_LENGTH       = 8 ;
  `endif
  parameter MAX_MESSAGE_LENGTH  = 55;
  parameter NUMBER_OF_Ks        = 64;
  parameter NUMBER_OF_Hs        = 8 ;
  parameter SYMBOL_WIDTH        = 8 ;
 
  //---------------------------------------------------------------------------
  // General
  //---------------------------------------------------------------------------
  reg                                   clk                  ;
  reg                                   reset                ;
  reg                                   xxx__dut__go         ;
  reg   [ $clog2(MAX_MESSAGE_LENGTH):0] xxx__dut__msg_length ;
  wire                                  dut__xxx__finish     ;

  integer runId ;
  integer numberOfClocks ;
  bit dutRunning, waitForFinishLow;
  string outputType;

  initial begin
      `ifdef ECE464
      outputType = "M_1";
      `else
      outputType = "Hash";
      `endif
    end


  wire [ $clog2(MAX_MESSAGE_LENGTH)-1:0]   dut__msg__address  ;  // address of letter
  wire                                     dut__msg__enable   ;
  wire                                     dut__msg__write    ;
  wire [7:0]                               msg__dut__data     ;  // read each letter
                                          
  wire [ $clog2(NUMBER_OF_Ks)-1:0]         dut__kmem__address  ;
  wire                                     dut__kmem__enable   ;
  wire                                     dut__kmem__write    ;
  wire [31:0]                              kmem__dut__data     ;  // read data
                                          
  wire [ $clog2(NUMBER_OF_Hs )-1:0]        dut__hmem__address  ;
  wire                                     dut__hmem__enable   ;
  wire                                     dut__hmem__write    ;
  wire [31:0]                              hmem__dut__data     ;  // read data
                                          
  wire [ $clog2(OUTPUT_LENGTH)-1:0]        dut__dom__address  ;
  wire [31:0]                              dut__dom__data     ;  // write data
  wire                                     dut__dom__enable   ;
  wire                                     dut__dom__write    ;

//---------------------------------------------------------------------------
// SRAM Instantiations
//---------------------------------------------------------------------------
  
  sram  #(.ADDR_WIDTH    ($clog2(MAX_MESSAGE_LENGTH)),
          .DATA_WIDTH    (SYMBOL_WIDTH              ),
          .MEM_INIT_FILE ("message.dat"             ))
         msg_mem  (
          .address      ( dut__msg__address  ),
          .write_data   ( {SYMBOL_WIDTH {1'b0}}), 
          .read_data    ( msg__dut__data     ), 
          .enable       ( dut__msg__enable   ),
          .write        ( dut__msg__write    ),

          .clock        ( clk                )
         );

  sram  #(.ADDR_WIDTH    ( $clog2(NUMBER_OF_Ks)),
          .DATA_WIDTH    (32),
          .MEM_INIT_FILE ("K.dat"         ))
          kmem_mem (

          .address     ( dut__kmem__address  ),
          .write_data  ( 'd0                 ), 
          .read_data   ( kmem__dut__data     ), 
          .enable      ( dut__kmem__enable   ),
          .write       ( dut__kmem__write    ),

          .clock       ( clk                 )
         );

  sram  #(.ADDR_WIDTH    ( $clog2(NUMBER_OF_Hs )),
          .DATA_WIDTH    (32),
          .MEM_INIT_FILE ("H.dat"         ))
          hmem_mem (

          .address     ( dut__hmem__address  ),
          .write_data  ( 'd0                 ), 
          .read_data   ( hmem__dut__data     ), 
          .enable      ( dut__hmem__enable   ),
          .write       ( dut__hmem__write    ),

          .clock       ( clk                 )
         );

  sram  #(.ADDR_WIDTH  ($clog2(OUTPUT_LENGTH)),
          .DATA_WIDTH  (32))
         dom_mem  (

          .address     ( dut__dom__address  ),
          .write_data  ( dut__dom__data     ), 
          .read_data   (                    ),
          .enable      ( dut__dom__enable   ),
          .write       ( dut__dom__write    ),

          .clock       ( clk                )
         );

//---------------------------------------------------------------------------
// Testbench
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
//  clk
//---------------------------------------------------------------------------
  initial 
    begin
        clk                     = 1'b0;
        forever # CLK_PHASE clk = ~clk;
    end

`ifdef DEFAULT_TEST
  initial 
    begin
        dutRunning = 0;
        waitForFinishLow = 1;
        repeat(10) @(posedge clk);
        reset = 0;
        xxx__dut__go = 0;
        xxx__dut__msg_length = `MSG_LENGTH;
        repeat(10) @(posedge clk);
        reset = 1;
        repeat(10) @(posedge clk);
        reset = 0;
        repeat(1) @(posedge clk);
        xxx__dut__go = 1;
        repeat(1) @(posedge clk);
        xxx__dut__go = 0;
        repeat(500) @(posedge clk);

        repeat(1) @(posedge clk);
        xxx__dut__go = 1;
        repeat(1) @(posedge clk);
        xxx__dut__go = 0;
        repeat(500) @(posedge clk);

        $finish;
    end
`endif

  always 
    begin
      @(posedge clk);
      if ((xxx__dut__go == 1'b1) && ~dutRunning)
        begin
          $display("@%0t, go asserted", $time);
          numberOfClocks = 0;
          dutRunning = 1;
        end
      else if ((dut__xxx__finish == 1'b0) && waitForFinishLow)
        begin
          waitForFinishLow = 0;
          numberOfClocks = numberOfClocks + 1;
        end
      else if ((dut__xxx__finish == 1'b1) && ~waitForFinishLow && dutRunning)
        begin
          $display("@%00t, dut finished, # of clocks = %0d", $time, numberOfClocks);
          dutRunning = 0;
          waitForFinishLow = 1;
        end
      else
        begin
          numberOfClocks = numberOfClocks + 1;
        end
    end

  always 
    begin
      @(posedge clk);
      if (dut__dom__enable == 1'b1)
        begin
          $display("%s[%0d] = %h", outputType, dut__dom__address, dut__dom__data);
        end
    end

  initial begin
      runId = 0;
    end

  always 
    begin
      @(posedge clk);
      if (dut__xxx__finish == 1'b1)
        begin
          $display("Store result to result_%0d.txt", runId);
          $writememh($sformatf("result_%0d.txt", runId),dom_mem.mem);
          runId = runId+1;
        end
      wait (dut__xxx__finish == 1'b0);

    end
	
//---------------------------------------------------------------------------
// Custom Test Bench
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
// Go Go Finish x 3
//---------------------------------------------------------------------------
`ifdef GO_FINISH_TEST
initial 
    begin
        dutRunning = 0;
        waitForFinishLow = 1;
        repeat(10) @(posedge clk);
        reset = 0;
        xxx__dut__go = 0;
        xxx__dut__msg_length = `MSG_LENGTH;
        repeat(10) @(posedge clk);
        reset = 1;
        repeat(10) @(posedge clk);
        reset = 0;
        repeat(1) @(posedge clk);
        xxx__dut__go = 1;
        repeat(1) @(posedge clk);
        xxx__dut__go = 0;
        repeat(10) @(posedge clk);
		xxx__dut__go = 1;
		repeat(10) @(posedge clk);
		xxx__dut__go = 0;
		repeat(480) @(posedge clk);
		
        repeat(1) @(posedge clk);
        xxx__dut__go = 1;
        repeat(1) @(posedge clk);
        xxx__dut__go = 0;
        repeat(10) @(posedge clk);
		xxx__dut__go = 1;
		repeat(10) @(posedge clk);
		xxx__dut__go = 0;
		repeat(480) @(posedge clk);
		
		repeat(1) @(posedge clk);
        xxx__dut__go = 1;
        repeat(1) @(posedge clk);
        xxx__dut__go = 0;
        repeat(10) @(posedge clk);
		xxx__dut__go = 1;
		repeat(10) @(posedge clk);
		xxx__dut__go = 0;
		repeat(480) @(posedge clk);

        $finish;
    end
`endif

//---------------------------------------------------------------------------
// Go Go Go Go Go
//---------------------------------------------------------------------------
`ifdef GO_GO_TEST
initial 
    begin
        dutRunning = 0;
        waitForFinishLow = 1;
        repeat(10) @(posedge clk);
        reset = 0;
        xxx__dut__go = 0;
        xxx__dut__msg_length = `MSG_LENGTH;
        repeat(10) @(posedge clk);
        reset = 1;
        repeat(10) @(posedge clk);
        reset = 0;
        repeat(1) @(posedge clk);
        xxx__dut__go = 1;
        repeat(501) @(posedge clk);

        repeat(1) @(posedge clk);
        repeat(1) @(posedge clk);
        repeat(500) @(posedge clk);

        $finish;
    end
`endif

//---------------------------------------------------------------------------
// Stimulus
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
// DUT 
//---------------------------------------------------------------------------
  MyDesign #(.OUTPUT_LENGTH      (OUTPUT_LENGTH     ),
             .MAX_MESSAGE_LENGTH (MAX_MESSAGE_LENGTH),
             .NUMBER_OF_Ks       (NUMBER_OF_Ks      ),
             .NUMBER_OF_Hs       (NUMBER_OF_Hs      ),
             .SYMBOL_WIDTH       (SYMBOL_WIDTH      ))

            dut(

          .xxx__dut__msg_length ( xxx__dut__msg_length ),  
          .dut__xxx__finish     ( dut__xxx__finish     ),
          .xxx__dut__go         ( xxx__dut__go         ),  
          .dut__msg__address    ( dut__msg__address    ),
          .msg__dut__data       ( msg__dut__data       ), 
          .dut__msg__enable     ( dut__msg__enable     ),
          .dut__msg__write      ( dut__msg__write      ),
                                                       
          .dut__kmem__address   ( dut__kmem__address   ),
          .kmem__dut__data      ( kmem__dut__data      ), 
          .dut__kmem__enable    ( dut__kmem__enable    ),
          .dut__kmem__write     ( dut__kmem__write     ),
                                                       
          .dut__hmem__address   ( dut__hmem__address   ),
          .hmem__dut__data      ( hmem__dut__data      ), 
          .dut__hmem__enable    ( dut__hmem__enable    ),
          .dut__hmem__write     ( dut__hmem__write     ),
                                                       
          .dut__dom__address    ( dut__dom__address    ),
          .dut__dom__data       ( dut__dom__data       ), 
          .dut__dom__enable     ( dut__dom__enable     ),
          .dut__dom__write      ( dut__dom__write      ),
                                                       
          .reset                ( reset                ),  
          .clk                  ( clk                  )
         );

endmodule