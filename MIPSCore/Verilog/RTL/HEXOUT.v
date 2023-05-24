module	hexOut(		RFOUT,
							DMOUT,
							seg0,
							seg1,
							seg2,
							seg3,
							seg4,
							seg5,
							seg6,
							seg7,
							QSEL);
							
	input 			QSEL;
	input [31:0] 	RFOUT, DMOUT;
	
	output [6:0] 	seg0, seg1, seg2, seg3,
						seg4, seg5, seg6, seg7;
						
	wire   [3:0] 	segin0, segin1, segin2, segin3,
						segin4, segin5, segin6, segin7;
						
	
	assign {segin7, segin6, segin5, segin4,
			  segin3, segin2, segin1, segin0} = QSEL ? RFOUT : DMOUT;
			  
	seg7dec i0(segin0, seg0);
	seg7dec i1(segin1, seg1);
	seg7dec i2(segin2, seg2);
	seg7dec i3(segin3, seg3);
	seg7dec i4(segin4, seg4);
	seg7dec i5(segin5, seg5);
	seg7dec i6(segin6, seg6);
	seg7dec i7(segin7, seg7);
			  
endmodule

module seg7dec(in, out);

	input 		[3:0] in;
	output reg	[6:0] out;
	
	always@(*)
	
		case(in)
		
			4'h0: out <= 7'b1000000;
			4'h1: out <= 7'b1111001;
			4'h2: out <= 7'b0100100;
			4'h3: out <= 7'b0110000;
			4'h4: out <= 7'b0011001;
			4'h5: out <= 7'b0010010;
			4'h6: out <= 7'b0000010;
			4'h7: out <= 7'b1111000;
			4'h8: out <= 7'b0000000;
			4'h9: out <= 7'b0011000;
			4'hA: out <= 7'b0001000;
			4'hB: out <= 7'b0000011;
			4'hC: out <= 7'b1000110;
			4'hD: out <= 7'b0100001;
			4'hE: out <= 7'b0000110;
			4'hF: out <= 7'b0001110;
		
		endcase
	
endmodule
