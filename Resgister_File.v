module Register_File(A1, A2, A3, WD3, RD1, RD2, WE3, clk,rst);

//INPUTS AND OUTPUTS

input [4:0] A1, A2, A3;
input [31:0] WD3;
input clk, rst, WE3;

output [31:0] RD1, RD2;

//CREATION OF MEMORY
reg [31:0] Registers [31:0];

//WRITE FUNCTIONALITY
always @(posedge clk) 
begin
    if(rst && WE3)
        Registers[A3] <= WD3;
end 
//READ FUNCTIONALITY
assign RD1 = (~rst) ? 32'd0 : Registers[A1] ;
assign RD2 = (~rst) ? 32'd0 : Registers[A2] ;   

// INITIALIZE ALL REGISTERS
integer i;
initial begin
    for (i = 0; i < 32; i = i + 1)
        Registers[i] = 32'h00000000;   // all regs = 0
    // then override specific test values
    Registers[5] = 32'h00000005;
    Registers[6] = 32'h00000004;
end

endmodule