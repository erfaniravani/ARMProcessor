////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                            New Hazard Unit		                            //
// Created by: Amirmahdi Joudi 	                                              //
// Revision by:                				                                           //
// Date: 04-30-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////
module newHazardUnit(
  input Two_src,
  input [3:0] src1,
  input [3:0] src2,
  input [3:0] Exe_Dest,
  input MEM_R_EN,
  output reg hazard_detected
);

  always @(Two_src, src1, src2, Exe_Dest, MEM_R_EN) begin
    hazard_detected = 1'b0;
    
    if(MEM_R_EN == 1'b1) begin
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
      
  end 
  
  
endmodule
