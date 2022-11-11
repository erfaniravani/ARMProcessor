////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                           Status Register		                             //
// Created by:	Amirmahdi Joudi							                                         //
// Revision by:	Amirmahdi Joudi							                                        //
// Date:	04-08-2021							                                                    //
////////////////////////////////////////////////////////////////////////////////

module StatusRegister(d_in, rst, en, clk, d_out);
  input [3:0] d_in;
  input rst, clk, en;
  output [3:0] d_out;
  reg [3:0] d_out;
  
  always @(negedge clk)
  begin
    if (rst==1'b1)
      d_out <= 4'd0;
    else if(en)
      d_out <= d_in;
  end
  
endmodule

