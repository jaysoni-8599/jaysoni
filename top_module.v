`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2023 17:46:35
// Design Name: 
// Module Name: top_module
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


module top_module( input clk,input rst );
    
    wire clock_final,rst_final,enable_final,clock_stop;
    wire clear,stop,enable,bge,blt,zero,bne,beq,tak_na_add_sel,pcsrc_p_j,flush_clear;
    wire  Regwrite,Alusrc, Memread, Memwrite,Memtoreg,branch,jump,Pcsrc,update,flush,Pcsrc_p,Pcsrc_p_IF_ID,Branch_IF_ID;
    wire Regwrites,Alusrcs,Memreads,Memwrites,Memtoregs,Branchs,act_pcsrc,act_pcsrc_ID_EX,pcsrc_p_ID_EX,branch_id_ex;
    wire[1:0]Aluop,immsel,ALU_op_ID_EX,RS1,RS2,Immsels,Aluops,update_data,write_branch_add,branch_add_if_id,branch_takendata,immsel_b_j,branch_takendata_if_id,branch_takendata_ID_EX,branch_add_id_ex;
    wire [31:0]pc_final,PC_IF_ID,PC_Fetch,instruction_code,instruction_code_IF,If_Id_instructioncode,Read_data_Rs1,Read_data_Rs2,immdata,alu_result,EX_MEM_Aluresult;
    wire  ALU_src_ID_EX,ID_EXmemtoreg,ID_EXmemread,ID_EXmemwrite,ID_EX_Regwrite, EX_MEMmemtoreg,EX_MEMmemwrite,EX_MEMregwrite, EX_MEMmemread,RegwriteMEM_WB,Memtoreg_mem_wb;
    wire [31:0]ID_EXimmdata,Reg1_pipedata,Reg2_pipedata,Ex_mem_writedata_Rs2,read_data_mem,MEM_WB_Readdata,ALU_MEM_WB_writedata;
    wire [4:0]Rs1_Id_Ex,Rs2_Id_Ex,Rd_Id_Ex,Rd_EX_MEM,Rd_MEM_WB;
    wire [31:0]Rs1_final,Rs2_final,writedata_mem_wb,aluinput2,PC_X,PC_X_IF_ID,shift_data,pc_x_4,pc_4,pc_x,immdata_br_jal,PC_4_IF_ID,PC_update_br,Final_pc,next_pc,pc_4_ID_EX,pc_x_ID_EX;
    wire [3:0]fun_ID_EX,final_alu_control;
    wire [2:0]func3_id_ex;
    and a3(clock_final,clk,stop);
    and a2(rst_final,rst,clear);
   // and a1(enable_final,enable,stop);
  //  clock_stop ckl1(clk,stop,clock_stop);
  // and a1 (clock_final,clock_stop,clk);
    pc_gen g1(clk,rst,next_pc,pc_final);
    
   pc_4_add pc4(pc_final,pc_4);
   Pc_x_add pcx1(pc_final,shift_data,pc_x);
   
   mux_two pc_1(pc_x,pc_4,pcsrc_p_j,pc_x_4);//for branch
   mux_two branch_update(PC_update_br,pc_x_4,update,Final_pc); //if taken mismatch than pc
   mux_two mx11(PC_IF_ID,pc_final,enable,PC_Fetch);   //for stalling, pc to be fetch
   mux_two stal_1(Final_pc,PC_4_IF_ID,stop,next_pc); // after stalling keep next instruction to ready 
    mux_two mx12(pc_4_ID_EX,pc_x_ID_EX,tak_na_add_sel,PC_update_br); //for flushing pc and updateing pc
       or o1(pcsrc_p_j,Pcsrc_p,jump);
    fetch_unit f1(clk,rst,PC_Fetch,instruction_code);
    
    immgen m1(instruction_code,immsel_b_j,immdata_br_jal);
    shiftimm sh1(immdata_br_jal,shift_data);
    branch_control br1(instruction_code[6:0],instruction_code[14:12],immsel_b_j,branch,jump);
    BHT bh1(rst,pc_final[3:2],update_data,branch_add_id_ex,update,branch,branch_takendata);
    prediction_pcsrc pd1(branch_takendata,branch,Pcsrc_p);
    saturation_counter sat1(update,branch_takendata_ID_EX,update_data);
    which_instruc_afterbr wbr1(act_pcsrc,pcsrc_p_ID_EX,tak_na_add_sel);
   
   flush_unit flu1(instruction_code,flush,instruction_code_IF);
    
    IF_ID i1(instruction_code_IF,clk,rst,pc_final,pc_4,pc_x,branch,Pcsrc_p,pc_final[3:2],branch_takendata,If_Id_instructioncode,PC_IF_ID,PC_X_IF_ID,PC_4_IF_ID,Branch_IF_ID,Pcsrc_p_IF_ID,branch_add_if_id,branch_takendata_if_id);
    
    //branch_comparator bc1(If_Id_instructioncode[14:12],Branch_IF_ID,Read_data_Rs1,Read_data_Rs2,bne,zero,blt,bge);
    
    //pcsrc_gen pg1(If_Id_instructioncode[14:12],Branch_IF_ID,bne,zero,blt,bge,act_pcsrc);
    
    branch_macthing bm1(act_pcsrc,pcsrc_p_ID_EX,branch_id_ex,flush,update);
    
    
    
    main_control c1(If_Id_instructioncode[6:0],If_Id_instructioncode[14:12],Regwrite,immsel,Aluop,Alusrc,Memread, Memwrite,Memtoreg);
    
    immgen im2(If_Id_instructioncode,immsel,immdata);
    
    register_file r1(If_Id_instructioncode[19:15],If_Id_instructioncode[24:20],Rd_MEM_WB,writedata_mem_wb,RegwriteMEM_WB,clk,rst,Read_data_Rs1,Read_data_Rs2);
       
    or o2(flush_clear,clear,flush);
    stall_control s1(flush_clear,Regwrite,immsel,Branch_IF_ID,Aluop,Alusrc,Memread, Memwrite,Memtoreg,Regwrites,Immsels,Branchs,Aluops,Alusrcs,Memreads,Memwrites,Memtoregs);
    
    ID_EX id1(clk,rst,Aluops,Alusrcs,Regwrites,Memtoregs,Memreads,Memwrites,immdata,{If_Id_instructioncode[30],If_Id_instructioncode[14:12]},Read_data_Rs1,Read_data_Rs2,If_Id_instructioncode[19:15],If_Id_instructioncode[24:20],If_Id_instructioncode[11:7],PC_4_IF_ID,PC_X_IF_ID,If_Id_instructioncode[14:12],Pcsrc_p_IF_ID,Branchs,branch_takendata_if_id,branch_add_if_id,ALU_op_ID_EX,ALU_src_ID_EX,ID_EXmemtoreg,ID_EXmemread,ID_EXmemwrite,
              ID_EXimmdata,Reg1_pipedata,Reg2_pipedata,ID_EX_Regwrite,Rs1_Id_Ex,Rs2_Id_Ex,Rd_Id_Ex,fun_ID_EX,func3_id_ex,pc_4_ID_EX,pc_x_ID_EX,pcsrc_p_ID_EX,branch_id_ex,branch_takendata_ID_EX,branch_add_id_ex);
              
     alu_control aluc(fun_ID_EX,ALU_op_ID_EX,final_alu_control);  
     
     mux_two mx1(ID_EXimmdata,Rs2_final,ALU_src_ID_EX,aluinput2); 
     
     alu al(Rs1_final,aluinput2,final_alu_control,alu_result,beq,blt,bge,bne);
     
     pcsrc_gen pg1(func3_id_ex,branch_id_ex,bne,beq,blt,bge,act_pcsrc);//actual pcsrc
     
     EX_MEM_ ex1(clk,rst,alu_result,Reg2_pipedata,Rd_Id_Ex,ID_EXmemtoreg,ID_EXmemwrite,ID_EX_Regwrite,ID_EXmemread,EX_MEM_Aluresult,EX_MEMmemtoreg,EX_MEMmemwrite,EX_MEMregwrite,EX_MEMmemread,Rd_EX_MEM,Ex_mem_writedata_Rs2);  
     
     data_memory dm (EX_MEM_Aluresult,EX_MEMmemwrite,EX_MEMmemread,rst,Ex_mem_writedata_Rs2,read_data_mem);
              
     Mem_Wb_p p1(clk,rst,Rd_EX_MEM,EX_MEM_Aluresult,read_data_mem,EX_MEMregwrite,EX_MEMmemtoreg,MEM_WB_Readdata,ALU_MEM_WB_writedata,RegwriteMEM_WB,Rd_MEM_WB,Memtoreg_mem_wb);   
     
     mux_two mx2(MEM_WB_Readdata,ALU_MEM_WB_writedata,Memtoreg_mem_wb,writedata_mem_wb); 
     
     forwarding_unit fu1(Rs1_Id_Ex,Rs2_Id_Ex,Rd_EX_MEM,Rd_MEM_WB,EX_MEMregwrite,RegwriteMEM_WB,RS1,RS2);
     
     mux_three mx1_1(Reg1_pipedata,EX_MEM_Aluresult,writedata_mem_wb,RS1,Rs1_final);
     
     mux_three mx1_2(Reg2_pipedata,EX_MEM_Aluresult,writedata_mem_wb,RS2,Rs2_final);
     
     stalling st1(ID_EXmemread,Rd_Id_Ex,If_Id_instructioncode[19:15],If_Id_instructioncode[24:20],clear,stop,enable);
    
    
    
    
endmodule
