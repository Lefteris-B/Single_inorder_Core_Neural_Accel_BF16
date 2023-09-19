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

module LoopMatmulLdD(
  input         clock,
                reset,
                io_req_valid,
  input  [15:0] io_req_bits_max_j,
                io_req_bits_max_i,
  input  [3:0]  io_req_bits_pad_j,
                io_req_bits_pad_i,
  input  [33:0] io_req_bits_dram_addr,
                io_req_bits_dram_stride,
  input         io_req_bits_low_d,
  input  [8:0]  io_req_bits_addr_start,
  input         io_req_bits_loop_id,
                io_cmd_ready,
                io_rob_overloaded,
  output        io_req_ready,
                io_cmd_valid,
  output [63:0] io_cmd_bits_rs1,
                io_cmd_bits_rs2,
  output        io_idle,
                io_loop_id
);

  reg         state;	// @[LoopMatmul.scala:270:22]
  reg  [15:0] req_max_j;	// @[LoopMatmul.scala:272:16]
  reg  [15:0] req_max_i;	// @[LoopMatmul.scala:272:16]
  reg  [3:0]  req_pad_j;	// @[LoopMatmul.scala:272:16]
  reg  [3:0]  req_pad_i;	// @[LoopMatmul.scala:272:16]
  reg  [33:0] req_dram_addr;	// @[LoopMatmul.scala:272:16]
  reg  [33:0] req_dram_stride;	// @[LoopMatmul.scala:272:16]
  reg         req_low_d;	// @[LoopMatmul.scala:272:16]
  reg  [8:0]  req_addr_start;	// @[LoopMatmul.scala:272:16]
  reg         req_loop_id;	// @[LoopMatmul.scala:272:16]
  wire [15:0] max_blocks = req_low_d ? (req_max_j < 16'h5 ? req_max_j : 16'h4) : req_max_j < 16'h2 ? req_max_j : 16'h1;	// @[LoopMatmul.scala:272:16, :274:{23,38,49}, :275:{8,19}]
  reg  [15:0] j;	// @[LoopMatmul.scala:277:14]
  reg  [15:0] i;	// @[LoopMatmul.scala:278:14]
  wire [49:0] _dram_offset_T_5 = {34'h0, i} * {16'h0, req_dram_stride};	// @[LoopMatmul.scala:272:16, :278:14, :282:39, Mux.scala:101:16]
  wire [49:0] _GEN = {34'h0, j};	// @[LoopMatmul.scala:277:14, :282:{39,57}]
  wire [28:0] _GEN_0 = {20'h0, req_addr_start} + {{9'h0, i} * {9'h0, req_max_j} + {9'h0, j}, 4'h0};	// @[LoopMatmul.scala:272:16, :277:14, :278:14, :285:{32,37,49}, :287:43, :296:16]
  wire [16:0] _next_j_T_4 = {1'h0, j} + {1'h0, max_blocks};	// @[LoopMatmul.scala:270:22, :274:23, :277:14, :286:22]
  wire [15:0] blocks = _next_j_T_4[15:0] <= req_max_j ? max_blocks : req_max_j - j;	// @[LoopMatmul.scala:272:16, :274:23, :277:14, :286:{19,22,35,70}]
  wire [15:0] _rows_T_1 = req_max_i - 16'h1;	// @[LoopMatmul.scala:272:16, :288:48]
  wire        _io_cmd_valid_output = state & ~io_rob_overloaded & (|req_dram_addr);	// @[LoopMatmul.scala:270:22, :272:16, :306:{37,56,73}]
  wire        _T = req_dram_addr == 34'h0;	// @[LoopMatmul.scala:272:16, :282:39, :311:23]
  wire        _T_1 = io_cmd_ready & _io_cmd_valid_output;	// @[Decoupled.scala:51:35, LoopMatmul.scala:306:56]
  wire [16:0] _next_i_T_3 = {1'h0, i} + 17'h1;	// @[LoopMatmul.scala:270:22, :278:14, :288:48, Util.scala:41:15]
  wire        _next_i_T_4 = _next_i_T_3 > {1'h0, _rows_T_1};	// @[LoopMatmul.scala:270:22, :288:48, Util.scala:41:15, :43:17]
  wire [15:0] next_i = _next_i_T_4 ? 16'h0 : _next_i_T_3[15:0];	// @[Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire        _next_j_T_5 = _next_j_T_4 > {1'h0, req_max_j - 16'h1};	// @[LoopMatmul.scala:270:22, :272:16, :286:22, Util.scala:39:28, :43:17]
  wire        _T_5 = ~state & io_req_valid;	// @[Decoupled.scala:51:35, LoopMatmul.scala:270:22, :302:25]
  always @(posedge clock) begin
    if (reset)
      state <= 1'h0;	// @[LoopMatmul.scala:270:22]
    else
      state <= _T_5 | ~(_T | _T_1 & ~(|next_i) & ((|next_i) ? j : _next_j_T_5 ? 16'h0 : _next_j_T_4[15:0]) == 16'h0) & state;	// @[Decoupled.scala:51:35, LoopMatmul.scala:270:22, :277:14, :286:22, :311:{23,32}, :312:11, :313:28, :316:60, :321:{36,45}, :322:13, :326:22, :328:11, Mux.scala:101:16, Util.scala:41:15, :43:17]
    if (_T_5) begin	// @[Decoupled.scala:51:35]
      req_max_j <= io_req_bits_max_j;	// @[LoopMatmul.scala:272:16]
      req_max_i <= io_req_bits_max_i;	// @[LoopMatmul.scala:272:16]
      req_pad_j <= io_req_bits_pad_j;	// @[LoopMatmul.scala:272:16]
      req_pad_i <= io_req_bits_pad_i;	// @[LoopMatmul.scala:272:16]
      req_dram_addr <= io_req_bits_dram_addr;	// @[LoopMatmul.scala:272:16]
      req_dram_stride <= io_req_bits_dram_stride;	// @[LoopMatmul.scala:272:16]
      req_low_d <= io_req_bits_low_d;	// @[LoopMatmul.scala:272:16]
      req_addr_start <= io_req_bits_addr_start;	// @[LoopMatmul.scala:272:16]
      req_loop_id <= io_req_bits_loop_id;	// @[LoopMatmul.scala:272:16]
      j <= 16'h0;	// @[LoopMatmul.scala:277:14, Mux.scala:101:16]
      i <= 16'h0;	// @[LoopMatmul.scala:278:14, Mux.scala:101:16]
    end
    else begin	// @[Decoupled.scala:51:35]
      if (_T | ~_T_1 | (|next_i)) begin	// @[Decoupled.scala:51:35, LoopMatmul.scala:277:14, :278:14, :311:{23,32}, :313:28, :316:60, Mux.scala:101:16]
      end
      else if (_next_j_T_5)	// @[Util.scala:43:17]
        j <= 16'h0;	// @[LoopMatmul.scala:277:14, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        j <= _next_j_T_4[15:0];	// @[LoopMatmul.scala:277:14, :286:22, Util.scala:41:15]
      if (_T | ~_T_1) begin	// @[Decoupled.scala:51:35, LoopMatmul.scala:278:14, :311:{23,32}, :313:28]
      end
      else if (_next_i_T_4)	// @[Util.scala:43:17]
        i <= 16'h0;	// @[LoopMatmul.scala:278:14, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        i <= _next_i_T_3[15:0];	// @[LoopMatmul.scala:278:14, Util.scala:41:15]
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
        state = _RANDOM_0[0];	// @[LoopMatmul.scala:270:22]
        req_max_j = _RANDOM_0[16:1];	// @[LoopMatmul.scala:270:22, :272:16]
        req_max_i = {_RANDOM_0[31:17], _RANDOM_1[0]};	// @[LoopMatmul.scala:270:22, :272:16]
        req_pad_j = _RANDOM_1[4:1];	// @[LoopMatmul.scala:272:16]
        req_pad_i = _RANDOM_1[8:5];	// @[LoopMatmul.scala:272:16]
        req_dram_addr = {_RANDOM_1[31:9], _RANDOM_2[10:0]};	// @[LoopMatmul.scala:272:16]
        req_dram_stride = {_RANDOM_2[31:11], _RANDOM_3[12:0]};	// @[LoopMatmul.scala:272:16]
        req_low_d = _RANDOM_3[13];	// @[LoopMatmul.scala:272:16]
        req_addr_start = _RANDOM_3[22:14];	// @[LoopMatmul.scala:272:16]
        req_loop_id = _RANDOM_3[23];	// @[LoopMatmul.scala:272:16]
        j = {_RANDOM_3[31:24], _RANDOM_4[7:0]};	// @[LoopMatmul.scala:272:16, :277:14]
        i = _RANDOM_4[23:8];	// @[LoopMatmul.scala:277:14, :278:14]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_req_ready = ~state;	// @[LoopMatmul.scala:270:22, :302:25]
  assign io_cmd_valid = _io_cmd_valid_output;	// @[LoopMatmul.scala:306:56]
  assign io_cmd_bits_rs1 = {6'h0, {24'h0, req_dram_addr} + ((req_low_d ? {4'h0, _dram_offset_T_5 + _GEN, 4'h0} : {2'h0, _dram_offset_T_5 + _GEN, 6'h0}) & 58'hFFFFFFFF)};	// @[LoopMatmul.scala:272:16, :282:{24,39,57}, :283:{26,46}, :284:33, :287:43, :291:12, :293:16, :1139:17]
  assign io_cmd_bits_rs2 = {11'h0, 5'h10 - {1'h0, i == _rows_T_1 ? req_pad_i : 4'h0}, 9'h0, {blocks[2:0], 4'h0} - {3'h0, j + blocks >= req_max_j ? req_pad_j : 4'h0}, 3'h4, _GEN_0[28:26], 13'h0, _GEN_0[12:0]};	// @[LocalAddr.scala:108:37, :109:57, LoopMatmul.scala:270:22, :272:16, :277:14, :278:14, :285:32, :286:19, :287:{38,43,46,55}, :288:{27,32,35,48}, :296:16, :300:32]
  assign io_idle = ~state;	// @[LoopMatmul.scala:270:22, :302:25]
  assign io_loop_id = req_loop_id;	// @[LoopMatmul.scala:272:16]
endmodule

