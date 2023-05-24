module dplogic(	inst, pc, pcp, brnch, jmp, adwReg, rst,
				regDst, aluSrc, rd2, srcB, mem2Reg, result,
				aluRslt, rData);

	input 	[31:0] 	inst, pc, rd2, aluRslt, rData;
	input 			brnch, jmp, regDst, 
					aluSrc, mem2Reg, rst;
	output	[ 4:0]	adwReg;
	output 	[31:0]	pcp, srcB, result;
	wire 	[31:0] 	pcplus4, pca, pcb, seimm, bta, jta;

	//Logic to create PCP options
	assign pcplus4 		=	pc + 32'h4;
	assign seimm		= 	{{16{inst[15]}},inst[15:0]};
	assign bta			=	{seimm[29:0], 2'b0} + pcplus4;
	assign jta			=	{pcplus4[31:28], {inst[25:0], 2'b00}};
	//Decision for PCP
	MUX2X1 			m0(pcplus4, bta, 	brnch, 	pca);
	MUX2X1 			m1(pca, 	jta, 	jmp, 	pcb);
	MUX2X1 			m3(pcb, 	32'b0, 	rst, 	pcp);
	//Decision for ALU srcB operand
	MUX2X1 			m4(rd2, 	seimm, aluSrc, 	srcB);
	//Decision for result source
	MUX2X1 			m5(aluRslt, rData, mem2Reg, result);
	//Decision for register to write data to
	MUX2X1	#(5)	m6(inst[20:16], inst[15:11], regDst, adwReg);

endmodule

module MUX2X1 #(MUXWIDTH = 32)(a, b, sel, y);

	input 	[(MUXWIDTH-1):0] 	a, b;
	input 						sel;
	output 	[(MUXWIDTH-1):0]	y;

	assign y = (sel) ? b : a;

endmodule
