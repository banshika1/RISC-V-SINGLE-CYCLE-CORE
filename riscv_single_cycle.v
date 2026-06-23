

module riscv_single_cycle(clk, rst);

//INOUTS AND OUTPUTS

input clk, rst;

wire [31:0] pc_top, RD_inst, RD1_top,RD_top2, Imm_ext_top, 
            ALUResult, SrcB2, ReadData, pcplus4, RESULT;

wire RegWrite, MemWrite, ALUSrc;
wire [1:0] ImmSrc;
wire [2:0]  ALUCONTROL_top;

PC_module PC(
              .clk(clk),
              .rst(rst),
              .pc(pc_top),
              .pc_next(pcplus4)
);
PC_Adder PC_Adder(
    .a(pc_top),
    .b(32'd4),
    .c(pcplus4)
);


Instruction_memory Instruction_memory(
    .rst(rst),
    .A(pc_top),
    .RD(RD_inst)
);

Register_File Register_File(
    .clk(clk),
    .rst(rst),
    .WE3(RegWrite),
    .A1(RD_inst[19:15]),
    .A2(RD_inst[24:20]),
    .A3(RD_inst[11:7]),
    .WD3(RESULT),
    .RD1(RD1_top),
    .RD2(RD2_top)
);
Sign_extend Sign_extend(
    .In(RD_inst),
    .ImmSrc(ImmSrc),
    .Imm_ext(Imm_ext_top)
);
 Mux Mux_Register_to_ALU(
                            .a(RD2_Top),
                            .b(Imm_Ext_Top),
                            .s(ALUSrc),
                            .c(SrcB)
    );

ALU ALU(
    .A(RD1_top), 
    .B(SrcB), 
    .ALUCONTROL(ALUCONTROL_top), 
    .RESULT(ALUResult), 
    .Z(), 
    .N(), 
    .V(), 
    .C()
);

Control_unit Control_unit(
    .op(RD_inst[6:0]), 
    .ResultSrc(ResultSrc), 
    .MemWrite(MemWrite), 
    .ALUSrc(ALUSrc),
    .funct3(RD_inst[14:12]), 
    .funct7(RD_inst[6:0]), 
    .ALUControl(ALUCONTROL_top), 
    .branch(), 
    .ImmSrc(ImmSrc), 
    .RegWrite(RegWrite)
);

Data_Memory Data_Memory(
    .A(ALUResult), 
    .WD(RD2_top), 
    .WE(MemWrite), 
    .RD(ReadData), 
    .clk(clk), 
    .rst(rst)
);
 Mux Mux_DataMemory_to_ALU(
                            .a(ALUResult),
                            .b(ReadData),
                            .s(ResultSrc),
                            .c(RESULT)
    );

endmodule