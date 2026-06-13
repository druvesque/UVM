import uvm_pkg::*;
`include "uvm_macros.svh"

class A extends uvm_agent;
    `uvm_component_utils(A)
    function new(string name = "A", uvm_component parent);
      super.new(name, parent);
      `uvm_info(get_full_name(), $sformatf(" A new"), UVM_LOW)
    endfunction
    
    virtual function hello();
      `uvm_info(get_full_name(), $sformatf("HELLO from original class A"), UVM_LOW)         
    endfunction
endclass

class A_ovr extends A;
    `uvm_component_utils(A_ovr)
    function new(string name = "A_ovr", uvm_component parent);
      super.new(name, parent);
      `uvm_info(get_full_name(), $sformatf(" A_ovr new"), UVM_LOW)
    endfunction

    virtual function hello();
      `uvm_info(get_full_name(), $sformatf("HELLO from override class A_ovr"), UVM_LOW)         
    endfunction
endclass

class B extends uvm_agent;
    `uvm_component_utils(B)
    function new(string name = "B", uvm_component parent);
      super.new(name, parent);
      `uvm_info(get_full_name(), $sformatf(" B new"), UVM_LOW)
    endfunction
    
    virtual function hello();
      `uvm_info(get_full_name(), $sformatf("HELLO from original class B"), UVM_LOW)         
    endfunction
endclass

class B_ovr extends B;
    `uvm_component_utils(B_ovr)
    function new(string name = "B_ovr", uvm_component parent);
      super.new(name,parent);
      `uvm_info(get_full_name(), $sformatf(" B_ovr new"), UVM_LOW)
    endfunction

    virtual function hello();
      `uvm_info(get_full_name, $sformatf("HELLO from override class B_ovr"), UVM_LOW)         
    endfunction
endclass

class environment extends uvm_env;
   `uvm_component_utils(environment)
   A a1;
   A_ovr a2;
   B b1;
   B_ovr b2;
  
   function new(string name="environment", uvm_component parent);
     super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     a1 = A::type_id::create("a1",this);
     a2 = A_ovr::type_id::create("a2",this);
     b1 = B::type_id::create("b1",this);
     b2 = B_ovr::type_id::create("b2",this);        
     void'(a1.hello());
     void'(a2.hello());
     void'(b1.hello());
     void'(b2.hello());
   endfunction
endclass

class test extends uvm_test;
    `uvm_component_utils(test)
    environment env;

    function new(string name="test", uvm_component parent=null);
      super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env = environment::type_id::create("env", this);
      `uvm_info(get_full_name(), $sformatf("Test set_type_override_by_type"), UVM_LOW)
      set_type_override_by_type(A::get_type(),A_ovr::get_type());
      set_type_override_by_type(B::get_type(),B_ovr::get_type());
      // set_inst_override_by_type();
      // set_inst_override_by_type();
    endfunction
endclass

module top();
    initial begin
        run_test("test");
    end
endmodule

