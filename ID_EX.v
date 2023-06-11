`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:51:44
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
input clk,
input rst,
//input clear,
input [1:0]aluop,
input alusrc,
input regwrite,
input memtoreg,
input memread,
input memwrite,
input [31:0]immdata,
input [3:0]fun,


input [31:0]reg1_data,
input[31:0]reg2_data,
input[4:0]reg1,
input [4:0]reg2,
input [4:0]writereg_numb,
input [31:0]pc_4_IF_ID,
input [31:0]pc_x_IF_ID,
input [2:0]func3_if_id,
input pcsrc_p_IF_ID,
input branch_if_id,
input [1:0]branch_takendata_IF_ID,
input [1:0]branch_add_if_id,
output [1:0]ALU_op_ID_EX,
output ALU_src_ID_EX,
output ID_EXmemtoreg,
output ID_EXmemread,
output ID_EXmemwrite,
output [31:0]ID_EXimmdata,
output [31:0]Reg1_pipedata,
output[31:0]Reg2_pipedata,
output Pipe_regwrite,
output[4:0] Reg1ID_EX,
output[4:0]Reg2ID_EX,
output [4:0]Writereg_numb_ID_EX,
output [3:0]fun_ID_EXalucontrol,
output[2:0]func3_id_ex,
output[31:0]pc_4_ID_EX,
output[31:0]pc_x_ID_EX,
output pcsrc_p_ID_EX,
output branch_id_ex,
output [1:0]branch_takendata_ID_EX,
output [1:0]branch_add_id_ex
    );
    reg[31:0]reg1_pipe_data,
              reg2_pipe_data,
              ID_immdata,pc_4,pc_x;
             reg pipe_regwite,ID_EX_memtoreg,ID_EX_memread,ID_EX_memwrite,ALUsrc_ID_EX,pcsrc,branch;
             reg [3:0]fun_ID_alucontrol;
             reg [4:0]Reg1,Reg2,Writeregnumb;
             reg[1:0]ALU_opID_EX,branch_takendata,branch_add;
             reg [2:0]func3;
             
    //assign Alu_pipecontrol=alu_pipe_control;
    assign Reg1_pipedata=reg1_pipe_data;
    assign Reg2_pipedata=reg2_pipe_data;
    assign Pipe_regwrite=pipe_regwite;
    assign Reg1ID_EX=Reg1;
    assign Reg2ID_EX=Reg2;
    assign Writereg_numb_ID_EX=Writeregnumb;
    assign fun_ID_EXalucontrol=fun_ID_alucontrol;
    assign ALU_op_ID_EX=ALU_opID_EX;
    assign  ALU_src_ID_EX=ALUsrc_ID_EX;
    assign ID_EXmemtoreg=ID_EX_memtoreg;
    assign ID_EXmemread=ID_EX_memread;
    assign ID_EXmemwrite=ID_EX_memwrite;
    assign ID_EXimmdata=ID_immdata;
    assign pcsrc_p_ID_EX=pcsrc;
    assign pc_4_ID_EX=pc_4;
    assign pc_x_ID_EX=pc_x;
    assign branch_takendata_ID_EX=branch_takendata;
    assign branch_add_id_ex=branch_add;
    assign branch_id_ex=branch;
    assign func3_id_ex=func3;
    
    always @(posedge clk,negedge rst)
        begin
            if(rst==0)
              begin
              fun_ID_alucontrol=4'b0;
              reg1_pipe_data=32'b0;
              reg2_pipe_data=32'b0;
              pipe_regwite=0;
              Reg1=0;
              Reg2=0;
              Writeregnumb=0;
              ID_EX_memtoreg=0;
              ID_EX_memread=0;
              ID_EX_memwrite=0;
              ALUsrc_ID_EX=0;
              ID_immdata=0;
              ALU_opID_EX=0;
             pcsrc=0;
             pc_4=0;
             pc_x=0;
             branch_takendata=0;
             branch_add=0;
             branch=0;
             func3=0;
              end
            else 
                begin
             fun_ID_alucontrol=fun;
              reg1_pipe_data=reg1_data;
              reg2_pipe_data=reg2_data;
              pipe_regwite=regwrite;
              Reg1=reg1;
              Reg2=reg2;
              Writeregnumb=writereg_numb;
              ID_EX_memtoreg=memtoreg;
              ID_EX_memread=memread;
              ID_EX_memwrite= memwrite;
              ALUsrc_ID_EX=alusrc;
              ID_immdata=immdata;
              ALU_opID_EX=aluop;
              pcsrc=pcsrc_p_IF_ID;
              pc_4=pc_4_IF_ID;
              pc_x=pc_x_IF_ID;
              branch_takendata=branch_takendata_IF_ID;
              branch_add=branch_add_if_id;
              branch=branch_if_id;
              func3=func3_if_id;
                end  
                
        end
endmodule