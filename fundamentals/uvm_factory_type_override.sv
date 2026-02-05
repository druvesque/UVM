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

// extending driver class to driver_2 class
class driver_2 extends driver;
   `uvm_component_utils(driver_2)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass

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

// extending monitor class to monitor_2 class
class monitor_2 extends monitor;
   `uvm_component_utils(monitor_2)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build();
      uvm_report_info(get_full_name(),"Build2",UVM_LOW);
    endfunction

    function void connect();
      uvm_report_info(get_full_name(),"Connect2",UVM_LOW);
    endfunction

    function void end_of_elaboration();
      uvm_report_info(get_full_name(),"End_of_elaboration2",UVM_LOW);
    endfunction

    function void start_of_simulation();
      uvm_report_info(get_full_name(),"Start_of_simulation2",UVM_LOW);
    endfunction

    task run();
      uvm_report_info(get_full_name(),"Run2",UVM_LOW);
    endtask

    function void extract ();
      uvm_report_info(get_full_name(),"Extract2",UVM_LOW);
    endfunction

    function void check();
      uvm_report_info(get_full_name(),"Check2",UVM_LOW);
    endfunction

    function void report();
      uvm_report_info(get_full_name(),"Report2",UVM_LOW);
    endfunction
endclass

class agent extends uvm_agent;
   `uvm_component_utils(agent)

   protected uvm_active_passive_enum is_active=UVM_ACTIVE;

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

class test1 extends uvm_test;
  `uvm_component_utils(test1)

  env t_env;

  function new(string name="test1",uvm_component parent=null);
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

class test_factory extends uvm_test;
    `uvm_component_utils(test_factory)
    env t_env;

    function new (string name="test1", uvm_component parent=null);
        super.new (name, parent);
        t_env = new("t_env", this);
        factory.set_type_override_by_type(driver::get_type(),driver_2::get_type(),"*");
        factory.set_type_override_by_name("monitor","monitor_2","*");
        factory.print(); // factory.print_topology();
        // t_env = new("t_env",this);
    endfunction : new 

    function void end_of_elaboration();
        uvm_report_info(get_full_name(),"End_of_elaboration", UVM_LOW);
        print();
    endfunction : end_of_elaboration

    task run ();
        #1000;
        global_stop_request();
    endtask : run
endclass

module top_test_factory;
  initial
    run_test("test_factory");
endmodule

