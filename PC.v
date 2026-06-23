module PC_module(pc, pc_next, clk, rst);

//INPUT AND OUTPUT
input [31:0] pc_next;
input clk, rst;

output reg [31:0] pc;

always @( posedge clk)
begin
     if(~rst)
            pc <= {32{1'b0}};
      else
      pc <= pc_next;  
end


endmodule