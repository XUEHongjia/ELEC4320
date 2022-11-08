`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 03:54:40 PM
// Design Name: 
// Module Name: read_address
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

    `define DEPTH 1024
    `define LOG_DEPTH 10
    `define WIDTH 16
    `define DOUBLE_WIDTH 32
    `define NUM_LABEL 8
    `define LOG_NUM_LABEL 3

module read_address(
    input clk,
    input rst,
    output reg [`LOG_DEPTH-1:0] raddr,
    input enable
    );
    
    always@(posedge clk)
    begin
         if(rst)
             raddr<=0;
         else 
            begin
            if(enable)
                raddr<=raddr+1;
            end
    end
endmodule
