module ALU(A, B, ALUCONTROL, RESULT, Z, N, V, C);

input [31:0] A, B;
input [2:0] ALUCONTROL;
output [31:0] RESULT;
output Z, N, V, C;

wire [31:0] a_and_b;
wire [31:0] a_or_b;
wire [31:0] not_b;
wire [31:0] mux_1;
wire [31:0] sum;
wire [31:0] mux_2;
wire [31:0] slt;
wire cout;

assign a_and_b  = A & B;
assign a_or_b   = A | B;
assign not_b    = ~B;
assign mux_1    = ALUCONTROL[0] ? not_b : B;

// SIMPLE carry extraction - no width issues
assign {cout, sum} = A + mux_1 + {31'b0, ALUCONTROL[0]};

assign slt  = {31'b0, sum[31]};

assign mux_2 = (ALUCONTROL == 3'b000) ? sum        :
               (ALUCONTROL == 3'b001) ? sum        :
               (ALUCONTROL == 3'b010) ? a_and_b    :
               (ALUCONTROL == 3'b011) ? a_or_b     :
               (ALUCONTROL == 3'b101) ? slt        :
                                        32'h00000000;

assign RESULT = mux_2;

assign Z = (RESULT == 32'b0);
assign N =  RESULT[31];
assign C = cout & (~ALUCONTROL[1]);
assign V = (~ALUCONTROL[1]) &
           (A[31] ^ sum[31]) &
           (~(A[31] ^ B[31] ^ ALUCONTROL[0]));

endmodule