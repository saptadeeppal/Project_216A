`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:31:56 11/10/2015 
// Design Name: 
// Module Name:    coeff_register 
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
module coeff_register(
	 input [3:0]   coeff_sel,
	 input [31:0]  coeff_reg [9:0],
	 output [31:0] coeff_o
    );

always @(*)
begin
	case(coeff_sel)
		3'd0:
		begin
			coeff_o = coeff_reg[0];
		end
		3'd1:
		begin
			coeff_o = coeff_reg[1];
		end
		3'd2:
		begin
			coeff_o = coeff_reg[2];
		end
		3'd3:
		begin
			coeff_o = coeff_reg[3];
		end
		3'd4:
		begin
			coeff_o = coeff_reg[4];
		end
		3'd5:
		begin
			coeff_o = coeff_reg[5];
		end
		3'd6:
		begin
			coeff_o = coeff_reg[6];
		end
		3'd7:
		begin
			coeff_o = coeff_reg[7];
		end
		3'd8:
		begin
			coeff_o = coeff_reg[8];
		end
		3'd9:
		begin
			coeff_o = coeff_reg[9];
		end
	endcase
end

endmodule
