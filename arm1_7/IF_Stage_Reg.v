////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                   Instruction_Fetch Stage Register		                    //
// Created by: Erfan Iravani					                                             //
// Revision by:	Amirmahdi Joudi							                                        //
// Date: 04-16-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module IF_Stage_Reg(
  input clk , rst , freeze , flush ,
  input [31:0] PC_in , Instruction_in , 
  output reg [31:0] PC , Instruction);
  
  always@(posedge clk, posedge rst)
  begin
    if(rst == 1'b1) begin
      PC <= 32'b0;
      Instruction <= 32'b0;
    end
    else begin
      if(flush == 1'b1) begin
        PC <= 32'b0;
        Instruction <= 32'b0;
      end
      else if(freeze == 1'b0) begin
        PC <= PC_in;
        Instruction <= Instruction_in;
      end
    end
  end  
  
endmodule