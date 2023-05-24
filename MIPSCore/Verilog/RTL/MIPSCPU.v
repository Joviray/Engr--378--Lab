module mips(rst, clk, QUERY, QSEL, seg0, seg1, 
				seg2, seg3, seg4, seg5, seg6, seg7);

	parameter INSTMEMSIZE = 128;
	parameter DATAMEMSIZE = 128;

	input 					rst, clk, QSEL;
	
	input		[9:0]		QUERY;
	
	wire		[4:0]		RFQUERY;
	wire 		[31:0]	RFOUT;
	
	wire		[9:0]		DMQUERY;
	wire		[31:0]	DMOUT;
	
	output 	[6:0] 	seg0, seg1, seg2, seg3,
							seg4, seg5, seg6, seg7;

	wire					regW, regDst, aluSrc, brnch, memW,
							mem2Reg, jmp, zero;

	wire		[2:0]		aluCtrl;

	wire		[4:0]		adwReg;

	wire 		[31:0]	inst, pc, pcp, srcB, srcA, result, 
							aluRslt, rd2, rData;
							
	assign 	RFQUERY 	= QUERY[4:0];
	assign	DMQUERY	= QUERY[9:0];
	
	//You have to create the module for this instantiation!
	
	hexOut					ho0(		.RFOUT(RFOUT),
											.DMOUT(DMOUT),
											.seg0(seg0),
											.seg1(seg1),
											.seg2(seg2),
											.seg3(seg3),
											.seg4(seg4),
											.seg5(seg5),
											.seg6(seg6),
											.seg7(seg7),
											.QSEL(QSEL));
											
	//You have to create the module for this instantiation!										
											
	 alu 						al0(		.srcA(srcA), 
											.srcB(srcB), 
											.aluCtrl(aluCtrl), 
											.aluRslt(aluRslt), 
											.zero(zero));
											

	//No need to touch the modules below
											
	ctrlogic					cl0(		.op(inst[31:26]), 
											.func(inst[5:0]), 
											.regW(regW), 
											.regDst(regDst), 
											.aluSrc(aluSrc), 
											.brnch(brnch), 
											.memW(memW), 
											.mem2Reg(mem2Reg), 
											.aluCtrl(aluCtrl), 
											.jmp(jmp), 
											.zero(zero));

	dplogic						dl0(	.inst(inst), 
											.pc(pc), 
											.pcp(pcp), 
											.brnch(brnch), 
											.jmp(jmp), 
											.adwReg(adwReg), 
											.rst(rst),
											.regDst(regDst), 
											.aluSrc(aluSrc), 
											.rd2(rd2), 
											.srcB(srcB), 
											.mem2Reg(mem2Reg), 
											.result(result),
											.aluRslt(aluRslt), 
											.rData(rData));

	INSTMEM						imem( .address(pcp[6:2]),
											.clock(clk),
											.q(inst));
	

	dmem 	#(DATAMEMSIZE)		dm0(	.ad(aluRslt),
											.we(memW), 
											.clk(clk), 
											.wData(rd2), 
											.rData(rData),
											.DMQUERY(DMQUERY),
											.DMOUT(DMOUT));

	pc							pc0(		.pcp(pcp), 
											.clk(clk), 
											.pc(pc));

 	rf							rf0(		.ad1(inst[25:21]), 
											.ad2(inst[20:16]),
											.adw(adwReg), 
											.wData(result), 
											.clk(clk), 
											.we(regW), 
											.rData1(srcA), 
											.rData2(rd2),
											.RFQUERY(RFQUERY),
											.RFOUT(RFOUT));

endmodule
