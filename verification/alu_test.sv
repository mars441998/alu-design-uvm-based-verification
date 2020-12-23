//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_test
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

`include "alu_env.sv"

class alu_test extends uvm_test;

  //UVM Factory registration
  `uvm_component_utils(alu_test)

  //Calling environment
  alu_env a_env;

  //Calling constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Building components of environment
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a_env = alu_env::type_id::create(.name("a_env"), .parent(this));
  endfunction //build_phase end

  task run_phase(uvm_phase phase);
    //Calling sequence object
    alu_sequence a_seq;

    phase.raise_objection(.obj(this));
    //Creating sequence object

    a_seq = alu_sequence::type_id::create(.name("a_seq"), .contxt(get_full_name()));
    assert(a_seq.randomize());
    a_seq.start(a_env.a_agent.a_seqr);
    phase.drop_objection(.obj(this));

  endtask //run phase
endclass: alu_test
