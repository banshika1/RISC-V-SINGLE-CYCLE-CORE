module Instruction_memory(A, rst, RD );

//INPUTS AND OUTPUTS

input [31:0] A;
input rst;

output [31:0] RD;

//creation of memory
reg [31:0] mem [1023:0];

assign RD = (~rst) ? {32{1'b0}} : 
            (A[31:2] < 1024) ? mem[A[31:2]] : {32{1'b0}};
  initial begin
    $readmemh("memfile.hex",mem);
  end
endmodule