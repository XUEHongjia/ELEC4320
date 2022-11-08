`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2017 11:39:32 AM
// Design Name: 
// Module Name: kmeans
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

module kmeans(
    input clk,
    input rst
    );
    
    wire [`WIDTH-1:0] center0x, center0y;
    wire [`WIDTH-1:0] center1x, center1y;
    wire [`WIDTH-1:0] center2x, center2y;
    wire [`WIDTH-1:0] center3x, center3y;
    wire [`WIDTH-1:0] center4x, center4y;
    wire [`WIDTH-1:0] center5x, center5y;
    wire [`WIDTH-1:0] center6x, center6y;
    wire [`WIDTH-1:0] center7x, center7y;         
    
    
    wire [`DOUBLE_WIDTH-1:0] dout;
    wire dwea;
    wire lwea;
    assign dwea=1'b0;
    wire [`LOG_DEPTH-1:0] raddr;
    reg [`LOG_DEPTH-1:0] waddr;
    
    wire [`LOG_NUM_LABEL-1:0] labels;
    
    // map you ROM/RAM to BRAM ip cores
    blk_mem_gen_0 ds(.clka(clk), .addra(raddr), .douta(dout));
    blk_mem_gen_1 ls(.clka(clk), .wea(lwea), .addra(waddr), .dina(labels), .douta());
    
 /////////////////////////////////////////////////////// pipeline control ///////////////////////////////////////////////////////
    reg sweepPointsReadMem, sweepPointsReadPoint, sweepPointsCalDist, sweepPointsAccu, updateCenters, storeLabels;
    reg sweepPointsStall;
    
    always@(posedge clk)
    begin
        if(rst)
            sweepPointsStall<=0;
        else if(raddr==1023)
            sweepPointsStall<=1;
        else if(updateCenters)
            sweepPointsStall<=0;
    end
    
    always@(posedge clk)
    begin
        if(rst)
        begin
            sweepPointsReadMem<=0;
        end
        else if(raddr==1023)
        begin
            sweepPointsReadMem<=0;
        end
        else if(~sweepPointsStall)
        begin
            sweepPointsReadMem<=1;
        end    
    end
    
    // pipeline control signals (not compulsory to understand)
    always@(posedge clk)
    begin
        sweepPointsReadPoint<=sweepPointsReadMem;
        sweepPointsCalDist<=sweepPointsReadPoint;
        sweepPointsAccu<=sweepPointsCalDist;
    end
    
    always@(posedge clk)
    begin
        if(rst)
        begin
            updateCenters<=0;
        end
        else if(~sweepPointsCalDist && sweepPointsAccu)
        begin
            updateCenters<=1;
        end 
        else
        begin
            updateCenters<=0;
        end
        
    end
    
/////////////////////////////////////////////////////// Stage 1: reading address assignment  /////////////////////////////////////////////////////// 
    read_address rd(
        .clk(clk), 
        .rst(rst), 
        .raddr(raddr), 
        .enable(sweepPointsReadMem)
    );

    // store into regs
    wire [`WIDTH-1:0] pointx, pointy;
    get_pointxy sp(
        .clk(clk), 
        .rst(rst),     
        .enable(sweepPointsReadPoint),
        .dout(dout),
        .pointx(pointx),
        .pointy(pointy)
    );
 
/////////////////////////////////////////////////////// Stage 2: distance calculation and find the min value label for the point XY ///////////////////////////////////////////////////////  
    wire [`DOUBLE_WIDTH:0] dist0, dist1, dist2, dist3, dist4, dist5, dist6, dist7; 
    cal_dist cd(
        .clk(clk),
        .rst(rst),
        .enable(sweepPointsCalDist),
        .pointx(pointx),
        .pointy(pointy),
        .center0x(center0x),
        .center1x(center1x),
        .center2x(center2x),
        .center3x(center3x),
        .center4x(center4x),
        .center5x(center5x),
        .center6x(center6x),
        .center7x(center7x),
        .center0y(center0y),
        .center1y(center1y),
        .center2y(center2y),
        .center3y(center3y),
        .center4y(center4y),
        .center5y(center5y),
        .center6y(center6y),
        .center7y(center7y),
        .dist0(dist0),
        .dist1(dist1),
        .dist2(dist2),
        .dist3(dist3),
        .dist4(dist4),
        .dist5(dist5),
        .dist6(dist6),
        .dist7(dist7)
        );
 
    wire [`LOG_NUM_LABEL-1:0] minlabel;
    
    find_min fm(
        .dist0(dist0),
        .dist1(dist1),
        .dist2(dist2),
        .dist3(dist3),
        .dist4(dist4),
        .dist5(dist5),
        .dist6(dist6),
        .dist7(dist7),
        .minlabel(minlabel)
        );
        
    // store the labels into the ls memory if "done" signal is high
    // writing address Generation
    always@(posedge clk)
    begin
        if(rst)
        begin
            waddr<=0;
        end
        else if(lwea)
        begin
            waddr<=waddr + 1;
        end
    end
    
    assign labels=minlabel;
    
    wire done;
    done_check dc(    
        .clk(clk),
        .rst(rst),
        .updateCenters(updateCenters),    
        .center0x(center0x),
        .center1x(center1x),
        .center2x(center2x),
        .center3x(center3x),
        .center4x(center4x),
        .center5x(center5x),
        .center6x(center6x),
        .center7x(center7x),
        .center0y(center0y),
        .center1y(center1y),
        .center2y(center2y),
        .center3y(center3y),
        .center4y(center4y),
        .center5y(center5y),
        .center6y(center6y),
        .center7y(center7y),
        .done(done)
    );
    
    // result store signal
    always@(posedge clk)
    begin
        if(rst)
            storeLabels<=0;
        else
            if(done)
                storeLabels<=1;
    end
    // label store enable.
    assign lwea = storeLabels && sweepPointsAccu;        
        
