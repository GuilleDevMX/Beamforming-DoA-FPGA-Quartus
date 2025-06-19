
module cordic_cos (
	a,
	areset,
	c,
	clk,
	s);	

	input	[10:0]	a;
	input		areset;
	output	[9:0]	c;
	input		clk;
	output	[9:0]	s;
endmodule
