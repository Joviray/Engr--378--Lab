module pc(pcp, clk, pc);

	input 		[31:0] 	pcp;
	input 				clk;
	output reg 	[31:0] 	pc;

	always@(posedge clk)
		pc<=pcp;

endmodule
