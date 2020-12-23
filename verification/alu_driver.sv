//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_driver
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

//Defining driver interface so it can communicate with DUT
`define driver_inf vif.dri_ver.driver_block

class alu_driver extends uvm_driver#(alu_tx);

  //UVM factory registration
  `uvm_component_utils(alu_driver)

  //Calling virtual interface object
  virtual alu_if vif;

  //Constructor call for driver
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Building the driver object
  function void build_phase (uvm_phase phase)
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_if)::get(this, ::,"vif",vif))
      `uvm_fatal("No virtual interface", {"Virtual Interface must be set for: ",get_full_name(),".vif"});
  endfunction


  virtual task run_phase(uvm_phase phase);
    forever begin
      //Get input transaction
      seq_item_port.get_next_item(alu_tx);
      drive();
      seq_item_port.item_done();
    end
  endtask


  virtual task drive();
    @(posedge vif.clk)
    //Sending each input to the initialized ports of Virtual interface
    vif.in_1 <= alu_tx.in_1;
    vif.in_2 <= alu_tx.in_2;
    vif.op   <= alu_tx.op;
    repeat(2)
    
    @(posedge vif.clk)

    alu_tx.op_res <= vif.out_res;
  endtask
endclass