`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:45:45
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input [31:0] address,
    input memwrite,
    input memread,
    input reset,
    input [31:0] writedata,
    output [31:0] Readdata
    );
    reg [7:0]datamem[31:0];
    reg [31:0]readdata;
    assign Readdata=readdata;
    
    always @(negedge reset)
        begin
            if(reset==0)
                 begin
                 datamem[0]=8'h68;datamem[1]=8'h00;datamem[2]=8'h00;datamem[3]=8'h00;
                 datamem[4]=8'h20;datamem[5]=8'h00;datamem[6]=8'h00;datamem[7]=8'h00;
                 datamem[8]=8'h02;datamem[9]=8'h00;datamem[10]=8'h00;datamem[11]=8'h00;
                 datamem[12]=8'h00;datamem[13]=8'h00;datamem[14]=8'h00;datamem[15]=8'h00;
                 datamem[16]=8'h00;datamem[17]=8'h00;datamem[18]=8'h00;datamem[19]=8'h00;
                 datamem[20]=8'h00;datamem[21]=8'h00;datamem[22]=8'h00;datamem[23]=8'h00;
    
                     end
        end
        
             always @(*)
                begin
                    if ((memread==1)&&(memwrite==0))
                        begin
                        readdata={datamem[address+3],datamem[address+2],datamem[address+1],datamem[address]};
                        
                        end
                        
                        else if((memwrite==1)&&(memread==0))
                        begin
                        datamem[address]=writedata;
                        end
                end
               
    
    
    
    
endmodule

