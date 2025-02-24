`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 07:49:45 AM
// Design Name: 
// Module Name: lab5_tb
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


module lab5_tb;

      logic a,b,c,d;
      logic [2:0] sel;
      logic A,B,C,D,E,F,G;
      logic [7:0] an;

Lab5_struct dut(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .sel(sel),
    .A(A),.B(B),.C(C),.D(D),.E(E),.F(F),.G(G),
    .an(an)
    );
    
task led_driver(input logic [1:0]a,input logic [1:0]b );
    begin
            a = a[1];
            b = a[0];
            c = b[1];
            d = b[0];
    #10;
    
    end
endtask        

task an_driver(input logic a,input logic [1:0]b );
    begin
            sel[2] = a;
            sel[1] = b[1];
            sel[0] = b[0];
            
    #10;
    
    end
endtask        
initial begin
int i,j;
    for(i=0;i<4;i++)
    begin
        for(j=0;j<4;j++)
        begin
        led_driver(i,j);
        end
    end 
end

initial begin
int i,j;
    for(i=0;i<2;i++)
    begin
        for(j=0;j<4;j++)
        begin
        led_driver(i,j);
        end
    end
    $finish; 
end    
    

        
        
    










endmodule
