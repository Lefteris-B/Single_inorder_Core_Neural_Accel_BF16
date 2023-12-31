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

module Pipeline(
  input         io_in_valid,
  input  [31:0] io_in_bits_out_0,
                io_in_bits_out_1,
                io_in_bits_out_2,
                io_in_bits_out_3,
                io_in_bits_out_4,
                io_in_bits_out_5,
                io_in_bits_out_6,
                io_in_bits_out_7,
                io_in_bits_out_8,
                io_in_bits_out_9,
                io_in_bits_out_10,
                io_in_bits_out_11,
                io_in_bits_out_12,
                io_in_bits_out_13,
                io_in_bits_out_14,
                io_in_bits_out_15,
  input  [15:0] io_in_bits_row,
  input         io_in_bits_last,
  input  [11:0] io_in_bits_tag_addr,
  input         io_in_bits_tag_mask_0,
                io_in_bits_tag_mask_1,
                io_in_bits_tag_mask_2,
                io_in_bits_tag_mask_3,
                io_in_bits_tag_mask_4,
                io_in_bits_tag_mask_5,
                io_in_bits_tag_mask_6,
                io_in_bits_tag_mask_7,
                io_in_bits_tag_mask_8,
                io_in_bits_tag_mask_9,
                io_in_bits_tag_mask_10,
                io_in_bits_tag_mask_11,
                io_in_bits_tag_mask_12,
                io_in_bits_tag_mask_13,
                io_in_bits_tag_mask_14,
                io_in_bits_tag_mask_15,
                io_in_bits_tag_mask_16,
                io_in_bits_tag_mask_17,
                io_in_bits_tag_mask_18,
                io_in_bits_tag_mask_19,
                io_in_bits_tag_mask_20,
                io_in_bits_tag_mask_21,
                io_in_bits_tag_mask_22,
                io_in_bits_tag_mask_23,
                io_in_bits_tag_mask_24,
                io_in_bits_tag_mask_25,
                io_in_bits_tag_mask_26,
                io_in_bits_tag_mask_27,
                io_in_bits_tag_mask_28,
                io_in_bits_tag_mask_29,
                io_in_bits_tag_mask_30,
                io_in_bits_tag_mask_31,
                io_in_bits_tag_mask_32,
                io_in_bits_tag_mask_33,
                io_in_bits_tag_mask_34,
                io_in_bits_tag_mask_35,
                io_in_bits_tag_mask_36,
                io_in_bits_tag_mask_37,
                io_in_bits_tag_mask_38,
                io_in_bits_tag_mask_39,
                io_in_bits_tag_mask_40,
                io_in_bits_tag_mask_41,
                io_in_bits_tag_mask_42,
                io_in_bits_tag_mask_43,
                io_in_bits_tag_mask_44,
                io_in_bits_tag_mask_45,
                io_in_bits_tag_mask_46,
                io_in_bits_tag_mask_47,
                io_in_bits_tag_mask_48,
                io_in_bits_tag_mask_49,
                io_in_bits_tag_mask_50,
                io_in_bits_tag_mask_51,
                io_in_bits_tag_mask_52,
                io_in_bits_tag_mask_53,
                io_in_bits_tag_mask_54,
                io_in_bits_tag_mask_55,
                io_in_bits_tag_mask_56,
                io_in_bits_tag_mask_57,
                io_in_bits_tag_mask_58,
                io_in_bits_tag_mask_59,
                io_in_bits_tag_mask_60,
                io_in_bits_tag_mask_61,
                io_in_bits_tag_mask_62,
                io_in_bits_tag_mask_63,
                io_in_bits_tag_is_acc,
                io_in_bits_tag_accumulate,
  input  [7:0]  io_in_bits_tag_bytes_read,
                io_in_bits_tag_cmd_id,
  input         io_out_ready,
  output        io_in_ready,
                io_out_valid,
  output [31:0] io_out_bits_out_0,
                io_out_bits_out_1,
                io_out_bits_out_2,
                io_out_bits_out_3,
                io_out_bits_out_4,
                io_out_bits_out_5,
                io_out_bits_out_6,
                io_out_bits_out_7,
                io_out_bits_out_8,
                io_out_bits_out_9,
                io_out_bits_out_10,
                io_out_bits_out_11,
                io_out_bits_out_12,
                io_out_bits_out_13,
                io_out_bits_out_14,
                io_out_bits_out_15,
  output [15:0] io_out_bits_row,
  output        io_out_bits_last,
  output [11:0] io_out_bits_tag_addr,
  output        io_out_bits_tag_mask_0,
                io_out_bits_tag_mask_1,
                io_out_bits_tag_mask_2,
                io_out_bits_tag_mask_3,
                io_out_bits_tag_mask_4,
                io_out_bits_tag_mask_5,
                io_out_bits_tag_mask_6,
                io_out_bits_tag_mask_7,
                io_out_bits_tag_mask_8,
                io_out_bits_tag_mask_9,
                io_out_bits_tag_mask_10,
                io_out_bits_tag_mask_11,
                io_out_bits_tag_mask_12,
                io_out_bits_tag_mask_13,
                io_out_bits_tag_mask_14,
                io_out_bits_tag_mask_15,
                io_out_bits_tag_mask_16,
                io_out_bits_tag_mask_17,
                io_out_bits_tag_mask_18,
                io_out_bits_tag_mask_19,
                io_out_bits_tag_mask_20,
                io_out_bits_tag_mask_21,
                io_out_bits_tag_mask_22,
                io_out_bits_tag_mask_23,
                io_out_bits_tag_mask_24,
                io_out_bits_tag_mask_25,
                io_out_bits_tag_mask_26,
                io_out_bits_tag_mask_27,
                io_out_bits_tag_mask_28,
                io_out_bits_tag_mask_29,
                io_out_bits_tag_mask_30,
                io_out_bits_tag_mask_31,
                io_out_bits_tag_mask_32,
                io_out_bits_tag_mask_33,
                io_out_bits_tag_mask_34,
                io_out_bits_tag_mask_35,
                io_out_bits_tag_mask_36,
                io_out_bits_tag_mask_37,
                io_out_bits_tag_mask_38,
                io_out_bits_tag_mask_39,
                io_out_bits_tag_mask_40,
                io_out_bits_tag_mask_41,
                io_out_bits_tag_mask_42,
                io_out_bits_tag_mask_43,
                io_out_bits_tag_mask_44,
                io_out_bits_tag_mask_45,
                io_out_bits_tag_mask_46,
                io_out_bits_tag_mask_47,
                io_out_bits_tag_mask_48,
                io_out_bits_tag_mask_49,
                io_out_bits_tag_mask_50,
                io_out_bits_tag_mask_51,
                io_out_bits_tag_mask_52,
                io_out_bits_tag_mask_53,
                io_out_bits_tag_mask_54,
                io_out_bits_tag_mask_55,
                io_out_bits_tag_mask_56,
                io_out_bits_tag_mask_57,
                io_out_bits_tag_mask_58,
                io_out_bits_tag_mask_59,
                io_out_bits_tag_mask_60,
                io_out_bits_tag_mask_61,
                io_out_bits_tag_mask_62,
                io_out_bits_tag_mask_63,
                io_out_bits_tag_is_acc,
                io_out_bits_tag_accumulate,
  output [7:0]  io_out_bits_tag_bytes_read,
                io_out_bits_tag_cmd_id
);

  assign io_in_ready = io_out_ready;
  assign io_out_valid = io_in_valid;
  assign io_out_bits_out_0 = io_in_bits_out_0;
  assign io_out_bits_out_1 = io_in_bits_out_1;
  assign io_out_bits_out_2 = io_in_bits_out_2;
  assign io_out_bits_out_3 = io_in_bits_out_3;
  assign io_out_bits_out_4 = io_in_bits_out_4;
  assign io_out_bits_out_5 = io_in_bits_out_5;
  assign io_out_bits_out_6 = io_in_bits_out_6;
  assign io_out_bits_out_7 = io_in_bits_out_7;
  assign io_out_bits_out_8 = io_in_bits_out_8;
  assign io_out_bits_out_9 = io_in_bits_out_9;
  assign io_out_bits_out_10 = io_in_bits_out_10;
  assign io_out_bits_out_11 = io_in_bits_out_11;
  assign io_out_bits_out_12 = io_in_bits_out_12;
  assign io_out_bits_out_13 = io_in_bits_out_13;
  assign io_out_bits_out_14 = io_in_bits_out_14;
  assign io_out_bits_out_15 = io_in_bits_out_15;
  assign io_out_bits_row = io_in_bits_row;
  assign io_out_bits_last = io_in_bits_last;
  assign io_out_bits_tag_addr = io_in_bits_tag_addr;
  assign io_out_bits_tag_mask_0 = io_in_bits_tag_mask_0;
  assign io_out_bits_tag_mask_1 = io_in_bits_tag_mask_1;
  assign io_out_bits_tag_mask_2 = io_in_bits_tag_mask_2;
  assign io_out_bits_tag_mask_3 = io_in_bits_tag_mask_3;
  assign io_out_bits_tag_mask_4 = io_in_bits_tag_mask_4;
  assign io_out_bits_tag_mask_5 = io_in_bits_tag_mask_5;
  assign io_out_bits_tag_mask_6 = io_in_bits_tag_mask_6;
  assign io_out_bits_tag_mask_7 = io_in_bits_tag_mask_7;
  assign io_out_bits_tag_mask_8 = io_in_bits_tag_mask_8;
  assign io_out_bits_tag_mask_9 = io_in_bits_tag_mask_9;
  assign io_out_bits_tag_mask_10 = io_in_bits_tag_mask_10;
  assign io_out_bits_tag_mask_11 = io_in_bits_tag_mask_11;
  assign io_out_bits_tag_mask_12 = io_in_bits_tag_mask_12;
  assign io_out_bits_tag_mask_13 = io_in_bits_tag_mask_13;
  assign io_out_bits_tag_mask_14 = io_in_bits_tag_mask_14;
  assign io_out_bits_tag_mask_15 = io_in_bits_tag_mask_15;
  assign io_out_bits_tag_mask_16 = io_in_bits_tag_mask_16;
  assign io_out_bits_tag_mask_17 = io_in_bits_tag_mask_17;
  assign io_out_bits_tag_mask_18 = io_in_bits_tag_mask_18;
  assign io_out_bits_tag_mask_19 = io_in_bits_tag_mask_19;
  assign io_out_bits_tag_mask_20 = io_in_bits_tag_mask_20;
  assign io_out_bits_tag_mask_21 = io_in_bits_tag_mask_21;
  assign io_out_bits_tag_mask_22 = io_in_bits_tag_mask_22;
  assign io_out_bits_tag_mask_23 = io_in_bits_tag_mask_23;
  assign io_out_bits_tag_mask_24 = io_in_bits_tag_mask_24;
  assign io_out_bits_tag_mask_25 = io_in_bits_tag_mask_25;
  assign io_out_bits_tag_mask_26 = io_in_bits_tag_mask_26;
  assign io_out_bits_tag_mask_27 = io_in_bits_tag_mask_27;
  assign io_out_bits_tag_mask_28 = io_in_bits_tag_mask_28;
  assign io_out_bits_tag_mask_29 = io_in_bits_tag_mask_29;
  assign io_out_bits_tag_mask_30 = io_in_bits_tag_mask_30;
  assign io_out_bits_tag_mask_31 = io_in_bits_tag_mask_31;
  assign io_out_bits_tag_mask_32 = io_in_bits_tag_mask_32;
  assign io_out_bits_tag_mask_33 = io_in_bits_tag_mask_33;
  assign io_out_bits_tag_mask_34 = io_in_bits_tag_mask_34;
  assign io_out_bits_tag_mask_35 = io_in_bits_tag_mask_35;
  assign io_out_bits_tag_mask_36 = io_in_bits_tag_mask_36;
  assign io_out_bits_tag_mask_37 = io_in_bits_tag_mask_37;
  assign io_out_bits_tag_mask_38 = io_in_bits_tag_mask_38;
  assign io_out_bits_tag_mask_39 = io_in_bits_tag_mask_39;
  assign io_out_bits_tag_mask_40 = io_in_bits_tag_mask_40;
  assign io_out_bits_tag_mask_41 = io_in_bits_tag_mask_41;
  assign io_out_bits_tag_mask_42 = io_in_bits_tag_mask_42;
  assign io_out_bits_tag_mask_43 = io_in_bits_tag_mask_43;
  assign io_out_bits_tag_mask_44 = io_in_bits_tag_mask_44;
  assign io_out_bits_tag_mask_45 = io_in_bits_tag_mask_45;
  assign io_out_bits_tag_mask_46 = io_in_bits_tag_mask_46;
  assign io_out_bits_tag_mask_47 = io_in_bits_tag_mask_47;
  assign io_out_bits_tag_mask_48 = io_in_bits_tag_mask_48;
  assign io_out_bits_tag_mask_49 = io_in_bits_tag_mask_49;
  assign io_out_bits_tag_mask_50 = io_in_bits_tag_mask_50;
  assign io_out_bits_tag_mask_51 = io_in_bits_tag_mask_51;
  assign io_out_bits_tag_mask_52 = io_in_bits_tag_mask_52;
  assign io_out_bits_tag_mask_53 = io_in_bits_tag_mask_53;
  assign io_out_bits_tag_mask_54 = io_in_bits_tag_mask_54;
  assign io_out_bits_tag_mask_55 = io_in_bits_tag_mask_55;
  assign io_out_bits_tag_mask_56 = io_in_bits_tag_mask_56;
  assign io_out_bits_tag_mask_57 = io_in_bits_tag_mask_57;
  assign io_out_bits_tag_mask_58 = io_in_bits_tag_mask_58;
  assign io_out_bits_tag_mask_59 = io_in_bits_tag_mask_59;
  assign io_out_bits_tag_mask_60 = io_in_bits_tag_mask_60;
  assign io_out_bits_tag_mask_61 = io_in_bits_tag_mask_61;
  assign io_out_bits_tag_mask_62 = io_in_bits_tag_mask_62;
  assign io_out_bits_tag_mask_63 = io_in_bits_tag_mask_63;
  assign io_out_bits_tag_is_acc = io_in_bits_tag_is_acc;
  assign io_out_bits_tag_accumulate = io_in_bits_tag_accumulate;
  assign io_out_bits_tag_bytes_read = io_in_bits_tag_bytes_read;
  assign io_out_bits_tag_cmd_id = io_in_bits_tag_cmd_id;
endmodule

