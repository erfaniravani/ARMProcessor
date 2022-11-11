////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                        Instruction_Fetch Stage		                        //
// Created by: Erfan Iravani   	                                              //
// Revision by: Amirmahdi Joudi				                                           //
// Date: 04-30-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////
module hazard_Detection_Unit(
  input Two_src,
  input [3:0] src1,
  input [3:0] src2,
  input [3:0] Exe_Dest,
  input Exe_WB_EN,
  input [3:0] Mem_Dest,
  input Mem_WB_EN,
  output reg hazard_detected
);

  always @(Two_src, src1, src2, Exe_Dest, Exe_WB_EN, Mem_Dest, Mem_WB_EN) begin
    hazard_detected = 1'b0;
    
    if(Exe_WB_EN == 1'b1) begin
      if(Two_src == 1'b1) begin
        if(src1 == Exe_Dest || src2 == Exe_Dest) begin
          hazard_detected <= 1'b1;
        end
      end
      else if(Two_src == 1'b0) begin
        if(src1 == Exe_Dest) begin
          hazard_detected <= 1'b1;
        end
      end
    end
    
    
    if(Mem_WB_EN == 1'b1) begin
      if(Two_src == 1'b1) begin
        if(src1 == Mem_Dest || src2 == Mem_Dest) begin
          hazard_detected <= 1'b1;
        end
      end
      else if(Two_src == 1'b0) begin
        if(src1 == Mem_Dest) begin
          hazard_detected <= 1'b1;
        end
      end
    end
      
  end 
  
  
endmodule