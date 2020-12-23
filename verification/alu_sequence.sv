//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_sequence
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

class alu_sequence extends uvm_sequence#(alu_transaction);
  `uvm_object_utils(alu_sequence)

  function new(string name = "");
    super.new(name);
  endfunction

  task body();
    alu_transaction alu_tx;

    repeat(20) begin
    alu_tx = alu_transaction::type_id::create(.name("alu_tx"), .contxt(get_full_name()));

    start_item(alu_tx);
    assert(alu_tx.randomize());
    `uvm_info("alu_sequence", alu_tx.sprint(), UVM_LOW);
    finish_item(alu_tx);
    end
  endtask //body
endclass: alu_sequence