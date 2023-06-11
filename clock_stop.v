`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2023 21:38:21
// Design Name: 
// Module Name: clock_stop
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


module clock_stop(
    input clk,
    input stop,
    output clock_stop
    );
    reg clock;
    assign clock_stop=clock;
    always @(posedge clk)
     begin
       clock=clk&stop;
     end
endmodule
