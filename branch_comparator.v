`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 19:27:10
// Design Name: 
// Module Name: branch_comparator
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


module branch_comparator(
input [2:0]func,
input branch,
input [31:0]a,
input [31:0]b,
output  reg bne,
output reg zero,
output reg blt,
output reg bge
    );
    
    always @(*)
      begin
          if(branch)
           begin
                 case(func)
                 3'b000:zero=(a==b);
                 3'b100:blt=(a<b);
                 3'b101:bge=(a>b|a==b);
                 3'b001:bne=(a!=b);
               endcase
           end
        end   
    
endmodule
