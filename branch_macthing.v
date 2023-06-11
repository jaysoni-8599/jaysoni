`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 19:10:09
// Design Name: 
// Module Name: branch_macthing
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


module branch_macthing(
input actual_pcsrc,
input predict_pcsrc,
input branch,
output reg flush,
output reg update


    );
    
    always @(*)
      begin
        if(branch)
          begin
           flush=actual_pcsrc^predict_pcsrc;
          update=actual_pcsrc^predict_pcsrc;
          end
          
          else
           begin
           flush=0;
           update=0;
           
           end
      end
endmodule
