`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 00:56:25
// Design Name: 
// Module Name: flush_unit
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


module flush_unit(
input [31:0]instuction_code,
input flush,
output reg[31:0]instuction_codef
    );
    
    always@(*)
     begin
      if(flush)
       begin
       instuction_codef=0;
       end
       
       else
        instuction_codef=instuction_code;
     end
endmodule
