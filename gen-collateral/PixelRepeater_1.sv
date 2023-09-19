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

module PixelRepeater_1(
  input         clock,
                reset,
                io_req_valid,
  input  [7:0]  io_req_bits_in_0,
                io_req_bits_in_1,
                io_req_bits_in_2,
                io_req_bits_in_3,
                io_req_bits_in_4,
                io_req_bits_in_5,
                io_req_bits_in_6,
                io_req_bits_in_7,
                io_req_bits_in_8,
                io_req_bits_in_9,
                io_req_bits_in_10,
                io_req_bits_in_11,
                io_req_bits_in_12,
                io_req_bits_in_13,
                io_req_bits_in_14,
                io_req_bits_in_15,
  input         io_req_bits_mask_0,
                io_req_bits_mask_1,
                io_req_bits_mask_2,
                io_req_bits_mask_3,
                io_req_bits_mask_4,
                io_req_bits_mask_5,
                io_req_bits_mask_6,
                io_req_bits_mask_7,
                io_req_bits_mask_8,
                io_req_bits_mask_9,
                io_req_bits_mask_10,
                io_req_bits_mask_11,
                io_req_bits_mask_12,
                io_req_bits_mask_13,
                io_req_bits_mask_14,
                io_req_bits_mask_15,
                io_req_bits_laddr_is_acc_addr,
  input  [11:0] io_req_bits_laddr_data,
  input  [4:0]  io_req_bits_len,
  input  [7:0]  io_req_bits_pixel_repeats,
  input         io_req_bits_last,
                io_req_bits_tag_is_acc,
                io_req_bits_tag_accumulate,
  input  [7:0]  io_req_bits_tag_bytes_read,
                io_req_bits_tag_cmd_id,
  input         io_resp_ready,
  output        io_req_ready,
                io_resp_valid,
  output [7:0]  io_resp_bits_out_0,
                io_resp_bits_out_1,
                io_resp_bits_out_2,
                io_resp_bits_out_3,
                io_resp_bits_out_4,
                io_resp_bits_out_5,
                io_resp_bits_out_6,
                io_resp_bits_out_7,
                io_resp_bits_out_8,
                io_resp_bits_out_9,
                io_resp_bits_out_10,
                io_resp_bits_out_11,
                io_resp_bits_out_12,
                io_resp_bits_out_13,
                io_resp_bits_out_14,
                io_resp_bits_out_15,
  output        io_resp_bits_mask_0,
                io_resp_bits_mask_1,
                io_resp_bits_mask_2,
                io_resp_bits_mask_3,
                io_resp_bits_mask_4,
                io_resp_bits_mask_5,
                io_resp_bits_mask_6,
                io_resp_bits_mask_7,
                io_resp_bits_mask_8,
                io_resp_bits_mask_9,
                io_resp_bits_mask_10,
                io_resp_bits_mask_11,
                io_resp_bits_mask_12,
                io_resp_bits_mask_13,
                io_resp_bits_mask_14,
                io_resp_bits_mask_15,
  output [11:0] io_resp_bits_laddr_data,
  output        io_resp_bits_last,
                io_resp_bits_tag_is_acc,
                io_resp_bits_tag_accumulate,
  output [7:0]  io_resp_bits_tag_bytes_read,
                io_resp_bits_tag_cmd_id
);

  reg          req_valid;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_0;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_1;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_2;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_3;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_4;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_5;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_6;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_7;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_8;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_9;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_10;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_11;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_12;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_13;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_14;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_in_15;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_0;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_1;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_2;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_3;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_4;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_5;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_6;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_7;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_8;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_9;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_10;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_11;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_12;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_13;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_14;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_mask_15;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_laddr_is_acc_addr;	// @[PixelRepeater.scala:44:18]
  reg  [11:0]  req_bits_laddr_data;	// @[PixelRepeater.scala:44:18]
  reg  [4:0]   req_bits_len;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_pixel_repeats;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_last;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_tag_is_acc;	// @[PixelRepeater.scala:44:18]
  reg          req_bits_tag_accumulate;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_tag_bytes_read;	// @[PixelRepeater.scala:44:18]
  reg  [7:0]   req_bits_tag_cmd_id;	// @[PixelRepeater.scala:44:18]
  wire         _T_79 = req_bits_pixel_repeats == 8'h0;	// @[PixelRepeater.scala:44:18, :46:76]
  wire         _io_req_ready_output = ~req_valid | io_resp_ready & _T_79;	// @[PixelRepeater.scala:44:18, :46:{21,32,50,76}]
  wire [3:0]   out_shift = req_bits_pixel_repeats[3:0] * req_bits_len[3:0];	// @[PixelRepeater.scala:44:18, :49:41]
  wire [382:0] _T_18 = {255'h0, req_bits_in_15, req_bits_in_14, req_bits_in_13, req_bits_in_12, req_bits_in_11, req_bits_in_10, req_bits_in_9, req_bits_in_8, req_bits_in_7, req_bits_in_6, req_bits_in_5, req_bits_in_4, req_bits_in_3, req_bits_in_2, req_bits_in_1, req_bits_in_0} << {376'h0, out_shift, 3'h0};	// @[LocalAddr.scala:86:26, PixelRepeater.scala:44:18, :49:41, :51:45]
  wire [46:0]  _T_53 = {31'h0, req_bits_mask_15, req_bits_mask_14, req_bits_mask_13, req_bits_mask_12, req_bits_mask_11, req_bits_mask_10, req_bits_mask_9, req_bits_mask_8, req_bits_mask_7, req_bits_mask_6, req_bits_mask_5, req_bits_mask_4, req_bits_mask_3, req_bits_mask_2, req_bits_mask_1, req_bits_mask_0} << out_shift;	// @[PixelRepeater.scala:44:18, :49:41, :52:48]
  wire [11:0]  _GEN = {4'h0, req_bits_pixel_repeats};	// @[LocalAddr.scala:86:26, PixelRepeater.scala:44:18]
  wire [12:0]  _GEN_0 = {1'h0, req_bits_laddr_data};	// @[LocalAddr.scala:89:47, PixelRepeater.scala:44:18]
  wire [11:0]  _sp_addr_result_data_T_1 = req_bits_laddr_data - _GEN;	// @[LocalAddr.scala:86:26, :89:47, PixelRepeater.scala:44:18]
  wire [12:0]  _underflow_underflow_T_1 = {5'h0, req_bits_pixel_repeats} + 13'h800;	// @[LocalAddr.scala:86:35, PixelRepeater.scala:44:18, :49:41]
  wire         underflow = ~req_bits_laddr_is_acc_addr & (req_bits_laddr_data[11] ? _GEN_0 < _underflow_underflow_T_1 : req_bits_laddr_data < _GEN);	// @[LocalAddr.scala:86:{26,35}, :89:47, PixelRepeater.scala:44:18, :60:53, :65:{21,34,40}]
  wire         _io_resp_valid_output = req_valid & ~underflow;	// @[PixelRepeater.scala:44:18, :65:34, :72:{32,35}]
  wire         _T_78 = io_resp_ready & _io_resp_valid_output | underflow;	// @[Decoupled.scala:51:35, PixelRepeater.scala:65:34, :72:32, :74:23]
  wire         _T_80 = _io_req_ready_output & io_req_valid;	// @[Decoupled.scala:51:35, PixelRepeater.scala:46:32]
  always @(posedge clock) begin
    if (reset)
      req_valid <= 1'h0;	// @[PixelRepeater.scala:44:18]
    else
      req_valid <= _T_80 | ~(_T_78 & _T_79) & req_valid;	// @[Decoupled.scala:51:35, PixelRepeater.scala:44:18, :46:76, :74:{23,37}, :77:44, :82:23, Util.scala:134:13, :139:13]
    if (_T_80) begin	// @[Decoupled.scala:51:35]
      req_bits_in_0 <= io_req_bits_in_0;	// @[PixelRepeater.scala:44:18]
      req_bits_in_1 <= io_req_bits_in_1;	// @[PixelRepeater.scala:44:18]
      req_bits_in_2 <= io_req_bits_in_2;	// @[PixelRepeater.scala:44:18]
      req_bits_in_3 <= io_req_bits_in_3;	// @[PixelRepeater.scala:44:18]
      req_bits_in_4 <= io_req_bits_in_4;	// @[PixelRepeater.scala:44:18]
      req_bits_in_5 <= io_req_bits_in_5;	// @[PixelRepeater.scala:44:18]
      req_bits_in_6 <= io_req_bits_in_6;	// @[PixelRepeater.scala:44:18]
      req_bits_in_7 <= io_req_bits_in_7;	// @[PixelRepeater.scala:44:18]
      req_bits_in_8 <= io_req_bits_in_8;	// @[PixelRepeater.scala:44:18]
      req_bits_in_9 <= io_req_bits_in_9;	// @[PixelRepeater.scala:44:18]
      req_bits_in_10 <= io_req_bits_in_10;	// @[PixelRepeater.scala:44:18]
      req_bits_in_11 <= io_req_bits_in_11;	// @[PixelRepeater.scala:44:18]
      req_bits_in_12 <= io_req_bits_in_12;	// @[PixelRepeater.scala:44:18]
      req_bits_in_13 <= io_req_bits_in_13;	// @[PixelRepeater.scala:44:18]
      req_bits_in_14 <= io_req_bits_in_14;	// @[PixelRepeater.scala:44:18]
      req_bits_in_15 <= io_req_bits_in_15;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_0 <= io_req_bits_mask_0;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_1 <= io_req_bits_mask_1;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_2 <= io_req_bits_mask_2;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_3 <= io_req_bits_mask_3;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_4 <= io_req_bits_mask_4;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_5 <= io_req_bits_mask_5;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_6 <= io_req_bits_mask_6;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_7 <= io_req_bits_mask_7;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_8 <= io_req_bits_mask_8;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_9 <= io_req_bits_mask_9;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_10 <= io_req_bits_mask_10;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_11 <= io_req_bits_mask_11;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_12 <= io_req_bits_mask_12;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_13 <= io_req_bits_mask_13;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_14 <= io_req_bits_mask_14;	// @[PixelRepeater.scala:44:18]
      req_bits_mask_15 <= io_req_bits_mask_15;	// @[PixelRepeater.scala:44:18]
      req_bits_laddr_is_acc_addr <= io_req_bits_laddr_is_acc_addr;	// @[PixelRepeater.scala:44:18]
      req_bits_laddr_data <= io_req_bits_laddr_data;	// @[PixelRepeater.scala:44:18]
      req_bits_len <= io_req_bits_len;	// @[PixelRepeater.scala:44:18]
      req_bits_pixel_repeats <= io_req_bits_pixel_repeats - 8'h1;	// @[PixelRepeater.scala:44:18, :84:59]
      req_bits_last <= io_req_bits_last;	// @[PixelRepeater.scala:44:18]
      req_bits_tag_is_acc <= io_req_bits_tag_is_acc;	// @[PixelRepeater.scala:44:18]
      req_bits_tag_accumulate <= io_req_bits_tag_accumulate;	// @[PixelRepeater.scala:44:18]
      req_bits_tag_bytes_read <= io_req_bits_tag_bytes_read;	// @[PixelRepeater.scala:44:18]
      req_bits_tag_cmd_id <= io_req_bits_tag_cmd_id;	// @[PixelRepeater.scala:44:18]
    end
    else if (_T_78)	// @[PixelRepeater.scala:74:23]
      req_bits_pixel_repeats <= req_bits_pixel_repeats - 8'h1;	// @[PixelRepeater.scala:44:18, :75:56]
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[PixelRepeater.scala:58:11]
      if (~reset & req_valid & req_bits_laddr_is_acc_addr & (|req_bits_pixel_repeats)) begin	// @[PixelRepeater.scala:44:18, :58:{11,65}]
        if (`ASSERT_VERBOSE_COND_)	// @[PixelRepeater.scala:58:11]
          $error("Assertion failed\n    at PixelRepeater.scala:58 assert(!(req.valid && is_acc_addr && req.bits.pixel_repeats > 0.U))\n");	// @[PixelRepeater.scala:58:11]
        if (`STOP_COND_)	// @[PixelRepeater.scala:58:11]
          $fatal;	// @[PixelRepeater.scala:58:11]
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    logic [31:0] _RANDOM_5;
    logic [31:0] _RANDOM_6;
    logic [31:0] _RANDOM_7;
    logic [31:0] _RANDOM_8;
    logic [31:0] _RANDOM_9;
    logic [31:0] _RANDOM_10;
    logic [31:0] _RANDOM_11;
    logic [31:0] _RANDOM_12;
    logic [31:0] _RANDOM_13;
    logic [31:0] _RANDOM_14;
    logic [31:0] _RANDOM_15;
    logic [31:0] _RANDOM_16;
    logic [31:0] _RANDOM_17;
    logic [31:0] _RANDOM_18;
    logic [31:0] _RANDOM_19;
    logic [31:0] _RANDOM_20;
    logic [31:0] _RANDOM_21;
    logic [31:0] _RANDOM_22;
    logic [31:0] _RANDOM_23;
    logic [31:0] _RANDOM_24;
    logic [31:0] _RANDOM_25;
    logic [31:0] _RANDOM_26;
    logic [31:0] _RANDOM_27;
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
        _RANDOM_5 = `RANDOM;
        _RANDOM_6 = `RANDOM;
        _RANDOM_7 = `RANDOM;
        _RANDOM_8 = `RANDOM;
        _RANDOM_9 = `RANDOM;
        _RANDOM_10 = `RANDOM;
        _RANDOM_11 = `RANDOM;
        _RANDOM_12 = `RANDOM;
        _RANDOM_13 = `RANDOM;
        _RANDOM_14 = `RANDOM;
        _RANDOM_15 = `RANDOM;
        _RANDOM_16 = `RANDOM;
        _RANDOM_17 = `RANDOM;
        _RANDOM_18 = `RANDOM;
        _RANDOM_19 = `RANDOM;
        _RANDOM_20 = `RANDOM;
        _RANDOM_21 = `RANDOM;
        _RANDOM_22 = `RANDOM;
        _RANDOM_23 = `RANDOM;
        _RANDOM_24 = `RANDOM;
        _RANDOM_25 = `RANDOM;
        _RANDOM_26 = `RANDOM;
        _RANDOM_27 = `RANDOM;
        req_valid = _RANDOM_0[0];	// @[PixelRepeater.scala:44:18]
        req_bits_in_0 = _RANDOM_0[8:1];	// @[PixelRepeater.scala:44:18]
        req_bits_in_1 = _RANDOM_0[16:9];	// @[PixelRepeater.scala:44:18]
        req_bits_in_2 = _RANDOM_0[24:17];	// @[PixelRepeater.scala:44:18]
        req_bits_in_3 = {_RANDOM_0[31:25], _RANDOM_1[0]};	// @[PixelRepeater.scala:44:18]
        req_bits_in_4 = _RANDOM_1[8:1];	// @[PixelRepeater.scala:44:18]
        req_bits_in_5 = _RANDOM_1[16:9];	// @[PixelRepeater.scala:44:18]
        req_bits_in_6 = _RANDOM_1[24:17];	// @[PixelRepeater.scala:44:18]
        req_bits_in_7 = {_RANDOM_1[31:25], _RANDOM_2[0]};	// @[PixelRepeater.scala:44:18]
        req_bits_in_8 = _RANDOM_2[8:1];	// @[PixelRepeater.scala:44:18]
        req_bits_in_9 = _RANDOM_2[16:9];	// @[PixelRepeater.scala:44:18]
        req_bits_in_10 = _RANDOM_2[24:17];	// @[PixelRepeater.scala:44:18]
        req_bits_in_11 = {_RANDOM_2[31:25], _RANDOM_3[0]};	// @[PixelRepeater.scala:44:18]
        req_bits_in_12 = _RANDOM_3[8:1];	// @[PixelRepeater.scala:44:18]
        req_bits_in_13 = _RANDOM_3[16:9];	// @[PixelRepeater.scala:44:18]
        req_bits_in_14 = _RANDOM_3[24:17];	// @[PixelRepeater.scala:44:18]
        req_bits_in_15 = {_RANDOM_3[31:25], _RANDOM_4[0]};	// @[PixelRepeater.scala:44:18]
        req_bits_mask_0 = _RANDOM_4[1];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_1 = _RANDOM_4[2];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_2 = _RANDOM_4[3];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_3 = _RANDOM_4[4];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_4 = _RANDOM_4[5];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_5 = _RANDOM_4[6];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_6 = _RANDOM_4[7];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_7 = _RANDOM_4[8];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_8 = _RANDOM_4[9];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_9 = _RANDOM_4[10];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_10 = _RANDOM_4[11];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_11 = _RANDOM_4[12];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_12 = _RANDOM_4[13];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_13 = _RANDOM_4[14];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_14 = _RANDOM_4[15];	// @[PixelRepeater.scala:44:18]
        req_bits_mask_15 = _RANDOM_4[16];	// @[PixelRepeater.scala:44:18]
        req_bits_laddr_is_acc_addr = _RANDOM_4[17];	// @[PixelRepeater.scala:44:18]
        req_bits_laddr_data = _RANDOM_5[16:5];	// @[PixelRepeater.scala:44:18]
        req_bits_len = _RANDOM_5[21:17];	// @[PixelRepeater.scala:44:18]
        req_bits_pixel_repeats = _RANDOM_5[29:22];	// @[PixelRepeater.scala:44:18]
        req_bits_last = _RANDOM_5[30];	// @[PixelRepeater.scala:44:18]
        req_bits_tag_is_acc = _RANDOM_24[11];	// @[PixelRepeater.scala:44:18]
        req_bits_tag_accumulate = _RANDOM_24[12];	// @[PixelRepeater.scala:44:18]
        req_bits_tag_bytes_read = {_RANDOM_26[31], _RANDOM_27[6:0]};	// @[PixelRepeater.scala:44:18]
        req_bits_tag_cmd_id = _RANDOM_27[14:7];	// @[PixelRepeater.scala:44:18]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_req_ready = _io_req_ready_output;	// @[PixelRepeater.scala:46:32]
  assign io_resp_valid = _io_resp_valid_output;	// @[PixelRepeater.scala:72:32]
  assign io_resp_bits_out_0 = _T_18[7:0];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_1 = _T_18[15:8];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_2 = _T_18[23:16];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_3 = _T_18[31:24];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_4 = _T_18[39:32];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_5 = _T_18[47:40];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_6 = _T_18[55:48];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_7 = _T_18[63:56];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_8 = _T_18[71:64];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_9 = _T_18[79:72];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_10 = _T_18[87:80];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_11 = _T_18[95:88];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_12 = _T_18[103:96];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_13 = _T_18[111:104];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_14 = _T_18[119:112];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_out_15 = _T_18[127:120];	// @[PixelRepeater.scala:51:{45,84}]
  assign io_resp_bits_mask_0 = _T_53[0];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_1 = _T_53[1];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_2 = _T_53[2];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_3 = _T_53[3];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_4 = _T_53[4];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_5 = _T_53[5];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_6 = _T_53[6];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_7 = _T_53[7];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_8 = _T_53[8];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_9 = _T_53[9];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_10 = _T_53[10];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_11 = _T_53[11];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_12 = _T_53[12];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_13 = _T_53[13];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_14 = _T_53[14];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_mask_15 = _T_53[15];	// @[PixelRepeater.scala:52:{48,108}]
  assign io_resp_bits_laddr_data = req_bits_laddr_is_acc_addr ? req_bits_laddr_data : req_bits_laddr_data[11] ? (_GEN_0 < _underflow_underflow_T_1 ? 12'h800 : _sp_addr_result_data_T_1) : req_bits_laddr_data < _GEN ? 12'h0 : _sp_addr_result_data_T_1;	// @[LocalAddr.scala:86:{26,35}, :89:{23,47}, PixelRepeater.scala:44:18, :60:{22,53}, :70:30]
  assign io_resp_bits_last = req_bits_last & _T_79;	// @[PixelRepeater.scala:44:18, :46:76, :54:40]
  assign io_resp_bits_tag_is_acc = req_bits_tag_is_acc;	// @[PixelRepeater.scala:44:18]
  assign io_resp_bits_tag_accumulate = req_bits_tag_accumulate;	// @[PixelRepeater.scala:44:18]
  assign io_resp_bits_tag_bytes_read = req_bits_tag_bytes_read;	// @[PixelRepeater.scala:44:18]
  assign io_resp_bits_tag_cmd_id = req_bits_tag_cmd_id;	// @[PixelRepeater.scala:44:18]
endmodule

