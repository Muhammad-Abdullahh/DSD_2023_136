`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 04:28:15 AM
// Design Name: 
// Module Name: lab_5tb
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


module lab_5tb;

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
    
    task led_driver(input logic [3:0] hexi );
    begin
            d = hexi[0];
            c = hexi[1];
            b = hexi[2];
            a = hexi[3];
    #10;
    
    end
endtask        


initial begin
int k;
    for(k=0;k<16;k++)
    begin
       led_driver(k);
    end 
    $stop;
end

    initial
begin
        sel[2]=0 ; sel[1]=0 ; sel[0]=0 ;
        #10;
        sel[2]=0 ; sel[1]=0 ; sel[0]=1 ;
        #10;
        sel[2]=0 ; sel[1]=1 ; sel[0]=0 ;
        #10;
        sel[2]=0 ; sel[1]=1 ; sel[0]=1 ;
        #10;
        sel[2]=1 ; sel[1]=0 ; sel[0]=0 ;
        #10;
        sel[2]=1 ; sel[1]=0 ; sel[0]=1 ;
        #10;
        sel[2]=1 ; sel[1]=1 ; sel[0]=0 ;
        #10;
        sel[2]=1 ; sel[1]=1 ; sel[0]=1 ;
        #10;
       
end
endmodule
