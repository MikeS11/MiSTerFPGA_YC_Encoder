// Gray counter

module gray_count
(
	input   [5:0]   b,
  	output  [5:0]   g
);
  assign g = b ^ (b >> 1);

endmodule
