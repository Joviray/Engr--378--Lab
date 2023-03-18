module FourAdder(S, Cout, A, B, Cin);
input [3:0] A, B;
input Cin;
output [3:0] S;
output Cout;

wire [3:1] C;

FullAdder FA0 (A[0], B[0], Cin, C[1], S[0]);
FullAdder FA1 (A[1], B[1], C[1], C[2], S[1]);
FullAdder FA2 (A[2], B[2], C[2], C[3], S[2]);
FullAdder FA3 (A[3], B[3], C[3], Cout, S[3]);

endmodule
