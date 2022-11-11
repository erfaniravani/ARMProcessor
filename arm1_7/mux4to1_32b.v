////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                      MUX 4 input 1 out put 32bit                        //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: Amirmahdi Joudi						                                         //
// Date: 05-19-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module mux4to1_32b (i0, i1, i2, i3, sel, y);
  input [31:0] i0, i1, i2, i3;
  input [1:0]sel;
  output [31:0] y;
  
  assign y = (sel==2'b11) ? i3 :
             (sel==2'b10) ? i2 :
             (sel==2'b01) ? i1: i0;
  
endmodule

