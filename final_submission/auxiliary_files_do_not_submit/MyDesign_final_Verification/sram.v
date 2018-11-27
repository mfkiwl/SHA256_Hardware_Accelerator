/*********************************************************************************************

    File name   : sram.v
    Author      : Lee Baker
    Affiliation : North Carolina State University, Raleigh, NC
    Date        : Oct 2017
    email       : lbbaker@ncsu.edu

    Description : Generic SRAM 


*********************************************************************************************/
    
//`timescale 1ns/10ps

module sram     #(parameter  ADDR_WIDTH      = 8   ,
                  parameter  DATA_WIDTH      = 32  ,
                  parameter  MEM_INIT_FILE   = ""  )
                (
                //---------------------------------------------------------------
                // 
                input  wire [ADDR_WIDTH-1:0  ]  address     ,
                input  wire [DATA_WIDTH-1:0  ]  write_data  ,
                output reg  [DATA_WIDTH-1:0  ]  read_data   ,
                input  wire                     enable      , 
                input  wire                     write       ,

                input  clock
                );


    //--------------------------------------------------------
    // Associative memory

    bit  [DATA_WIDTH-1 :0  ]     mem     [int] = '{default: 'X};


    //--------------------------------------------------------
    // Read

    always @(*)
      begin
        #4 read_data   =  (enable && ~write) ? mem [address] :
                                               16'hx         ; 
      end

    //--------------------------------------------------------
    // Write

    always @(posedge clock)
      begin
        if (enable && write)
          mem [address] = write_data ;
      end
    //--------------------------------------------------------


    //--------------------------------------------------------
    // Need to accomodate loading during simulation
    // e.g. pe_cntl.v creates event
    
    string memFile;
    string entry  ;
    int fileDesc ;
    bit [ADDR_WIDTH-1 :0 ]  memory_address ;
    bit [DATA_WIDTH-1 :0 ]  memory_data    ;

    event loadMemory ;
    always
      begin
        @(loadMemory)
          loadInitFile;
      end

    // load at trailing edge of reset
    initial
      begin
        memFile = MEM_INIT_FILE ;
        -> loadMemory ;
      end

    task  loadInitFile;
      if (memFile != "")
        begin
          fileDesc = $fopen (memFile, "r");
          if (fileDesc == 0)
            begin
              $display("ERROR::readmem file error : %s ", memFile);
              $finish;
            end
          $display("INFO::readmem : %s ", memFile);
          while (!$feof(fileDesc)) 
            begin 
              void'($fgets(entry, fileDesc)); 
              void'($sscanf(entry, "@%x %x", memory_address, memory_data));
              //$display("INFO::readmem file contents : %s  : Addr:%h, Data:%h", memFile, memory_address, memory_data);
              mem[memory_address] = memory_data ;
            end
          $fclose(fileDesc);
        end
     endtask

endmodule


