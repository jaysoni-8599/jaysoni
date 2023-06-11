`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 15:03:31
// Design Name: 
// Module Name: BHT
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


module BHT(input rst,
input [1:0]pc,
input [1:0]update_data,
input [1:0]write_add,
input update,
input branch,
output reg [1:0]n_taken_data
    );
    
    reg [1:0]history_table[0:3];
    always @(negedge rst)
     begin
     if(rst==0)
      begin
      history_table[0]=2'b11;
      history_table[1]=2'b11;
      history_table[2]=2'b11;
      history_table[3]=2'b11;
      end
     end
    
    always @(*)
      begin
      if(branch)
        n_taken_data=history_table[pc];
      end
    
    always @(*)
      begin
       if(update)
         #2
         history_table[write_add]=update_data;
         end
     
    
endmodule
