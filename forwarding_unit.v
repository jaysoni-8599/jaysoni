`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2023 22:08:52
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit(
input [4:0]RS1_ID_EX,
input[4:0]RS2_ID_EX,
input [4:0]RD_EX_MEM,
input[4:0]RD_MEM_WB,
input EX_MEM_regwrite,
input MEM_WB_regwrite,
output reg [1:0]RS1,
output reg [1:0]RS2

    );
    
    
    always @(*)
     begin
     if ((EX_MEM_regwrite==1)&&(RS1_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0))
       begin
            RS1=2'b01;
            if ((EX_MEM_regwrite==1)&&(RS2_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0))
             begin
                RS2=2'b01;
             end
            else if ((~((EX_MEM_regwrite==1)&&(RS2_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0)))&&(MEM_WB_regwrite==1)&&(RS2_ID_EX==RD_MEM_WB)&&(RD_MEM_WB!=0))
                RS2=2'b10;
            else 
                RS2=2'b00;  
       end 
       
      else if ((EX_MEM_regwrite==1)&&(RS2_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0))
       begin
            RS2=2'b01;
            if ((~((EX_MEM_regwrite==1)&&(RS1_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0)))&&(MEM_WB_regwrite==1)&&(RS1_ID_EX==RD_MEM_WB)&&(RD_MEM_WB!=0))
             begin
                RS1=2'b10;
             end
            else 
                RS1=2'b00;
       end 
         
       else if((~((EX_MEM_regwrite==1)&&(RS2_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0)))&&(MEM_WB_regwrite==1)&&(RS2_ID_EX==RD_MEM_WB)&&(RD_MEM_WB!=0))
             begin 
                RS2=2'b10;
                  if ((~((EX_MEM_regwrite==1)&&(RS1_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0)))&&(MEM_WB_regwrite==1)&&(RS1_ID_EX==RD_MEM_WB)&&(RD_MEM_WB!=0))
                     begin
                        RS1=2'b10;
                     end
                else 
                RS1=2'b00;
              end
         
         else if ((~((EX_MEM_regwrite==1)&&(RS1_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0)))&&(MEM_WB_regwrite==1)&&(RS1_ID_EX==RD_MEM_WB)&&(RD_MEM_WB!=0))
             begin
                RS1=2'b10;
                RS2=2'b00;
                end
            
         
                
         else 
           begin
           RS1=2'b00;
           RS2=2'b00;  
           end
      end   
         
         
         
//     else if((EX_MEM_regwrite==1)&&(RS2_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0))
//       begin
//        RS1=2'b00;
//       RS2=2'b01;
//       end  
//     else if((~((EX_MEM_regwrite==1)&&(RS1_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0)))&&(MEM_WB_regwrite==1)&&(RS1_ID_EX==RD_MEM_WB)&&(RD_MEM_WB!=0))
//        begin
//        RS1=2'b10;
//       RS1=2'b00;
//        end 
//        else if((~((EX_MEM_regwrite==1)&&(RS2_ID_EX==RD_EX_MEM)&&(RD_EX_MEM!=0)))&&(MEM_WB_regwrite==1)&&(RS2_ID_EX==RD_MEM_WB)&&(RD_MEM_WB!=0))
//          begin
//          RS1=2'b00;
//          RS2=2'b10;
//          end
//        else
//          begin
//          RS1=2'b00;
//          RS2=2'b00;
//          end
//     end
    
endmodule
