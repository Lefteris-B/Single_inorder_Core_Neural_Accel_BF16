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

module LoopMatmulLdA(
  input         clock,
                reset,
                io_req_valid,
  input  [15:0] io_req_bits_max_i,
                io_req_bits_max_k,
  input  [3:0]  io_req_bits_pad_i,
                io_req_bits_pad_k,
  input  [33:0] io_req_bits_dram_addr,
                io_req_bits_dram_stride,
  input         io_req_bits_transpose,
  input  [11:0] io_req_bits_addr_start,
  input         io_req_bits_loop_id,
                io_req_bits_is_resadd,
                io_cmd_ready,
                io_rob_overloaded,
  output        io_req_ready,
                io_cmd_valid,
  output [63:0] io_cmd_bits_rs1,
                io_cmd_bits_rs2,
  output [15:0] io_i,
                io_k,
  output        io_idle,
                io_loop_id
);

  wire [11:0] mvin_cmd_rs2_local_addr_data;	// @[LoopMatmul.scala:82:27, :84:22, :85:29]
  wire        mvin_cmd_rs2_local_addr_garbage_bit;	// @[LoopMatmul.scala:82:27, :84:22, :85:29]
  wire [2:0]  mvin_cmd_rs2_local_addr_norm_cmd;	// @[LoopMatmul.scala:82:27, :84:22, :85:29]
  reg         state;	// @[LoopMatmul.scala:45:22]
  reg  [15:0] req_max_i;	// @[LoopMatmul.scala:47:16]
  reg  [15:0] req_max_k;	// @[LoopMatmul.scala:47:16]
  reg  [3:0]  req_pad_i;	// @[LoopMatmul.scala:47:16]
  reg  [3:0]  req_pad_k;	// @[LoopMatmul.scala:47:16]
  reg  [33:0] req_dram_addr;	// @[LoopMatmul.scala:47:16]
  reg  [33:0] req_dram_stride;	// @[LoopMatmul.scala:47:16]
  reg         req_transpose;	// @[LoopMatmul.scala:47:16]
  reg  [11:0] req_addr_start;	// @[LoopMatmul.scala:47:16]
  reg         req_loop_id;	// @[LoopMatmul.scala:47:16]
  reg         req_is_resadd;	// @[LoopMatmul.scala:47:16]
  reg  [15:0] i;	// @[LoopMatmul.scala:49:14]
  reg  [15:0] k;	// @[LoopMatmul.scala:50:14]
  wire [15:0] row_iterator = req_transpose ? k : i;	// @[LoopMatmul.scala:47:16, :49:14, :50:14, :52:25]
  wire [15:0] col_iterator = req_transpose ? i : k;	// @[LoopMatmul.scala:47:16, :49:14, :50:14, :53:25]
  wire [15:0] max_col_iterator = req_transpose ? req_max_i : req_max_k;	// @[LoopMatmul.scala:47:16, :56:29]
  wire [15:0] max_blocks = max_col_iterator < 16'h5 ? max_col_iterator : 16'h4;	// @[LoopMatmul.scala:56:29, :62:{23,36}]
  wire [28:0] _GEN = {17'h0, req_addr_start} + {{9'h0, row_iterator} * {9'h0, max_col_iterator} + {9'h0, col_iterator}, 4'h0};	// @[LoopMatmul.scala:47:16, :52:25, :53:25, :56:29, :68:{31,47,66}, :70:43, :79:16]
  wire [15:0] blocks = col_iterator + max_blocks <= max_col_iterator ? max_blocks : max_col_iterator - col_iterator;	// @[LoopMatmul.scala:53:25, :56:29, :62:23, :69:{19,33,46,95}]
  assign mvin_cmd_rs2_local_addr_norm_cmd = req_is_resadd ? _GEN[28:26] : _GEN[28:26];	// @[LocalAddr.scala:108:37, LoopMatmul.scala:47:16, :68:31, :82:27, :84:22, :85:29]
  assign mvin_cmd_rs2_local_addr_garbage_bit = req_is_resadd ? _GEN[12] : _GEN[12];	// @[LocalAddr.scala:108:37, LoopMatmul.scala:47:16, :68:31, :82:27, :84:22, :85:29]
  assign mvin_cmd_rs2_local_addr_data = req_is_resadd ? _GEN[11:0] : _GEN[11:0];	// @[LocalAddr.scala:108:37, LoopMatmul.scala:47:16, :68:31, :82:27, :84:22, :85:29]
  wire        _io_cmd_valid_output = state & ~io_rob_overloaded & (|req_dram_addr);	// @[LoopMatmul.scala:45:22, :47:16, :93:{37,56,73}]
  wire        _T = req_dram_addr == 34'h0;	// @[LoopMatmul.scala:47:16, :66:35, :98:22]
  wire        _T_1 = io_cmd_ready & _io_cmd_valid_output;	// @[Decoupled.scala:51:35, LoopMatmul.scala:93:56]
  wire [16:0] _next_i_T_3 = {1'h0, i} + {1'h0, req_transpose ? max_blocks : 16'h1};	// @[LoopMatmul.scala:45:22, :47:16, :49:14, :62:23, :102:23, Util.scala:41:15]
  wire        _next_i_T_4 = _next_i_T_3 > {1'h0, req_max_i - 16'h1};	// @[LoopMatmul.scala:45:22, :47:16, Util.scala:39:28, :41:15, :43:17]
  wire [15:0] next_i = _next_i_T_4 ? 16'h0 : _next_i_T_3[15:0];	// @[Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire [16:0] _next_k_T_4 = {1'h0, k} + {1'h0, req_transpose ? 16'h1 : max_blocks};	// @[LoopMatmul.scala:45:22, :47:16, :50:14, :62:23, :102:23, :103:23, Util.scala:41:15]
  wire        _next_k_T_5 = _next_k_T_4 > {1'h0, req_max_k - 16'h1};	// @[LoopMatmul.scala:45:22, :47:16, Util.scala:39:28, :41:15, :43:17]
  wire        _T_5 = ~state & io_req_valid;	// @[Decoupled.scala:51:35, LoopMatmul.scala:45:22, :88:25]
  always @(posedge clock) begin
    if (reset)
      state <= 1'h0;	// @[LoopMatmul.scala:45:22]
    else
      state <= _T_5 | ~(_T | _T_1 & ~(|next_i) & ((|next_i) ? k : _next_k_T_5 ? 16'h0 : _next_k_T_4[15:0]) == 16'h0) & state;	// @[Decoupled.scala:51:35, LoopMatmul.scala:45:22, :50:14, :98:{22,30}, :99:11, :100:27, :106:58, :111:{36,45}, :112:13, :116:22, :118:11, Mux.scala:101:16, Util.scala:41:15, :43:17]
    if (_T_5) begin	// @[Decoupled.scala:51:35]
      req_max_i <= io_req_bits_max_i;	// @[LoopMatmul.scala:47:16]
      req_max_k <= io_req_bits_max_k;	// @[LoopMatmul.scala:47:16]
      req_pad_i <= io_req_bits_pad_i;	// @[LoopMatmul.scala:47:16]
      req_pad_k <= io_req_bits_pad_k;	// @[LoopMatmul.scala:47:16]
      req_dram_addr <= io_req_bits_dram_addr;	// @[LoopMatmul.scala:47:16]
      req_dram_stride <= io_req_bits_dram_stride;	// @[LoopMatmul.scala:47:16]
      req_transpose <= io_req_bits_transpose;	// @[LoopMatmul.scala:47:16]
      req_addr_start <= io_req_bits_addr_start;	// @[LoopMatmul.scala:47:16]
      req_loop_id <= io_req_bits_loop_id;	// @[LoopMatmul.scala:47:16]
      req_is_resadd <= io_req_bits_is_resadd;	// @[LoopMatmul.scala:47:16]
      i <= 16'h0;	// @[LoopMatmul.scala:49:14, Mux.scala:101:16]
      k <= 16'h0;	// @[LoopMatmul.scala:50:14, Mux.scala:101:16]
    end
    else begin	// @[Decoupled.scala:51:35]
      if (_T | ~_T_1) begin	// @[Decoupled.scala:51:35, LoopMatmul.scala:49:14, :98:{22,30}, :100:27]
      end
      else if (_next_i_T_4)	// @[Util.scala:43:17]
        i <= 16'h0;	// @[LoopMatmul.scala:49:14, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        i <= _next_i_T_3[15:0];	// @[LoopMatmul.scala:49:14, Util.scala:41:15]
      if (_T | ~_T_1 | (|next_i)) begin	// @[Decoupled.scala:51:35, LoopMatmul.scala:49:14, :50:14, :98:{22,30}, :100:27, :106:58, Mux.scala:101:16]
      end
      else if (_next_k_T_5)	// @[Util.scala:43:17]
        k <= 16'h0;	// @[LoopMatmul.scala:50:14, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        k <= _next_k_T_4[15:0];	// @[LoopMatmul.scala:50:14, Util.scala:41:15]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        _RANDOM_4 = `RANDOM;
        state = _RANDOM_0[0];	// @[LoopMatmul.scala:45:22]
        req_max_i = _RANDOM_0[16:1];	// @[LoopMatmul.scala:45:22, :47:16]
        req_max_k = {_RANDOM_0[31:17], _RANDOM_1[0]};	// @[LoopMatmul.scala:45:22, :47:16]
        req_pad_i = _RANDOM_1[4:1];	// @[LoopMatmul.scala:47:16]
        req_pad_k = _RANDOM_1[8:5];	// @[LoopMatmul.scala:47:16]
        req_dram_addr = {_RANDOM_1[31:9], _RANDOM_2[10:0]};	// @[LoopMatmul.scala:47:16]
        req_dram_stride = {_RANDOM_2[31:11], _RANDOM_3[12:0]};	// @[LoopMatmul.scala:47:16]
        req_transpose = _RANDOM_3[13];	// @[LoopMatmul.scala:47:16]
        req_addr_start = _RANDOM_3[25:14];	// @[LoopMatmul.scala:47:16]
        req_loop_id = _RANDOM_3[26];	// @[LoopMatmul.scala:47:16]
        req_is_resadd = _RANDOM_3[27];	// @[LoopMatmul.scala:47:16]
        i = {_RANDOM_3[31:28], _RANDOM_4[11:0]};	// @[LoopMatmul.scala:47:16, :49:14]
        k = _RANDOM_4[27:12];	// @[LoopMatmul.scala:49:14, :50:14]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_req_ready = ~state;	// @[LoopMatmul.scala:45:22, :88:25]
  assign io_cmd_valid = _io_cmd_valid_output;	// @[LoopMatmul.scala:93:56]
  assign io_cmd_bits_rs1 = {8'h0, {22'h0, req_dram_addr} + {2'h0, {34'h0, row_iterator} * {16'h0, req_dram_stride} + {34'h0, col_iterator} & 50'hFFFFFFF, 4'h0}};	// @[LoopMatmul.scala:47:16, :52:25, :53:25, :66:{35,53}, :67:33, :70:43, :74:12, :76:16, :1139:17, Mux.scala:101:16]
  assign io_cmd_bits_rs2 = {11'h0, 5'h10 - {1'h0, row_iterator == (req_transpose ? req_max_k : req_max_i) - 16'h1 ? (req_transpose ? req_pad_k : req_pad_i) : 4'h0}, 9'h0, {blocks[2:0], 4'h0} - {3'h0, col_iterator + blocks >= max_col_iterator ? (req_transpose ? req_pad_i : req_pad_k) : 4'h0}, req_is_resadd, 2'h0, mvin_cmd_rs2_local_addr_norm_cmd, 13'h0, mvin_cmd_rs2_local_addr_garbage_bit, mvin_cmd_rs2_local_addr_data};	// @[LocalAddr.scala:109:57, LoopMatmul.scala:45:22, :47:16, :52:25, :53:25, :55:29, :56:29, :58:20, :59:20, :69:19, :70:{38,43,57,66}, :71:{27,32,46,66}, :74:12, :79:16, :82:27, :83:32, :84:22, :85:29]
  assign io_i = i;	// @[LoopMatmul.scala:49:14]
  assign io_k = k;	// @[LoopMatmul.scala:50:14]
  assign io_idle = ~state;	// @[LoopMatmul.scala:45:22, :88:25]
  assign io_loop_id = req_loop_id;	// @[LoopMatmul.scala:47:16]
endmodule

