module Lab4(sw, btn, seven, seven2, select);
  input [3:0] sw;
  input [2:0] btn;
  output reg [6:0] seven, select, seven2;	//seven = 1st seven-seg, seven2 = 2nd seven-seg, select = left-most seven-seg
  
  dec_seven dec(din, dout);	//dec_seven module call with "din" input and "dout" output
  bcd_seven bcd(bin, bout);	//bcd_seven module call with "bin" input and "bout" output
  hex_seven hex(hin, hout);	//hex_seven module call with "hin" input and "hout" output
  
  wire [6:0] hout, bout, dout;	//wire for "hout", "bout", "dout" since they are outputs to assign to "seven"
  reg [3:0] hin, bin, din;			//register of input for the modules
  
  always @(btn)						//always and case with sensitivity of the buttons to choose which output is assigned to "seven"
  case (btn)
	6:seven = bout;
	5:seven = dout;
	3:seven = hout;
	default:seven = 7'b1111111;
	endcase
  
  always @ (sw, btn) begin		//always and case with sensitivity of the switches and buttons
	case (btn)
    6:begin								//btn = 011, module bcd_seven
			if (sw < 10)
				begin
				 bin = {1'b0, sw};	//creates "bin" input for bcd_seven module
				 seven2 = 7'b1111111;//keeps 2nd seven-segment off
				 select = 7'b0000011;//b = bcd
				end
			else
				begin
				 bin = 5'b01001;		//if 10 or more, stays at 9
				 seven2 = 7'b1111111;
				 select = 7'b0000011;
				end
			end
	 5:begin								//btn = 101, module dec_seven
			if (sw < 10)
				begin
				 din = {1'b0, sw};	//creates "bin" input for dec_seven module
				 seven2 = 7'b1111111;//if less than 10, keeps 2nd seven-segment off
				 select = 7'b0100001;//d = dec
				end
			else
				begin
				 din = {1'b0, sw};	
				 seven2 = 7'b1111001;//if 10 or more, 2nd seven-segment is "1"
				 select = 7'b0100001;
				end
			end
     3:begin							//btn = 110, module hex_seven
				 hin = {1'b0, sw};	//creates "hin" input for hex_seven module
				 seven2 = 7'b1111111;
				 select = 7'b0001011;//h for hex
			end
		default:begin					//btn = 000, default
				seven2 = 7'b1111111;	//both seven-segments are off
				select = 7'b1111111;
		end
    endcase
	end

endmodule
