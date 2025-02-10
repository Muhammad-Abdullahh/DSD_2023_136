`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 07:11:28 AM
// Design Name: 
// Module Name: tb_3
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


module tb_3();

logic a1;
logic b1;
logic c1;
logic sum1;
logic carry1;

full_adder  l3(
    .a(a1),
    .b(b1),
    .c(c1),
    .sum(sum1),
    .carry(carry1)
    );
    
initial
begin
        a1=0 ; b1=0 ; c1=0 ;
        #10;
        a1=0 ; b1=0 ; c1=0 ;
        #10;
        a1=0 ; b1=0 ; c1=0 ;
        #10;
        a1=0 ; b1=0 ; c1=0 ;
        #10;
        a1=0 ; b1=0 ; c1=0 ;
        #10;
        a1=0 ; b1=0 ; c1=0 ;
        #10;
        a1=0 ; b1=0 ; c1=0 ;
        #10;
        a1=0 ; b1=0 ; c1=0 ;
        #10;
        $stop;
end

initial
begin
        $monitor("sum=%b, carry=%b, a=%b, b=%b, c=%b" , sum1,carry1,a1,b1,c1);
end                
endmodule
