`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 01:41:08 AM
// Design Name: 
// Module Name: lab_7
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


 module lab_7 (
    input logic clk, reset, write,
    input logic [2:0] sel,                   // 3-bit select for 8 displays
    input logic [3:0] num,                   // 4-bit number to store
    output logic [6:0] segments,             // 7-segment output
    output logic [7:0] an                    // Anode control signals
);

    logic [3:0] reg_mem [7:0];               // 8 registers to store values
    logic [2:0] display_sel;                 // Select which display is active
    logic slow_clk;                          // Slowed-down clock
    logic [7:0] enable;                      // Enable signals for each register

    // Clock divider to generate ~100 Hz signal from 100 MHz input
    logic [19:0] counter;
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 0;
        else
            counter <= counter + 1;
    end
    
    assign slow_clk = counter[19];   // Divide by 2^20 ? 100 Hz

    // Decoder to generate enable signals
    always_comb begin
        enable = 8'b11111111;               // Default all disabled
        enable[sel] = 1'b0;                // Active-low output for selected display
    end

    // Register storage (write only when write = 1)
    genvar i;
    generate
        for (i = 0; i < 8; i++) begin
            always_ff @(posedge clk or posedge reset) begin
                if (reset)
                    reg_mem[i] <= 4'b0000;                      // Clear register on reset
                else if (write && ~enable[i])                  // Store when enabled & write = 1
                    reg_mem[i] <= num;
            end
        end
    endgenerate

    // Display select logic (cycle through displays when write = 0)
    always_ff @(posedge slow_clk or posedge reset) begin
        if (reset)
            display_sel <= 3'b000;
        else if (!write)                                       // Only change display when write = 0
            display_sel <= display_sel + 1;
    end

    // Anode control logic
    always_comb begin
        if (write)
            an = ~(8'b00000001 << sel);                        // Turn on only selected display during write
        else begin
            an = 8'b11111111;                                  // Default all off
            an[display_sel] = 1'b0;                            // Enable selected display during display mode
        end
    end

    // 7-segment decoder for the selected value
    always_comb begin
        if (reset)                                             // Show 0 on reset
            segments = 7'b1000000;                             // Display '0' on reset
        else if (write)                                        // Show the number being written
            case (num)
                4'h0: segments = 7'b1000000;
                4'h1: segments = 7'b1111001;
                4'h2: segments = 7'b0100100;
                4'h3: segments = 7'b0110000;
                4'h4: segments = 7'b0011001;
                4'h5: segments = 7'b0010010;
                4'h6: segments = 7'b0000010;
                4'h7: segments = 7'b1111000;
                4'h8: segments = 7'b0000000;
                4'h9: segments = 7'b0010000;
                4'hA: segments = 7'b0001000;
                4'hB: segments = 7'b0000011;
                4'hC: segments = 7'b1000110;
                4'hD: segments = 7'b0100001;
                4'hE: segments = 7'b0000110;
                4'hF: segments = 7'b0001110;
                default: segments = 7'b1111111;               // Blank display for invalid input
            endcase
        else                                                  // Show stored value when write = 0
            case (reg_mem[display_sel])
                4'h0: segments = 7'b1000000;
                4'h1: segments = 7'b1111001;
                4'h2: segments = 7'b0100100;
                4'h3: segments = 7'b0110000;
                4'h4: segments = 7'b0011001;
                4'h5: segments = 7'b0010010;
                4'h6: segments = 7'b0000010;
                4'h7: segments = 7'b1111000;
                4'h8: segments = 7'b0000000;
                4'h9: segments = 7'b0010000;
                4'hA: segments = 7'b0001000;
                4'hB: segments = 7'b0000011;
                4'hC: segments = 7'b1000110;
                4'hD: segments = 7'b0100001;
                4'hE: segments = 7'b0000110;
                4'hF: segments = 7'b0001110;
                default: segments = 7'b1111111;
            endcase
    end

endmodule
