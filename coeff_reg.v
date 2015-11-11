`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:07:44 11/10/2015 
// Design Name: 
// Module Name:    coeff_reg 
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
module coeff_comparator(
	 input  [20:0] adc_count,
	 input  [31:0] config_reg [39:0],
	 output wire [31:0] coeff_o [9:0]
    );

	 assign coeff_o = (adc_count<21'd524287)  ? config_reg [9:0] :
							(adc_count<21'd1048574) ? config_reg [19:10]:
							(adc_count<21'd1572861) ? config_reg [29:20]: config_reg[39:30];
							
endmodule
