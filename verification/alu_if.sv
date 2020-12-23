//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_interface
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

interface alu_if;

  //Declaration of logic signals of DUT
  logic clk;
  logic [31:0] in_1;
  logic [31:0] in_2;
  logic [31:0] out_res;
  logic [2:0] op;

//For driver as it will pass all the values to the monitor
  clocking driver_block @(posedge clk);
    default input #1 output #1;
    output in_1;
    output in_2;
    output op;
    input out_res;
  endclocking

//For monitor to get the logic signals and pass it to scoreboard
  clocking monitor_block @(posedge clk);
    default input #1 output #1;
    input in_1;
    input in_2;
    input op;
    output out_res;
  endclocking

  modport dri_ver (clocking driver_block, input clk);
  modport moni_tor (clocking monitor_block, input clk);
  
endinterface: alu_if