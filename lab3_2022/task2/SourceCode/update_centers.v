`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 10:25:07 PM
// Design Name: 
// Module Name: update_centers
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


module update_centers(
    input clk,
    input rst,
    input enable_update,
    input [`DOUBLE_WIDTH-1: 0] xaccu0,
    input [`DOUBLE_WIDTH-1: 0] xaccu1,
    input [`DOUBLE_WIDTH-1: 0] xaccu2,
    input [`DOUBLE_WIDTH-1: 0] xaccu3,
    input [`DOUBLE_WIDTH-1: 0] xaccu4,
    input [`DOUBLE_WIDTH-1: 0] xaccu5,
    input [`DOUBLE_WIDTH-1: 0] xaccu6,
    input [`DOUBLE_WIDTH-1: 0] xaccu7,
    input [`DOUBLE_WIDTH-1: 0] yaccu0,
    input [`DOUBLE_WIDTH-1: 0] yaccu1,
    input [`DOUBLE_WIDTH-1: 0] yaccu2,
    input [`DOUBLE_WIDTH-1: 0] yaccu3,
    input [`DOUBLE_WIDTH-1: 0] yaccu4,
    input [`DOUBLE_WIDTH-1: 0] yaccu5,
    input [`DOUBLE_WIDTH-1: 0] yaccu6,
    input [`DOUBLE_WIDTH-1: 0] yaccu7,
    input [`LOG_DEPTH-1 : 0] count0,
    input [`LOG_DEPTH-1 : 0] count1,
    input [`LOG_DEPTH-1 : 0] count2,
    input [`LOG_DEPTH-1 : 0] count3,
    input [`LOG_DEPTH-1 : 0] count4,
    input [`LOG_DEPTH-1 : 0] count5,
    input [`LOG_DEPTH-1 : 0] count6,
    input [`LOG_DEPTH-1 : 0] count7,
    output reg [`WIDTH-1:0] center0x,
    output reg [`WIDTH-1:0] center1x,
    output reg [`WIDTH-1:0] center2x,
    output reg [`WIDTH-1:0] center3x,
    output reg [`WIDTH-1:0] center4x,
    output reg [`WIDTH-1:0] center5x,
    output reg [`WIDTH-1:0] center6x,
    output reg [`WIDTH-1:0] center7x,
    output reg [`WIDTH-1:0] center0y,
    output reg [`WIDTH-1:0] center1y,
    output reg [`WIDTH-1:0] center2y,
    output reg [`WIDTH-1:0] center3y,
    output reg [`WIDTH-1:0] center4y,
    output reg [`WIDTH-1:0] center5y,
    output reg [`WIDTH-1:0] center6y,
    output reg [`WIDTH-1:0] center7y
    );
    
    always@(posedge clk)
        begin
            if(rst)
            begin
                // initial centers;
                center0x<=20; center0y<=30;
                center1x<=20; center1y<=60;
                center2x<=40; center2y<=30;
                center3x<=40; center3y<=70;
                center4x<=60; center4y<=30;
                center5x<=80; center5y<=80;
                center6x<=80; center6y<=30;
                center7x<=90; center7y<=70;
            end
            else if(enable_update)
            begin
                if(!count0) begin center0x <= /*fill here according KMeans*/; center0y <= /*fill here according KMeans*/; end
                if(!count1) begin center1x <= /*fill here according KMeans*/; center1y <= /*fill here according KMeans*/; end
                if(!count2) begin center2x <= /*fill here according KMeans*/; center2y <= /*fill here according KMeans*/; end
                if(!count3) begin center3x <= /*fill here according KMeans*/; center3y <= /*fill here according KMeans*/; end
                if(!count4) begin center4x <= /*fill here according KMeans*/; center4y <= /*fill here according KMeans*/; end
                if(!count5) begin center5x <= /*fill here according KMeans*/; center5y <= /*fill here according KMeans*/; end
                if(!count6) begin center6x <= /*fill here according KMeans*/; center6y <= /*fill here according KMeans*/; end
                if(!count7) begin center7x <= /*fill here according KMeans*/; center7y <= /*fill here according KMeans*/; end
           end
                
        end
endmodule
