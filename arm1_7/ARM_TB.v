////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                        Instruction_Fetch Stage		                        //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: Erfan Iravani								                                         //
// Date: 10-04-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module ARM_TB();
  reg clk, rst, switch;
  
  ARM ARM_PROCESSOR(clk, rst, switch);
  
  initial
  begin
    rst = 1'b1;
    clk = 1'b0;
    switch = 1'b0;
    #50 rst = 1'b0;
    #15000 $stop;
  end
  
  always
  begin
    #10 clk = ~clk;
  end
  
endmodule
