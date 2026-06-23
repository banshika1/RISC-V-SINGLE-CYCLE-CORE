module Data_Memory(A, WD, WE, RD, clk, rst);

//INPUTS AND OUTPUTS

input rst, clk, WE;
input [31:0] A, WD;

output [31:0] RD;

reg [31:0] mem[1023:0];

//READ
//assign RD = (WE == 1'b0) ? mem[A] : 32'h00000000;

//WRITE
always @(posedge clk)
begin
    if (WE)
     begin
        mem[A] <= WD;
     end
end

assign RD = (~rst) ? 32'd0 : mem[A];

initial begin 
   mem[28] = 32'h00000020;
   mem[40] = 32'h00000002;
end

endmodule