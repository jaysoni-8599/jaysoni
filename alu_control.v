`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:50:12
// Design Name: 
// Module Name: alu_control
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


module alu_control(
    input [3:0] fun,
    input [1:0] aluop,
    output [3:0] alu_control
    );
   reg [3:0] temp_control;
   assign alu_control=temp_control;
   
    always @(*)
        begin
        case(aluop)
        2'b10: begin  //r type
                    case(fun)
                        4'b0000:temp_control=4'b0001;//add control
                        4'b1000:temp_control=4'b0010;//sub control
                        4'b0111:temp_control=4'b0011;//and control
                        4'b0110:temp_control=4'b0100;//or control
                        4'b0001:temp_control=4'b0111;//shift left
                        4'b0101:temp_control=4'b1011;//shift right 
                        4'b0100:temp_control=4'b1000;//xor 
                        
                     endcase
                end
         2'b00:begin  //lw and sw
                       case(fun[2:0])
                       3'b010:temp_control=4'b0001;//add 
                       
                       endcase
                       
               end                
         2'b01: begin  //branch aluop
                        case(fun[2:0])
                        3'b000:temp_control=4'b0110;//for BEQ sub control
                        3'b100:temp_control=4'b1001;//for BLT 
                        3'b101:temp_control=4'b1010;//for BGE
                        3'b001:temp_control=4'b1100;//for BNE
                        endcase
                end       
     
        endcase
        end
    
endmodule
