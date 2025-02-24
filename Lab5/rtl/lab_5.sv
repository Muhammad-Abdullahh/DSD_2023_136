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
    output logic [6:0] led,
    output logic [7:0] an
);

always_comb begin
    case ({a,b,c,d})
        4'b0000: led = 7'b1000000; // 0
        4'b0001: led = 7'b1111001; // 1
        4'b0010: led = 7'b0100100; // 2
        4'b0011: led = 7'b0110000; // 3
        4'b0100: led = 7'b0011001; // 4
        4'b0101: led = 7'b0010010; // 5
        4'b0110: led = 7'b0000010; // 6
        4'b0111: led = 7'b1111000; // 7
        4'b1000: led = 7'b0000000; // 8
        4'b1001: led = 7'b0010000; // 9
        4'b1010: led = 7'b0001000; // A
        4'b1011: led = 7'b0000011; // B
        4'b1100: led = 7'b1000110; // C
        4'b1101: led = 7'b0100001; // D
        4'b1110: led = 7'b0000110; // E
        4'b1111: led = 7'b0001110; // F
        default: led = 7'b1111111; 
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


