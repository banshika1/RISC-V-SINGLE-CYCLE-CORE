module main_decoder(op, ResultSrc, MemWrite, ALUSrc, branch, ALUop, ImmSrc, RegWrite);

//INPUTS & OUTPUTS
input[6:0] op;
output MemWrite, ALUSrc, branch, RegWrite;
output[1:0] ResultSrc, ImmSrc,ALUop;

//ASSIGNMENTS
assign RegWrite = ((op == 7'b0110011) | (op== 7'b0000011)) ? 1'b1 : 1'b0;

assign MemWrite = (op == 7'b0100011) ? 1'b1 : 1'b0;

assign ResultSrc = (op==7'b0000011) ? 2'b01 : 2'b00;

assign ALUSrc = ((op == 7'b0000011) | (op == 7'b0100011)) ? 1'b1 : 1'b0;

assign ImmSrc =(op == 7'b0100011) ? 2'b01 :
               (op == 7'b1100011) ? 2'b10 : 2'b00;

assign branch = (op == 7'b1100011) ? 1'b1 : 1'b0;

assign ALUop = (op == 7'b0110011) ? 2'b10 :
                (op == 7'b1100011) ? 2'b01 : 2'b00;

endmodule