//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_agent
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

`include "alu_transaction.sv"
`include "alu_sequence.sv"
`include "alu_driver.sv"
`include "alu_monitor.sv"

class alu_agent extends uvm_agent;

  //UVM factory registration
  `uvm_component_utils(alu_agent)


  //Handles initialization for monitor, driver and sequencer
  alu_monitor monitor_obj;
  alu_driver alu_drvr;
  uvm_sequencer #(alu_transaction) alu_seqr;

  //Constructor call for agent
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction


  //Building the objects for handles
  function void build_phase(uvm_phase);
    super.build_phase(phase);
    alu_seqr = uvm_sequencer#(alu_transaction)::type_id::create(.name("alu_seqr"), .parent(this));
    alu_drvr = alu_driver::type_id::create(.name("alu_drvr"), .parent(this));
    monitor_obj = alu_monitor ::type_id::create(.name("monitor_obj"), .parent(this));
  endfunction


  //Connecting driver port with sequencer export port
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    alu_drvr.seq_item_port.connect(alu_seqr.seq_item_export);
  endfunction
  
endclass: alu_agent
