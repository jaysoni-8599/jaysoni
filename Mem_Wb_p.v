`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2023 18:35:26
// Design Name: 
// Module Name: Mem_Wb_p
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


module Mem_Wb_p(input clk,
input rst,
input [4:0]Rd_EX_MEM,
input [31:0] ALU_writedata_ex_mem,
input [31:0]data_read,
input regwrite_ex_mem,
input mem_to_reg_EX_MEM,
output [31:0]MEM_WB_Readdata,
output [31:0]ALU_MEM_WB_writedata,
output RegwriteMEM_WB,
output [4:0] RDMEM_WB,
output Memtoreg_mem_wb

    );
   reg [31:0]MEM_WB_ALUwritedata;
   reg Reg_writeMEM_WB;
   reg [4:0] RD_MEMWB;
   reg[31:0]MEM_WB_Read_data;
   reg mem_to_reg_MEM_WB;
   
   assign ALU_MEM_WB_writedata=MEM_WB_ALUwritedata;
   assign RegwriteMEM_WB=Reg_writeMEM_WB;
   assign RDMEM_WB=RD_MEMWB;
   assign MEM_WB_Readdata=MEM_WB_Read_data;
   assign Memtoreg_mem_wb=mem_to_reg_MEM_WB;
   
   always @(posedge clk,negedge rst)
     begin
         if (rst==0)
            begin
           MEM_WB_ALUwritedata=32'b0;
            Reg_writeMEM_WB=0;
           RD_MEMWB=5'b0;
            MEM_WB_Read_data=32'b0;
            mem_to_reg_MEM_WB=0;
            end
         else
           begin
            MEM_WB_ALUwritedata=ALU_writedata_ex_mem;
            Reg_writeMEM_WB=regwrite_ex_mem;
             RD_MEMWB=Rd_EX_MEM;
           MEM_WB_Read_data=data_read;
           mem_to_reg_MEM_WB=mem_to_reg_EX_MEM;
           
           end   
     end
    
    
endmodule


   