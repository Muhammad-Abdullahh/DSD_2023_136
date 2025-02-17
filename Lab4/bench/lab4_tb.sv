`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 03:09:05 AM
// Design Name: 
// Module Name: lab4_tb
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
module lab_4_tb;

    logic [1:0] a;
    logic [1:0] b;
    logic red, green, blue;
 
    lab_4 dut (
        .a(a),
        .b(b),
        .red(red),
        .green(green),
        .blue(blue)
    );

    task driver(input logic [1:0] d_a, input logic [1:0] d_b);
        begin
            a = d_a;
            b = d_b;
            #10; 
        end
    endtask

    task monitor;
        logic [1:0] M_A;
        logic [1:0] M_B;
        logic expected_red, expected_green, expected_blue;
        begin
        
            M_A = a;
            M_B = b;
            
            if (M_A > M_B) 
            begin 
                expected_red = 1;
                expected_green = 0;
                expected_blue = 1;
            end else if (M_A == M_B) 
            begin 
                expected_red = 1;
                expected_green = 1;
                expected_blue = 0;
            end else
            begin 
                expected_red = 0;
                expected_green = 1;
                expected_blue = 1;
            end

            
            if (red !== expected_red || green !== expected_green || blue !== expected_blue)
            begin
                $display("ERROR: A=%b, B=%b, Expected (R,G,B)=(%b,%b,%b), Got (R,G,B)=(%b,%b,%b), time=%t", 
                          M_A, M_B, expected_red, expected_green, expected_blue, red, green, blue, $time);
                $finish;
            end else begin
                $display("PASS: A=%b, B=%b, (R,G,B)=(%b,%b,%b)", M_A, M_B, red, green, blue);
            end   
        end
    endtask
    initial begin
        
        for (int i = 0; i < 4; i++) begin
            for (int j = 0; j < 4; j++) begin
                driver(i, j);
                monitor();
            end
        end
        
        $finish;
    end

endmodule

