`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2020 08:51:57 PM
// Design Name: 
// Module Name: done_check
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


module done_check(clk,rst,
                  updateCenters,
                  center0x,
                  center1x,
                  center2x,
                  center3x,
                  center4x,
                  center5x,
                  center6x,
                  center7x,
                  center0y,
                  center1y,
                  center2y,
                  center3y,
                  center4y,
                  center5y,
                  center6y,
                  center7y,
                  done
    ); 
    
    input clk,rst,
          updateCenters;
    input [`WIDTH-1:0]
          center0x,
          center1x,
          center2x,
          center3x,
          center4x,
          center5x,
          center6x,
          center7x,
          center0y,
          center1y,
          center2y,
          center3y,
          center4y,
          center5y,
          center6y,
          center7y;
    output done;
    
    reg [`WIDTH-1:0] center0x_D1, center0y_D1;
    reg [`WIDTH-1:0] center1x_D1, center1y_D1;
    reg [`WIDTH-1:0] center2x_D1, center2y_D1;
    reg [`WIDTH-1:0] center3x_D1, center3y_D1;
    reg [`WIDTH-1:0] center4x_D1, center4y_D1;
    reg [`WIDTH-1:0] center5x_D1, center5y_D1;
    reg [`WIDTH-1:0] center6x_D1, center6y_D1;
    reg [`WIDTH-1:0] center7x_D1, center7y_D1;
    
    // kmeans stop signal
    reg done;
    
    // kmeans stop criterion.
    always@(posedge clk)
    begin
        if(rst)
        begin
            center0x_D1<=0; center0y_D1<=0;
            center1x_D1<=0; center1y_D1<=0;
            center2x_D1<=0; center2y_D1<=0;
            center3x_D1<=0; center3y_D1<=0;
            center4x_D1<=0; center4y_D1<=0;
            center5x_D1<=0; center5y_D1<=0;
            center6x_D1<=0; center6y_D1<=0;
            center7x_D1<=0; center7y_D1<=0;
            done <= 0;
        end
        else if(updateCenters)
        begin
            center0x_D1<=center0x; center0y_D1<=center0y;
            center1x_D1<=center1x; center1y_D1<=center1y;
            center2x_D1<=center2x; center2y_D1<=center2y;
            center3x_D1<=center3x; center3y_D1<=center3y;
            center4x_D1<=center4x; center4y_D1<=center4y;
            center5x_D1<=center5x; center5y_D1<=center5y;
            center6x_D1<=center6x; center6y_D1<=center6y;
            center7x_D1<=center7x; center7y_D1<=center7y;
            done <= done0 && done1 && done2 && done3 && done4 && done5 && done6 && done7;
        end
    end
    
    wire done0, done1, done2, done3, done4, done5, done6, done7;
    assign done0=(center0x_D1 == center0x) && (center0y_D1 == center0y);
    assign done1=(center1x_D1 == center1x) && (center1y_D1 == center1y);
    assign done2=(center2x_D1 == center2x) && (center2y_D1 == center2y);
    assign done3=(center3x_D1 == center3x) && (center3y_D1 == center3y);
    assign done4=(center4x_D1 == center4x) && (center4y_D1 == center4y);
    assign done5=(center5x_D1 == center5x) && (center5y_D1 == center5y);
    assign done6=(center6x_D1 == center6x) && (center6y_D1 == center6y);
    assign done7=(center7x_D1 == center7x) && (center7y_D1 == center7y);
    
   
    
endmodule
