`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 04:07:18 PM
// Design Name: 
// Module Name: store_pointxy
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

module get_pointxy(
    input clk,
    input rst,
    input enable,
    input [`DOUBLE_WIDTH-1:0] dout,
    output reg [`WIDTH-1:0] pointx, 
    output reg [`WIDTH-1:0] pointy
    );
    
    always@(posedge clk)
        begin
            if(rst) 
            begin
                pointx<=`WIDTH'b0;
                pointy<=`WIDTH'b0;
            end
            else if(enable)
            begin
                pointx<=dout[`DOUBLE_WIDTH-1:`WIDTH];
                pointy<=dout[`WIDTH-1:0];
            end
     end
endmodule
