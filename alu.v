`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:44:56
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] control,
    output [31:0] result,
    output beq_,
    output blt_,
    output bge_,
    output bne_
    
    );
    reg [31:0]res;
    reg Bge,Blt,Zero,Bne,Beq;
    assign result=res;
    assign beq_=Beq;
    assign blt_=Blt;
    assign bge_=Bge;
    assign zero=(a==b);
    assign bne_=Bne;
    
    
        always @(*)
        begin
        case(control)
        4'b0001:res=a+b;               
        4'b0010:begin
                res=a-b;
                end   
        4'b0011:res=a&b;
        4'b0100:res=a|b;
        4'b1011:res=a>>b[4:0];
        4'b0111:res=a<<b[4:0];
        4'b1010:begin
                res=(a>b);
               Bge=((a>b) |(a==b));
                end
        4'b1001:begin
                res=(a<b);
               Blt=(a<b); 
                 end   
        4'b1100:begin
                Bne=(a!=b);
                
                end
        4'b1000:res=(a^b);   
        4'b0110:begin
               res=(a==b);
               Beq=(a==b);
                end         
         endcase
        end
endmodule
