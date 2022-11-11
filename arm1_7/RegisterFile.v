////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                             Register File	                              //
// Created by: Erfan Iravani			                                               //
// Revision by: Amirmahdi Joudi								                                       //
// Date: 04-16-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module RegisterFile(
  input clk , rst,
  input[3:0] srcl , src2 , Dest_wb ,
  input[31:0] Result_WB ,
  input writeBackEn ,
  output[31:0] reg1 ,reg2
  );
  
  reg [31:0] register_file [0:14];
  integer i;
  
  assign reg1 = register_file[srcl];
  assign reg2 = register_file[src2];
  
  always @(negedge clk)
    if (rst == 1'b1)
      for (i=0; i<15 ; i=i+1 )
        register_file[i] <= i;
    else if (writeBackEn == 1'b1)
      register_file[Dest_wb] <= Result_WB;
      
endmodule
