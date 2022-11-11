////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                            Condition Check                              //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: Erfan Iravani								                                         //
// Date: 04-16-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module Condition_Check(
  input[3:0] cond, status_bits,
  output reg ok
);
  
  wire n, z, c, v;
  assign n = status_bits[3];
  assign z = status_bits[2];
  assign c = status_bits[1];
  assign v = status_bits[0];
  
  always@(cond, n, z, c, v)
    case(cond)
      4'b0000: ok = (z==1'b1) ? 1'b1 : 1'b0;
      4'b0001: ok = (z==1'b0) ? 1'b1 : 1'b0;
      4'b0010: ok = (c==1'b1) ? 1'b1 : 1'b0;
      4'b0011: ok = (c==1'b0) ? 1'b1 : 1'b0;
      4'b0100: ok = (n==1'b1) ? 1'b1 : 1'b0;
      4'b0101: ok = (n==1'b0) ? 1'b1 : 1'b0;
      4'b0110: ok = (v==1'b1) ? 1'b1 : 1'b0;
      4'b0111: ok = (v==1'b0) ? 1'b1 : 1'b0;
      4'b1000: ok = ({c,z} == 2'b10) ? 1'b1 : 1'b0;
      4'b1001: ok = ({c,z} == 1'b01) ? 1'b1 : 1'b0;
      4'b1010: ok = (n == v) ? 1'b1 : 1'b0;
      4'b1011: ok = (n != v) ? 1'b1 : 1'b0;
      4'b1100: ok = (z==1'b0 && n == v) ? 1'b1 : 1'b0;
      4'b1101: ok = (z==1'b1 && n != v) ? 1'b1 : 1'b0;
      4'b1110: ok = 1'b1;
    endcase
    
endmodule