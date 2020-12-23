//////////////////////////////////////////////////////////////////////////////////
// Company       : Self-made
// Engineer      : Muhammad Abdur-Rehman Siddiqui
//
// Create Date   : 15:54:41 12/06/2020
// Design Name   :
// Module Name   : alu_scoreboard
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

class alu_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(alu_scoreboard)

  //Analysis port declaration
  uvm_tlm_analysis_fifo #(alu_transaction) item_col;

  alu_transaction transaction_item;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Building components
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_col = new("item_col", this);
  endfunction

  task run();
    forever begin
      compare();
    end
  endtask

  virtual function void compare();
    item_col.get(transaction_item);

    if(transaction_item.op == 3'b000) begin
      if(transaction_item.in_1 == transaction_item.out_res) begin
        `uvm_info(get_type_name(), $sformatf("Value of 1st input = %0d, Value of 2nd input = %0d, Value of Result = %0d Test Pass", transaction_item.in_1, transaction_item.in_2, transaction_item.out_res), UVM_LOW)
      end
      else begin
        `uvm_info(get_type_name(), $sformatf("Test Failed"), UVM_LOW)
      end
    end

    if(transaction_item.op == 3'b001) begin
      if(transaction_item.in_1 + transaction_item.in_2 == transaction_item.out_res) begin
        `uvm_info(get_type_name(), $sformatf("Value of 1st input = %0d, Value of 2nd input = %0d, Value of Result = %0d Test Pass", transaction_item.in_1, transaction_item.in_2, transaction_item.out_res), UVM_LOW)
      end
      else begin
        `uvm_info(get_type_name(), $sformatf("Test Failed"), UVM_LOW)
      end
    end

    if(transaction_item.op == 3'b010) begin
      if(transaction_item.in_1 - transaction_item.in_2 == transaction_item.out_res) begin
        `uvm_info(get_type_name(), $sformatf("Value of 1st input = %0d, Value of 2nd input = %0d, Value of Result = %0d Test Pass", transaction_item.in_1, transaction_item.in_2, transaction_item.out_res), UVM_LOW)
      end
      else begin
        `uvm_info(get_type_name(), $sformatf("Test Failed"), UVM_LOW)
      end
    end

    if(transaction_item.op == 3'b011) begin
      if(transaction_item.in_1 & transaction_item.in_2 == transaction_item.out_res) begin
        `uvm_info(get_type_name(), $sformatf("Value of 1st input = %0d, Value of 2nd input = %0d, Value of Result = %0d Test Pass", transaction_item.in_1, transaction_item.in_2, transaction_item.out_res), UVM_LOW)
      end
      else begin
        `uvm_info(get_type_name(), $sformatf("Test Failed"), UVM_LOW)
      end
    end

    if(transaction_item.op == 3'b100) begin
      if(transaction_item.in_1 | transaction_item.in_2 == transaction_item.out_res) begin
        `uvm_info(get_type_name(), $sformatf("Value of 1st input = %0d, Value of 2nd input = %0d, Value of Result = %0d Test Pass", transaction_item.in_1, transaction_item.in_2, transaction_item.out_res), UVM_LOW)
      end
      else begin
        `uvm_info(get_type_name(), $sformatf("Test Failed"), UVM_LOW)
      end
    end

    if(transaction_item.op == 3'b101) begin
      if(transaction_item.in_1 + 1 == transaction_item.out_res) begin
        `uvm_info(get_type_name(), $sformatf("Value of 1st input = %0d, Value of 2nd input = %0d, Value of Result = %0d Test Pass", transaction_item.in_1, transaction_item.in_2, transaction_item.out_res), UVM_LOW)
      end
      else begin
        `uvm_info(get_type_name(), $sformatf("Test Failed"), UVM_LOW)
      end
    end

    if(transaction_item.op == 3'b110) begin
      if(transaction_item.in_1 - 1 == transaction_item.out_res) begin
        `uvm_info(get_type_name(), $sformatf("Value of 1st input = %0d, Value of 2nd input = %0d, Value of Result = %0d Test Pass", transaction_item.in_1, transaction_item.in_2, transaction_item.out_res), UVM_LOW)
      end
      else begin
        `uvm_info(get_type_name(), $sformatf("Test Failed"), UVM_LOW)
      end
    end

    if(transaction_item.op == 3'b111) begin
      if(transaction_item.in_2 == transaction_item.out_res) begin
        `uvm_info(get_type_name(), $sformatf("Value of 1st input = %0d, Value of 2nd input = %0d, Value of Result = %0d Test Pass", transaction_item.in_1, transaction_item.in_2, transaction_item.out_res), UVM_LOW)
      end
      else begin
        `uvm_info(get_type_name(), $sformatf("Test Failed"), UVM_LOW)
      end
    end
  endfunction
endclass
