module dmem #(MEMSIZE = 128)(ad, we, clk, wData, rData, DMQUERY, DMOUT);

	input 	[31:0] 	ad, wData;
	input 	[ 9:0]	DMQUERY;
	input 				clk, we;
	output  	[31:0]	rData, DMOUT;

	reg 		[31:0] 	mem [(MEMSIZE-1):0];

	assign DMOUT  	= mem[{27'b0, DMQUERY[ 9:2]}];
	assign rData 	= mem[{ 2'b0,      ad[31:2]}];
	
	always@(posedge clk) begin
	
		if(we == 1'b1)
		
			mem[{2'b00,ad[31:2]}] <= wData;
			
	end

endmodule
