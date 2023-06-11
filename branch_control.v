`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 22:23:17
// Design Name: 
// Module Name: branch_control
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


module branch_control(
input [6:0]opcode,
input [2:0] func3,
output reg[1:0]immsel,
output reg branch,
output reg jump
    );
  always @(*)
   begin
   if (opcode==7'b1100011) //branch
    begin
      branch=1;
      immsel=2'b10;
      jump=0;
     end 
     else if(opcode==7'b1101111)// jump
        begin
        immsel=2'b11;
        jump=1;
        branch=0;
        end
      else
       begin
      branch=0;
      immsel=0;
      jump=0;
      end
      
    end
      
    
    
endmodule
