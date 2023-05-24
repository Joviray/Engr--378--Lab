module tb;
//inputs
reg [3:0] sw;
reg [2:0] btn;
//outputs
wire [6:0] hex2, hex1, hex0;

//instantiate the unit under test (UUT)
Lab4 uut(sw, btn, seven, seven2, select);
initial begin
    btn = 6;
    
   // $monitor("sw=%b, btn=%b, hex2=%b, hex1=%b, hex0=%b", sw, btn, hex2, hex1, hex0);
    #10 sw = 4'b0000; // 0
    #10 sw = 4'b0001; // 1
    #10 sw = 4'b0010; // 2
    #10 sw = 4'b0011; // 3
    #10 sw = 4'b0100; // 4
    #10 sw = 4'b0101; // 5
    #10 sw = 4'b0110; // 6
    #10 sw = 4'b0111; // 7
    #10 sw = 4'b1000; // 8
    #10 sw = 4'b1001; // 9
    #10 sw = 4'b1010; // A
    #10 sw = 4'b1011; // B
    #10 sw = 4'b1100; // C
    #10 sw = 4'b1101; // D
    #10 sw = 4'b1110; // E
    #10 sw = 4'b1111; // F
    // #10 sw = 5'b0000; // 0
    // #10 sw = 5'b0001; // 1
    // #10 sw = 5'b0010; // 2
    // #10 sw = 5'b0011; // 3
    // #10 sw = 5'b0100; // 4
    // #10 sw = 5'b0101; // 5
    // #10 sw = 5'b0110; // 6
    // #10 sw = 5'b0111; // 7
    // #10 sw = 5'b1000; // 8
    
end
endmodule
