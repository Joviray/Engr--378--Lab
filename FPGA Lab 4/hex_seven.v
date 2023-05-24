module hex_seven(hex, seven);
	input [4:0] hex;
	output [6:0] seven;
	
	reg [6:0] seven;
	
	always @(hex)
	begin
		case (hex)
			5'b00000 : seven = 7'b1000000;	//0
			5'b00001 : seven = 7'b1111001;	//1
			5'b00010 : seven = 7'b0100100;	//2
			5'b00011 : seven = 7'b0110000;	//3
			5'b00100 : seven = 7'b0011001;	//4
			5'b00101 : seven = 7'b0010010;	//5
			5'b00110 : seven = 7'b0000010;	//6
			5'b00111 : seven = 7'b1111000;	//7
			5'b01000 : seven = 7'b0000000;	//8
			5'b01001 : seven = 7'b0011000;	//9
			5'b01010 : seven = 7'b0001000;	//A
			5'b01011 : seven = 7'b0000011;	//b
			5'b01100 : seven = 7'b1000110;	//C
			5'b01101 : seven = 7'b0100001;	//d
			5'b01110 : seven = 7'b0000110;	//E
			5'b01111 : seven = 7'b0001110;	//F
			
		endcase
	end
	
endmodule
