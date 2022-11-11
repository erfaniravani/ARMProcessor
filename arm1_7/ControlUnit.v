////////////////////////////////////////////////////////////////////////////////
//                              ARM Architecture:	                    		      //	
// 		                             Control Unit	                               //
// Created by: Amirmahdi Joudi		                                              //
// Revision by: Erfan Iravani								                                         //
// Date: 04-16-2021								                                                   //
////////////////////////////////////////////////////////////////////////////////

module ControlUnit(
  input s,
  input [3:0] Op_code,
  input [1:0] mode,
  output reg WB_Enable, mem_read, mem_write,
  output reg [3:0] ExecuteCommand,
  output reg B, status
);

  always@(s, Op_code, mode) begin
    {WB_Enable, mem_read, mem_write, ExecuteCommand, B, status} = {8'b0,s};
    case(mode)
      //RType
      2'b00: begin
        case(Op_code)
          //MOV
          4'b1101:{WB_Enable, ExecuteCommand} = 5'b10001;
          //MVN
          4'b1111:{WB_Enable, ExecuteCommand} = 5'b11001;
          //ADD
          4'b0100:{WB_Enable, ExecuteCommand} = 5'b10010;
          //ADC
          4'b0101:{WB_Enable, ExecuteCommand} = 5'b10011;
          //SUB
          4'b0010:{WB_Enable, ExecuteCommand} = 5'b10100;
          //SBC
          4'b0110:{WB_Enable, ExecuteCommand} = 5'b10101;
          //AND
          4'b0000:{WB_Enable, ExecuteCommand} = 5'b10110;
          //ORR
          4'b1100:{WB_Enable, ExecuteCommand} = 5'b10111;
          //EOR
          4'b0001:{WB_Enable, ExecuteCommand} = 5'b11000;
          //CMP
          4'b1010:{ExecuteCommand} = 4'b0100;
          //TST
          4'b1000:{ExecuteCommand} = 4'b0110;
        endcase
      end
      2'b01: begin
        ExecuteCommand = 4'b0010;
        case(s)
          //LDR
          1'b1:{WB_Enable, mem_read, status} = {3'b110};
          //STR
          1'b0:{mem_write, status} = {2'b10};
        endcase
      end
      2'b10:begin
        //branch
        {B, status} = 2'b10;
      end
    endcase
  end
  
endmodule