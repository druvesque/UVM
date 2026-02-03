import uvm_pkg::*;
`include "uvm_macros.svh"

class mem_seq_item extends uvm_sequence_item;
    rand bit [3:0] addr;
    rand bit       wr_en;
    rand bit       rd_en;

    rand bit [7:0] wdata;

    bit [7:0] rdata;

    `uvm_object_utils_begin(mem_seq_item)
        `uvm_field_int(addr,  UVM_ALL_ON)
        `uvm_field_int(wr_en, UVM_ALL_ON)
        `uvm_field_int(rd_en, UVM_ALL_ON)
        `uvm_field_int(wdata, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "mem_seq_item");
        super.new(name);
    endfunction

    constraint wr_rd_c { wr_en != rd_en; };
endclass

module seq_item_tb_clone;
    mem_seq_item s0;
    mem_seq_item s1;

    initial begin
        s0 = mem_seq_item::type_id::create("s0");
        void'(s0.randomize());
        s0.print();
        $cast(s1, s0.clone());
        s1.print();
        s1.addr = 8;
        s1.wdata = 'h56;
        `uvm_info("", "Printing s0", UVM_LOW)
        s0.print();
        `uvm_info("", "Printing s1", UVM_LOW)
        s1.print();
    end
endmodule
