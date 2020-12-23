//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_env
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

`include "alu_agent.sv"
`include "alu_scoreboard.sv"

class alu_env extends uvm_env;
  //UVM Factory registration
  `uvm_component_utils(alu_env)

  //Calling agent anf scoreboard objects
  alu_agent a_agent;
  alu_scoreboard a_sb;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Building components of agent and scoreboard
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a_agent = alu_agent::type_id::create(.name("a_agent"), .parent(this))     ;
    a_sb    = alu_scoreboard::type_id::create(.name("a_agent"), .parent(this));
  endfunction //build_phase end

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    a_agent.monitor_obj.connect(a_sb.item_col.analysis_export);
  endfunction //connect phase
endclass: alu_env