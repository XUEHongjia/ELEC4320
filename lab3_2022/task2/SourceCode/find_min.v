`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 04:48:42 PM
// Design Name: 
// Module Name: find_min
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
   
module find_min(
    input [`DOUBLE_WIDTH:0] dist0,
    input [`DOUBLE_WIDTH:0] dist1,
    input [`DOUBLE_WIDTH:0] dist2,
    input [`DOUBLE_WIDTH:0] dist3,
    input [`DOUBLE_WIDTH:0] dist4,
    input [`DOUBLE_WIDTH:0] dist5,
    input [`DOUBLE_WIDTH:0] dist6,
    input [`DOUBLE_WIDTH:0] dist7,
    output [`LOG_NUM_LABEL-1:0] minlabel
    );
    	
	// Minimum distance in corresponding index range
	wire [`DOUBLE_WIDTH:0] dist01;
	wire [`DOUBLE_WIDTH:0] dist23;
	wire [`DOUBLE_WIDTH:0] dist45;
	wire [`DOUBLE_WIDTH:0] dist67;
	wire [`DOUBLE_WIDTH:0] dist03;
	wire [`DOUBLE_WIDTH:0] dist47;
	
	wire comp01,comp23,comp45,comp67;
	wire [1:0] comp03,comp47;
	
	assign comp01 = dist0 < dist1 ? 0 : 1;
	assign dist01 = dist0 < dist1 ? dist0 : dist1;
	assign comp23 = dist2 < dist3 ? 0 : 1;
	assign dist23 = dist2 < dist3 ? dist2 : dist3;
	assign comp45 = dist4 < dist5 ? 0 : 1;
	assign dist45 = dist4 < dist5 ? dist4 : dist5;
	assign comp67 = dist6 < dist7 ? 0 : 1;
	assign dist67 = dist6 < dist7 ? dist6 : dist7;
	
	assign comp03 = dist01 < dist23 ? {1'b0,comp01} : {1'b1,comp23};
	assign dist03 = dist01 < dist23 ? dist01 : dist23;
	assign comp47 = dist45 < dist67 ? {1'b0,comp45} : {1'b1,comp67};
	assign dist47 = dist45 < dist67 ? dist45 : dist67;
	
	// Try to understand what have been on in the lines above. Fill the line below.
	// assign minlabel = fill here.
endmodule
