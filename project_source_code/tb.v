`timescale 1ns / 1ns
`include "define.v"

module tb ();

reg Clk=0, Start=0;
dct_top hereDCT_top(.Clk(Clk), .Start(Start));

initial
begin
    Clk=0;
    Start=0;
    
    #1000 Start=1;
    #10 Start=0;
end

always #5 Clk=~Clk;


endmodule