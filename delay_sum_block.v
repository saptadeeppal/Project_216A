`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:23 11/09/2015 
// Design Name: 
// Module Name:    delay_sum_block 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module delay_sum_block(
	input [31:0] x_i_porty,
	input sum_en,
	input sum_rst,
	input srdyi_i,
	input GlobalReset,
	input clk,
	output [31:0] z_o_portx
    );

reg [31:0] input_reg;
reg [31:0] delay_reg;

always@(posedge clk)
begin
		if(GlobalReset==0)
		begin
				if(sum_en==1&&sum_rst==0)
				begin
						delay_reg <= input_reg;
						z_o_portx <= delay_reg;
				end
				if(sum_rst==1)
				begin
						z_port_x <= 0;
						delay_reg <= 0;
				end
		
		end
		else if(GlobalReset==1)
		begin
		    z_port_x <= 0;
			 delay_reg <= 0;
			 input_reg <= 0;
		end



end

always@(posedge srdyi_i)
	begin
		input_reg <= x_i_porty;
	end
endmodule
