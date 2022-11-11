////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                      MUX 2 input 1 out put 9bit	                        //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: Erfan Iravani								                                         //
// Date: 04-16-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module mux2to1_9b (i0, i1, sel, y);
  input [8:0] i0, i1;
  input sel;
  output [8:0] y;
  
  assign y = (sel==1'b1) ? i1 : i0;
  
endmodule



