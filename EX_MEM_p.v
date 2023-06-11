`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2023 18:21:36
// Design Name: 
// Module Name: EX_MEM_p
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


module EX_MEM_p(
input clk,
input rst,
input [4:0]Rd_EX_MEM,
input [31:0]ALU_writedata_ex_mem,
input [31:0]data_read,
input regwrite_ex_mem,
output [31:0]EX_MEM_Readdata,
output [31:0]ALU_EX_MEM_writedata,
output RegwriteEX_MEM,
output [4:0] RDEX_MEM

    );
   reg [31:0]EXMEM_writedata;
   reg Reg_writeEX_MEM;
   reg [4:0] RD_EXMEM;
   reg[31:0]EX_MEM_Read_data;
   
   assign ALU_EX_MEM_writedata=EXMEM_writedata;
   assign RegwriteEX_MEM=Reg_writeEX_MEM;
   assign RDEX_MEM=RD_EXMEM;
   assign EX_MEM_Readdata=EX_MEM_Read_data;
   
   always @(posedge clk,negedge rst)
     begin
         if (rst==0)
            begin
            EXMEM_writedata=32'b0;
            Reg_writeEX_MEM=0;
            RD_EXMEM=5'b0;
            EX_MEM_Read_data=32'b0;
            end
         else
           begin
            EXMEM_writedata=ALU_writedata_ex_mem;
            Reg_writeEX_MEM=regwrite_ex_mem;
            RD_EXMEM=Rd_EX_MEM;
            EX_MEM_Read_data=data_read;
           
           end   
     end
    
    
endmodule
