//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_monitor
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

`define monitor_inf vif.monitor_block

class alu_monitor extends uvm_monitor;

virtual alu_if vif;
  `uvm_component_utils(alu_monitor)

  uvm_analysis_port #(alu_transaction) item_col_port;
  alu_transaction seq_col;
  alu_transaction item_col;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    seq_col = new();
    item_col_port = new("item_col_port", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_if)::get(this, "", "vif",vif))
      `uvm_fatal("NO_VIF", {"Virtual Interface must be set for: ", get_full_name(), ".vif"});
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk)
      seq_col.in_1 = vif.in_1;
      seq_col.in_2 = vif.in_2;
      seq_col.op = vif.op;

      @(posedge vif.clk)
      seq_col.out_res = vif.out_res;

      @(posedge vif.clk)

      `uvm_info(get_type_name(),$sformatf("From monitor the result is 32'b %b", seq_col.out_res).UVM_MEDIUM)
      $cast(item_col, seq_col.clone());
      item_col_port.write(item_col);
    end
  endtask
endclass