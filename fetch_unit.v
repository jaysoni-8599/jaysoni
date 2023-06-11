`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:53:49
// Design Name: 
// Module Name: fetch_unit
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


module fetch_unit(
    input clk,
    input reset,
    input [31:0]PC,
    output [31:0] InstructionCode
    );
//    reg[31:0]PC;
    
    instruction_mem t1(PC,reset,InstructionCode);
    
//    always @(posedge clk,negedge reset)
//    begin
//    if(reset==0)
//    PC<=0;
//    else
//    PC<=PC+4;
//    end
    
endmodule
