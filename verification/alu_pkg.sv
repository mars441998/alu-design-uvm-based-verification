//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_package
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

package alu_pkg;
  import uvm_pkg::*;

  `include "alu_transaction.sv"
  `include "alu_sequence.sv"
  `include "alu_monitor.sv"
  `include "alu_driver.sv"
  `include "alu_agent.sv"
  `include "alu_scoreboard.sv"
  `include "alu_config.sv"
  `include "alu_env.sv"
  `include "alu_test.sv"
endpackage: alu_pkg
