module Lab_3(rst, clk, q, qbar, qb, qbbar);
  //variables for I/O
  output q, qbar;
  output qb, qbbar;
  input rst,clk;
  
  reg Ja, Ka, Jb, Kb;
  //Ja = BC' Ka = B+C Jb = C' Kb = 1
  //wire Ja,Jb,Ka,Kb; 
  always @(*)
    begin
    Ja <= (qb && ~rst);
    Ka <= (qb || rst);
      Jb <= ~rst;
      Kb <= 1;
    end

   jkff1 FF1(Ja, Ka, clk, q, qbar);
   jkff1 FF2(Jb,Kb,clk, qb, qbbar);

endmodule
