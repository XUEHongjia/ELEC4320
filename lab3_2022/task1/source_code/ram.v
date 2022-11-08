`timescale 1ns / 1ps
`include "define.v"

module ram(clk, load, addr, d, q);
 parameter DWIDTH=16,AWIDTH=12,WORDS=4096;

 input clk,load;
 input [AWIDTH-1:0] addr;
 input [DWIDTH-1:0] d;
 output [DWIDTH-1:0] q;
 reg [DWIDTH-1:0] q;
 reg [DWIDTH-1:0] mem [WORDS-1:0];

//load is same as write enable
//read is always enabled

 always @(posedge clk)
   begin
     if(load) mem[addr] <= d;
     q <= mem[addr];
   end

 integer i;
 initial begin
    for(i=0;i<WORDS;i=i+1)
       mem[i]=0;    
mem[12'h000] = 16'hD000; 
mem[12'h001] = 16'h2800; 
mem[12'h002] = 16'hF000; 
mem[12'h003] = 16'h2801; 
mem[12'h004] = 16'hF002; 
mem[12'h005] = 16'hE000; 
mem[12'h006] = 16'h0000; 

mem[12'h800] = 16'h0002; 
mem[12'h801] = 16'h0004; 

end

endmodule
