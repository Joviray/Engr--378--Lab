module Lab2(A, B, S, Cin, F, Cout);
input [3:0] A, B;
input [1:0] S;
input Cin;
output [3:0] F;
output Cout;

wire [3:0] W, Op1, Op2;

mux2x1 mux1 (~A, 0, S[0], W);
mux2x1 mux2 (A, W, S[1], Op1);
mux2x1 mux3 (B, ~B, S[0], Op2);

FourAdder FA (F, Cout, Op1, Op2, Cin);

endmodule
