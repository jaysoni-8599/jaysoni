`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 00:43:24
// Design Name: 
// Module Name: stall_control
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


module stall_control(input clear,
input  Regwrite,
input  [1:0]  Immsel,
input Branch,
input [1:0] Aluop,
input Alusrc,
//input Pcsrc,
input  Memread,
input Memwrite,
input Memtoreg,
//input Jump,
output  Regwrites,
output  [1:0]  Immsels,
output  Branchs,
output  [1:0] Aluops,
  output Alusrcs,
   //output Pcsrcs,
    output Memreads, 
    output  Memwrites,
    output Memtoregs
    //output Jumps


    );
    
    mux_two m1(0,Regwrite,clear,Regwrites);
    
    mux_two m2(0,Immsel,clear,Immsels);
    
    mux_two m3(0,Branch,clear,Branchs);
    
    mux_two m4(0,Aluop,clear,Aluops);
    
    mux_two m5(0,Alusrc,clear,Alusrcs);
    
    mux_two m6(0,Memread,clear,Memreads);
    
    mux_two m7(0,Memwrite,clear,Memwrites);
    
    mux_two m8(0, Memtoreg,clear, Memtoregs);
    
    
    
    
endmodule
