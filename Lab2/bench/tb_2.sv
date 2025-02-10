`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 06:25:36 AM
// Design Name: 
// Module Name: tb_2
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


module tb_2;

logic a1;
logic b1;
logic c1;
logic x1;
logic y1;

lab_2  l2(
    .a(a1),
    .b(b1),
    .c(c1),
    .x(x1),
    .y(y1)
    );
    
initial
begin 
        a1=0 ; b1=0 ; c1=0 ;
        #20;
        a1=0 ; b1=0 ; c1=1 ;
        #20;
        a1=0 ; b1=1 ; c1=0 ;
        #20;
        a1=0 ; b1=1 ; c1=1 ;
        #20;
        a1=1 ; b1=0 ; c1=0 ;
        #20;
        a1=1 ; b1=0 ; c1=1 ;
        #20;
        a1=1 ; b1=1 ; c1=0 ;
        #20;
        a1=1 ; b1=1 ; c1=1 ;
        #20;
        $stop;    
end
    
initial
begin
        
        $monitor("y=%b, x=%b, a=%b, b=%b, c=%b" , y1,x1,a1,b1,c1);
end            
endmodule
