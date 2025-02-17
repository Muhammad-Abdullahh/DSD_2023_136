`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 11:55:07 PM
// Design Name: 
// Module Name: lab_4
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

`timescale 1ns/1ps
module lab_4(
input logic [1:0] a,
input logic [1:0] b,
output logic red,
output logic green, 
output logic blue
    );

assign red=(~b[0] & (~b[1])) | (a[1] & (a[0])) | (a[1] & (~b[0])) | (a[1] & (~b[1]))| (a[0] & ~b[1]);
assign blue =(a[1] & (~b[1])) | (b[1] &( ~a[1])) | (a[0]^b[0]);
assign green =( ~a[1] &(~a[0])) | (b[1] &( b[0])) |( ~ a[0] & (b[1])) | (~ a[1] & (b[1])) |(~ a[1] & (b[0])) ;   
    
endmodule
