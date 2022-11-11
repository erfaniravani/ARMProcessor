////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                           Write_Back Stage 			                          //
// Created by:Amirmahdi Joudi			                                              //
// Revision by:Erfan Iravani								                                          //
// Date:05-07-2021                                                            //
////////////////////////////////////////////////////////////////////////////////

module WB_Stage(
  input[31:0] ALU_result, MEM_result,
  input MEM_R_en,
  output [31:0] out
);
  
  mux2to1_32b WB_MUX(ALU_result, MEM_result, MEM_R_en, out);
  
endmodule



