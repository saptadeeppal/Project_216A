`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:50 11/09/2015 
// Design Name: 
// Module Name:    adc_correction_engine 
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
module adc_correction_engine(
    input srdyi,
    output srdyo,
    input [20:0] adc_correction_in,
    output [15:0] adc_correction_out,
    input sys_clk_i,
	 input reset_i
    );
reg [31:0] config_reg[39:0]={};
wire sum_en, sum_rst;
wire [31:0] smc_input_data;
wire [31:0] x_i_multiplier_d;
wire srdyo_smc_mul, srdyo_mul_add, srdyo_add_o;
wire [31:0] coefficient_32i;
wire [31:0] multiplier_32o, adder_32i_1, adder_32i_2, delay_32i, adder_32o, delay_32o;
assign adder_32i_1 = multiplier_32o;
assign adder_32i_2 = coefficient_32i;
assign delay_32i = adder_32o;
assign x_i_multiplier_d = delay_32o;

wire [3:0] coeff_sel;

fp_to_smc_float fp_to_smc_float_input_data(.x_1(adc_correction_in), .srdyi_i(srdyi), .Gloabalreset(reset_i), .clk(sys_clk_i), .y_o_portx(smc_input_data), .srdyo_o(srdyo_smc_mul));
smc_float_multiplier smc_float_32i_32i_32o_multiplier(.x_i_porty(smc_input_data), .y_i_porty(x_i_multiplier_d), . srdyi_i(srdyo_smc_mul), .GlobalReset(reset_i), .clk(sys_clk_i), .z_o_portx(multiplier_32o), .srdyo_o(srdyo_mul_add));
smc_float_adder smc_float_32i_32i_32o_adder(.x_i_porty(adder_32i_1), .y_i_porty(adder_32i_2), . srdyi_i(srdyo_mul_add), .GlobalReset(reset_i), .clk(sys_clk_i), .z_o_portx(adder_32o), .srdyo_o(srdyo_add_o));
delay_sum_block delay_sum_block(.x_i_porty(delay_32i), .sum_en(sum_en), .sum_rst(sum_rst), .srdyi_i(srdyo_add_o), .GlobalReset(reset_i), .clk(sys_clk_i), .z_o_portx(delay_32o));

control control(.srdyi(srdyi), .srdyo(srdyo), .sum_en(sum_en), .sum_rst(sum_rst), .clk(sys_clk_i), .GlobalReset(reset_i), .coeff_sel(coeff_sel));

endmodule
