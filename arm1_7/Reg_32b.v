////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                            32bit Register			                            //
// Created by:	Erfan Iravani							                                           //
// Revision by:	Amirmahdi Joudi							                                        //
// Date:	04-08-2021							                                                    //
////////////////////////////////////////////////////////////////////////////////

module Reg_32b (d_in, rst, clk, freeze, d_out);
  input [31:0] d_in;
  input rst, clk, freeze;
  output [31:0] d_out;
  reg [31:0] d_out;
  
  always @(posedge clk , posedge rst)
  begin
    if (rst==1'b1)
      d_out <= 32'd0;
    else if (freeze)
      d_out <= d_out;
    else
      d_out <= d_in;
  end
  
endmodule
