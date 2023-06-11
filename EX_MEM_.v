`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2023 18:44:13
// Design Name: 
// Module Name: EX_MEM_
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


module EX_MEM_(
input clk,
input rst,
input [31:0] alu_result,
input [31:0]RS2_data,
input [4:0] Rd_ID_EX,
input ID_EXmemtoreg,
input ID_EXmemwrite,
input ID_EXregwrite,
input ID_EXmemread,
output [31:0]EX_MEM_Aluresult,
output EX_MEMmemtoreg,
output EX_MEMmemwrite,
output EX_MEMregwrite,
output EX_MEMmemread,
output [4:0] Rd_EX_MEM,
output [31:0]Ex_mem_writedata_Rs2
    );
    
    reg EX_MEM_memtoreg,EX_MEM_memread,EX_MEM_memwrite,EX_MEM_regwrite;
    reg[31:0]EX_MEM_Alu_result,Ex_memwritedata_Rs2;
    reg [4:0]RdEX_MEM;
    assign EX_MEM_Aluresult=EX_MEM_Alu_result;
    assign EX_MEMmemtoreg=EX_MEM_memtoreg;
    assign EX_MEMmemwrite=EX_MEM_memwrite;
    assign EX_MEMregwrite=EX_MEM_regwrite;
    assign EX_MEMmemread=EX_MEM_memread;
    assign Rd_EX_MEM=RdEX_MEM;
    assign Ex_mem_writedata_Rs2=Ex_memwritedata_Rs2;
    
    always @(posedge clk,negedge rst)
        begin
            if(rst==0)
             begin
             EX_MEM_memtoreg=0;
             EX_MEM_memread=0;
             EX_MEM_memwrite=0;
             EX_MEM_regwrite=0;
             EX_MEM_Alu_result=32'b0;
             RdEX_MEM=0;
             Ex_memwritedata_Rs2=0;
             end
            else
              begin
               EX_MEM_memtoreg=ID_EXmemtoreg;
             EX_MEM_memread=ID_EXmemread;
             EX_MEM_memwrite=ID_EXmemwrite;
             EX_MEM_regwrite=ID_EXregwrite;
             EX_MEM_Alu_result= alu_result;
             RdEX_MEM=Rd_ID_EX;
             Ex_memwritedata_Rs2=RS2_data;
              end 
        end
    
endmodule
