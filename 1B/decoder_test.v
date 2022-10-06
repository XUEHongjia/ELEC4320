`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: decoder_test
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


module decoder_test;

reg [2:0] data_in;
wire [7:0] data_out;
decoder DUT2(.data_in(data_in),.data_out(data_out));

initial begin
    data_in = 3'b000;     #100;
    data_in = 3'b001;     #100;
    data_in = 3'b010;     #100;
    data_in = 3'b011;     #100;
    data_in = 3'b100;     #100;
    data_in = 3'b101;     #100;
    data_in = 3'b110;     #100;
    data_in = 3'b111;     #100;
end
      

endmodule
