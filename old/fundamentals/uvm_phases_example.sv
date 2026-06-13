import uvm_pkg::*;
`include "uvm_macros.svh"

class driver extends uvm_driver;
  `uvm_component_utils(driver)

  function new(string name, uvm_component parent);
   super.new(name,parent);
  endfunction

  function void build();
   uvm_report_info(get_full_name(),"Build",UVM_LOW);
  endfunction

  function void connect();
   uvm_report_info(get_full_name(),"Connect",UVM_LOW);
  endfunction

  function void end_of_elaboration();
   uvm_report_info(get_full_name(),"End_of_elaboration",UVM_LOW);
  endfunction

  function void start_of_simulation();
   uvm_report_info(get_full_name(),"Start_of_simulation",UVM_LOW);
  endfunction

  task run();
   uvm_report_info(get_full_name(),"Run",UVM_LOW);
  endtask

  function void extract ();
   uvm_report_info(get_full_name(),"Extract",UVM_LOW);
  endfunction

  function void check();
   uvm_report_info(get_full_name(),"Check",UVM_LOW);
  endfunction

  function void report();
   uvm_report_info(get_full_name(),"Report",UVM_LOW);
  endfunction
endclass

// Q1. Do you need to put suffix _phase in all the phases

class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)

  function new(string name,uvm_component parent);
   super.new(name,parent);
  endfunction

  function void build();
   uvm_report_info(get_full_name(),"Build",UVM_LOW);
  endfunction

  function void connect();
   uvm_report_info(get_full_name(),"Connect",UVM_LOW);
  endfunction

  function void end_of_elaboration();
   uvm_report_info(get_full_name(),"End_of_elaboration",UVM_LOW);
  endfunction

  function void start_of_simulation();
   uvm_report_info(get_full_name(),"Start_of_simulation",UVM_LOW);
  endfunction

  task run();
   uvm_report_info(get_full_name(),"Run",UVM_LOW);
  endtask

  function void extract ();
   uvm_report_info(get_full_name(),"Extract",UVM_LOW);
  endfunction

  function void check();
   uvm_report_info(get_full_name(),"Check",UVM_LOW);
  endfunction

  function void report();
   uvm_report_info(get_full_name(),"Report",UVM_LOW);
  endfunction
endclass

class agent extends uvm_agent;
  `uvm_component_utils(agent)

  protected uvm_active_passive_enum is_active=UVM_ACTIVE;
  // typedef enum (UVM_PASSIVE, UVM_ACTIVE) uvm_active_passive_enum;

   monitor mon;
   driver drv;

   function new (string name,uvm_component parent);
    super.new(name,parent);
   endfunction

   function void build();
    uvm_report_info(get_full_name(),"Build",UVM_LOW);
    mon=monitor::type_id::create("mon",this);
    drv=driver::type_id::create("drv",this);
   endfunction

   function void connect();
    uvm_report_info(get_full_name(),"Connect",UVM_LOW);
   endfunction

   function void end_of_elaboration();
    uvm_report_info(get_full_name(),"End_of_elaboration",UVM_LOW);
   endfunction

   function void start_of_simulation();
    uvm_report_info(get_full_name(),"Start_of_simulation",UVM_LOW);
   endfunction

   task run();
    uvm_report_info(get_full_name(),"Run",UVM_LOW);
   endtask

   function void extract ();
    uvm_report_info(get_full_name(),"Extract",UVM_LOW);
   endfunction

   function void check();
    uvm_report_info(get_full_name(),"Check",UVM_LOW);
   endfunction

   function void report();
    uvm_report_info(get_full_name(),"Report",UVM_LOW);
   endfunction
endclass

class env extends uvm_env;
  `uvm_component_utils(env)
  agent ag1;
  agent ag2;

  function new (string name,uvm_component parent);
   super.new(name,parent);
  endfunction

  function void build ();
   uvm_report_info(get_full_name(),"Build",UVM_LOW);
   ag1=agent::type_id::create("ag1",this);
   ag2=agent::type_id::create("ag2",this);
  endfunction

  function void connect();
   uvm_report_info(get_full_name(),"Connect",UVM_LOW);
  endfunction

  function void end_of_elaboration();
   uvm_report_info(get_full_name(),"End_of_elaboration",UVM_LOW);
  endfunction

  function void start_of_simulation();
   uvm_report_info(get_full_name(),"Start_of_simulation",UVM_LOW);
  endfunction

  task run();
   uvm_report_info(get_full_name(),"Run",UVM_LOW);
  endtask

  function void extract ();
   uvm_report_info(get_full_name(),"Extract",UVM_LOW);
  endfunction

  function void check();
   uvm_report_info(get_full_name(),"Check",UVM_LOW);
  endfunction

  function void report();
   uvm_report_info(get_full_name(),"Report",UVM_LOW);
  endfunction
endclass

class simple_test extends uvm_test;
  `uvm_component_utils(simple_test)

  env t_env;

  function new(string name="simple_test",uvm_component parent=null);
   super.new(name,parent);
   t_env=new("t_env",this);
  endfunction:new

  function void end_of_elaboration();
   uvm_report_info(get_full_name(),"End_of_elaboration",UVM_LOW);
   print();
  endfunction: end_of_elaboration

  task run();
   #1000;
   global_stop_request();
  endtask:run
endclass

module test_uvm_phases;
  initial
    run_test("simple_test");
endmodule

