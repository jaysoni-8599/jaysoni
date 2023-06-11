`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:47:46
// Design Name: 
// Module Name: pc_gen
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


module pc_gen(
    input clk,
    input reset,
    input [31:0]pc_x_4,
     output  [31:0]PC
    );
    reg [31:0]pc_x;
    assign PC=pc_x;
    
    always @(posedge clk,negedge reset)
     begin
     if(reset==0)
       pc_x=0;
       else
      pc_x=pc_x_4;  
    end
    
endmodule
