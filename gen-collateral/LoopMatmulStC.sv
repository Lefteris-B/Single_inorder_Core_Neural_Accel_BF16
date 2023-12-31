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

module LoopMatmulStC(
  input         clock,
                reset,
                io_req_valid,
  input  [15:0] io_req_bits_max_k,
                io_req_bits_max_j,
                io_req_bits_max_i,
  input  [3:0]  io_req_bits_pad_j,
                io_req_bits_pad_i,
  input  [33:0] io_req_bits_dram_addr,
                io_req_bits_dram_stride,
  input         io_req_bits_full_c,
  input  [2:0]  io_req_bits_act,
  input  [8:0]  io_req_bits_addr_start,
  input         io_req_bits_loop_id,
                io_req_bits_is_resadd,
                io_cmd_ready,
  input  [15:0] io_ex_k,
                io_ex_j,
                io_ex_i,
  input         io_ex_completed,
                io_rob_overloaded,
  output        io_req_ready,
                io_cmd_valid,
  output [6:0]  io_cmd_bits_inst_funct,
  output [63:0] io_cmd_bits_rs1,
                io_cmd_bits_rs2,
  output        io_idle,
                io_loop_id
);

  wire [3:0][2:0] _GEN = '{3'h5, 3'h0, 3'h6, 3'h5};	// @[LoopMatmul.scala:590:8]
  wire [3:0][2:0] _GEN_0 = '{3'h1, 3'h0, 3'h3, 3'h1};	// @[LoopMatmul.scala:590:8]
  wire [3:0][2:0] _GEN_1 = '{3'h5, 3'h0, 3'h7, 3'h5};	// @[LoopMatmul.scala:589:8]
  wire [3:0][2:0] _GEN_2 = '{3'h2, 3'h0, 3'h4, 3'h2};	// @[LoopMatmul.scala:589:8]
  reg  [1:0]      state;	// @[LoopMatmul.scala:538:22]
  reg  [15:0]     req_max_k;	// @[LoopMatmul.scala:540:16]
  reg  [15:0]     req_max_j;	// @[LoopMatmul.scala:540:16]
  reg  [15:0]     req_max_i;	// @[LoopMatmul.scala:540:16]
  reg  [3:0]      req_pad_j;	// @[LoopMatmul.scala:540:16]
  reg  [3:0]      req_pad_i;	// @[LoopMatmul.scala:540:16]
  reg  [33:0]     req_dram_addr;	// @[LoopMatmul.scala:540:16]
  reg  [33:0]     req_dram_stride;	// @[LoopMatmul.scala:540:16]
  reg             req_full_c;	// @[LoopMatmul.scala:540:16]
  reg  [2:0]      req_act;	// @[LoopMatmul.scala:540:16]
  reg  [8:0]      req_addr_start;	// @[LoopMatmul.scala:540:16]
  reg             req_loop_id;	// @[LoopMatmul.scala:540:16]
  reg             req_is_resadd;	// @[LoopMatmul.scala:540:16]
  wire [15:0]     max_blocks = req_full_c ? 16'h1 : req_max_j < 16'h5 ? req_max_j : 16'h4;	// @[LoopMatmul.scala:540:16, :542:{23,44,55}]
  reg  [15:0]     j;	// @[LoopMatmul.scala:545:14]
  reg  [15:0]     i;	// @[LoopMatmul.scala:546:14]
  wire [49:0]     _ln_dram_offset_T = {34'h0, i} * {16'h0, req_dram_stride};	// @[LoopMatmul.scala:540:16, :546:14, :550:40, Mux.scala:101:16]
  wire [49:0]     _GEN_3 = {34'h0, j};	// @[LoopMatmul.scala:545:14, :550:{40,58}]
  wire [57:0]     _GEN_4 = {24'h0, req_dram_addr};	// @[LoopMatmul.scala:540:16, :552:33]
  wire [24:0]     _GEN_5 = {9'h0, i} * {9'h0, req_max_j};	// @[LoopMatmul.scala:540:16, :546:14, :553:37, :564:17]
  wire [28:0]     _GEN_6 = {20'h0, req_addr_start} + {_GEN_5 + {9'h0, j}, 4'h0};	// @[LoopMatmul.scala:540:16, :545:14, :553:{32,37,49}, :555:43, :564:17]
  wire [16:0]     _next_j_T_10 = {1'h0, j} + {1'h0, max_blocks};	// @[LoopMatmul.scala:538:22, :542:23, :545:14, :554:22]
  wire [15:0]     blocks = _next_j_T_10[15:0] <= req_max_j ? max_blocks : req_max_j - j;	// @[LoopMatmul.scala:540:16, :542:23, :545:14, :554:{19,22,35,70}]
  wire [15:0]     _cols_T_2 = j + blocks;	// @[LoopMatmul.scala:545:14, :554:19, :555:46]
  wire [6:0]      ln_mvout_cmd_rs2_num_cols = {blocks[2:0], 4'h0} - {3'h0, _cols_T_2 >= req_max_j ? req_pad_j : 4'h0};	// @[LoopMatmul.scala:540:16, :554:19, :555:{38,43,46,55}, :578:12]
  wire [15:0]     _rows_T_1 = req_max_i - 16'h1;	// @[LoopMatmul.scala:540:16, :556:48]
  wire [4:0]      mvout_cmd_rs2_num_rows = 5'h10 - {1'h0, i == _rows_T_1 ? req_pad_i : 4'h0};	// @[LoopMatmul.scala:538:22, :540:16, :546:14, :555:43, :556:{27,32,35,48}]
  reg  [15:0]     ln_row;	// @[LoopMatmul.scala:571:19]
  reg  [15:0]     ln_cmd;	// @[LoopMatmul.scala:572:19]
  reg  [15:0]     ln_stat_id;	// @[LoopMatmul.scala:573:23]
  wire [16:0]     _GEN_7 = {1'h0, ln_row};	// @[LoopMatmul.scala:538:22, :571:19, :583:30]
  wire [16:0]     _GEN_8 = {1'h0, ln_stat_id};	// @[LoopMatmul.scala:538:22, :573:23, :585:21]
  wire [16:0]     ln_r = _GEN_7 + _GEN_8;	// @[LoopMatmul.scala:583:30, :585:21]
  wire            _ln_norm_cmd_T_6 = req_act == 3'h2;	// @[LoopMatmul.scala:540:16, :577:37, :589:17]
  wire            _io_req_ready_output = state == 2'h0;	// @[LoopMatmul.scala:538:22, :559:13, :621:25]
  wire            _ex_ahead_T_20 = io_ex_i > i;	// @[LoopMatmul.scala:546:14, :631:54]
  wire            _io_cmd_valid_output = (|state) & ~io_rob_overloaded & (req_is_resadd ? io_ex_completed | _ex_ahead_T_20 | io_ex_i == i & io_ex_j >= _cols_T_2 : io_ex_completed | req_act != 3'h2 & req_act != 3'h4 & io_ex_k == req_max_k - 16'h1 & (io_ex_j >= _cols_T_2 | io_ex_j == _cols_T_2 - 16'h1 & _ex_ahead_T_20)) & (|req_dram_addr);	// @[LoopMatmul.scala:538:22, :540:16, :542:55, :546:14, :555:46, :577:37, :627:{26,43}, :628:{15,53,77}, :629:{16,30}, :630:{18,32}, :631:{21,36,43,54}, :632:22, :633:{14,33,61,67,78}, :636:{25,37,68,85}]
  wire            _T_8 = state == 2'h2;	// @[LoopMatmul.scala:538:22, :577:37, :638:12]
  wire [16:0]     _ln_stat_ids_T_4 = {12'h0, mvout_cmd_rs2_num_rows} - _GEN_7;	// @[LoopMatmul.scala:556:27, :583:30]
  wire            _T = req_dram_addr == 34'h0;	// @[LoopMatmul.scala:540:16, :550:40, :644:23]
  wire            _T_10 = io_cmd_ready & _io_cmd_valid_output;	// @[Decoupled.scala:51:35, LoopMatmul.scala:636:68]
  wire            _T_3 = _T_10 & state == 2'h1;	// @[Decoupled.scala:51:35, LoopMatmul.scala:538:22, :646:{29,38}, :682:17]
  wire [16:0]     _GEN_9 = {1'h0, i};	// @[LoopMatmul.scala:538:22, :546:14, Util.scala:41:15]
  wire [16:0]     _next_i_T_3 = _GEN_9 + 17'h1;	// @[LoopMatmul.scala:556:48, Util.scala:41:15]
  wire [16:0]     _GEN_10 = {1'h0, _rows_T_1};	// @[LoopMatmul.scala:538:22, :556:48, Util.scala:43:17]
  wire            _next_i_T_4 = _next_i_T_3 > _GEN_10;	// @[Util.scala:41:15, :43:17]
  wire [15:0]     next_i = _next_i_T_4 ? 16'h0 : _next_i_T_3[15:0];	// @[Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire            _next_j_T_5 = _next_j_T_10 > {1'h0, req_max_j - 16'h1};	// @[LoopMatmul.scala:538:22, :540:16, :554:22, Util.scala:39:28, :43:17]
  wire            _T_9 = _T_10 & _T_8;	// @[Decoupled.scala:51:35, LoopMatmul.scala:638:12, :657:29]
  wire            _T_12 = _T_10 & (&state);	// @[Decoupled.scala:51:35, LoopMatmul.scala:538:22, :639:12, :659:29]
  wire            _next_j_T_11 = _next_j_T_10 > {1'h0, req_max_j - 16'h1};	// @[LoopMatmul.scala:538:22, :540:16, :554:22, Util.scala:39:28, :43:17]
  wire [15:0]     next_j_1 = _next_j_T_11 ? 16'h0 : _next_j_T_10[15:0];	// @[LoopMatmul.scala:554:22, Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire [16:0]     _next_stat_id_T_4 = _GEN_8 + 17'h1;	// @[LoopMatmul.scala:556:48, :585:21, Util.scala:41:15]
  wire            _next_stat_id_T_5 = _next_stat_id_T_4 > (_ln_stat_ids_T_4 > 17'h4 ? 17'h4 : _ln_stat_ids_T_4) - 17'h1;	// @[LoopMatmul.scala:583:{24,30,40}, Util.scala:39:28, :41:15, :43:17]
  wire            _T_18 = ((|next_j_1) ? ln_stat_id : _next_stat_id_T_5 ? 16'h0 : _next_stat_id_T_4[15:0]) == 16'h0;	// @[LoopMatmul.scala:573:23, :661:70, :662:94, Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire            _next_cmd_T_2 = ~(|next_j_1) & _T_18;	// @[LoopMatmul.scala:661:70, :662:{78,94}, Mux.scala:101:16]
  wire [16:0]     _next_cmd_T_6 = {1'h0, ln_cmd} + 17'h1;	// @[LoopMatmul.scala:538:22, :556:48, :572:19, Util.scala:41:15]
  wire            _next_cmd_T_7 = _next_cmd_T_6 > 17'h2;	// @[Util.scala:41:15, :43:17]
  wire            _T_16 = (_next_cmd_T_2 ? (_next_cmd_T_7 ? 16'h0 : _next_cmd_T_6[15:0]) : ln_cmd) == 16'h0;	// @[LoopMatmul.scala:572:19, :662:78, :663:111, Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire            _next_row_T_4 = ~(|next_j_1) & _T_18 & _T_16;	// @[LoopMatmul.scala:661:70, :662:94, :663:{99,111}, Mux.scala:101:16]
  wire [16:0]     _next_row_T_8 = _GEN_7 + 17'h4;	// @[LoopMatmul.scala:583:{24,30}, Util.scala:41:15]
  wire            _next_row_T_9 = _next_row_T_8 > {12'h0, mvout_cmd_rs2_num_rows - 5'h1};	// @[LoopMatmul.scala:556:27, :583:30, Util.scala:39:28, :41:15, :43:17]
  wire            _T_14 = (_next_row_T_4 ? (_next_row_T_9 ? 16'h0 : _next_row_T_8[15:0]) : ln_row) == 16'h0;	// @[LoopMatmul.scala:571:19, :663:99, :665:78, Mux.scala:101:16, Util.scala:41:15, :43:17]
  wire            _next_i_T_12 = ~(|next_j_1) & _T_18 & _T_16 & _T_14;	// @[LoopMatmul.scala:661:70, :662:94, :663:111, :665:{66,78}, Mux.scala:101:16]
  wire [16:0]     _next_i_T_16 = _GEN_9 + 17'h1;	// @[LoopMatmul.scala:556:48, Util.scala:41:15]
  wire            _next_i_T_17 = _next_i_T_16 > _GEN_10;	// @[Util.scala:41:15, :43:17]
  wire            _T_23 = _io_req_ready_output & io_req_valid;	// @[Decoupled.scala:51:35, LoopMatmul.scala:621:25]
  wire            _GEN_11 = _T | _T_3 | _T_9;	// @[LoopMatmul.scala:573:23, :644:{23,32}, :646:{29,46}, :657:{29,53}, :659:49]
  always @(posedge clock) begin
    if (reset)
      state <= 2'h0;	// @[LoopMatmul.scala:538:22, :559:13]
    else if (_T_23) begin	// @[Decoupled.scala:51:35]
      if (io_req_bits_act == 3'h2 | io_req_bits_act == 3'h4)	// @[LoopMatmul.scala:542:55, :577:37, :682:{35,61,81}]
        state <= 2'h2;	// @[LoopMatmul.scala:538:22, :577:37]
      else	// @[LoopMatmul.scala:682:61]
        state <= 2'h1;	// @[LoopMatmul.scala:538:22, :682:17]
    end
    else if (_T)	// @[LoopMatmul.scala:644:23]
      state <= 2'h0;	// @[LoopMatmul.scala:538:22, :559:13]
    else if (_T_3) begin	// @[LoopMatmul.scala:646:29]
      if (~(|next_i) & ((|next_i) ? j : _next_j_T_5 ? 16'h0 : _next_j_T_10[15:0]) == 16'h0)	// @[LoopMatmul.scala:545:14, :554:22, :649:60, :654:{26,36}, Mux.scala:101:16, Util.scala:41:15, :43:17]
        state <= 2'h0;	// @[LoopMatmul.scala:538:22, :559:13]
    end
    else if (_T_9)	// @[LoopMatmul.scala:657:29]
      state <= 2'h3;	// @[LoopMatmul.scala:538:22, :560:24]
    else if (_T_12) begin	// @[LoopMatmul.scala:659:29]
      if ((_next_i_T_12 ? (_next_i_T_17 ? 16'h0 : _next_i_T_16[15:0]) : i) == 16'h0 & _T_14 & _T_16 & _T_18 & ~(|next_j_1))	// @[LoopMatmul.scala:546:14, :661:70, :662:94, :663:111, :665:{66,78}, :673:{18,90}, Mux.scala:101:16, Util.scala:41:15, :43:17]
        state <= 2'h0;	// @[LoopMatmul.scala:538:22, :559:13]
      else if (~(|next_j_1))	// @[LoopMatmul.scala:661:70, Mux.scala:101:16]
        state <= 2'h2;	// @[LoopMatmul.scala:538:22, :577:37]
    end
    if (_T_23) begin	// @[Decoupled.scala:51:35]
      req_max_k <= io_req_bits_max_k;	// @[LoopMatmul.scala:540:16]
      req_max_j <= io_req_bits_max_j;	// @[LoopMatmul.scala:540:16]
      req_max_i <= io_req_bits_max_i;	// @[LoopMatmul.scala:540:16]
      req_pad_j <= io_req_bits_pad_j;	// @[LoopMatmul.scala:540:16]
      req_pad_i <= io_req_bits_pad_i;	// @[LoopMatmul.scala:540:16]
      req_dram_addr <= io_req_bits_dram_addr;	// @[LoopMatmul.scala:540:16]
      req_dram_stride <= io_req_bits_dram_stride;	// @[LoopMatmul.scala:540:16]
      req_full_c <= io_req_bits_full_c;	// @[LoopMatmul.scala:540:16]
      req_act <= io_req_bits_act;	// @[LoopMatmul.scala:540:16]
      req_addr_start <= io_req_bits_addr_start;	// @[LoopMatmul.scala:540:16]
      req_loop_id <= io_req_bits_loop_id;	// @[LoopMatmul.scala:540:16]
      req_is_resadd <= io_req_bits_is_resadd;	// @[LoopMatmul.scala:540:16]
      j <= 16'h0;	// @[LoopMatmul.scala:545:14, Mux.scala:101:16]
      i <= 16'h0;	// @[LoopMatmul.scala:546:14, Mux.scala:101:16]
      ln_row <= 16'h0;	// @[LoopMatmul.scala:571:19, Mux.scala:101:16]
      ln_cmd <= 16'h0;	// @[LoopMatmul.scala:572:19, Mux.scala:101:16]
      ln_stat_id <= 16'h0;	// @[LoopMatmul.scala:573:23, Mux.scala:101:16]
    end
    else begin	// @[Decoupled.scala:51:35]
      if (_T) begin	// @[LoopMatmul.scala:644:23]
      end
      else if (_T_3) begin	// @[LoopMatmul.scala:646:29]
        if (~(|next_i)) begin	// @[LoopMatmul.scala:649:60, Mux.scala:101:16]
          if (_next_j_T_5)	// @[Util.scala:43:17]
            j <= 16'h0;	// @[LoopMatmul.scala:545:14, Mux.scala:101:16]
          else	// @[Util.scala:43:17]
            j <= _next_j_T_10[15:0];	// @[LoopMatmul.scala:545:14, :554:22, Util.scala:41:15]
        end
        if (_next_i_T_4)	// @[Util.scala:43:17]
          i <= 16'h0;	// @[LoopMatmul.scala:546:14, Mux.scala:101:16]
        else	// @[Util.scala:43:17]
          i <= _next_i_T_3[15:0];	// @[LoopMatmul.scala:546:14, Util.scala:41:15]
      end
      else begin	// @[LoopMatmul.scala:646:29]
        if (_T_9 | ~_T_12) begin	// @[LoopMatmul.scala:545:14, :657:{29,53}, :659:{29,49}]
        end
        else if (_next_j_T_11)	// @[Util.scala:43:17]
          j <= 16'h0;	// @[LoopMatmul.scala:545:14, Mux.scala:101:16]
        else	// @[Util.scala:43:17]
          j <= _next_j_T_10[15:0];	// @[LoopMatmul.scala:545:14, :554:22, Util.scala:41:15]
        if (_T_9 | ~(_T_12 & _next_i_T_12)) begin	// @[LoopMatmul.scala:546:14, :657:{29,53}, :659:{29,49}, :665:66, :671:7]
        end
        else if (_next_i_T_17)	// @[Util.scala:43:17]
          i <= 16'h0;	// @[LoopMatmul.scala:546:14, Mux.scala:101:16]
        else	// @[Util.scala:43:17]
          i <= _next_i_T_16[15:0];	// @[LoopMatmul.scala:546:14, Util.scala:41:15]
      end
      if (_GEN_11 | ~(_T_12 & _next_row_T_4)) begin	// @[LoopMatmul.scala:571:19, :573:23, :644:32, :646:46, :657:53, :659:{29,49}, :663:99, :670:12]
      end
      else if (_next_row_T_9)	// @[Util.scala:43:17]
        ln_row <= 16'h0;	// @[LoopMatmul.scala:571:19, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        ln_row <= _next_row_T_8[15:0];	// @[LoopMatmul.scala:571:19, Util.scala:41:15]
      if (_GEN_11 | ~(_T_12 & _next_cmd_T_2)) begin	// @[LoopMatmul.scala:572:19, :573:23, :644:32, :646:46, :657:53, :659:{29,49}, :662:78, :669:12]
      end
      else if (_next_cmd_T_7)	// @[Util.scala:43:17]
        ln_cmd <= 16'h0;	// @[LoopMatmul.scala:572:19, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        ln_cmd <= _next_cmd_T_6[15:0];	// @[LoopMatmul.scala:572:19, Util.scala:41:15]
      if (_GEN_11 | ~_T_12 | (|next_j_1)) begin	// @[LoopMatmul.scala:545:14, :573:23, :644:32, :646:46, :657:53, :659:{29,49}, :661:70, Mux.scala:101:16]
      end
      else if (_next_stat_id_T_5)	// @[Util.scala:43:17]
        ln_stat_id <= 16'h0;	// @[LoopMatmul.scala:573:23, Mux.scala:101:16]
      else	// @[Util.scala:43:17]
        ln_stat_id <= _next_stat_id_T_4[15:0];	// @[LoopMatmul.scala:573:23, Util.scala:41:15]
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
        state = _RANDOM_0[1:0];	// @[LoopMatmul.scala:538:22]
        req_max_k = _RANDOM_0[17:2];	// @[LoopMatmul.scala:538:22, :540:16]
        req_max_j = {_RANDOM_0[31:18], _RANDOM_1[1:0]};	// @[LoopMatmul.scala:538:22, :540:16]
        req_max_i = _RANDOM_1[17:2];	// @[LoopMatmul.scala:540:16]
        req_pad_j = _RANDOM_1[21:18];	// @[LoopMatmul.scala:540:16]
        req_pad_i = _RANDOM_1[25:22];	// @[LoopMatmul.scala:540:16]
        req_dram_addr = {_RANDOM_1[31:26], _RANDOM_2[27:0]};	// @[LoopMatmul.scala:540:16]
        req_dram_stride = {_RANDOM_2[31:28], _RANDOM_3[29:0]};	// @[LoopMatmul.scala:540:16]
        req_full_c = _RANDOM_3[30];	// @[LoopMatmul.scala:540:16]
        req_act = {_RANDOM_3[31], _RANDOM_4[1:0]};	// @[LoopMatmul.scala:540:16]
        req_addr_start = _RANDOM_4[10:2];	// @[LoopMatmul.scala:540:16]
        req_loop_id = _RANDOM_4[11];	// @[LoopMatmul.scala:540:16]
        req_is_resadd = _RANDOM_4[12];	// @[LoopMatmul.scala:540:16]
        j = _RANDOM_4[28:13];	// @[LoopMatmul.scala:540:16, :545:14]
        i = {_RANDOM_4[31:29], _RANDOM_5[12:0]};	// @[LoopMatmul.scala:540:16, :546:14]
        ln_row = _RANDOM_5[28:13];	// @[LoopMatmul.scala:546:14, :571:19]
        ln_cmd = {_RANDOM_5[31:29], _RANDOM_6[12:0]};	// @[LoopMatmul.scala:546:14, :572:19]
        ln_stat_id = _RANDOM_6[28:13];	// @[LoopMatmul.scala:572:19, :573:23]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_req_ready = _io_req_ready_output;	// @[LoopMatmul.scala:621:25]
  assign io_cmd_valid = _io_cmd_valid_output;	// @[LoopMatmul.scala:636:68]
  assign io_cmd_bits_inst_funct = _T_8 ? 7'h0 : 7'h3;	// @[LoopMatmul.scala:559:13, :560:24, :638:12, Mux.scala:101:16]
  assign io_cmd_bits_rs1 = _T_8 ? {48'h2, ln_stat_id[7:0], 8'h3} : {6'h0, (&state) ? _GEN_4 + {1'h0, {2'h0, {1'h0, _ln_dram_offset_T} + {35'h0, j}, 4'h0} + {6'h0, {34'h0, ln_r} * {17'h0, req_dram_stride}} & 57'hFFFFFFFF} : _GEN_4 + ((req_full_c ? {2'h0, _ln_dram_offset_T + _GEN_3, 6'h0} : {4'h0, _ln_dram_offset_T + _GEN_3, 4'h0}) & 58'hFFFFFFFF)};	// @[LoopMatmul.scala:538:22, :540:16, :545:14, :550:{24,40,58,78}, :551:26, :552:33, :553:49, :555:43, :559:13, :561:17, :573:23, :585:21, :593:{46,67,75}, :594:36, :600:36, :605:44, :638:12, :639:12, :1139:17, Mux.scala:101:16]
  assign io_cmd_bits_rs2 = _T_8 ? 64'h0 : (&state) ? {25'h200, ln_mvout_cmd_rs2_num_cols, 2'h2, req_full_c, _next_j_T_10 >= {1'h0, req_max_j} ? (_ln_norm_cmd_T_6 ? _GEN_2[ln_cmd[1:0]] : _GEN_1[ln_cmd[1:0]]) : _ln_norm_cmd_T_6 ? _GEN_0[ln_cmd[1:0]] : _GEN[ln_cmd[1:0]], 13'h0, {4'h0, req_addr_start} + {_GEN_5[8:0] + j[8:0], 4'h0} + ln_r[12:0]} : {11'h0, mvout_cmd_rs2_num_rows, 9'h0, ln_mvout_cmd_rs2_num_cols, 2'h2, req_full_c, _GEN_6[28:26], 13'h0, _GEN_6[12:0]};	// @[LocalAddr.scala:108:37, LoopMatmul.scala:538:22, :540:16, :545:14, :553:{32,37,49}, :554:{22,70}, :555:{38,43}, :556:27, :564:17, :568:34, :572:19, :577:37, :585:21, :587:{35,53,74}, :588:{24,41}, :589:{8,17}, :590:8, :597:22, :606:22, :619:40, :638:12, :639:12, Mux.scala:101:16]
  assign io_idle = _io_req_ready_output;	// @[LoopMatmul.scala:621:25]
  assign io_loop_id = req_loop_id;	// @[LoopMatmul.scala:540:16]
endmodule

