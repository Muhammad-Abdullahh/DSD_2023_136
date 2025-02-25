`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 08:30:03 AM
// Design Name: 
// Module Name: lab5_self_tb
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


module lab5_self_tb;

  logic a, b, c, d;
    logic [2:0] sel;
    logic A, B, C, D, E, F, G, H;
    logic [7:0] an;

    lab_5 dut (
        .a(a), .b(b), .c(c), .d(d),
        .sel(sel),
        .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .H(H),
        .an(an)
    );

    task led_driver(input logic [3:0] hexi);
        begin
            {a, b, c, d} = hexi;
            #10;
        end
    endtask

    task anode_driver(input logic [2:0] sel_input);
        begin
            sel = sel_input;
            #10;
        end
    endtask

    task led_monitor;
        logic [6:0] expected_led;
        begin
            case ({a, b, c, d})
            4'b0000: expected_led = 7'b0000001;
            4'b0001: expected_led = 7'b0000110;
            4'b0010: expected_led = 7'b1011011;
            4'b0011: expected_led = 7'b1001111;
            4'b0100: expected_led = 7'b1100110;
            4'b0101: expected_led = 7'b1101101;
            4'b0110: expected_led = 7'b1111101;
            4'b0111: expected_led = 7'b0000111;
            4'b1000: expected_led = 7'b1111111;
            4'b1001: expected_led = 7'b1101111;
            4'b1010: expected_led = 7'b1110111;
            4'b1011: expected_led = 7'b1111100;
            4'b1100: expected_led = 7'b0111001;
            4'b1101: expected_led = 7'b1011110;
            4'b1110: expected_led = 7'b1111001;
            4'b1111: expected_led = 7'b1110001;
                default: expected_led = 7'b0000000;
            endcase

            if ({A, B, C, D, E, F, G} !== expected_led) begin
                $display("LED ERROR: a=%b, b=%b, c=%b, d=%b | Expected LED: %b, Got: %b at time %0t", a, b, c, d, expected_led, {A, B, C, D, E, F, G}, $time);
            end else begin
                $display("LED PASS: a=%b, b=%b, c=%b, d=%b | LED: %b", a, b, c, d, {A, B, C, D, E, F, G});
            end
        end
    endtask

    task anode_monitor;
        logic [7:0] expected_an;
        begin
            case (sel)
                3'b000: expected_an = 8'b11111110;
                3'b001: expected_an = 8'b11111101;
                3'b010: expected_an = 8'b11111011;
                3'b011: expected_an = 8'b11110111;
                3'b100: expected_an = 8'b11101111;
                3'b101: expected_an = 8'b11011111;
                3'b110: expected_an = 8'b10111111;
                3'b111: expected_an = 8'b01111111;
                default: expected_an = 8'b11111111;
            endcase

            if (an !== expected_an) begin
                $display("ANODE ERROR: sel=%b | Expected Anode: %b, Got: %b at time %0t", sel, expected_an, an, $time);
            end else begin
                $display("ANODE PASS: sel=%b | Anode: %b", sel, an);
            end
        end
    endtask

    initial begin
        int i;
        for (i = 0; i < 16; i++) begin
            led_driver(i);
            led_monitor();
        end
      $stop;
    end

    initial begin
        int j;
        for (j = 0; j < 8; j++) begin
            anode_driver(j);
            anode_monitor();
        end
        
    end

endmodule
