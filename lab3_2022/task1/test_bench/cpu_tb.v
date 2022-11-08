`timescale 1ns / 1ps

`include "define.v"

module cpu_tb;

 reg clk, reset, run;
 reg [15:0] in;
 wire [2:0] cs;
 wire [15:0] irout, qtop, dbus, out;
 wire [11:0] pcout, abus;

 cpu cpu0(.clk(clk), .reset(reset), .run(run), .in(in), .cs(cs), .pcout(pcout), .irout(irout), .qtop(qtop), .abus(abus), .dbus(dbus), .out(out));

initial 
begin
	clk=0;
	forever #5 clk = !clk;
end

initial begin
	reset=1; run=0; in=8;
	#10 reset=0; run=1;
	#10 run=0;
	#1000 $finish;
end

endmodule


