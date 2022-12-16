`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 17:08:40
// Design Name: 
// Module Name: gray_counter
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


module gray_counter(
    input clk,
    input rst,
    output [2:0] cnt
    );
    reg[ 2: 0 ] cnt_temp;
    
    initial
    begin
    cnt_temp = 3'd0;
    end
    
    always@(posedge clk or negedge rst) begin
                if( ! rst )begin         
                        cnt_temp <= 3'b000 ;
                end
                else if ( cnt_temp==3'd7 ) begin  
                        cnt_temp <=3'b000;
                end
                else begin                                      
                        cnt_temp <= cnt_temp + 1'b1 ; 
                end
     end
     assign cnt[2] = cnt_temp[2];
     assign cnt[1] = cnt_temp[2]^cnt_temp[1];
     assign cnt[0] = cnt_temp[1]^cnt_temp[0];

endmodule
