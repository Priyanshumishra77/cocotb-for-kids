//
// Generated by Bluespec Compiler (build d05342e3)
//
// On Thu Oct  6 11:04:51 IST 2022
//
//
// Ports:
// Name                         I/O  size props
// a_rdy                          O     1 reg
// b_rdy                          O     1 reg
// y_data                         O     1 reg
// y_rdy                          O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// a_data                         I     1 reg
// b_data                         I     1 reg
// a_en                           I     1
// b_en                           I     1
// y_en                           I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module ifc_or(CLK,
	   RST_N,

	   a_data,
	   a_en,
	   a_rdy,

	   b_data,
	   b_en,
	   b_rdy,

	   y_en,
	   y_data,
	   y_rdy);
  input  CLK;
  input  RST_N;

  // action method a
  input  a_data;
  input  a_en;
  output a_rdy;

  // action method b
  input  b_data;
  input  b_en;
  output b_rdy;

  // actionvalue method y
  input  y_en;
  output y_data;
  output y_rdy;

  // signals for module outputs
  wire a_rdy, b_rdy, y_data, y_rdy;

  // ports of submodule a_ff
  wire a_ff$CLR,
       a_ff$DEQ,
       a_ff$D_IN,
       a_ff$D_OUT,
       a_ff$EMPTY_N,
       a_ff$ENQ,
       a_ff$FULL_N;

  // ports of submodule b_ff
  wire b_ff$CLR,
       b_ff$DEQ,
       b_ff$D_IN,
       b_ff$D_OUT,
       b_ff$EMPTY_N,
       b_ff$ENQ,
       b_ff$FULL_N;

  // ports of submodule y_ff
  wire y_ff$CLR,
       y_ff$DEQ,
       y_ff$D_IN,
       y_ff$D_OUT,
       y_ff$EMPTY_N,
       y_ff$ENQ,
       y_ff$FULL_N;

  // action method a
  assign a_rdy = a_ff$FULL_N ;

  // action method b
  assign b_rdy = b_ff$FULL_N ;

  // actionvalue method y
  assign y_data = y_ff$D_OUT ;
  assign y_rdy = y_ff$EMPTY_N ;

  // submodule a_ff
  FIFO2 #(.width(32'd1), .guarded(1'd1)) a_ff(.RST(RST_N),
					      .CLK(CLK),
					      .D_IN(a_ff$D_IN),
					      .ENQ(a_ff$ENQ),
					      .DEQ(a_ff$DEQ),
					      .CLR(a_ff$CLR),
					      .D_OUT(a_ff$D_OUT),
					      .FULL_N(a_ff$FULL_N),
					      .EMPTY_N(a_ff$EMPTY_N));

  // submodule b_ff
  FIFO1 #(.width(32'd1), .guarded(1'd1)) b_ff(.RST(RST_N),
					      .CLK(CLK),
					      .D_IN(b_ff$D_IN),
					      .ENQ(b_ff$ENQ),
					      .DEQ(b_ff$DEQ),
					      .CLR(b_ff$CLR),
					      .D_OUT(b_ff$D_OUT),
					      .FULL_N(b_ff$FULL_N),
					      .EMPTY_N(b_ff$EMPTY_N));

  // submodule y_ff
  FIFO2 #(.width(32'd1), .guarded(1'd1)) y_ff(.RST(RST_N),
					      .CLK(CLK),
					      .D_IN(y_ff$D_IN),
					      .ENQ(y_ff$ENQ),
					      .DEQ(y_ff$DEQ),
					      .CLR(y_ff$CLR),
					      .D_OUT(y_ff$D_OUT),
					      .FULL_N(y_ff$FULL_N),
					      .EMPTY_N(y_ff$EMPTY_N));

  // submodule a_ff
  assign a_ff$D_IN = a_data ;
  assign a_ff$ENQ = a_en ;
  assign a_ff$DEQ = y_ff$FULL_N && a_ff$EMPTY_N && b_ff$EMPTY_N ;
  assign a_ff$CLR = 1'b0 ;

  // submodule b_ff
  assign b_ff$D_IN = b_data ;
  assign b_ff$ENQ = b_en ;
  assign b_ff$DEQ = y_ff$FULL_N && a_ff$EMPTY_N && b_ff$EMPTY_N ;
  assign b_ff$CLR = 1'b0 ;

  // submodule y_ff
  assign y_ff$D_IN = a_ff$D_OUT || b_ff$D_OUT ;
  assign y_ff$ENQ = y_ff$FULL_N && a_ff$EMPTY_N && b_ff$EMPTY_N ;
  assign y_ff$DEQ = y_en ;
  assign y_ff$CLR = 1'b0 ;
endmodule  // dut
