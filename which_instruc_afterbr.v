`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 00:03:46
// Design Name: 
// Module Name: which_instruc_afterbr
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


module which_instruc_afterbr(
input act_pcsrc,
input pred_pcsrc,
output reg sel
    );
    
    always @(*)
      begin
      if(~act_pcsrc&&pred_pcsrc)
        sel=1;  //pc_4
        else if(act_pcsrc&&~pred_pcsrc)
        sel=0;  //pc_x
        else 
        sel=0;
      end
endmodule
