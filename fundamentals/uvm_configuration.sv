import uvm_pkg::*;
`include "uvm_macros.svh"

class driver extends uvm_driver;
  integer int_cfg;
  string  str_cfg;

  `uvm_component_utils_begin(driver)
     `uvm_field_int(int_cfg, UVM_DEFAULT)
     `uvm_field_string(str_cfg, UVM_DEFAULT)
  `uvm_component_utils_end

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build();
    super.build();
  endfunction
endclass

class monitor extends uvm_monitor;
  integer int_cfg;
  string  str_cfg;

  `uvm_component_utils_begin(monitor)
    `uvm_field_int(int_cfg, UVM_DEFAULT)
    `uvm_field_string(str_cfg, UVM_DEFAULT)
  `uvm_component_utils_end

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build();
    super.build();
  endfunction
endclass

class agent extends uvm_agent;
  integer int_cfg;
  string  str_cfg;

  `uvm_component_utils_begin(agent)
    `uvm_field_int(int_cfg, UVM_DEFAULT)
    `uvm_field_string(str_cfg, UVM_DEFAULT)
  `uvm_component_utils_end

  protected uvm_active_passive_enum is_active = UVM_ACTIVE;
  monitor mon;
  driver drv;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build();
    super.build();
    mon = monitor::type_id::create("mon",this);   
    drv = driver::type_id::create("drv",this);   
  endfunction     
endclass

class env extends uvm_env;
  integer int_cfg;
  string  str_cfg;

  `uvm_component_utils_begin(env)
    `uvm_field_int(int_cfg, UVM_DEFAULT)
    `uvm_field_string(str_cfg, UVM_DEFAULT)
  `uvm_component_utils_end

  agent ag1;
  agent ag2;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build();
    super.build();
    ag1 = agent::type_id::create("ag1",this);   
    ag2 = agent::type_id::create("ag2",this);   
  endfunction
endclass

class test1 extends uvm_test;
  `uvm_component_utils(test1)
  env t_env;

  function new (string name="test1", uvm_component parent=null);
    super.new (name, parent);
    print_config_matches = 1;
    //t_env.ag1.drv.int_cfg, t_env.ag1.mon.int_cfg
    set_config_int("*.ag1.*", "int_cfg", 32);
    //t_env.ag2.drv
    set_config_int("t_env.ag2.drv","int_cfg",32);
    //t_env.ag2.mon
    set_config_int("t_env.ag2.mon", "int_cfg", 32);
    //t_env.ag1.mon.str_cfg, t_env.ag2.mon.str_cfg
    //t_env.ag1.drv.str_cfg, t_env.ag2.drv.str_cfg
    set_config_string("*.ag?.*", "str_cfg", "pars");
    //t_env.str_cfg
    set_config_string("t_env", "str_cfg", "abcd");
    t_env = new("t_env", this);
  endfunction : new

  function void end_of_elaboration();
    print();
    // print_config_settings("", this, 1);
    print_config(1, 0); // recurse, audit
  endfunction : end_of_elaboration

  task run ();
    #1000;
    global_stop_request();
  endtask : run
endclass

module test_configuration;
  initial
    run_test("test1");
endmodule

