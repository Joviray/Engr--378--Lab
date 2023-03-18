module FullAdder(A, B, Cin, Cout, Sum);
output Cout, Sum;
input A, B, Cin;

    assign #10 Sum = A ^ B ^ Cin;
    assign #10 Cout = (A && B) || (A && Cin) || (B && Cin);
    
endmodule
