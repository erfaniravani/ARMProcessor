////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                            Forwarding Unit		                            //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: 								                                                      //
// Date: 18-05-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module ForwardingUnit(src1, src2, MEM_WB_EN, WB_WB_EN, MEM_DEST, WB_DEST, sel_src1, sel_src2);
  input [3:0] src1, src2;
  input [3:0] MEM_DEST, WB_DEST;
  input MEM_WB_EN, WB_WB_EN;
  output reg[1:0] sel_src1, sel_src2;
  
  always@(src1, src2, MEM_WB_EN, WB_WB_EN, MEM_DEST, WB_DEST)
  begin
    if((src1 == MEM_DEST) && (MEM_WB_EN==1'b1))
      sel_src1 <= 2'b01;
    else if((src1 == WB_DEST) && (WB_WB_EN==1'b1))
      sel_src1 <= 2'b10;
    else
      sel_src1 <= 2'b00;
    
    if((src2 == MEM_DEST) && (MEM_WB_EN==1'b1))
      sel_src2 <= 2'b01;
    else if((src2 == WB_DEST) && (WB_WB_EN==1'b1))
      sel_src2 <= 2'b10;
    else
      sel_src2 <= 2'b00;
  end

endmodule