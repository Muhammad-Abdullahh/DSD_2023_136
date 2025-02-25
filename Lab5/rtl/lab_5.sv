`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 06:09:44 AM
// Design Name: 
// Module Name: lab_5
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

module lab_5 (
    input  logic a,b,c,d,
    input  logic [2:0] sel,
    output logic A,B,C,D,E,F,G,H,
    output logic [7:0] an
);

always_comb begin
 H=0;
    case ({a,b,c,d})
            4'b0000: {A, B, C, D, E, F, G} = 7'b0000001;
            4'b0001: {A, B, C, D, E, F, G} = 7'b0000110;
            4'b0010: {A, B, C, D, E, F, G} = 7'b1011011;
            4'b0011: {A, B, C, D, E, F, G} = 7'b1001111;
            4'b0100: {A, B, C, D, E, F, G} = 7'b1100110;
            4'b0101: {A, B, C, D, E, F, G} = 7'b1101101;
            4'b0110: {A, B, C, D, E, F, G} = 7'b1111101;
            4'b0111: {A, B, C, D, E, F, G} = 7'b0000111;
            4'b1000: {A, B, C, D, E, F, G} = 7'b1111111;
            4'b1001: {A, B, C, D, E, F, G} = 7'b1101111;
            4'b1010: {A, B, C, D, E, F, G} = 7'b1110111;
            4'b1011: {A, B, C, D, E, F, G} = 7'b1111100;
            4'b1100: {A, B, C, D, E, F, G} = 7'b0111001;
            4'b1101: {A, B, C, D, E, F, G} = 7'b1011110;
            4'b1110: {A, B, C, D, E, F, G} = 7'b1111001;
            4'b1111: {A, B, C, D, E, F, G} = 7'b1110001;
                default: {A, B, C, D, E, F, G} = 7'b0000000;
    endcase
end

always_comb begin
        case (sel)
            3'b000: an = 8'b11111110;
            3'b001: an = 8'b11111101;
            3'b010: an = 8'b11111011;
            3'b011: an = 8'b11110111;
            3'b100: an = 8'b11101111;
            3'b101: an = 8'b11011111;
            3'b110: an = 8'b10111111;
            3'b111: an = 8'b01111111;
            default: an = 8'b11111111;
        endcase
end

endmodule


