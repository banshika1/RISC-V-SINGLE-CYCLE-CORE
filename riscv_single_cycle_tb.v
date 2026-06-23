`timescale 1ns / 1ps

module riscv_single_cycle_tb ();
    
    reg clk, rst; 

    riscv_single_cycle riscv_single_cycle(
                                .clk(clk),
                                .rst(rst)
    );

initial clk =1'b0;
always 
          #50 clk = ~ clk;
    
    initial
    begin
        rst <= 1'b0; //ASSERT RESEST LOW
        #150;

        rst <=1'b1; //DEASSERT RESET HIGH AFTER 150 UNITS
        #450;

        $finish; //END SIMUALTION AT t=600
    end

endmodule