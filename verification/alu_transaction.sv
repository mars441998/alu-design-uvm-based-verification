//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_transaction
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

class alu_transaction extends uvm_sequence_item;
  rand bit [31:0]    in_1;
  rand bit [31:0]    in_2;
  rand bit [ 2:0]      op;
  logic    [31:0] out_res;

  function new(string name = "");
    super.new(name);
  endfunction

  // Transaction itms created for inputs and outputs
  `uvm_object_utils_begin(alu_transaction)
    `uvm_field_int(in_1   , UVM_ALL_ON)
    `uvm_field_int(in_2   , UVM_ALL_ON)
    `uvm_field_int(op     , UVM_ALL_ON)
    `uvm_field_int(out_res, UVM_ALL_ON)
  `uvm_object_utils_end

  constraint cons{A > B;};

endclass: alu_transaction