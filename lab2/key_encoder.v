`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 12:45:46 AM
// Design Name: 
// Module Name: key_encoder
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


module key_encoder(clk_5MHz, IOs, notecode);

input  clk_5MHz;
input  wire [9:0] IOs;
output reg [4:0] notecode;

	
/*****************************************************************************/
always @ (posedge clk_5MHz)
begin
// write your code here
// you can also modify other parts.
notecode[4] <= IOs[9] || IOs[8];
notecode[3] <= IOs[9] || IOs[7];

notecode[0] <= IOs[0] || IOs[2] || IOs[4] || IOs[6];
notecode[1] <= IOs[1] || IOs[2] || IOs[5] || IOs[6];
notecode[2] <= IOs[3] || IOs[4] || IOs[5] || IOs[6];

end	

endmodule
