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

module TLB_1(
  input  [33:0] io_req_bits_vaddr,
  input  [2:0]  io_req_bits_size,
  input  [4:0]  io_req_bits_cmd,
  input  [1:0]  io_req_bits_prv,
  input         io_ptw_status_debug,
                io_ptw_status_mxr,
                io_ptw_status_sum,
                io_ptw_pmp_0_cfg_l,
  input  [1:0]  io_ptw_pmp_0_cfg_a,
  input         io_ptw_pmp_0_cfg_w,
                io_ptw_pmp_0_cfg_r,
  input  [29:0] io_ptw_pmp_0_addr,
  input  [31:0] io_ptw_pmp_0_mask,
  input         io_ptw_pmp_1_cfg_l,
  input  [1:0]  io_ptw_pmp_1_cfg_a,
  input         io_ptw_pmp_1_cfg_w,
                io_ptw_pmp_1_cfg_r,
  input  [29:0] io_ptw_pmp_1_addr,
  input  [31:0] io_ptw_pmp_1_mask,
  input         io_ptw_pmp_2_cfg_l,
  input  [1:0]  io_ptw_pmp_2_cfg_a,
  input         io_ptw_pmp_2_cfg_w,
                io_ptw_pmp_2_cfg_r,
  input  [29:0] io_ptw_pmp_2_addr,
  input  [31:0] io_ptw_pmp_2_mask,
  input         io_ptw_pmp_3_cfg_l,
  input  [1:0]  io_ptw_pmp_3_cfg_a,
  input         io_ptw_pmp_3_cfg_w,
                io_ptw_pmp_3_cfg_r,
  input  [29:0] io_ptw_pmp_3_addr,
  input  [31:0] io_ptw_pmp_3_mask,
  input         io_ptw_pmp_4_cfg_l,
  input  [1:0]  io_ptw_pmp_4_cfg_a,
  input         io_ptw_pmp_4_cfg_w,
                io_ptw_pmp_4_cfg_r,
  input  [29:0] io_ptw_pmp_4_addr,
  input  [31:0] io_ptw_pmp_4_mask,
  input         io_ptw_pmp_5_cfg_l,
  input  [1:0]  io_ptw_pmp_5_cfg_a,
  input         io_ptw_pmp_5_cfg_w,
                io_ptw_pmp_5_cfg_r,
  input  [29:0] io_ptw_pmp_5_addr,
  input  [31:0] io_ptw_pmp_5_mask,
  input         io_ptw_pmp_6_cfg_l,
  input  [1:0]  io_ptw_pmp_6_cfg_a,
  input         io_ptw_pmp_6_cfg_w,
                io_ptw_pmp_6_cfg_r,
  input  [29:0] io_ptw_pmp_6_addr,
  input  [31:0] io_ptw_pmp_6_mask,
  input         io_ptw_pmp_7_cfg_l,
  input  [1:0]  io_ptw_pmp_7_cfg_a,
  input         io_ptw_pmp_7_cfg_w,
                io_ptw_pmp_7_cfg_r,
  input  [29:0] io_ptw_pmp_7_addr,
  input  [31:0] io_ptw_pmp_7_mask,
  output [31:0] io_resp_paddr,
  output        io_resp_pf_ld,
                io_resp_pf_st,
                io_resp_ae_ld,
                io_resp_ae_st
);

  wire        _entries_barrier_5_io_y_u;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_ae_ptw;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_ae_final;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_pf;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_gf;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_sw;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_sx;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_sr;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_pw;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_px;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_pr;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_ppp;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_pal;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_paa;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_eff;	// @[package.scala:259:25]
  wire        _entries_barrier_5_io_y_c;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_u;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_ae_ptw;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_ae_final;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_pf;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_gf;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_sw;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_sx;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_sr;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_pw;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_px;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_pr;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_ppp;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_pal;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_paa;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_eff;	// @[package.scala:259:25]
  wire        _entries_barrier_4_io_y_c;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_u;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_ae_ptw;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_ae_final;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_pf;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_gf;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_sw;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_sx;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_sr;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_pw;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_px;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_pr;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_ppp;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_pal;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_paa;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_eff;	// @[package.scala:259:25]
  wire        _entries_barrier_3_io_y_c;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_u;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_ae_ptw;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_ae_final;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_pf;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_gf;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_sw;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_sx;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_sr;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_pw;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_px;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_pr;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_ppp;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_pal;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_paa;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_eff;	// @[package.scala:259:25]
  wire        _entries_barrier_2_io_y_c;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_u;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_ae_ptw;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_ae_final;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_pf;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_gf;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_sw;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_sx;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_sr;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_pw;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_px;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_pr;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_ppp;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_pal;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_paa;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_eff;	// @[package.scala:259:25]
  wire        _entries_barrier_1_io_y_c;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_u;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_ae_ptw;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_ae_final;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_pf;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_gf;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_sw;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_sx;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_sr;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_pw;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_px;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_pr;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_ppp;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_pal;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_paa;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_eff;	// @[package.scala:259:25]
  wire        _entries_barrier_io_y_c;	// @[package.scala:259:25]
  wire        _pmp_io_r;	// @[TLB.scala:403:19]
  wire        _pmp_io_w;	// @[TLB.scala:403:19]
  wire        _mpu_ppn_barrier_io_y_u;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_ae_ptw;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_ae_final;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_pf;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_gf;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_sw;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_sx;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_sr;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_pw;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_px;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_pr;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_ppp;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_pal;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_paa;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_eff;	// @[package.scala:259:25]
  wire        _mpu_ppn_barrier_io_y_c;	// @[package.scala:259:25]
  wire [40:0] _mpu_ppn_WIRE_1 = 41'bz;	// @[TLB.scala:159:77]
  wire [10:0] _GEN = io_req_bits_vaddr[26:16] ^ 11'h201;	// @[Parameters.scala:137:31]
  wire [1:0]  _GEN_0 = io_req_bits_vaddr[26:25] ^ 2'h1;	// @[Parameters.scala:137:31]
  wire        legal_address = io_req_bits_vaddr[33:12] == 22'h3 | io_req_bits_vaddr[33:12] == 22'h2010 | io_req_bits_vaddr[33:12] == 22'h4 | io_req_bits_vaddr[33:12] == 22'h54000 | io_req_bits_vaddr[33:26] == 8'h3 | io_req_bits_vaddr[33:16] == 18'h200 | io_req_bits_vaddr[33:12] == 22'h0 | io_req_bits_vaddr[33:16] == 18'h1 | io_req_bits_vaddr[33:12] == 22'h100 | io_req_bits_vaddr[33:12] == 22'h110 | io_req_bits_vaddr[33:28] == 6'h8;	// @[Parameters.scala:137:{31,65}, TLB.scala:410:67]
  wire        cacheable = legal_address & io_req_bits_vaddr[31];	// @[TLB.scala:410:67, :413:19]
  wire        deny_access_to_debug = ~io_ptw_status_debug & io_req_bits_vaddr[33:12] == 22'h0;	// @[Parameters.scala:137:65, TLB.scala:418:{39,50}]
  wire [3:0]  _GEN_1 = {io_req_bits_vaddr[31], io_req_bits_vaddr[25], io_req_bits_vaddr[20], io_req_bits_vaddr[16]};	// @[Parameters.scala:137:45]
  wire [3:0]  _GEN_2 = {io_req_bits_vaddr[31], io_req_bits_vaddr[26:25], ~(io_req_bits_vaddr[20])};	// @[Parameters.scala:137:{31,45}]
  wire [3:0]  _GEN_3 = {io_req_bits_vaddr[31], _GEN_0, io_req_bits_vaddr[20]};	// @[Parameters.scala:137:{31,45}]
  wire [1:0]  _GEN_4 = {io_req_bits_vaddr[31], ~(io_req_bits_vaddr[26])};	// @[Parameters.scala:137:{31,45}]
  wire [40:0] _entries_WIRE_3 = 41'bz;	// @[TLB.scala:159:77]
  wire [40:0] _entries_WIRE_5 = 41'bz;	// @[TLB.scala:159:77]
  wire [40:0] _entries_WIRE_7 = 41'bz;	// @[TLB.scala:159:77]
  wire [40:0] _entries_WIRE_9 = 41'bz;	// @[TLB.scala:159:77]
  wire [40:0] _entries_WIRE_11 = 41'bz;	// @[TLB.scala:159:77]
  wire        _cmd_read_T_2 = io_req_bits_cmd == 5'h6;	// @[package.scala:16:47]
  wire        _cmd_write_T_3 = io_req_bits_cmd == 5'h7;	// @[package.scala:16:47]
  wire        _cmd_write_T_5 = io_req_bits_cmd == 5'h4;	// @[package.scala:16:47]
  wire        _cmd_write_T_6 = io_req_bits_cmd == 5'h9;	// @[package.scala:16:47]
  wire        _cmd_write_T_7 = io_req_bits_cmd == 5'hA;	// @[package.scala:16:47]
  wire        _cmd_write_T_8 = io_req_bits_cmd == 5'hB;	// @[package.scala:16:47]
  wire        _cmd_write_T_12 = io_req_bits_cmd == 5'h8;	// @[package.scala:16:47]
  wire        _cmd_write_T_13 = io_req_bits_cmd == 5'hC;	// @[package.scala:16:47]
  wire        _cmd_write_T_14 = io_req_bits_cmd == 5'hD;	// @[package.scala:16:47]
  wire        _cmd_write_T_15 = io_req_bits_cmd == 5'hE;	// @[package.scala:16:47]
  wire        _cmd_write_T_16 = io_req_bits_cmd == 5'hF;	// @[package.scala:16:47]
  wire        cmd_put_partial = io_req_bits_cmd == 5'h11;	// @[TLB.scala:562:41]
  wire        _GEN_5 = (|(io_req_bits_vaddr[7:0] & (8'h1 << io_req_bits_size) - 8'h1)) & legal_address & ({io_req_bits_vaddr[31], io_req_bits_vaddr[25], io_req_bits_vaddr[20], io_req_bits_vaddr[16], io_req_bits_vaddr[13]} == 5'h0 | {io_req_bits_vaddr[31], io_req_bits_vaddr[26:25], ~(io_req_bits_vaddr[20]), io_req_bits_vaddr[13]} == 5'h0 | {io_req_bits_vaddr[31], _GEN_0, io_req_bits_vaddr[20], io_req_bits_vaddr[16]} == 5'h0 | {io_req_bits_vaddr[31], _GEN[10:9], io_req_bits_vaddr[20], _GEN[0], io_req_bits_vaddr[13]} == 6'h0 | _GEN_4 == 2'h0) | (_cmd_read_T_2 | _cmd_write_T_3) & ~cacheable;	// @[Bitwise.scala:77:12, OneHot.scala:57:35, Parameters.scala:137:{31,45,65}, :616:89, TLB.scala:410:67, :413:19, :539:{39,69,77}, :571:{8,37}, :572:{8,19}, package.scala:16:47, :73:59]
  OptimizationBarrier mpu_ppn_barrier (	// @[package.scala:259:25]
    .io_x_u        (_mpu_ppn_WIRE_1[20]),	// @[TLB.scala:159:77]
    .io_x_ae_ptw   (_mpu_ppn_WIRE_1[18]),	// @[TLB.scala:159:77]
    .io_x_ae_final (_mpu_ppn_WIRE_1[17]),	// @[TLB.scala:159:77]
    .io_x_pf       (_mpu_ppn_WIRE_1[16]),	// @[TLB.scala:159:77]
    .io_x_gf       (_mpu_ppn_WIRE_1[15]),	// @[TLB.scala:159:77]
    .io_x_sw       (_mpu_ppn_WIRE_1[14]),	// @[TLB.scala:159:77]
    .io_x_sx       (_mpu_ppn_WIRE_1[13]),	// @[TLB.scala:159:77]
    .io_x_sr       (_mpu_ppn_WIRE_1[12]),	// @[TLB.scala:159:77]
    .io_x_pw       (_mpu_ppn_WIRE_1[8]),	// @[TLB.scala:159:77]
    .io_x_px       (_mpu_ppn_WIRE_1[7]),	// @[TLB.scala:159:77]
    .io_x_pr       (_mpu_ppn_WIRE_1[6]),	// @[TLB.scala:159:77]
    .io_x_ppp      (_mpu_ppn_WIRE_1[5]),	// @[TLB.scala:159:77]
    .io_x_pal      (_mpu_ppn_WIRE_1[4]),	// @[TLB.scala:159:77]
    .io_x_paa      (_mpu_ppn_WIRE_1[3]),	// @[TLB.scala:159:77]
    .io_x_eff      (_mpu_ppn_WIRE_1[2]),	// @[TLB.scala:159:77]
    .io_x_c        (_mpu_ppn_WIRE_1[1]),	// @[TLB.scala:159:77]
    .io_y_u        (_mpu_ppn_barrier_io_y_u),
    .io_y_ae_ptw   (_mpu_ppn_barrier_io_y_ae_ptw),
    .io_y_ae_final (_mpu_ppn_barrier_io_y_ae_final),
    .io_y_pf       (_mpu_ppn_barrier_io_y_pf),
    .io_y_gf       (_mpu_ppn_barrier_io_y_gf),
    .io_y_sw       (_mpu_ppn_barrier_io_y_sw),
    .io_y_sx       (_mpu_ppn_barrier_io_y_sx),
    .io_y_sr       (_mpu_ppn_barrier_io_y_sr),
    .io_y_pw       (_mpu_ppn_barrier_io_y_pw),
    .io_y_px       (_mpu_ppn_barrier_io_y_px),
    .io_y_pr       (_mpu_ppn_barrier_io_y_pr),
    .io_y_ppp      (_mpu_ppn_barrier_io_y_ppp),
    .io_y_pal      (_mpu_ppn_barrier_io_y_pal),
    .io_y_paa      (_mpu_ppn_barrier_io_y_paa),
    .io_y_eff      (_mpu_ppn_barrier_io_y_eff),
    .io_y_c        (_mpu_ppn_barrier_io_y_c)
  );
  PMPChecker_2 pmp (	// @[TLB.scala:403:19]
    .io_prv         (io_req_bits_prv),
    .io_pmp_0_cfg_l (io_ptw_pmp_0_cfg_l),
    .io_pmp_0_cfg_a (io_ptw_pmp_0_cfg_a),
    .io_pmp_0_cfg_w (io_ptw_pmp_0_cfg_w),
    .io_pmp_0_cfg_r (io_ptw_pmp_0_cfg_r),
    .io_pmp_0_addr  (io_ptw_pmp_0_addr),
    .io_pmp_0_mask  (io_ptw_pmp_0_mask),
    .io_pmp_1_cfg_l (io_ptw_pmp_1_cfg_l),
    .io_pmp_1_cfg_a (io_ptw_pmp_1_cfg_a),
    .io_pmp_1_cfg_w (io_ptw_pmp_1_cfg_w),
    .io_pmp_1_cfg_r (io_ptw_pmp_1_cfg_r),
    .io_pmp_1_addr  (io_ptw_pmp_1_addr),
    .io_pmp_1_mask  (io_ptw_pmp_1_mask),
    .io_pmp_2_cfg_l (io_ptw_pmp_2_cfg_l),
    .io_pmp_2_cfg_a (io_ptw_pmp_2_cfg_a),
    .io_pmp_2_cfg_w (io_ptw_pmp_2_cfg_w),
    .io_pmp_2_cfg_r (io_ptw_pmp_2_cfg_r),
    .io_pmp_2_addr  (io_ptw_pmp_2_addr),
    .io_pmp_2_mask  (io_ptw_pmp_2_mask),
    .io_pmp_3_cfg_l (io_ptw_pmp_3_cfg_l),
    .io_pmp_3_cfg_a (io_ptw_pmp_3_cfg_a),
    .io_pmp_3_cfg_w (io_ptw_pmp_3_cfg_w),
    .io_pmp_3_cfg_r (io_ptw_pmp_3_cfg_r),
    .io_pmp_3_addr  (io_ptw_pmp_3_addr),
    .io_pmp_3_mask  (io_ptw_pmp_3_mask),
    .io_pmp_4_cfg_l (io_ptw_pmp_4_cfg_l),
    .io_pmp_4_cfg_a (io_ptw_pmp_4_cfg_a),
    .io_pmp_4_cfg_w (io_ptw_pmp_4_cfg_w),
    .io_pmp_4_cfg_r (io_ptw_pmp_4_cfg_r),
    .io_pmp_4_addr  (io_ptw_pmp_4_addr),
    .io_pmp_4_mask  (io_ptw_pmp_4_mask),
    .io_pmp_5_cfg_l (io_ptw_pmp_5_cfg_l),
    .io_pmp_5_cfg_a (io_ptw_pmp_5_cfg_a),
    .io_pmp_5_cfg_w (io_ptw_pmp_5_cfg_w),
    .io_pmp_5_cfg_r (io_ptw_pmp_5_cfg_r),
    .io_pmp_5_addr  (io_ptw_pmp_5_addr),
    .io_pmp_5_mask  (io_ptw_pmp_5_mask),
    .io_pmp_6_cfg_l (io_ptw_pmp_6_cfg_l),
    .io_pmp_6_cfg_a (io_ptw_pmp_6_cfg_a),
    .io_pmp_6_cfg_w (io_ptw_pmp_6_cfg_w),
    .io_pmp_6_cfg_r (io_ptw_pmp_6_cfg_r),
    .io_pmp_6_addr  (io_ptw_pmp_6_addr),
    .io_pmp_6_mask  (io_ptw_pmp_6_mask),
    .io_pmp_7_cfg_l (io_ptw_pmp_7_cfg_l),
    .io_pmp_7_cfg_a (io_ptw_pmp_7_cfg_a),
    .io_pmp_7_cfg_w (io_ptw_pmp_7_cfg_w),
    .io_pmp_7_cfg_r (io_ptw_pmp_7_cfg_r),
    .io_pmp_7_addr  (io_ptw_pmp_7_addr),
    .io_pmp_7_mask  (io_ptw_pmp_7_mask),
    .io_addr        (io_req_bits_vaddr[31:0]),	// @[TLB.scala:404:15]
    .io_size        (io_req_bits_size),
    .io_r           (_pmp_io_r),
    .io_w           (_pmp_io_w)
  );
  OptimizationBarrier entries_barrier (	// @[package.scala:259:25]
    .io_x_u        (1'h0),
    .io_x_ae_ptw   (1'h0),
    .io_x_ae_final (1'h0),
    .io_x_pf       (1'h0),
    .io_x_gf       (1'h0),
    .io_x_sw       (1'h0),
    .io_x_sx       (1'h0),
    .io_x_sr       (1'h0),
    .io_x_pw       (1'h0),
    .io_x_px       (1'h0),
    .io_x_pr       (1'h0),
    .io_x_ppp      (1'h0),
    .io_x_pal      (1'h0),
    .io_x_paa      (1'h0),
    .io_x_eff      (1'h0),
    .io_x_c        (1'h0),
    .io_y_u        (_entries_barrier_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_io_y_ae_final),
    .io_y_pf       (_entries_barrier_io_y_pf),
    .io_y_gf       (_entries_barrier_io_y_gf),
    .io_y_sw       (_entries_barrier_io_y_sw),
    .io_y_sx       (_entries_barrier_io_y_sx),
    .io_y_sr       (_entries_barrier_io_y_sr),
    .io_y_pw       (_entries_barrier_io_y_pw),
    .io_y_px       (_entries_barrier_io_y_px),
    .io_y_pr       (_entries_barrier_io_y_pr),
    .io_y_ppp      (_entries_barrier_io_y_ppp),
    .io_y_pal      (_entries_barrier_io_y_pal),
    .io_y_paa      (_entries_barrier_io_y_paa),
    .io_y_eff      (_entries_barrier_io_y_eff),
    .io_y_c        (_entries_barrier_io_y_c)
  );
  OptimizationBarrier entries_barrier_1 (	// @[package.scala:259:25]
    .io_x_u        (_entries_WIRE_3[20]),	// @[TLB.scala:159:77]
    .io_x_ae_ptw   (_entries_WIRE_3[18]),	// @[TLB.scala:159:77]
    .io_x_ae_final (_entries_WIRE_3[17]),	// @[TLB.scala:159:77]
    .io_x_pf       (_entries_WIRE_3[16]),	// @[TLB.scala:159:77]
    .io_x_gf       (_entries_WIRE_3[15]),	// @[TLB.scala:159:77]
    .io_x_sw       (_entries_WIRE_3[14]),	// @[TLB.scala:159:77]
    .io_x_sx       (_entries_WIRE_3[13]),	// @[TLB.scala:159:77]
    .io_x_sr       (_entries_WIRE_3[12]),	// @[TLB.scala:159:77]
    .io_x_pw       (_entries_WIRE_3[8]),	// @[TLB.scala:159:77]
    .io_x_px       (_entries_WIRE_3[7]),	// @[TLB.scala:159:77]
    .io_x_pr       (_entries_WIRE_3[6]),	// @[TLB.scala:159:77]
    .io_x_ppp      (_entries_WIRE_3[5]),	// @[TLB.scala:159:77]
    .io_x_pal      (_entries_WIRE_3[4]),	// @[TLB.scala:159:77]
    .io_x_paa      (_entries_WIRE_3[3]),	// @[TLB.scala:159:77]
    .io_x_eff      (_entries_WIRE_3[2]),	// @[TLB.scala:159:77]
    .io_x_c        (_entries_WIRE_3[1]),	// @[TLB.scala:159:77]
    .io_y_u        (_entries_barrier_1_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_1_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_1_io_y_ae_final),
    .io_y_pf       (_entries_barrier_1_io_y_pf),
    .io_y_gf       (_entries_barrier_1_io_y_gf),
    .io_y_sw       (_entries_barrier_1_io_y_sw),
    .io_y_sx       (_entries_barrier_1_io_y_sx),
    .io_y_sr       (_entries_barrier_1_io_y_sr),
    .io_y_pw       (_entries_barrier_1_io_y_pw),
    .io_y_px       (_entries_barrier_1_io_y_px),
    .io_y_pr       (_entries_barrier_1_io_y_pr),
    .io_y_ppp      (_entries_barrier_1_io_y_ppp),
    .io_y_pal      (_entries_barrier_1_io_y_pal),
    .io_y_paa      (_entries_barrier_1_io_y_paa),
    .io_y_eff      (_entries_barrier_1_io_y_eff),
    .io_y_c        (_entries_barrier_1_io_y_c)
  );
  OptimizationBarrier entries_barrier_2 (	// @[package.scala:259:25]
    .io_x_u        (_entries_WIRE_5[20]),	// @[TLB.scala:159:77]
    .io_x_ae_ptw   (_entries_WIRE_5[18]),	// @[TLB.scala:159:77]
    .io_x_ae_final (_entries_WIRE_5[17]),	// @[TLB.scala:159:77]
    .io_x_pf       (_entries_WIRE_5[16]),	// @[TLB.scala:159:77]
    .io_x_gf       (_entries_WIRE_5[15]),	// @[TLB.scala:159:77]
    .io_x_sw       (_entries_WIRE_5[14]),	// @[TLB.scala:159:77]
    .io_x_sx       (_entries_WIRE_5[13]),	// @[TLB.scala:159:77]
    .io_x_sr       (_entries_WIRE_5[12]),	// @[TLB.scala:159:77]
    .io_x_pw       (_entries_WIRE_5[8]),	// @[TLB.scala:159:77]
    .io_x_px       (_entries_WIRE_5[7]),	// @[TLB.scala:159:77]
    .io_x_pr       (_entries_WIRE_5[6]),	// @[TLB.scala:159:77]
    .io_x_ppp      (_entries_WIRE_5[5]),	// @[TLB.scala:159:77]
    .io_x_pal      (_entries_WIRE_5[4]),	// @[TLB.scala:159:77]
    .io_x_paa      (_entries_WIRE_5[3]),	// @[TLB.scala:159:77]
    .io_x_eff      (_entries_WIRE_5[2]),	// @[TLB.scala:159:77]
    .io_x_c        (_entries_WIRE_5[1]),	// @[TLB.scala:159:77]
    .io_y_u        (_entries_barrier_2_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_2_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_2_io_y_ae_final),
    .io_y_pf       (_entries_barrier_2_io_y_pf),
    .io_y_gf       (_entries_barrier_2_io_y_gf),
    .io_y_sw       (_entries_barrier_2_io_y_sw),
    .io_y_sx       (_entries_barrier_2_io_y_sx),
    .io_y_sr       (_entries_barrier_2_io_y_sr),
    .io_y_pw       (_entries_barrier_2_io_y_pw),
    .io_y_px       (_entries_barrier_2_io_y_px),
    .io_y_pr       (_entries_barrier_2_io_y_pr),
    .io_y_ppp      (_entries_barrier_2_io_y_ppp),
    .io_y_pal      (_entries_barrier_2_io_y_pal),
    .io_y_paa      (_entries_barrier_2_io_y_paa),
    .io_y_eff      (_entries_barrier_2_io_y_eff),
    .io_y_c        (_entries_barrier_2_io_y_c)
  );
  OptimizationBarrier entries_barrier_3 (	// @[package.scala:259:25]
    .io_x_u        (_entries_WIRE_7[20]),	// @[TLB.scala:159:77]
    .io_x_ae_ptw   (_entries_WIRE_7[18]),	// @[TLB.scala:159:77]
    .io_x_ae_final (_entries_WIRE_7[17]),	// @[TLB.scala:159:77]
    .io_x_pf       (_entries_WIRE_7[16]),	// @[TLB.scala:159:77]
    .io_x_gf       (_entries_WIRE_7[15]),	// @[TLB.scala:159:77]
    .io_x_sw       (_entries_WIRE_7[14]),	// @[TLB.scala:159:77]
    .io_x_sx       (_entries_WIRE_7[13]),	// @[TLB.scala:159:77]
    .io_x_sr       (_entries_WIRE_7[12]),	// @[TLB.scala:159:77]
    .io_x_pw       (_entries_WIRE_7[8]),	// @[TLB.scala:159:77]
    .io_x_px       (_entries_WIRE_7[7]),	// @[TLB.scala:159:77]
    .io_x_pr       (_entries_WIRE_7[6]),	// @[TLB.scala:159:77]
    .io_x_ppp      (_entries_WIRE_7[5]),	// @[TLB.scala:159:77]
    .io_x_pal      (_entries_WIRE_7[4]),	// @[TLB.scala:159:77]
    .io_x_paa      (_entries_WIRE_7[3]),	// @[TLB.scala:159:77]
    .io_x_eff      (_entries_WIRE_7[2]),	// @[TLB.scala:159:77]
    .io_x_c        (_entries_WIRE_7[1]),	// @[TLB.scala:159:77]
    .io_y_u        (_entries_barrier_3_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_3_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_3_io_y_ae_final),
    .io_y_pf       (_entries_barrier_3_io_y_pf),
    .io_y_gf       (_entries_barrier_3_io_y_gf),
    .io_y_sw       (_entries_barrier_3_io_y_sw),
    .io_y_sx       (_entries_barrier_3_io_y_sx),
    .io_y_sr       (_entries_barrier_3_io_y_sr),
    .io_y_pw       (_entries_barrier_3_io_y_pw),
    .io_y_px       (_entries_barrier_3_io_y_px),
    .io_y_pr       (_entries_barrier_3_io_y_pr),
    .io_y_ppp      (_entries_barrier_3_io_y_ppp),
    .io_y_pal      (_entries_barrier_3_io_y_pal),
    .io_y_paa      (_entries_barrier_3_io_y_paa),
    .io_y_eff      (_entries_barrier_3_io_y_eff),
    .io_y_c        (_entries_barrier_3_io_y_c)
  );
  OptimizationBarrier entries_barrier_4 (	// @[package.scala:259:25]
    .io_x_u        (_entries_WIRE_9[20]),	// @[TLB.scala:159:77]
    .io_x_ae_ptw   (_entries_WIRE_9[18]),	// @[TLB.scala:159:77]
    .io_x_ae_final (_entries_WIRE_9[17]),	// @[TLB.scala:159:77]
    .io_x_pf       (_entries_WIRE_9[16]),	// @[TLB.scala:159:77]
    .io_x_gf       (_entries_WIRE_9[15]),	// @[TLB.scala:159:77]
    .io_x_sw       (_entries_WIRE_9[14]),	// @[TLB.scala:159:77]
    .io_x_sx       (_entries_WIRE_9[13]),	// @[TLB.scala:159:77]
    .io_x_sr       (_entries_WIRE_9[12]),	// @[TLB.scala:159:77]
    .io_x_pw       (_entries_WIRE_9[8]),	// @[TLB.scala:159:77]
    .io_x_px       (_entries_WIRE_9[7]),	// @[TLB.scala:159:77]
    .io_x_pr       (_entries_WIRE_9[6]),	// @[TLB.scala:159:77]
    .io_x_ppp      (_entries_WIRE_9[5]),	// @[TLB.scala:159:77]
    .io_x_pal      (_entries_WIRE_9[4]),	// @[TLB.scala:159:77]
    .io_x_paa      (_entries_WIRE_9[3]),	// @[TLB.scala:159:77]
    .io_x_eff      (_entries_WIRE_9[2]),	// @[TLB.scala:159:77]
    .io_x_c        (_entries_WIRE_9[1]),	// @[TLB.scala:159:77]
    .io_y_u        (_entries_barrier_4_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_4_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_4_io_y_ae_final),
    .io_y_pf       (_entries_barrier_4_io_y_pf),
    .io_y_gf       (_entries_barrier_4_io_y_gf),
    .io_y_sw       (_entries_barrier_4_io_y_sw),
    .io_y_sx       (_entries_barrier_4_io_y_sx),
    .io_y_sr       (_entries_barrier_4_io_y_sr),
    .io_y_pw       (_entries_barrier_4_io_y_pw),
    .io_y_px       (_entries_barrier_4_io_y_px),
    .io_y_pr       (_entries_barrier_4_io_y_pr),
    .io_y_ppp      (_entries_barrier_4_io_y_ppp),
    .io_y_pal      (_entries_barrier_4_io_y_pal),
    .io_y_paa      (_entries_barrier_4_io_y_paa),
    .io_y_eff      (_entries_barrier_4_io_y_eff),
    .io_y_c        (_entries_barrier_4_io_y_c)
  );
  OptimizationBarrier entries_barrier_5 (	// @[package.scala:259:25]
    .io_x_u        (_entries_WIRE_11[20]),	// @[TLB.scala:159:77]
    .io_x_ae_ptw   (_entries_WIRE_11[18]),	// @[TLB.scala:159:77]
    .io_x_ae_final (_entries_WIRE_11[17]),	// @[TLB.scala:159:77]
    .io_x_pf       (_entries_WIRE_11[16]),	// @[TLB.scala:159:77]
    .io_x_gf       (_entries_WIRE_11[15]),	// @[TLB.scala:159:77]
    .io_x_sw       (_entries_WIRE_11[14]),	// @[TLB.scala:159:77]
    .io_x_sx       (_entries_WIRE_11[13]),	// @[TLB.scala:159:77]
    .io_x_sr       (_entries_WIRE_11[12]),	// @[TLB.scala:159:77]
    .io_x_pw       (_entries_WIRE_11[8]),	// @[TLB.scala:159:77]
    .io_x_px       (_entries_WIRE_11[7]),	// @[TLB.scala:159:77]
    .io_x_pr       (_entries_WIRE_11[6]),	// @[TLB.scala:159:77]
    .io_x_ppp      (_entries_WIRE_11[5]),	// @[TLB.scala:159:77]
    .io_x_pal      (_entries_WIRE_11[4]),	// @[TLB.scala:159:77]
    .io_x_paa      (_entries_WIRE_11[3]),	// @[TLB.scala:159:77]
    .io_x_eff      (_entries_WIRE_11[2]),	// @[TLB.scala:159:77]
    .io_x_c        (_entries_WIRE_11[1]),	// @[TLB.scala:159:77]
    .io_y_u        (_entries_barrier_5_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_5_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_5_io_y_ae_final),
    .io_y_pf       (_entries_barrier_5_io_y_pf),
    .io_y_gf       (_entries_barrier_5_io_y_gf),
    .io_y_sw       (_entries_barrier_5_io_y_sw),
    .io_y_sx       (_entries_barrier_5_io_y_sx),
    .io_y_sr       (_entries_barrier_5_io_y_sr),
    .io_y_pw       (_entries_barrier_5_io_y_pw),
    .io_y_px       (_entries_barrier_5_io_y_px),
    .io_y_pr       (_entries_barrier_5_io_y_pr),
    .io_y_ppp      (_entries_barrier_5_io_y_ppp),
    .io_y_pal      (_entries_barrier_5_io_y_pal),
    .io_y_paa      (_entries_barrier_5_io_y_paa),
    .io_y_eff      (_entries_barrier_5_io_y_eff),
    .io_y_c        (_entries_barrier_5_io_y_c)
  );
  assign io_resp_paddr = io_req_bits_vaddr[31:0];	// @[Cat.scala:33:92]
  assign io_resp_pf_ld = 1'h0;
  assign io_resp_pf_st = 1'h0;
  assign io_resp_ae_ld = (io_req_bits_cmd == 5'h0 | io_req_bits_cmd == 5'h10 | _cmd_read_T_2 | _cmd_write_T_3 | _cmd_write_T_5 | _cmd_write_T_6 | _cmd_write_T_7 | _cmd_write_T_8 | _cmd_write_T_12 | _cmd_write_T_13 | _cmd_write_T_14 | _cmd_write_T_15 | _cmd_write_T_16) & (_GEN_5 | ~(legal_address & ~deny_access_to_debug & _pmp_io_r));	// @[Consts.scala:85:68, OneHot.scala:57:35, TLB.scala:403:19, :410:67, :418:50, :419:{44,66}, :571:37, :575:{24,44,46}, package.scala:16:47]
  assign io_resp_ae_st = (io_req_bits_cmd == 5'h1 | cmd_put_partial | _cmd_write_T_3 | _cmd_write_T_5 | _cmd_write_T_6 | _cmd_write_T_7 | _cmd_write_T_8 | _cmd_write_T_12 | _cmd_write_T_13 | _cmd_write_T_14 | _cmd_write_T_15 | _cmd_write_T_16 | io_req_bits_cmd == 5'h5 | io_req_bits_cmd == 5'h17) & (_GEN_5 | ~(legal_address & (_GEN_1 == 4'h0 | _GEN_2 == 4'h0 | _GEN_3 == 4'h0 | _GEN_4 == 2'h0 | io_req_bits_vaddr[31]) & ~deny_access_to_debug & _pmp_io_w)) | cmd_put_partial & ~(legal_address & (_GEN_1 == 4'h0 | _GEN_2 == 4'h0 | _GEN_3 == 4'h0 | _GEN_4 == 2'h0 | io_req_bits_vaddr[31]) | cacheable) | (_cmd_write_T_5 | _cmd_write_T_6 | _cmd_write_T_7 | _cmd_write_T_8) & ~(legal_address & (_GEN_1 == 4'h0 | _GEN_2 == 4'h0 | _GEN_3 == 4'h0 | _GEN_4 == 2'h0 | io_req_bits_vaddr[31]) | cacheable) | (_cmd_write_T_12 | _cmd_write_T_13 | _cmd_write_T_14 | _cmd_write_T_15 | _cmd_write_T_16) & ~(legal_address & (_GEN_1 == 4'h0 | _GEN_2 == 4'h0 | _GEN_3 == 4'h0 | _GEN_4 == 2'h0 | io_req_bits_vaddr[31]) | cacheable);	// @[Consts.scala:86:32, Parameters.scala:137:{45,65}, :616:89, TLB.scala:403:19, :410:67, :413:19, :418:50, :419:44, :420:70, :533:39, :534:39, :535:39, :562:41, :566:35, :571:37, :577:{8,35,37}, :578:{8,26}, :579:{8,26,53}, :580:{8,29}, package.scala:16:47, :73:59]
endmodule

