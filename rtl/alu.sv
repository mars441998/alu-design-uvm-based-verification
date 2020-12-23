//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : ALU_design
// Project Name  : Single cycle 16-bit ARM Microprocessor
// Target Devices:
// Tool versions : ISE Design Suite 14.7
// Description   : ALU module for the processor
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu
( 
  input             clk    ,
  input      [31:0] in_1   ,
  input      [31:0] in_2   ,
  input      [2:0 ] op     ,
  output reg [31:0] out_res
);

always @(posedge clk) begin
  case(op)
    3'b000: out_res = in_1       ;  //Passing 1st input to the output
    3'b001: out_res = in_1 + in_2;  //Adding both inputs
    3'b010: out_res = in_1 - in_2;  //Subtracting both inputs
    3'b011: out_res = in_1 & in_2;  //AND both inputs bitwise
    3'b100: out_res = in_1 | in_2;  //OR both inputs bitwise
    3'b101: out_res = in_1 + 1   ;  //Adding 1 in 1st input
    3'b110: out_res = in_1 - 1   ;  //Subtracting 1 from 1st input
    3'b111: out_res = in_2       ;  //Passing 2nd input directly to the output
  endcase
end //always block
endmodule