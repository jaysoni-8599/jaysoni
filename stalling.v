`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2023 23:52:02
// Design Name: 
// Module Name: stalling
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


module stalling(
input ID_EX_memread,
input[4:0] Rd_Id_Ex,
input [4:0]Rs1_If_Id,
input[4:0]Rs2_If_Id,
output clear,
output stop,
output enable

    );
reg flag_clear,flag_stop,en;
assign clear=flag_clear;
assign stop=flag_stop;
assign enable=en;


always @(*)
  begin
    if((ID_EX_memread==1)&&((Rd_Id_Ex==Rs1_If_Id)|(Rd_Id_Ex==Rs1_If_Id)))
      begin
      flag_clear=1;
      flag_stop=0;
      en=1;
      end
    else
     begin
     flag_clear=0;
      flag_stop=1;
      en=0;
     end    
  end
  
endmodule
