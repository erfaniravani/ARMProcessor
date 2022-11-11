////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                            Execution Stage 		                           //
// Created by:	Amirmahdi Joudi							                                         //
// Revision by: Amirmahdi Joudi                                               //
// Date:05-07-2021								                                                              //
////////////////////////////////////////////////////////////////////////////////

module EXE_Stage(
  input clk,
  input[3:0] EXE_CMD,
  input MEM_R_EN, MEM_W_EN,
  input[31:0] PC,
  input[31:0] Val_Rn, Val_Rm,
  input imm,
  input[11:0] Shift_operand,
  input[23:0] Signed_imm_24,
  input[3:0] SR,
  input[1:0] sel_src1, sel_src2,
  input[31:0] ALU_res, Result_WB,
  
  output[31:0] ALU_result, Br_addr, Val_Rm_o,
  output[3:0] status
);

  wire n, z, c, v;
  wire control_input;
  wire[31:0] Val2;
  wire[31:0] mux1_o, mux2_o;
  
  or(control_input, MEM_R_EN, MEM_W_EN);
  
  Val2Generator V2G(Shift_operand , imm , mux2_o , MEM_R_EN | MEM_W_EN , Val2);
  
  ALU alu(mux1_o, Val2, EXE_CMD, ALU_result, SR[1], n, z, c, v);
  
  adder_32bit  ADDER(({{8{Signed_imm_24[23]}}, Signed_imm_24} + 32'd1) << 2 , PC, 1'b0, , Br_addr);
  
  mux4to1_32b MUX1(Val_Rn, ALU_res, Result_WB, , sel_src1, mux1_o);
  
  mux4to1_32b MUX2(Val_Rm, ALU_res, Result_WB, , sel_src2, mux2_o);
  
  assign Val_Rm_o = mux2_o;
  
  assign status = {n, z, c, v};
  
endmodule

