module Control_unit(op, ResultSrc,MemWrite, ALUSrc,funct3, funct7, ALUCONTROL, branch, ImmSrc, RegWrite);

input [6:0] op, funct7;
input [2:0] funct3;

output RegWrite, MemWrite, ALUSrc, branch;
output [1:0] ImmSrc, ResultSrc;
output [2:0] ALUCONTROL;

wire [1:0] ALUop;

main_decoder main_decoder(
                            .op(op),
                            .ResultSrc(ResultSrc), 
                            .MemWrite(MemWrite), 
                            .ALUSrc(ALUSrc), 
                            .ImmSrc(ImmSrc), 
                            .RegWrite(RegWrite),
                            .branch(branch),
                            .ALUop(ALUop)
);

 ALU_Decoder ALU_Decoder(
                            .ALUop(ALUop),
                            .funct3(funct3),
                            .funct7(funct7),
                            .op(op),
                            .ALUCONTROL(ALUCONTROL)
    );


endmodule
