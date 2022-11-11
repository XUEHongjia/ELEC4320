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
			dist0 <= ( pointx - center0x )*( pointx - center0x ) + ( pointy - center0y )*( pointy - center0y )/*fill here according KMeans*/;
			dist1 <= ( pointx - center1x )*( pointx - center1x ) + ( pointy - center1y )*( pointy - center1y )/*fill here according KMeans*/;
			dist2 <= ( pointx - center2x )*( pointx - center2x ) + ( pointy - center2y )*( pointy - center2y )/*fill here according KMeans*/;
			dist3 <= ( pointx - center3x )*( pointx - center3x ) + ( pointy - center3y )*( pointy - center3y )/*fill here according KMeans*/;
			dist4 <= ( pointx - center4x )*( pointx - center4x ) + ( pointy - center4y )*( pointy - center4y )/*fill here according KMeans*/;
			dist5 <= ( pointx - center5x )*( pointx - center5x ) + ( pointy - center5y )*( pointy - center5y )/*fill here according KMeans*/;
			dist6 <= ( pointx - center6x )*( pointx - center6x ) + ( pointy - center6y )*( pointy - center6y )/*fill here according KMeans*/;
			dist7 <= ( pointx - center7x )*( pointx - center7x ) + ( pointy - center7y )*( pointy - center7y )/*fill here according KMeans*/;
		end
	end
	
endmodule