/////////////////////////////////////////////////////// Stage 3: x y accumulator and count assignment for each label ///////////////////////////////////////////////////////      
    // delay the point x y by 1 cycle to wait for minlabel ready
    reg [`WIDTH-1:0] pointx_D1, pointy_D1;
    always@(posedge clk)
    begin
        if(rst)
        begin
            pointx_D1<=0;
            pointy_D1<=0;
        end
        else
        begin
            pointx_D1<=pointx;
            pointy_D1<=pointy;
        end
    end 
    
    // x y accumulator
    wire [`DOUBLE_WIDTH-1: 0] xaccu0, yaccu0, xaccu1, yaccu1, xaccu2, yaccu2, xaccu3, yaccu3, xaccu4, yaccu4, xaccu5, yaccu5, xaccu6, yaccu6, xaccu7, yaccu7;
    wire [`LOG_DEPTH-1 : 0] count0, count1, count2, count3, count4, count5, count6, count7;
    xyaccumulator xyaccu(
        .clk(clk),
        .rst(rst),
        .accu_enable(sweepPointsAccu),
        .accu_reset(updateCenters),
        .minlabel(minlabel),
        .pointx(pointx_D1),
        .pointy(pointy_D1),
        .xaccu0(xaccu0),
        .xaccu1(xaccu1),
        .xaccu2(xaccu2),
        .xaccu3(xaccu3),
        .xaccu4(xaccu4),
        .xaccu5(xaccu5),
        .xaccu6(xaccu6),
        .xaccu7(xaccu7),
        .yaccu0(yaccu0),
        .yaccu1(yaccu1),
        .yaccu2(yaccu2),
        .yaccu3(yaccu3),
        .yaccu4(yaccu4),
        .yaccu5(yaccu5),
        .yaccu6(yaccu6),
        .yaccu7(yaccu7),
        .count0(count0),
        .count1(count1),
        .count2(count2),
        .count3(count3),
        .count4(count4),
        .count5(count5),
        .count6(count6),
        .count7(count7)
    );
    
    
/////////////////////////////////////////////////////// Stage Out A of Pipeline: update center0-7 ///////////////////////////////////////////////////////  
    // update center0-7
    update_centers uc(
        .clk(clk),
        .rst(rst),
        .enable_update(updateCenters),
        .xaccu0(xaccu0),
        .xaccu1(xaccu1),
        .xaccu2(xaccu2),
        .xaccu3(xaccu3),
        .xaccu4(xaccu4),
        .xaccu5(xaccu5),
        .xaccu6(xaccu6),
        .xaccu7(xaccu7),
        .yaccu0(yaccu0),
        .yaccu1(yaccu1),
        .yaccu2(yaccu2),
        .yaccu3(yaccu3),
        .yaccu4(yaccu4),
        .yaccu5(yaccu5),
        .yaccu6(yaccu6),
        .yaccu7(yaccu7),
        .count0(count0),
        .count1(count1),
        .count2(count2),
        .count3(count3),
        .count4(count4),
        .count5(count5),
        .count6(count6),
        .count7(count7),
        .center0x(center0x),
        .center1x(center1x),
        .center2x(center2x),
        .center3x(center3x),
        .center4x(center4x),
        .center5x(center5x),
        .center6x(center6x),
        .center7x(center7x),
        .center0y(center0y),
        .center1y(center1y),
        .center2y(center2y),
        .center3y(center3y),
        .center4y(center4y),
        .center5y(center5y),
        .center6y(center6y),
        .center7y(center7y)
        
    );
    

endmodule
