`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:17 11/09/2015 
// Design Name: 
// Module Name:    control 
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
module control(
    input srdyi,
    output srdyo,
    output sum_en,
    output sum_rst,
    input clk,
	 input GlobalReset,
    output [3:0] coeff_sel
    );
reg [3:0] counter;
always@(posedge clk)
begin
		if(GlobalReset == 0)
		counter = counter + 1;
		if(counter == 6)
		begin
				coeff_sel = coeff_sel + 1;
		end
		
end

always@(posedge GlobalReset)
begin
	coeff_sel = 0;
	counter = 0;
end

always@(posedge clk and posedge srdyi)
begin
		if(sum_en == 0)
		begin
				sum_en = 1;
		end
end

always@(posedge clk and posedge srdyo)
begin
		if(sum_en == 1)
		begin
				sum_en = 0;
				sum_rst = 1;
		end
end

always@(negedge clk)
begin
		if(sum_rst)
		begin
				sum_rst = 0;
		end
end

endmodule
