`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 12:14:41
// Design Name: 
// Module Name: immgen
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


module immgen(
    input [31:0] incode,
    input [1:0]immsel,
    output [31:0] immdata
    );
    reg [31:0]temp;
    assign immdata=temp;
    
    always @(*)
    begin
     
    if (immsel==2'b00)//lw
    begin
    temp={{20{incode[31]}},incode[31:20]};
    end
    else if(immsel==2'b01)//sw
    begin
    temp={{20{incode[31]}},incode[31:25],incode[11:7]};
    end
    else if(immsel==2'b10)//branch
    begin
    temp={{20{incode[31]}},incode[31],incode[7],incode[30:25],incode[11:8]};
    end
    else if(immsel==2'b11)//jump
    begin
    temp={{12{incode[31]}},incode[31],incode[19:12],incode[20],incode[30:21]};
    end
        
    end
    
endmodule

