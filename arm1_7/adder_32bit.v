////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                        Instruction_Fetch Stage		                        //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: Erfan Iravani								                                         //
// Date: 10-04-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module adder_32bit (a , b, cin, cout, sum);
  input [31:0] a, b;
  input cin;
  output cout;
  output [31:0] sum;
  
  assign {cout, sum} = a + b + cin;
  
endmodule
