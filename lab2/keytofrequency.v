`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 12:45:46 AM
// Design Name: 
// Module Name: keytofrequency
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


module keytofrequency(clk_5MHz, notecode, countStart);

input  clk_5MHz;
input wire[4:0] notecode;



/*****************************************************************************/
output reg[13:0] countStart;

initial begin
countStart = 14'd0;
end

always @ (posedge clk_5MHz)
begin
// write your code here
// you can also modify other parts.
    if ( notecode[4:3] == 2'b00 )begin
    countStart <= 14'd0;
    end
    
    else if ( notecode[4:3] == 2'b01  ) begin 
        if ( notecode[2:0] == 3'b000 ) begin 
        countStart <= 14'd0;
        end
        
        else if ( notecode[2:0] == 3'b001 ) begin
        countStart <= 14'd261; 
        end
        
        else if ( notecode[2:0] == 3'b010 ) begin
        countStart <= 14'd293; 
        end
        
        else if ( notecode[2:0] == 3'b011 ) begin
        countStart <= 14'd329; 
        end
        
        else if ( notecode[2:0] == 3'b100 ) begin
        countStart <= 14'd349; 
        end
        
        else if ( notecode[2:0] == 3'b101 ) begin
        countStart <= 14'd391; 
        end
        
        else if ( notecode[2:0] == 3'b110 ) begin
        countStart <= 14'd439; 
        end
        
        else if ( notecode[2:0] == 3'b11 ) begin
        countStart <= 14'd493; 
        end
    end
    
    else if ( notecode[4:3] == 2'b10  ) begin 
    
            if ( notecode[2:0] == 3'b000 ) begin 
        countStart <= 14'd0;
        end
        
        else if ( notecode[2:0] == 3'b001 ) begin
        countStart <= 14'd523; 
        end
        
        else if ( notecode[2:0] == 3'b010 ) begin
        countStart <= 14'd587; 
        end
        
        else if ( notecode[2:0] == 3'b011 ) begin
        countStart <= 14'd659; 
        end
        
        else if ( notecode[2:0] == 3'b100 ) begin
        countStart <= 14'd698; 
        end
        
        else if ( notecode[2:0] == 3'b101 ) begin
        countStart <= 14'd783; 
        end
        
        else if ( notecode[2:0] == 3'b110 ) begin
        countStart <= 14'd874; 
        end
        
        else if ( notecode[2:0] == 3'b11 ) begin
        countStart <= 14'd987; 
        end
    end
    
    else if ( notecode[4:3] == 2'b11  ) begin 
    
            if ( notecode[2:0] == 3'b000 ) begin 
        countStart <= 14'd0;
        end
        
        else if ( notecode[2:0] == 3'b001 ) begin
        countStart <= 14'd1046; 
        end
        
        else if ( notecode[2:0] == 3'b010 ) begin
        countStart <= 14'd1174; 
        end
        
        else if ( notecode[2:0] == 3'b011 ) begin
        countStart <= 14'd1318; 
        end
        
        else if ( notecode[2:0] == 3'b100 ) begin
        countStart <= 14'd1396; 
        end
        
        else if ( notecode[2:0] == 3'b101 ) begin
        countStart <= 14'd1568; 
        end
        
        else if ( notecode[2:0] == 3'b110 ) begin
        countStart <= 14'd1760; 
        end
        
        else if ( notecode[2:0] == 3'b11 ) begin
        countStart <= 14'd1974; 
        end
    end
end	

/*****************************************************************************/
// YOU SHOULD UNCOMMENT THIS FOR EXERCISE 2C
// output wire[13:0] countStart;
// blk_mem_gen_0 BRAMROM(
//        .clka(clk_5MHz),
//        .addra(notecode),
//        .douta(countStart),
//        .ena(1)
//       );
   
endmodule

