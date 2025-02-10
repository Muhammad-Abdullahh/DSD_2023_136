`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2025 09:19:00 AM
// Design Name: 
// Module Name: lab_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab_2(
input a,
input b,
input c,
output x,
output y
);

// internal signals

logic not_o;
logic or_o;
logic nand_o;
logic xor_o;

// circuit description

assign not_o = ~(c);
assign or_o = a|b;
assign nand_o = ~(a&b);
assign xor_o = nand_o^or_o;
assign x= not_o ^ or_o;
assign y= or_o & xor_o;



endmodule
