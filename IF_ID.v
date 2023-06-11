`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 21:53:41
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input [31:0] instruction,
    input clk,
    input rst,
    input [31:0]pc,
    input [31:0]pc_4,
    input [31:0]pc_x,
    input branch,
    input Pcsrc_P,
    input [1:0]branch_add,
    input [1:0] n_taken_data,
    output  reg [31:0] IF_ID_Instruction,
    output  reg [31:0]PC_IF_ID,
    output reg [31:0]PC_X_IF_ID,
    output reg [31:0]PC_4_IF_ID,
    output reg Branch_IF_ID,
     output reg Pcsrc_p_IF_ID,  
     output reg[1:0] branch_add_if_id,
     output reg[1:0]n_taken_data_if_id
    );
    
    always @(posedge clk,negedge rst)
      begin
               if(rst==0)
                 begin
                   IF_ID_Instruction=32'b0;
                   PC_IF_ID=0;
                   PC_X_IF_ID=0;
                   Branch_IF_ID=0;
                   Pcsrc_p_IF_ID=0;
                   branch_add_if_id=0;  
                   PC_4_IF_ID=0;
                   n_taken_data_if_id=0;
                 end
                   else 
                    IF_ID_Instruction=instruction;
                        PC_IF_ID=pc;
                        Branch_IF_ID=branch;
                         PC_X_IF_ID=pc_x;
                          Pcsrc_p_IF_ID=Pcsrc_P;
                          branch_add_if_id=branch_add;
                          PC_4_IF_ID=pc_4;
                          n_taken_data_if_id=n_taken_data;
      end
endmodule
