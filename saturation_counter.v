`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 15:48:19
// Design Name: 
// Module Name: saturation_counter
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


module saturation_counter(
  input update,
  input [1:0] presentstate,
  output reg [1:0] updated_state
    );
    
    always @(presentstate,update)
      begin
      case(presentstate)
      2'b00:if(update==1)
            updated_state=2'b01;
            else
            updated_state=2'b00;
     2'b01:if(update==1)
            updated_state=2'b10;
            else
            updated_state=2'b00;
     2'b10:if(update==1)
            updated_state=2'b01;
            else        
            updated_state=2'b11;
     2'b11:if(update==1)
           updated_state=2'b10;
           else
           updated_state=2'b11;       
                  
      endcase
      end 
    
endmodule
