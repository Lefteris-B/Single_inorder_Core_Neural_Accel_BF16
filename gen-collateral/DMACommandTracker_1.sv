// Generated by CIRCT unknown git version
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

module DMACommandTracker_1(
  input         clock,
                reset,
                io_alloc_valid,
  input  [5:0]  io_alloc_bits_tag_rob_id,
  input  [12:0] io_alloc_bits_bytes_to_read,
  input         io_request_returned_valid,
                io_request_returned_bits_cmd_id,
                io_cmd_completed_ready,
  output        io_alloc_ready,
                io_alloc_bits_cmd_id,
                io_cmd_completed_valid,
  output [5:0]  io_cmd_completed_bits_tag_rob_id,
  output        io_busy
);

  reg         cmds_0_valid;	// @[DMACommandTracker.scala:61:17]
  reg  [5:0]  cmds_0_tag_rob_id;	// @[DMACommandTracker.scala:61:17]
  reg  [12:0] cmds_0_bytes_left;	// @[DMACommandTracker.scala:61:17]
  reg         cmds_1_valid;	// @[DMACommandTracker.scala:61:17]
  reg  [5:0]  cmds_1_tag_rob_id;	// @[DMACommandTracker.scala:61:17]
  reg  [12:0] cmds_1_bytes_left;	// @[DMACommandTracker.scala:61:17]
  wire        next_empty_alloc = cmds_0_valid & ~cmds_1_valid;	// @[DMACommandTracker.scala:61:17, :64:85, Mux.scala:101:16]
  wire        _io_alloc_ready_T = cmds_0_valid & cmds_1_valid;	// @[DMACommandTracker.scala:61:17, :66:42]
  wire        _io_cmd_completed_valid_T = cmds_0_bytes_left == 13'h0;	// @[DMACommandTracker.scala:61:17, :72:34]
  wire        _io_cmd_completed_valid_T_2 = cmds_1_bytes_left == 13'h0;	// @[DMACommandTracker.scala:61:17, :72:34]
  wire        cmd_completed_id = ~(cmds_0_valid & _io_cmd_completed_valid_T) & cmds_1_valid & _io_cmd_completed_valid_T_2;	// @[DMACommandTracker.scala:61:17, :72:{16,34}, Mux.scala:101:16]
  wire        _io_cmd_completed_valid_output = cmds_0_valid & _io_cmd_completed_valid_T | cmds_1_valid & _io_cmd_completed_valid_T_2;	// @[DMACommandTracker.scala:61:17, :72:34, :74:{55,91}]
  wire        _GEN = io_request_returned_bits_cmd_id ? cmds_1_valid : cmds_0_valid;	// @[DMACommandTracker.scala:61:17, :86:56]
  wire [12:0] _GEN_0 = io_request_returned_bits_cmd_id ? cmds_1_bytes_left : cmds_0_bytes_left;	// @[DMACommandTracker.scala:61:17, :86:56]
  wire        _GEN_1 = io_request_returned_valid & ~reset;	// @[DMACommandTracker.scala:88:11]
  wire        _T = io_alloc_valid & ~_io_alloc_ready_T;	// @[DMACommandTracker.scala:27:40, :66:{21,42}]
  wire        _GEN_2 = _T & ~next_empty_alloc;	// @[DMACommandTracker.scala:27:40, :61:17, :78:26, :79:34, Mux.scala:101:16]
  wire        _GEN_3 = _T & next_empty_alloc;	// @[DMACommandTracker.scala:27:40, :61:17, :78:26, :79:34, Mux.scala:101:16]
  wire [12:0] _cmds_bytes_left_T_1 = _GEN_0 - 13'h1;	// @[DMACommandTracker.scala:86:56]
  wire        _T_8 = io_cmd_completed_ready & _io_cmd_completed_valid_output;	// @[DMACommandTracker.scala:74:91, Decoupled.scala:51:35]
  always @(posedge clock) begin
    if (_GEN_1)	// @[DMACommandTracker.scala:88:11]
      assert__assert: assert(_GEN);	// @[DMACommandTracker.scala:86:56, :88:11]
    cmds_0_valid <= ~(reset | _T_8 & ~cmd_completed_id) & (_GEN_2 | cmds_0_valid);	// @[DMACommandTracker.scala:56:13, :61:17, :78:26, :79:34, :92:32, :93:46, :96:23, Decoupled.scala:51:35, Mux.scala:101:16]
    if (_GEN_2)	// @[DMACommandTracker.scala:61:17, :78:26, :79:34]
      cmds_0_tag_rob_id <= io_alloc_bits_tag_rob_id;	// @[DMACommandTracker.scala:61:17]
    if (io_request_returned_valid & ~io_request_returned_bits_cmd_id)	// @[DMACommandTracker.scala:78:26, :84:35, :86:29]
      cmds_0_bytes_left <= _cmds_bytes_left_T_1;	// @[DMACommandTracker.scala:61:17, :86:56]
    else if (_GEN_2)	// @[DMACommandTracker.scala:61:17, :78:26, :79:34]
      cmds_0_bytes_left <= io_alloc_bits_bytes_to_read;	// @[DMACommandTracker.scala:61:17]
    cmds_1_valid <= ~(reset | _T_8 & cmd_completed_id) & (_GEN_3 | cmds_1_valid);	// @[DMACommandTracker.scala:56:13, :61:17, :78:26, :79:34, :92:32, :93:46, :96:23, Decoupled.scala:51:35, Mux.scala:101:16]
    if (_GEN_3)	// @[DMACommandTracker.scala:61:17, :78:26, :79:34]
      cmds_1_tag_rob_id <= io_alloc_bits_tag_rob_id;	// @[DMACommandTracker.scala:61:17]
    if (io_request_returned_valid & io_request_returned_bits_cmd_id)	// @[DMACommandTracker.scala:78:26, :84:35, :86:29]
      cmds_1_bytes_left <= _cmds_bytes_left_T_1;	// @[DMACommandTracker.scala:61:17, :86:56]
    else if (_GEN_3)	// @[DMACommandTracker.scala:61:17, :78:26, :79:34]
      cmds_1_bytes_left <= io_alloc_bits_bytes_to_read;	// @[DMACommandTracker.scala:61:17]
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[DMACommandTracker.scala:88:11]
      if (_GEN_1 & ~_GEN) begin	// @[DMACommandTracker.scala:86:56, :88:11]
        if (`ASSERT_VERBOSE_COND_)	// @[DMACommandTracker.scala:88:11]
          $error("Assertion failed\n    at DMACommandTracker.scala:88 assert(cmds(cmd_id).valid)\n");	// @[DMACommandTracker.scala:88:11]
        if (`STOP_COND_)	// @[DMACommandTracker.scala:88:11]
          $fatal;	// @[DMACommandTracker.scala:88:11]
      end
      if (io_request_returned_valid & ~reset & _GEN_0 == 13'h0) begin	// @[DMACommandTracker.scala:72:34, :86:56, :89:{11,36}]
        if (`ASSERT_VERBOSE_COND_)	// @[DMACommandTracker.scala:89:11]
          $error("Assertion failed\n    at DMACommandTracker.scala:89 assert(cmds(cmd_id).bytes_left >= io.request_returned.bits.bytes_read)\n");	// @[DMACommandTracker.scala:89:11]
        if (`STOP_COND_)	// @[DMACommandTracker.scala:89:11]
          $fatal;	// @[DMACommandTracker.scala:89:11]
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        cmds_0_valid = _RANDOM_0[0];	// @[DMACommandTracker.scala:61:17]
        cmds_0_tag_rob_id = _RANDOM_0[6:1];	// @[DMACommandTracker.scala:61:17]
        cmds_0_bytes_left = _RANDOM_0[19:7];	// @[DMACommandTracker.scala:61:17]
        cmds_1_valid = _RANDOM_0[20];	// @[DMACommandTracker.scala:61:17]
        cmds_1_tag_rob_id = _RANDOM_0[26:21];	// @[DMACommandTracker.scala:61:17]
        cmds_1_bytes_left = {_RANDOM_0[31:27], _RANDOM_1[7:0]};	// @[DMACommandTracker.scala:61:17]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_alloc_ready = ~_io_alloc_ready_T;	// @[DMACommandTracker.scala:66:{21,42}]
  assign io_alloc_bits_cmd_id = next_empty_alloc;	// @[Mux.scala:101:16]
  assign io_cmd_completed_valid = _io_cmd_completed_valid_output;	// @[DMACommandTracker.scala:74:91]
  assign io_cmd_completed_bits_tag_rob_id = cmd_completed_id ? cmds_1_tag_rob_id : cmds_0_tag_rob_id;	// @[DMACommandTracker.scala:61:17, :76:29, Mux.scala:101:16]
  assign io_busy = cmds_0_valid | cmds_1_valid;	// @[DMACommandTracker.scala:61:17, :69:34]
endmodule

