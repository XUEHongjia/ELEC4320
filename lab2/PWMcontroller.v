`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 01:28:00 AM
// Design Name: 
// Module Name: PWMcontroler
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


module PWMcontroller(
        clk_5MHz,
        countStart,
        reset,
        beep
    );
    
input clk_5MHz;
input [13:0] countStart;
input reset;
output beep;


reg beep_r;
reg [13:0] count;  
reg [13:0] count_old;
integer c;
reg [14:0] cnt;
  
// write your code here
// you can also modify other parts.
initial begin
cnt <= 15'd0;
end

always @(posedge clk_5MHz)
begin  
    if (reset)
    begin
    beep_r = 1'b0;
    count_old = count;
    count = 14'd0;
    cnt = 15'd0;
        // write your code here
        // you can also modify other parts.
    end 
    
    else
    begin
    
    if ( count != countStart ) begin 
    count_old = count;
    count = countStart;
    end
        // write your code here
        // you can also modify other parts.
        
        if ( count == 14'd0 ) begin
            if( beep_r == 1 ) begin 
                if ( cnt == c ) begin 
                    beep_r <= 1'b0;
                    cnt <= 1'b0;
                end
                
                else begin 
                    cnt <= cnt + 1;
                end
            end
        
            else begin 
                beep_r <= 1'b0;
                cnt <= 1'b0;
            end
        end 
        
        
        else begin
            c = 2500000/count -1 ;
        
            if ( cnt == 0 ) begin 
                beep_r <= !beep_r;
                cnt <= cnt + 15'd1;
            end
        
            else if ( cnt > 0 && cnt <c ) begin 
                cnt <= cnt + 15'd1;
            end
        
            else if ( cnt == c ) begin 
                cnt <= 15'd0;
            end
            
            else if ( cnt > c ) begin
                 if ( cnt == 2500000/count_old - 1 ) begin
                    cnt <= 0;
                 end
                 else begin
                    cnt <= cnt + 1;
                 end
            end
        end
    end
end 

assign beep = beep_r;
endmodule
