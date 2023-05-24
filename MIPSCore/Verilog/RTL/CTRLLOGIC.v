module ctrlogic(op, func, regW, regDst, aluSrc, brnch, memW, mem2Reg, aluCtrl, jmp, zero);

	input 		[5:0] 	op, func;
	input				zero;
	output reg 			regW, regDst, aluSrc, brnch, memW, mem2Reg, jmp;
	output 		[2:0]	aluCtrl;
	reg 		[1:0]	aluOp;

	always@(*)begin

		case(op)
			//R-Type operation
			6'b000000 : {regW, regDst, aluSrc, brnch, memW, mem2Reg, aluOp, jmp} 
							<= 9'b1_1_0_0_0_0_10_0;
			//LW operation
			6'b100011 : {regW, regDst, aluSrc, brnch, memW, mem2Reg, aluOp, jmp} 
							<= 9'b1_0_1_0_0_1_00_0;
			//SW operation
			6'b101011 : {regW, regDst, aluSrc, brnch, memW, mem2Reg, aluOp, jmp} 
							<= 9'b0_X_1_0_1_X_00_0;
			//BEQ operation
			6'b000100 : {regW, regDst, aluSrc, brnch, memW, mem2Reg, aluOp, jmp} 
							<= {3'b0_X_0, zero, 5'b0_X_01_0};
			//ADDI operation
			6'b001000 : {regW, regDst, aluSrc, brnch, memW, mem2Reg, aluOp, jmp} 
							<= 9'b1_0_1_0_0_0_00_0;
			//J operation
			6'b000010 : {regW, regDst, aluSrc, brnch, memW, mem2Reg, aluOp, jmp} 
							<= 9'b0_X_X_X_0_X_XX_1;
			//Undef state
			default	  :	{regW, regDst, aluSrc, brnch, memW, mem2Reg, aluOp, jmp} 
							<= 9'bX_X_X_X_X_X_XX_X;
		endcase // op

	end

	aluDec  al0(aluOp, func, aluCtrl);

endmodule


module aluDec(aluOp, func, aluCtrl);

	input [1:0] aluOp;
	input [5:0]	func;

	output reg [2:0] aluCtrl;

	always@(*)begin

		casex({aluOp, func})

			8'b00_XXXXXX : aluCtrl <= 3'b010;
			8'bX1_XXXXXX : aluCtrl <= 3'b110;
			8'b10_100000 : aluCtrl <= 3'b010;
			8'b10_100010 : aluCtrl <= 3'b110;
			8'b10_100100 : aluCtrl <= 3'b000;
			8'b10_100101 : aluCtrl <= 3'b001;
			8'b10_101010 : aluCtrl <= 3'b111;
			
			default 	 	 : aluCtrl <= 3'bXXX;

		endcase

	end

endmodule

