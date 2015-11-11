`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:44:52 11/09/2015 
// Design Name: 
// Module Name:    output_reg 
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
module output_reg(
	 input [31:0] data_in,
	 input  srdyo,
	 input  GlobalReset,
	 output [31:0] data_out
    );

always @(posedge srdyo)
begin
	if(GlobalReset==0)
	begin
		data_out <= data_in;
	end
end	

endmodule
