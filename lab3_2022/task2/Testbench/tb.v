`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2017 10:42:11 PM
// Design Name: 
// Module Name: main
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


module tb(

    );
    
    
    reg clk, rst;
    kmeans k1(.clk(clk), .rst(rst));
    initial begin
    clk=1'b0;
    rst=1'b0;
    #4 rst=1'b1;
    #4 rst=1'b0;
    #61755;
    $finish;
    end
    
    always #5 clk=~clk;
endmodule
