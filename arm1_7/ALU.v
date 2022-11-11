////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                             Control Unit	                               //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: Amirmahdi Joudi									                                      //
// Date: 04-23-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module ALU(in1, in2, exe_com, out, cin,
  n, z, c, v
);

  input[31:0] in1, in2;
  input[3:0] exe_com;
  input cin;
  output n, z;
  output reg c, v;
  output reg[31:0] out;
  
  always@(in1, in2, exe_com, cin)
  begin
    c = 1'b0;
    case(exe_com)
      //MOV
      4'b0001: out <= in2;
      //MVN
      4'b1001: out <= ~in2;
      //ADD LDR STR
      4'b0010: {c, out} <= in1 + in2;
      //ADC
      4'b0011: {c, out} <= in1 + in2 + cin;
      //SUB CMP
      4'b0100: {c, out} <= in1 - in2;
      //SBC
      4'b0101: {c, out} <= in1 - in2 - {31'b0, ~cin};
      //AND TST
      4'b0110: out <= in1 & in2;
      //ORR
      4'b0111: out <= in1 | in2;
      //EOR
      4'b1000: out <= in1 ^ in2;
      //B
      default: out <= 32'b0;
    endcase
  end
  
  always@(in1, in2, out, exe_com)
  begin
    v<=1'b0;
    case(exe_com)
      4'b0010: v <= in1[31]&in2[31]&(~out[31]) | (~in1[31])&(~in2[31])&out[31];
      4'b0011: v <= in1[31]&in2[31]&(~out[31]) | (~in1[31])&(~in2[31])&out[31];
      4'b0100: v <= in1[31]&(~in2[31])&(~out[31]) | (~in1[31])&in2[31]&out[31];
      4'b0101: v <= in1[31]&(~in2[31])&(~out[31]) | (~in1[31])&in2[31]&out[31];
    endcase
  end
    
    assign n = out[31];
    assign z = (out == 32'b0) ? 1'b1 : 1'b0;
    
endmodule