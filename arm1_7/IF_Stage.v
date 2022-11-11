////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                        Instruction_Fetch Stage		                        //
// Created by:	Amirmahdi Joudi					                                           //
// Revision by: Erfan Iravani								                                         //
// Date: 10-04-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module IF_Stage(
  input clk , rst , freeze , Branch_taken ,
  input [31:0] BranchAdder , 
  output [31:0] PC , Instruction);
  
  wire [31:0] addr, adder_out, inst, PC_mux;
  
  adder_32bit ADDER(addr , 32'd4, 1'b0, , adder_out);
    
  mux2to1_32b PC_MUX(adder_out, BranchAdder, Branch_taken, PC_mux);
  
  Reg_32b PC_REG(PC_mux, rst, clk, freeze, addr);
  
  inst_mem INST_MEM(addr, inst);
  
  
  assign PC = addr;
  assign Instruction = inst;
  
endmodule
