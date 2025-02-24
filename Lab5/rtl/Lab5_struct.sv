`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 06:00:45 AM
// Design Name: 
// Module Name: Lab5_struct
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


module Lab5_struct(
    input logic a,b,c,d, 
    input [2:0] sel,   
    output A,B,C,D,E,F,G, 
    output [7:0] an  
    );
    
    // led segments
    assign A = ((~a)&(b)&(~c)&(~d)) | ((~a)&(~b)&(~c)&(d)) | ((a)&(b)&(~c)&(d)) | ((a)&(~b)&(c)&(d));
    assign B = ((~a)&(b)&(~c)&(d)) | ((b)&(c)&(~d)) | ((a)&(c)&(d)) | ((a)&(b)&(~d));
    assign C = ((~a)&(~b)&(c)&(~d)) | ((a)&(b)&(c)) | ((a)&(b)&(~d));
    assign D = ((~a)&(b)&(~c)&(~d)) | ((~a)&(~b)&(~c)&(d)) | ((a)&(~b)&(c)&(d)) | ((b)&(c)&(d));
    assign E = ((~a)&(d)) | ((~a)&(b)&(~c)) | ((~b)&(~c)&(d));
    assign F = ((a)&(b)&(~c)&(d)) | ((~a)&(c)&(d)) | ((~a)&(~b)&(d)) | ((~a)&(~b)&(c));
    assign G = ((a)&(b)&(~c)&(~d)) | ((~a)&(b)&(c)&(d)) | ((~a)&(~b)&(~c));
    
    // anode
    assign an[0] = ~(~sel[2] & ~sel[1] & ~sel[0]);
    assign an[1] = ~(~sel[2] & ~sel[1] & sel[0]);
    assign an[2] = ~(~sel[2] & sel[1] & ~sel[0]);
    assign an[3] = ~(~sel[2] & sel[1] & sel[0]);
    assign an[4] = ~(sel[2] & ~sel[1] & ~sel[0]);
    assign an[5] = ~(sel[2] & ~sel[1] & sel[0]);
    assign an[6] = ~(sel[2] & sel[1] & ~sel[0]);
    assign an[7] = ~(sel[2] & sel[1] & sel[0]);
    
endmodule
