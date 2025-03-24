`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 01:56:46 AM
// Design Name: 
// Module Name: lab7_tb
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


module lab7_tb;

    // Testbench signals
    logic clk, reset, write;
    logic [2:0] sel;                     // Select signal (3 bits for 8 displays)
    logic [3:0] num;                     // 4-bit number to store
    logic [6:0] segments;                // 7-segment output
    logic [7:0] an;                      // Anode control signals

    // Instantiate the DUT (Device Under Test)
    lab_7 DUT (
        .clk(clk),
        .reset(reset),
        .write(write),
        .sel(sel),
        .num(num),
        .segments(segments),
        .an(an)
    );

    // Clock generation (100 MHz clock)
    initial clk = 0;
    always #5 clk = ~clk;               // 100 MHz clock (10 ns period)

    // Test sequence
    initial begin
        $display("Starting Testbench...");
        $monitor("Time=%0t | write=%b | sel=%b | num=%h | an=%b | segments=%b", 
                 $time, write, sel, num, an, segments);

        // Initialize signals
        reset = 1;
        write = 0;
        sel = 3'b000;
        num = 4'h0;

        // Apply reset
        #20 reset = 0;
        $display("\nRESET: Registers cleared to 0, all displays show 0");

        // Write values to registers
        write = 1;

        sel = 3'b000; num = 4'h1;   #10;   // Write '1' to register 0
        $display("\nWrite '1' to Display 0");
        
        sel = 3'b001; num = 4'h2;   #10;   // Write '2' to register 1
        $display("\nWrite '2' to Display 1");
        
        sel = 3'b010; num = 4'h3;   #10;   // Write '3' to register 2
        $display("\nWrite '3' to Display 2");
        
        sel = 3'b011; num = 4'h4;   #10;   // Write '4' to register 3
        $display("\nWrite '4' to Display 3");
        
        sel = 3'b100; num = 4'h5;   #10;   // Write '5' to register 4
        $display("\nWrite '5' to Display 4");
        
        sel = 3'b101; num = 4'h6;   #10;   // Write '6' to register 5
        $display("\nWrite '6' to Display 5");
        
        sel = 3'b110; num = 4'h7;   #10;   // Write '7' to register 6
        $display("\nWrite '7' to Display 6");
        
        sel = 3'b111; num = 4'h8;   #10;   // Write '8' to register 7
        $display("\nWrite '8' to Display 7");

        // Stop writing, start displaying
        write = 0;
        $display("\nDISPLAY MODE: Cycling through stored values on all displays");

        // Let the display cycle for some time
        #20000;

       
        

        // End simulation
        $display("\nTest Complete!");
        $stop;
    end

endmodule

