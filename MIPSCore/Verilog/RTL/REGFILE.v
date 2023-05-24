module rf(ad1, ad2, adw, wData, clk, we, rData1, rData2, RFQUERY, RFOUT);

	input 		[ 4:0] 	ad1, ad2, adw, RFQUERY;
	input 					clk, we;
	input 		[31:0] 	wData;

	output 		[31:0] 	rData1, rData2, RFOUT;
	
	reg 			[31:0] 	mem [31:0];

	assign RFOUT  = (|RFQUERY) ? mem[RFQUERY] : 32'b0;
	assign rData1 = (|ad1  ) 	? mem[ad1] 	 	: 32'b0;
	assign rData2 = (|ad2  ) 	? mem[ad2] 	 	: 32'b0;

	always@(posedge clk) begin
	
		if(we==1'b1)
		
			mem[adw] <= wData;
			
	end

endmodule
