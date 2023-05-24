module dec_seven(dec, seven);
	input [4:0] dec;
	output [6:0] seven;
	
	reg [6:0] seven;
	
	always @(dec)
	begin
		case (dec)
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
							
			5'b01010 : seven = 7'b1000000;	//10
							
			5'b01011 : seven = 7'b1111001;	//11 
							
			5'b01100 : seven = 7'b0100100;	//12
							
			5'b01101 : seven = 7'b0110000;	//13
							
			5'b01110 : seven = 7'b0011001;	//14
						
			5'b01111 : seven = 7'b0010010;	//15
							
		endcase
	end
	
endmodule
