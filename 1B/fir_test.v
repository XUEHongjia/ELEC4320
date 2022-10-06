`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: fir_test
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


module fir_test;
reg [15:0] data_in;
reg clk;
wire [15:0] data_out;

fir_example DUT(.data_in(data_in),.clk(clk),.data_out(data_out));

initial data_in=16'd0;
initial clk=1'd0;
always #5 clk=~clk;


initial
begin
    #10
    data_in=16'd11;
    #10
    data_in=16'd12;
    #10
    data_in=16'd13;       
    #10
    data_in=16'd14;
    #10
    data_in=16'd15;
    #10
    data_in=16'd16; 
     #10
    data_in=16'd17;
    #10
    data_in=16'd18;
    #10
    data_in=16'd19; 
    
    #1000 $finish;     
end
endmodule
