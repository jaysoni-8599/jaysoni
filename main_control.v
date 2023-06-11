`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:46:50
// Design Name: 
// Module Name: main_control
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


module main_control(
input [6:0]opcode,
input [2:0] func3,
output  Regwrite,
output [1:0]  Immsel,
output [1:0] Aluop,
output  Alusrc,
output Memread,
output Memwrite,
output  Memtoreg
);
reg regwrite, branch,alusrc,memtoreg,memwrite,memread,pcsrc,jump;
reg [1:0]aluop,immsel;
        assign Regwrite=regwrite;
        assign Immsel=immsel;
        //assign Branch=branch;
        assign Aluop=aluop;
        assign Memwrite=memwrite;
        assign Memread=memread;
       // assign Pcsrc=pcsrc;
        assign Alusrc=alusrc;
        assign Memtoreg=memtoreg;
        //assign Jump=jump;
        
    
                always @(*)
                begin
                if (opcode==7'b0110011)   //rtype
                begin
                regwrite=1;
                alusrc=0;
                //branch=0;
                //jump=0; 
                memtoreg=0;
                aluop=2'b10;
                memwrite=0;
                memread=0;
                memread=0;
                //pcsrc=0;//pc+4
                end
            
            else if(opcode==7'b0000011)//lw
            begin
            immsel=2'b00;
            regwrite=1;
            alusrc=1;
            branch=0;
            //jump=0; 
            memtoreg=1;
            aluop=2'b00;
            memwrite=0;
            memread=1;
            //pcsrc=0;//pc+4
            end
        else if(opcode==7'b0100011)//sw
            begin
            immsel=2'b01;
            regwrite=0;
            alusrc=1;
            //branch=0;
            //jump=0; 
            memtoreg=0;
            aluop=2'b00;
            memwrite=1;
            memread=0;
            //pcsrc=0;//pc+4
            end
    
    else if(opcode==7'b1100011)//branch
    begin
    immsel=2'b10;
    regwrite=0;
    alusrc=0;
    //branch=1;
    //jump=0; 
    memtoreg=0;
    aluop=2'b01;
    memwrite=0;
    memread=0;
//     case(func3)
//     3'b000:pcsrc=zero;
//     3'b100:pcsrc=blt;
//     3'b101:pcsrc=bge;
//     3'b001:pcsrc=bne;
     //endcase
    
    
    end
    
    else if(opcode==7'b1101111)// jump
        begin
        immsel=2'b11;
        regwrite=1;
       // pcsrc=1;//pc+x
        aluop=2'bxx;
        memread=0;
        memwrite=0;
        memtoreg=0;
        alusrc=1'bx;
        //jump=1; 
        
        end
    end
    
    
    





endmodule