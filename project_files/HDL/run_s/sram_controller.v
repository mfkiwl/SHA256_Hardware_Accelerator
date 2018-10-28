module sram_controller	#(parameter ADDR_WIDTH = 3,
			  parameter DATA_WIDTH = 32)

			 //Input to the SRAM Controller
			(input clock,
			 input reset,
			 input memctrl_enable,
			 input memctrl_rw,
			 input [ADDR_WIDTH-1:0] memctrl_addr,
			 input [DATA_WIDTH-1:0] memctrl_write_data,

			 //Input from the SRAM to SRAM Controller
			 input [DATA_WIDTH-1:0] sram_out_data,

			 //Output from the SRAM Controller
			 output reg dat_ready,
			 output reg [DATA_WIDTH-1:0] memctrl_out_data,

			 //Output from the SRAM Controller to SRAM
			 output reg sram_enable,
			 output reg sram_rw,
			 output reg [DATA_WIDTH-1:0] sram_write_data,
			 output reg [ADDR_WIDTH-1:0] sram_addr);

always@(posedge clock)
begin
	if(reset)
	begin
		sram_enable <= 1'b0;
		sram_rw <= 1'b0;
		sram_write_data <= {DATA_WIDTH-1{1'b0}};
		sram_addr <= {ADDR_WIDTH-1{1'b0}};
		dat_ready <= 1'b0;
		memctrl_out_data <= {DATA_WIDTH-1{1'b0}};
	end
	else
	begin
		sram_enable <= memctrl_enable;
		sram_rw <= memctrl_rw;
		sram_write_data <= memctrl_write_data;
		sram_addr <= memctrl_addr;
		dat_ready <= (sram_enable & ~sram_rw);
		memctrl_out_data = sram_out_data;
	end
end

endmodule
