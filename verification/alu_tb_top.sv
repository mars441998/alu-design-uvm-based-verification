//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : testbench
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

`include "alu_pkg.sv"
`include "alu.sv"
`include "alu_if.sv"

module alu_tb_top;
  import uvm_pkg::*;
  
  //Interface Declaration
  alu_if vif();
  
  //Connection of interface with DUT
  alu dut(vif.clk     ,
          vif.in_1    ,
          vif.in_2    ,
          vif.op      ,
          vif.out_res);

  initial begin
  //Registerting the interface in configuration database so other modules can use it

    uvm_resource_db#(virtual alu_if)::set(.scope("ifs"),.name("alu_if"),.val(vif));
    
    run_test();
  end //initial

  //Initializing clock variable
  initial begin
    vif.clk <= 1'b1;
  end


  //Clock generator
  always
    #5 vif.clk = ~ vif.clk;
endmodule
