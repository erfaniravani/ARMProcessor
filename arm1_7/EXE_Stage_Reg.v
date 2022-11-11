////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                      Execution Stage Register		                         //
// Created by:Erfan Iravani								                                           //
// Revision by:Amirmahdi Joudi							                                         //
// Date:05-07-2021								                                                    //
////////////////////////////////////////////////////////////////////////////////

module EXE_Stage_Reg(
  input clk, rst, freeze, WB_en_in, MEM_R_EN_in, MEM_W_EN_in,
  input [31:0] ALU_result_in, ST_val_in,
  input [3:0] Dest_in,
  output reg WB_en, MEM_R_EN, MEM_W_EN,
  output reg [31:0] ALU_result, ST_val,
  output reg[3:0]Dest
);
  
  always@(posedge clk , posedge rst)
  begin
    if (rst == 1'b1) begin
      WB_en <= 1'b0;
      MEM_R_EN <= 1'b0;
      MEM_W_EN <= 1'b0;
      ALU_result <= 32'b0;
      ST_val <= 32'b0;
      Dest <= 4'b0;
    end
    else if(freeze == 1'b0) begin
      WB_en <= WB_en_in;
      MEM_R_EN <= MEM_R_EN_in;
      MEM_W_EN <= MEM_W_EN_in;
      ALU_result <= ALU_result_in;
      ST_val <= ST_val_in;
      Dest <= Dest_in;
    end 
  end
  
endmodule

