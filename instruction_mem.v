`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:53:19
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(
    input [31:0] PC,
    input Reset,
    output [31:0] InstructionCode
    );
    reg [7:0]memory[36:0];
    assign InstructionCode={memory[PC+3],memory[PC+2],memory[PC+1],memory[PC]};
    
    
    always @(negedge Reset)
    begin
    if(Reset==0)
    begin
    
    
// memory[0]=8'h63;memory[1]=8'h06;memory[2]=8'h73;memory[3]=8'h00; //loop:beq t1,t2,l1
//memory[4]=8'h33;memory[5]=8'h03;memory[6]=8'h73;memory[7]=8'h40;  //sub t1,t1,t2
//memory[8]=8'hef;memory[9]=8'hf0;memory[10]=8'h9f;memory[11]=8'hff; // jal loop
//memory[12]=8'hb3;memory[13]=8'h83;memory[14]=8'h63;memory[15]=8'h40;//l1:sub t2,t2,t1
memory[0]=8'h03;memory[1]=8'ha3;memory[2]=8'h02;memory[3]=8'h00;  //lw t1,0(t0)
memory[4]=8'h83;memory[5]=8'ha3;memory[6]=8'h42;memory[7]=8'h00;  // lw t2,4(t0)
memory[8]=8'h63;memory[9]=8'h0c;memory[10]=8'h73;memory[11]=8'h00; // loop : beq t1,t2,go
memory[12]=8'h63;memory[13]=8'hc6;memory[14]=8'h63;memory[15]=8'h00;//       blt t2,t1,subadd
memory[16]=8'hb3;memory[17]=8'h83;memory[18]=8'h63;memory[19]=8'h40;//sub t2,t2,t1			
    memory[20]=8'hef;memory[21]=8'hf0;memory[22]=8'h5f;memory[23]=8'hff;//jal loop
    memory[24]=8'h33;memory[25]=8'h03; memory[26]=8'h73;memory[27]=8'h40;// subadd: sub t1,t1,t2
    memory[28]=8'hef;memory[29]=8'hf0;memory[30]=8'hdf;memory[31]=8'hfe;//  jal loop
    memory[32]=8'h23;memory[33]=8'ha4;memory[34]=8'h62;memory[35]=8'h00;// go:sw t1,8(to)
//     memory[12]=8'hef;memory[13]=8'hf0;memory[14]=8'h5f;memory[15]=8'hff;  //jal loop
//     memory[16]=8'h33;memory[17]=8'h09;memory[18]=8'h73;memory[19]=8'h40;//sub s2,t1,t2	
    //memory[8]=8'hb3;memory[9]=8'h8e;memory[10]=8'hc3;memory[11]=8'h01;//add t4,t2,t3
  
    
    //memory[8]=8'h33;memory[9]=8'h7e;memory[10]=8'h73;memory[11]=8'h00;// l1: and t3,t1,t2
    //memory[0]=8'h33;memory[1]=8'h0e;memory[2]=8'h73;memory[3]=8'h00;  //add t3,t1,t2
 // memory[0]=8'h03;memory[1]=8'ha3;memory[2]=8'h42;memory[3]=8'h00; // lw t1,4(t0)     t1=10
   //memory[4]=8'h33;memory[5]=8'h8f;memory[6]=8'hc3;memory[7]=8'h01;
  // memory[4]=8'h33;memory[5]=8'h0e;memory[6]=8'h73;memory[7]=8'h00;  //add t3,t1,t2    t3=10+130=140
  //memory[8]=8'hb3;memory[9]=8'h8e;memory[10]=8'hc3;memory[11]=8'h01;//add t4,t2,t3     t4=130+140=270
//     memory[0]=8'h03;memory[1]=8'ha3;memory[2]=8'h02;memory[3]=8'h00;//lw t1,0(t0)
//    memory[4]=8'h83;memory[5]=8'ha3;memory[6]=8'h42;memory[7]=8'h00;//lw t2,4(t0)
//    memory[8]=8'h03;memory[9]=8'hae;memory[10]=8'h82;memory[11]=8'h00;//   lw t3,8(t0)
//    memory[12]=8'hb3;memory[13]=8'h04;memory[14]=8'h73;memory[15]=8'h00;//   add s1,t1,t2			#s1=25h
//    memory[16]=8'h33;memory[17]=8'h09;memory[18]=8'h73;memory[19]=8'h40;//sub s2,t1,t2			#s2=5h
//    memory[20]=8'h33;memory[21]=8'h4a;memory[22]=8'h73;memory[23]=8'h00;//xor  s4,t1,t2			#s4=5h
//    memory[24]=8'hb3;memory[25]=8'h1a; memory[26]=8'hc3;memory[27]=8'h01;// sll s5,t1,t3			#s5=54h
//    memory[28]=8'h33;memory[29]=8'h6a;memory[30]=8'h73;memory[31]=8'h00;//  srl s6,t1,t3			#s6=05h
//    memory[32]=8'h33;memory[33]=8'h5b;memory[34]=8'hcb;memory[35]=8'h01;// srl s6,s6,t3			#s6=01h
//    memory[36]=8'h63;memory[37]=8'h04;memory[38]=8'h49;memory[39]=8'h01;//beq s2,s4,l1       		#jumps to l1
//    memory[40]=8'hef;memory[41]=8'h00;memory[42]=8'h80;memory[43]=8'h00;//jal l2 
//    memory[44]=8'hb3;memory[45]=8'h79;memory[46]=8'h73;memory[47]=8'h00;//l1: and s3,t1,t2          		#s3=10h
//    memory[48]=8'h33;memory[49]=8'h6a;memory[50]=8'h73;memory[51]=8'h00;//or  s4,t1,t2			#s4=15h
//    memory[52]=8'hef;memory[53]=8'h00;memory[54]=8'h80;memory[55]=8'h00;//jal l3      
//    memory[56]=8'h63;memory[57]=8'h44;memory[58]=8'h4b;memory[59]=8'h01;//l2: blt s6,s4,l4		# jumps to l4
//    memory[60]=8'he3;memory[61]=8'h9e;memory[62]=8'h6a;memory[63]=8'hff;//l3: bne s5,s6,l2     		#it will go to l2
//    memory[64]=8'h63;memory[65]=8'h54;memory[66]=8'h3a;memory[67]=8'h01;//l4: bge s4,s3,l5		#will branch to l5
//    memory[68]=8'hb3;memory[69]=8'h04;memory[70]=8'h73;memory[71]=8'h00;//add s1,t1,t2			#s1=25h
//    memory[72]=8'h23;memory[73]=8'ha6;memory[74]=8'h32;memory[75]=8'h01;//l5: sw s3,12(t0) 		# 10 h stored at t0+12 loc
//    memory[76]=8'h23;memory[77]=8'ha8;memory[78]=8'h42;memory[79]=8'h01;//sw s4,16(t0)		# 15 h stored at t0+16 loc
    end
   
    
    
    
    end
    
    
endmodule
