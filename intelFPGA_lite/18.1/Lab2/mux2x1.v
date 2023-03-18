module mux2x1(A, B, S, Out);
input [3:0] A, B; 
input S;
output [3:0] Out;

assign Out = S?B:A;

endmodule
