`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:49:20
// Design Name: 
// Module Name: register_file
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


module register_file(
    input [4:0] Read_Reg_Num1,
    input [4:0] Read_Reg_Num2,
    input [4:0] Write_Reg_Num,
    input [31:0] Write_Data,
    input RegWrite,
    input Clk,
    input Reset,
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2
    );
    
    reg[31:0]RegMemory[31:0];
    
    assign Read_Data_1=RegMemory[Read_Reg_Num1];
    assign Read_Data_2=RegMemory[Read_Reg_Num2];
    
    
    always @(negedge Reset)
    begin
    
    if (Reset==0)
    begin
    RegMemory[0]=32'h00000001;
    RegMemory[1]=32'h00000006;
    RegMemory[2]=32'h00000004;
    RegMemory[3]=32'h00000008;
    RegMemory[4]=32'h00000007;
    RegMemory[5]=32'h00000000;//t0
    
    RegMemory[6]=32'h00000018;//t1
    RegMemory[7]=32'h00000020;//t2
    RegMemory[9]=32'h00000000;//s1
    RegMemory[18]=32'h00000000;//s2
    RegMemory[19]=32'h00000000;//s3
    RegMemory[20]=32'h00000000;//s4
    RegMemory[21]=32'h00000000;//s5
    RegMemory[28]=32'h00000014;//t3
     RegMemory[29]=32'h00000010;
    end
    end
    always @(*)
    begin
    if (RegWrite==1)
     RegMemory[Write_Reg_Num]=Write_Data;
     end
    
    
endmodule