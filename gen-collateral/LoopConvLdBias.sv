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

module LoopConvLdBias(
  input         clock,
                reset,
                io_req_valid,
  input  [15:0] io_req_bits_inner_bounds_batches,
                io_req_bits_inner_bounds_orows,
                io_req_bits_inner_bounds_ocols,
                io_req_bits_derived_params_ochs,
                io_req_bits_derived_params_bias_spad_stride,
  input  [8:0]  io_req_bits_addr_start,
  input  [33:0] io_req_bits_dram_addr,
  input         io_req_bits_no_bias,
                io_req_bits_loop_id,
                io_cmd_ready,
                io_rob_overloaded,
                io_wait_for_prev_loop,
  output        io_req_ready,
                io_cmd_valid,
  output [6:0]  io_cmd_bits_inst_funct,
  output [4:0]  io_cmd_bits_inst_rs2,
                io_cmd_bits_inst_rs1,
  output        io_cmd_bits_inst_xd,
                io_cmd_bits_inst_xs1,
                io_cmd_bits_inst_xs2,
  output [4:0]  io_cmd_bits_inst_rd,
  output [6:0]  io_cmd_bits_inst_opcode,
  output [63:0] io_cmd_bits_rs1,
                io_cmd_bits_rs2,
  output        io_idle,
                io_loop_id
);

  wire        _command_p_io_in_ready;	// @[LoopConv.scala:135:25]
  wire        _command_p_io_out_valid;	// @[LoopConv.scala:135:25]
  wire [6:0]  _command_p_io_out_bits_cmd_inst_funct;	// @[LoopConv.scala:135:25]
  wire [63:0] _command_p_io_out_bits_cmd_rs1;	// @[LoopConv.scala:135:25]
  wire [63:0] _command_p_io_out_bits_cmd_rs2;	// @[LoopConv.scala:135:25]
  wire [33:0] _command_p_io_out_bits_dram_addr;	// @[LoopConv.scala:135:25]
  wire [67:0] _command_p_io_out_bits_spad_addr;	// @[LoopConv.scala:135:25]
  wire [15:0] _command_p_io_out_bits_I;	// @[LoopConv.scala:135:25]
  wire [15:0] _command_p_io_out_bits_J;	// @[LoopConv.scala:135:25]
  wire        _command_p_io_busy;	// @[LoopConv.scala:135:25]
  reg  [1:0]  state;	// @[LoopConv.scala:100:22]
  reg  [15:0] req_inner_bounds_batches;	// @[LoopConv.scala:102:16]
  reg  [15:0] req_inner_bounds_orows;	// @[LoopConv.scala:102:16]
  reg  [15:0] req_inner_bounds_ocols;	// @[LoopConv.scala:102:16]
  reg  [15:0] req_derived_params_ochs;	// @[LoopConv.scala:102:16]
  reg  [15:0] req_derived_params_bias_spad_stride;	// @[LoopConv.scala:102:16]
  reg  [8:0]  req_addr_start;	// @[LoopConv.scala:102:16]
  reg  [33:0] req_dram_addr;	// @[LoopConv.scala:102:16]
  reg         req_no_bias;	// @[LoopConv.scala:102:16]
  reg         req_loop_id;	// @[LoopConv.scala:102:16]
  wire [15:0] max_ochs_per_mvin = req_derived_params_ochs < 16'h10 ? req_derived_params_ochs : 16'h10;	// @[LoopConv.scala:102:16, :109:{30,36}, :122:42]
  reg  [15:0] b;	// @[LoopConv.scala:114:14]
  reg  [15:0] orow;	// @[LoopConv.scala:115:17]
  reg  [15:0] ocol;	// @[LoopConv.scala:116:17]
  reg  [15:0] och;	// @[LoopConv.scala:117:16]
  wire [15:0] _I_T_1 = req_inner_bounds_ocols - ocol;	// @[LoopConv.scala:102:16, :116:17, :125:21]
  wire [15:0] _J_T_1 = req_derived_params_ochs - och;	// @[LoopConv.scala:102:16, :117:16, :126:20]
  wire        _io_idle_T = state == 2'h0;	// @[LoopConv.scala:100:22, :139:14, :161:25]
  wire        _io_req_ready_output = _io_idle_T & ~_command_p_io_busy;	// @[LoopConv.scala:135:25, :161:{25,34,37}]
  wire        _command_p_io_in_valid_T_4 = (|state) & ~io_wait_for_prev_loop & (|req_dram_addr);	// @[LoopConv.scala:100:22, :102:16, :111:28, :165:{34,46,69}]
  wire        _T_2 = state == 2'h1;	// @[LoopConv.scala:100:22, :149:26, :166:41]
  wire        _T = _command_p_io_out_bits_cmd_inst_funct == 7'hE;	// @[LoopConv.scala:135:25, :156:23, :175:46]
  wire        _T_1 = _command_p_io_in_ready & _command_p_io_in_valid_T_4;	// @[Decoupled.scala:51:35, LoopConv.scala:135:25, :165:69]
  wire [16:0] _next_och_T_3 = {1'h0, och} + {1'h0, max_ochs_per_mvin};	// @[LoopConv.scala:100:22, :109:30, :117:16, :126:20, Util.scala:41:15]
  wire        _next_och_T_4 = _next_och_T_3 > {1'h0, req_derived_params_ochs - 16'h1};	// @[LoopConv.scala:100:22, :102:16, Util.scala:39:28, :41:15, :43:17]
  wire [15:0] next_och = _next_och_T_4 ? 16'h0 : _next_och_T_3[15:0];	// @[Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire [16:0] _next_ocol_T_4 = {1'h0, ocol} + 17'h10;	// @[LoopConv.scala:100:22, :116:17, :125:21, Util.scala:41:15]
  wire        _next_ocol_T_5 = _next_ocol_T_4 > {1'h0, req_inner_bounds_ocols - 16'h1};	// @[LoopConv.scala:100:22, :102:16, Util.scala:39:28, :41:15, :43:17]
  wire        _state_T_3 = ((|next_och) ? ocol : _next_ocol_T_5 ? 16'h0 : _next_ocol_T_4[15:0]) == 16'h0;	// @[LoopConv.scala:116:17, :194:68, :195:60, Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire        _next_orow_T_2 = _state_T_3 & ~(|next_och);	// @[LoopConv.scala:194:68, :195:{60,68}, Mux.scala:101:16]
  wire [16:0] _next_orow_T_6 = {1'h0, orow} + 17'h1;	// @[LoopConv.scala:100:22, :115:17, Util.scala:39:28, :41:15]
  wire        _next_orow_T_7 = _next_orow_T_6 > {1'h0, req_inner_bounds_orows - 16'h1};	// @[LoopConv.scala:100:22, :102:16, Util.scala:39:28, :41:15, :43:17]
  wire        _state_T_1 = (_next_orow_T_2 ? (_next_orow_T_7 ? 16'h0 : _next_orow_T_6[15:0]) : orow) == 16'h0;	// @[LoopConv.scala:115:17, :195:68, :196:56, Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire        _next_b_T_4 = _state_T_1 & _state_T_3 & ~(|next_och);	// @[LoopConv.scala:194:68, :195:60, :196:{56,85}, Mux.scala:101:16]
  wire [16:0] _next_b_T_8 = {1'h0, b} + 17'h1;	// @[LoopConv.scala:100:22, :114:14, Util.scala:39:28, :41:15]
  wire        _next_b_T_9 = _next_b_T_8 > {1'h0, req_inner_bounds_batches - 16'h1};	// @[LoopConv.scala:100:22, :102:16, Util.scala:39:28, :41:15, :43:17]
  wire        _T_3 = _io_req_ready_output & io_req_valid;	// @[Decoupled.scala:51:35, LoopConv.scala:161:34]
  always @(posedge clock) begin
    if (reset)
      state <= 2'h0;	// @[LoopConv.scala:100:22, :139:14]
    else if (_T_3)	// @[Decoupled.scala:51:35]
      state <= 2'h1;	// @[LoopConv.scala:100:22, :149:26]
    else if (|req_dram_addr) begin	// @[LoopConv.scala:102:16, :111:28]
      if (_T_1) begin	// @[Decoupled.scala:51:35]
        if (_T_2)	// @[LoopConv.scala:166:41]
          state <= 2'h2;	// @[LoopConv.scala:100:22, :147:27]
        else	// @[LoopConv.scala:166:41]
          state <= {~((_next_b_T_4 ? (_next_b_T_9 ? 16'h0 : _next_b_T_8[15:0]) : b) == 16'h0 & _state_T_1 & _state_T_3 & ~(|next_och)), 1'h0};	// @[LoopConv.scala:100:22, :114:14, :194:68, :195:60, :196:{56,85}, :203:{19,27,77}, Mux.scala:101:16, Util.scala:41:15, :43:17]
      end
    end
    else	// @[LoopConv.scala:111:28]
      state <= 2'h0;	// @[LoopConv.scala:100:22, :139:14]
    if (_T_3) begin	// @[Decoupled.scala:51:35]
      req_inner_bounds_batches <= io_req_bits_inner_bounds_batches;	// @[LoopConv.scala:102:16]
      req_inner_bounds_orows <= io_req_bits_inner_bounds_orows;	// @[LoopConv.scala:102:16]
      req_inner_bounds_ocols <= io_req_bits_inner_bounds_ocols;	// @[LoopConv.scala:102:16]
      req_derived_params_ochs <= io_req_bits_derived_params_ochs;	// @[LoopConv.scala:102:16]
      req_derived_params_bias_spad_stride <= io_req_bits_derived_params_bias_spad_stride;	// @[LoopConv.scala:102:16]
      req_addr_start <= io_req_bits_addr_start;	// @[LoopConv.scala:102:16]
      req_dram_addr <= io_req_bits_dram_addr;	// @[LoopConv.scala:102:16]
      req_no_bias <= io_req_bits_no_bias;	// @[LoopConv.scala:102:16]
      req_loop_id <= io_req_bits_loop_id;	// @[LoopConv.scala:102:16]
      b <= 16'h0;	// @[LoopConv.scala:114:14, Mux.scala:101:16]
      orow <= 16'h0;	// @[LoopConv.scala:115:17, Mux.scala:101:16]
      ocol <= 16'h0;	// @[LoopConv.scala:116:17, Mux.scala:101:16]
      och <= 16'h0;	// @[LoopConv.scala:117:16, Mux.scala:101:16]
    end
    else begin	// @[Decoupled.scala:51:35]
      if (~(|req_dram_addr) | ~_T_1 | _T_2 | ~_next_b_T_4) begin	// @[Decoupled.scala:51:35, LoopConv.scala:102:16, :111:28, :114:14, :117:16, :166:41, :187:15, :189:36, :190:29, :196:85, Util.scala:42:8]
      end
      else if (_next_b_T_9)	// @[Util.scala:43:17]
        b <= 16'h0;	// @[LoopConv.scala:114:14, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        b <= _next_b_T_8[15:0];	// @[LoopConv.scala:114:14, Util.scala:41:15]
      if (~(|req_dram_addr) | ~_T_1 | _T_2 | ~_next_orow_T_2) begin	// @[Decoupled.scala:51:35, LoopConv.scala:102:16, :111:28, :115:17, :117:16, :166:41, :187:15, :189:36, :190:29, :195:68, Util.scala:42:8]
      end
      else if (_next_orow_T_7)	// @[Util.scala:43:17]
        orow <= 16'h0;	// @[LoopConv.scala:115:17, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        orow <= _next_orow_T_6[15:0];	// @[LoopConv.scala:115:17, Util.scala:41:15]
      if (~(|req_dram_addr) | ~_T_1 | _T_2 | (|next_och)) begin	// @[Decoupled.scala:51:35, LoopConv.scala:102:16, :111:28, :116:17, :117:16, :166:41, :187:15, :189:36, :190:29, :194:68, Mux.scala:101:16]
      end
      else if (_next_ocol_T_5)	// @[Util.scala:43:17]
        ocol <= 16'h0;	// @[LoopConv.scala:116:17, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        ocol <= _next_ocol_T_4[15:0];	// @[LoopConv.scala:116:17, Util.scala:41:15]
      if (~(|req_dram_addr) | ~_T_1 | _T_2) begin	// @[Decoupled.scala:51:35, LoopConv.scala:102:16, :111:28, :117:16, :166:41, :187:15, :189:36, :190:29]
      end
      else if (_next_och_T_4)	// @[Util.scala:43:17]
        och <= 16'h0;	// @[LoopConv.scala:117:16, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        och <= _next_och_T_3[15:0];	// @[LoopConv.scala:117:16, Util.scala:41:15]
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
        state = _RANDOM_0[1:0];	// @[LoopConv.scala:100:22]
        req_inner_bounds_batches = _RANDOM_8[17:2];	// @[LoopConv.scala:102:16]
        req_inner_bounds_orows = {_RANDOM_15[31:18], _RANDOM_16[1:0]};	// @[LoopConv.scala:102:16]
        req_inner_bounds_ocols = _RANDOM_16[17:2];	// @[LoopConv.scala:102:16]
        req_derived_params_ochs = {_RANDOM_16[31:18], _RANDOM_17[1:0]};	// @[LoopConv.scala:102:16]
        req_derived_params_bias_spad_stride = {_RANDOM_20[31:18], _RANDOM_21[1:0]};	// @[LoopConv.scala:102:16]
        req_addr_start = _RANDOM_22[10:2];	// @[LoopConv.scala:102:16]
        req_dram_addr = {_RANDOM_22[31:11], _RANDOM_23[12:0]};	// @[LoopConv.scala:102:16]
        req_no_bias = _RANDOM_23[13];	// @[LoopConv.scala:102:16]
        req_loop_id = _RANDOM_23[14];	// @[LoopConv.scala:102:16]
        b = _RANDOM_23[30:15];	// @[LoopConv.scala:102:16, :114:14]
        orow = {_RANDOM_23[31], _RANDOM_24[14:0]};	// @[LoopConv.scala:102:16, :115:17]
        ocol = _RANDOM_24[30:15];	// @[LoopConv.scala:115:17, :116:17]
        och = {_RANDOM_24[31], _RANDOM_25[14:0]};	// @[LoopConv.scala:115:17, :117:16]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Pipeline_10 command_p (	// @[LoopConv.scala:135:25]
    .clock                       (clock),
    .reset                       (reset),
    .io_in_valid                 (_command_p_io_in_valid_T_4),	// @[LoopConv.scala:165:69]
    .io_in_bits_cmd_inst_funct   (_T_2 ? 7'h0 : 7'hE),	// @[LoopConv.scala:139:14, :156:23, :166:{34,41}]
    .io_in_bits_cmd_rs1          (_T_2 ? {36'h3F8000000, req_derived_params_bias_spad_stride[11:0], 16'h111} : 64'h0),	// @[LoopConv.scala:102:16, :145:25, :150:36, :152:18, :166:{34,41}]
    .io_in_bits_dram_addr        (req_no_bias ? 34'h0 : req_dram_addr + {16'h0, och, 2'h0}),	// @[LoopConv.scala:102:16, :117:16, :121:{22,55}, :139:14, Mux.scala:101:16]
    .io_in_bits_spad_addr        ({1'h0, {1'h0, {1'h0, {56'h0, req_addr_start} + {1'h0, {16'h0, {16'h0, {16'h0, och / 16'h10} * {16'h0, req_inner_bounds_batches}} * {32'h0, req_inner_bounds_orows}} * {48'h0, req_inner_bounds_ocols}}} + {18'h0, {16'h0, {16'h0, b} * {16'h0, req_inner_bounds_orows}} * {32'h0, req_inner_bounds_ocols}}} + {35'h0, {16'h0, orow} * {16'h0, req_inner_bounds_ocols}}} + {52'h0, ocol}),	// @[LoopConv.scala:100:22, :102:16, :114:14, :115:17, :116:17, :117:16, :122:{34,42,74,84,92,100,105,113,121,129,137}, Mux.scala:101:16]
    .io_in_bits_I                (_I_T_1 > 16'h10 ? 16'h10 : _I_T_1),	// @[LoopConv.scala:122:42, :125:{14,21,28}]
    .io_in_bits_J                (_J_T_1 > max_ochs_per_mvin ? max_ochs_per_mvin : _J_T_1),	// @[LoopConv.scala:109:30, :126:{14,20,26}]
    .io_out_ready                (io_cmd_ready & ~io_rob_overloaded),	// @[LoopConv.scala:172:{42,45}]
    .io_in_ready                 (_command_p_io_in_ready),
    .io_out_valid                (_command_p_io_out_valid),
    .io_out_bits_cmd_inst_funct  (_command_p_io_out_bits_cmd_inst_funct),
    .io_out_bits_cmd_inst_rs2    (io_cmd_bits_inst_rs2),
    .io_out_bits_cmd_inst_rs1    (io_cmd_bits_inst_rs1),
    .io_out_bits_cmd_inst_xd     (io_cmd_bits_inst_xd),
    .io_out_bits_cmd_inst_xs1    (io_cmd_bits_inst_xs1),
    .io_out_bits_cmd_inst_xs2    (io_cmd_bits_inst_xs2),
    .io_out_bits_cmd_inst_rd     (io_cmd_bits_inst_rd),
    .io_out_bits_cmd_inst_opcode (io_cmd_bits_inst_opcode),
    .io_out_bits_cmd_rs1         (_command_p_io_out_bits_cmd_rs1),
    .io_out_bits_cmd_rs2         (_command_p_io_out_bits_cmd_rs2),
    .io_out_bits_dram_addr       (_command_p_io_out_bits_dram_addr),
    .io_out_bits_spad_addr       (_command_p_io_out_bits_spad_addr),
    .io_out_bits_I               (_command_p_io_out_bits_I),
    .io_out_bits_J               (_command_p_io_out_bits_J),
    .io_busy                     (_command_p_io_busy)
  );
  assign io_req_ready = _io_req_ready_output;	// @[LoopConv.scala:161:34]
  assign io_cmd_valid = _command_p_io_out_valid & ~io_rob_overloaded;	// @[LoopConv.scala:135:25, :172:45, :173:42]
  assign io_cmd_bits_inst_funct = _command_p_io_out_bits_cmd_inst_funct;	// @[LoopConv.scala:135:25]
  assign io_cmd_bits_rs1 = _T ? {30'h0, _command_p_io_out_bits_dram_addr} : _command_p_io_out_bits_cmd_rs1;	// @[LoopConv.scala:135:25, :174:15, :175:{46,61}, :177:21]
  assign io_cmd_bits_rs2 = _T ? {11'h0, _command_p_io_out_bits_I[4:0], 9'h0, _command_p_io_out_bits_J[6:0], 3'h4, _command_p_io_out_bits_spad_addr[28:26], 13'h0, _command_p_io_out_bits_spad_addr[12:0]} : _command_p_io_out_bits_cmd_rs2;	// @[LocalAddr.scala:108:37, :109:57, LoopConv.scala:135:25, :174:15, :175:{46,61}, :179:18, :180:27, :181:27, :183:{21,37}]
  assign io_idle = _io_idle_T & ~_command_p_io_busy;	// @[LoopConv.scala:135:25, :161:{25,37}, :162:29]
  assign io_loop_id = req_loop_id;	// @[LoopConv.scala:102:16]
endmodule

