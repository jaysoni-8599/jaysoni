`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 14:18:01
// Design Name: 
// Module Name: mux_three
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


module mux_three( 
input [31:0]a,
input [31:0]b,
input [31:0]c,
input [1:0]sel,
output [31:0]in

    );
   reg [31:0] data;
   
   assign in=data;
   
   always @(*)
     begin
      if (sel==2'b00)
        data=a;
        
        else if(sel==2'b01)
        data=b;
        
        else if(sel==2'b10)
         data=c;
        
        else 
        data =a;
        
      end 
   
endmodule
