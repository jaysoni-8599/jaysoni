`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2023 02:53:12
// Design Name: 
// Module Name: Pc_x_add
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


module Pc_x_add(
input [31:0]pc,
input [31:0]immshift,
output [31:0]PC_x

    );
    
    assign PC_x=pc+immshift;
endmodule
