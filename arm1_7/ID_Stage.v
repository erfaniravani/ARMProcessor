////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                       Instruction_Decode Stage		                        //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: Erfan Iravani								                                         //
// Date: 04-16-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module ID_Stage(
  input clk , rst ,
  //from IF_reg
  input [31:0] Instructions ,
  // from WB_Stage 
  input[31:0] Result_WB,
  input writeBackEnable,
  input[3:0] Dest_wb,
  //from hazard detect module
  input hazard,
  //from status register
  input[3:0] SR,
  //to next stage
  output WB_EN, MEM_R_EN, MEM_W_EN, B, S,
  output[3:0] EXE_CMD,
  output[31:0] VAL_Rn, VAL_Rm,
  output imm,
  output[11:0] Shift_operand,
  output[23:0] Signed_imm_24,
  output[3:0] Dest,
  //to hazard detect module
  output[3:0] src1, src2,
  output TWO_src  
);

  wire ok, okn, okn_h_or;
  wire wb_en, mem_r_en, mem_w_en, b, s;
  wire imm_n;
  wire[3:0] exe_cmd;
  wire[3:0] rfmux;

  Condition_Check COND_CHK(Instructions[31:28], SR, ok);

  ControlUnit CU(Instructions[20], Instructions[24:21], Instructions[27:26], wb_en, mem_r_en, mem_w_en, exe_cmd, b, s);

  mux2to1_9b CUMUX({wb_en, mem_r_en, mem_w_en, exe_cmd, b, s}, 9'b0, okn_h_or, {WB_EN, MEM_R_EN, MEM_W_EN, EXE_CMD, B, S});

  mux2to1_4b RFMUX(Instructions[3:0], Instructions[15:12], mem_w_en , rfmux);
  
  RegisterFile RF(clk, rst, Instructions[19:16], rfmux, Dest_wb, Result_WB, writeBackEnable, VAL_Rn, VAL_Rm);

  not(okn, ok);

  or(okn_h_or, okn, hazard);
  
  not(imm_n, Instructions[25]);
  
  or(TWO_src, imm_n, MEM_W_EN);
  
  assign imm = Instructions[25];
  
  assign Dest = Instructions[15:12];
  
  assign Shift_operand = Instructions[11:0];
  
  assign Signed_imm_24 = {{16{Instructions[7]}}, Instructions[7:0]};
  
  assign src1 = Instructions[19:16];
  
  assign src2 = rfmux;
  
endmodule
