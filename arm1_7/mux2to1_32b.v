////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                      MUX 2 input 1 out put 32bit	 	                     //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: Erfan Iravani								                                         //
// Date: 10-04-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module mux2to1_32b (i0, i1, sel, y);
  input [31:0] i0, i1;
  input sel;
  output [31:0] y;
  
  assign y = (sel==1'b1) ? i1 : i0;
  
endmodule


