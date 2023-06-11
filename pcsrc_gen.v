`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 19:18:48
// Design Name: 
// Module Name: pcsrc_gen
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


module pcsrc_gen(
input [2:0]func3,
input branch,
input bne,
input beq,
input blt,
input bge,
output reg pcsrc
    );
    
    always @(*)
     begin
          if(branch)
           begin
                 case(func3)
                 3'b000:pcsrc=beq;
                 3'b100:pcsrc=blt;
                 3'b101:pcsrc=bge;
                 3'b001:pcsrc=bne;
               endcase
           end
           
           else
           pcsrc=0;
     end
    
    
    
endmodule
