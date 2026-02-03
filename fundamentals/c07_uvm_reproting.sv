import uvm_pkg::*;
`include "uvm_macros.svh"

class rpting extends uvm_component;
    `uvm_component_utils(rpting)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    task run();
        uvm_report_info(get_full_name(), "info Message:Verbo lvl - UVM_LOW", UVM_LOW);
        #5 uvm_report_info(get_full_name(), "info Message:Verbo lvl - 150", 150);
        #5 uvm_report_info(get_full_name(), "info Message:Verbo lvl - UVM_MEDIUM", UVM_MEDIUM);
        uvm_report_warning(get_full_name(), "Warning message from rpting", UVM_LOW);
        uvm_report_error(get_full_name(), "error message from rpting\n\n", UVM_NONE); 
    endtask
endclass

module c07_tb;
    rpting rpt1;
    rpting rpt2;
    rpting rpt3;

    initial begin
        rpt1 = new("rpt1", null);
        rpt2 = new("rpt2", null);
        rpt3 = new("rpt3", null);

        rpt1.set_report_verbosity_level(UVM_MEDIUM);
        rpt2.set_report_verbosity_level(UVM_MEDIUM);
        rpt3.set_report_verbosity_level(UVM_MEDIUM);

        run_test();
    end
endmodule
