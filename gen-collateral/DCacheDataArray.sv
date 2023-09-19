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

module DCacheDataArray(
  input          clock,
                 io_req_valid,
  input  [11:0]  io_req_bits_addr,
  input          io_req_bits_write,
  input  [127:0] io_req_bits_wdata,
  input  [1:0]   io_req_bits_wordMask,
  input  [7:0]   io_req_bits_eccMask,
  output [127:0] io_resp_0
);

  wire        data_arrays_1_rdata_data_1_en;	// @[DCache.scala:69:39]
  wire        data_arrays_1_rdata_MPORT_1_en;	// @[DCache.scala:64:17]
  wire        data_arrays_0_rdata_data_en;	// @[DCache.scala:69:39]
  wire        data_arrays_0_rdata_MPORT_en;	// @[DCache.scala:64:17]
  wire [63:0] _data_arrays_1_RW0_rdata;	// @[DescribedSRAM.scala:17:26]
  wire [63:0] _data_arrays_0_RW0_rdata;	// @[DescribedSRAM.scala:17:26]
  wire        rdata_valid = io_req_valid & io_req_bits_wordMask[0];	// @[DCache.scala:63:{30,83}]
  assign data_arrays_0_rdata_MPORT_en = rdata_valid & io_req_bits_write;	// @[DCache.scala:63:30, :64:17]
  assign data_arrays_0_rdata_data_en = rdata_valid & ~io_req_bits_write;	// @[DCache.scala:63:30, :69:{39,42}]
  wire        rdata_valid_1 = io_req_valid & io_req_bits_wordMask[1];	// @[DCache.scala:63:{30,83}]
  assign data_arrays_1_rdata_MPORT_1_en = rdata_valid_1 & io_req_bits_write;	// @[DCache.scala:63:30, :64:17]
  assign data_arrays_1_rdata_data_1_en = rdata_valid_1 & ~io_req_bits_write;	// @[DCache.scala:63:30, :69:{39,42}]
  data_arrays_0 data_arrays_0 (	// @[DescribedSRAM.scala:17:26]
    .RW0_addr  (io_req_bits_addr[11:4]),	// @[DCache.scala:51:31]
    .RW0_en    (data_arrays_0_rdata_data_en | data_arrays_0_rdata_MPORT_en),	// @[DCache.scala:64:17, :69:39, DescribedSRAM.scala:17:26]
    .RW0_clk   (clock),
    .RW0_wmode (io_req_bits_write),
    .RW0_wdata (io_req_bits_wdata[63:0]),	// @[DescribedSRAM.scala:17:26]
    .RW0_wmask (io_req_bits_eccMask),
    .RW0_rdata (_data_arrays_0_RW0_rdata)
  );
  data_arrays_1 data_arrays_1 (	// @[DescribedSRAM.scala:17:26]
    .RW0_addr  (io_req_bits_addr[11:4]),	// @[DCache.scala:51:31]
    .RW0_en    (data_arrays_1_rdata_data_1_en | data_arrays_1_rdata_MPORT_1_en),	// @[DCache.scala:64:17, :69:39, DescribedSRAM.scala:17:26]
    .RW0_clk   (clock),
    .RW0_wmode (io_req_bits_write),
    .RW0_wdata (io_req_bits_wdata[127:64]),	// @[DescribedSRAM.scala:17:26]
    .RW0_wmask (io_req_bits_eccMask),
    .RW0_rdata (_data_arrays_1_RW0_rdata)
  );
  assign io_resp_0 = {_data_arrays_1_RW0_rdata, _data_arrays_0_RW0_rdata};	// @[Cat.scala:33:92, DescribedSRAM.scala:17:26]
endmodule

