`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 10:03:13 PM
// Design Name: 
// Module Name: xyaccumulator
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

module xyaccumulator(
    input clk,
    input rst,
    input accu_enable,
    input accu_reset,
    input [`LOG_NUM_LABEL-1:0] minlabel,
    input [`WIDTH-1:0] pointx,
    input [`WIDTH-1:0] pointy,
    output reg [`DOUBLE_WIDTH-1: 0] xaccu0,
    output reg [`DOUBLE_WIDTH-1: 0] xaccu1,
    output reg [`DOUBLE_WIDTH-1: 0] xaccu2,
    output reg [`DOUBLE_WIDTH-1: 0] xaccu3,
    output reg [`DOUBLE_WIDTH-1: 0] xaccu4,
    output reg [`DOUBLE_WIDTH-1: 0] xaccu5,
    output reg [`DOUBLE_WIDTH-1: 0] xaccu6,
    output reg [`DOUBLE_WIDTH-1: 0] xaccu7,
    output reg [`DOUBLE_WIDTH-1: 0] yaccu0,
    output reg [`DOUBLE_WIDTH-1: 0] yaccu1,
    output reg [`DOUBLE_WIDTH-1: 0] yaccu2,
    output reg [`DOUBLE_WIDTH-1: 0] yaccu3,
    output reg [`DOUBLE_WIDTH-1: 0] yaccu4,
    output reg [`DOUBLE_WIDTH-1: 0] yaccu5,
    output reg [`DOUBLE_WIDTH-1: 0] yaccu6,
    output reg [`DOUBLE_WIDTH-1: 0] yaccu7,
    output reg [`LOG_DEPTH-1 : 0] count0,
    output reg [`LOG_DEPTH-1 : 0] count1,
    output reg [`LOG_DEPTH-1 : 0] count2,
    output reg [`LOG_DEPTH-1 : 0] count3,
    output reg [`LOG_DEPTH-1 : 0] count4,
    output reg [`LOG_DEPTH-1 : 0] count5,
    output reg [`LOG_DEPTH-1 : 0] count6,
    output reg [`LOG_DEPTH-1 : 0] count7
    );
    
    always@(posedge clk)
        begin
            if(rst)
            begin
                xaccu0<=0;
                yaccu0<=0;
                xaccu1<=0;
                yaccu1<=0;
                xaccu2<=0;
                yaccu2<=0;
                xaccu3<=0;
                yaccu3<=0;
                xaccu4<=0;
                yaccu4<=0;
                xaccu5<=0;
                yaccu5<=0;
                xaccu6<=0;
                yaccu6<=0;
                xaccu7<=0;
                yaccu7<=0;
                count0<=0;
                count1<=0;
                count2<=0;
                count3<=0;
                count4<=0;
                count5<=0;
                count6<=0;
                count7<=0;
            end
            else if(accu_enable)
            begin
                // Todo: you need to accumulate xaccu and yaccu with respect to the minlabel;	
                case (minlabel)
                    0: begin xaccu0 <= xaccu0 + pointx/*fill here according KMeans*/; 
                    yaccu0 <= yaccu0 + pointy/*fill here according KMeans*/; 
                    count0 <= count0 + 1; end
                    1: begin xaccu1 <= xaccu1 + pointx/*fill here according KMeans*/; 
                    yaccu1 <= yaccu1 + pointy/*fill here according KMeans*/; 
                    count1 <= count1 + 1; end
                    2: begin xaccu2 <= xaccu2 + pointx/*fill here according KMeans*/; 
                    yaccu2 <= yaccu2 + pointy/*fill here according KMeans*/; 
                    count2 <= count2 + 1; end
                    3: begin xaccu3 <= xaccu3 + pointx/*fill here according KMeans*/; 
                    yaccu3 <= yaccu3 + pointy/*fill here according KMeans*/; 
                    count3 <= count3 + 1; end
                    4: begin xaccu4 <= xaccu4 + pointx/*fill here according KMeans*/; 
                    yaccu4 <= yaccu4 + pointy/*fill here according KMeans*/; 
                    count4 <= count4 + 1; end
                    5: begin xaccu5 <= xaccu5 + pointx/*fill here according KMeans*/; 
                    yaccu5 <= yaccu5 + pointy/*fill here according KMeans*/; 
                    count5 <= count5 + 1; end
                    6: begin xaccu6 <= xaccu6 + pointx/*fill here according KMeans*/; 
                    yaccu6 <= yaccu6 + pointy/*fill here according KMeans*/; 
                    count6 <= count6 + 1; end
                    7: begin xaccu7 <= xaccu7 + pointx/*fill here according KMeans*/; 
                    yaccu7 <= yaccu7 + pointy/*fill here according KMeans*/; 
                    count7 <= count7 + 1; end
		endcase
            end
            else if(accu_reset)
            begin
                xaccu0<=0;
                yaccu0<=0;
                xaccu1<=0;
                yaccu1<=0;
                xaccu2<=0;
                yaccu2<=0;
                xaccu3<=0;
                yaccu3<=0;
                xaccu4<=0;
                yaccu4<=0;
                xaccu5<=0;
                yaccu5<=0;
                xaccu6<=0;
                yaccu6<=0;
                xaccu7<=0;
                yaccu7<=0;
                count0<=0;
                count1<=0;
                count2<=0;
                count3<=0;
                count4<=0;
                count5<=0;
                count6<=0;
                count7<=0;
            end 
        end
endmodule
