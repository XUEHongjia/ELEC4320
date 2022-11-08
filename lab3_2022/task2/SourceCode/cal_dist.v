`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 04:20:33 PM
// Design Name: 
// Module Name: cal_dist
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

module cal_dist(
    input clk,
    input rst,
    input enable,
    input [`WIDTH-1:0] pointx,
    input [`WIDTH-1:0] pointy,
    input [`WIDTH-1:0] center0x,
    input [`WIDTH-1:0] center1x,
    input [`WIDTH-1:0] center2x,
    input [`WIDTH-1:0] center3x,
    input [`WIDTH-1:0] center4x,
    input [`WIDTH-1:0] center5x,
    input [`WIDTH-1:0] center6x,
    input [`WIDTH-1:0] center7x,
    input [`WIDTH-1:0] center0y,
    input [`WIDTH-1:0] center1y,
    input [`WIDTH-1:0] center2y,
    input [`WIDTH-1:0] center3y,
    input [`WIDTH-1:0] center4y,
    input [`WIDTH-1:0] center5y,
    input [`WIDTH-1:0] center6y,
    input [`WIDTH-1:0] center7y, 
    output reg [`DOUBLE_WIDTH:0] dist0,
    output reg [`DOUBLE_WIDTH:0] dist1,
    output reg [`DOUBLE_WIDTH:0] dist2,
    output reg [`DOUBLE_WIDTH:0] dist3,
    output reg [`DOUBLE_WIDTH:0] dist4,
    output reg [`DOUBLE_WIDTH:0] dist5,
    output reg [`DOUBLE_WIDTH:0] dist6,
    output reg [`DOUBLE_WIDTH:0] dist7
    );
    
    
	
	always@(posedge clk) begin
		if(rst) begin
			dist0 <= `DOUBLE_WIDTH'b0;
			dist1 <= `DOUBLE_WIDTH'b0;
			dist2 <= `DOUBLE_WIDTH'b0;
			dist3 <= `DOUBLE_WIDTH'b0;
			dist4 <= `DOUBLE_WIDTH'b0;
			dist5 <= `DOUBLE_WIDTH'b0;
			dist6 <= `DOUBLE_WIDTH'b0;
			dist7 <= `DOUBLE_WIDTH'b0;
		end
		else if (enable) begin
                        // Todo: you need to use provided signals to produce dist 0-7. Fill here.
                        // hint: without losing correctness, we use Euclidian distance square instead of Euclidian distance for simplicity.
			dist0 <= /*fill here according KMeans*/;
			dist1 <= /*fill here according KMeans*/;
			dist2 <= /*fill here according KMeans*/;
			dist3 <= /*fill here according KMeans*/;
			dist4 <= /*fill here according KMeans*/;
			dist5 <= /*fill here according KMeans*/;
			dist6 <= /*fill here according KMeans*/;
			dist7 <= /*fill here according KMeans*/;
		end
	end
	
endmodule
