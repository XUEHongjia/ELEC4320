`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: decoder
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


module decoder(
data_in,
data_out
    );
    input [2:0] data_in;
    output reg [7:0] data_out;

//write code here
assign data_out[0] = (!data_in[0]) && (!data_in[1]) && (!data_in[2]);  
endmodule
