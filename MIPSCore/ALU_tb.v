module tb;
    reg [31:0] srcA, srcB;
    reg [2:0] aluCtrl;
    reg [31:0] aluRslt;
    reg zero;
    
    alu alu(srcA, srcB, aluCtrl, aluRslt, zero);
    
    initial begin
        #20 
        srcA = 0; srcB = 0; aluCtrl = 3'b000; 
        #20
        srcA = 1; srcB = 1; aluCtrl = 3'b001;
        #20
        srcA = 2; srcB = 2; aluCtrl = 3'b010;
        #20
        srcA = 3; srcB = 3; aluCtrl = 3'b011;
        #20
        srcA = 4; srcB = 4; aluCtrl = 3'b111;
        
    end
    
endmodule
