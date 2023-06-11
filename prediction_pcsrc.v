`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 15:43:07
// Design Name: 
// Module Name: prediction_pcsrc
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


module prediction_pcsrc(
input [1:0]n_taken_data,
input branch,
//input jump,
output reg pcsrc_p
    );
    
    
    always @(*)
     begin
      if(branch==0)
       pcsrc_p=0;
      else if(branch&&(n_taken_data==2'b00|n_taken_data==2'b01))
        pcsrc_p=0;
      else if (branch &&(n_taken_data==2'b10|n_taken_data==2'b11))
        pcsrc_p=1;  
//        else 
//         pcsrc_p=0;
        
     end
endmodule
