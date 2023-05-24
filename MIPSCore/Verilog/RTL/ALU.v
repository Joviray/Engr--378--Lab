module alu(srcA, srcB, aluCtrl, aluRslt, zero);

	input 		[31:0] 	srcA, srcB;
	input 		[ 2:0] 	aluCtrl;
	output reg 	[31:0] 	aluRslt;
	output 					zero;

	always @(*) begin
		case (aluCtrl)
			3'b000: aluRslt = srcA & srcB;
			3'b001: aluRslt = srcA | srcB;
			3'b010: aluRslt = srcA + srcB;
			3'b011: aluRslt = srcA + ((~srcB) + 32'b1);
			3'b111: begin
				if (srcA < srcB) aluRslt = 32'b1;
				else aluRslt = 32'b0;
			end
			default: aluRslt = 32'bx;
		endcase
	end
	assign zero = (aluRslt == 0) ? 1:0;
endmodule
 