`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: fir_example
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fir_example(data_in,clk,data_out);
input signed [15:0] data_in;
input clk;
output signed [15:0] data_out;

parameter h1=5'd1;// can be any arbitary coeffiecient
parameter h2=5'd2;// can be any arbitary coeffiecient
parameter h3=5'd3;// can be any arbitary coeffiecient
parameter h4=5'd4;// can be any arbitary coeffiecient

reg signed [15:0] r1;// buffer1
reg signed [15:0] r2;// buffer2
reg signed [15:0] r3;// buffer3
reg signed [15:0] r4;// buffer4

//initialize buffers to zero
initial 
begin
    r1=16'd0;
    r2=16'd0;
    r3=16'd0;
    r4=16'd0;
end

always@(posedge clk)
begin
r4 = r3;
r3 = r2;
r2 = r1;
r1 = data_in;
data_out = r1*h1 + r2*h2 + r3*h3 + r4*h4;
//write code here
end

//write code here

endmodule
