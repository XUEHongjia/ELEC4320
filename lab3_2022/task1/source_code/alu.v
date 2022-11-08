`timescale 1ns / 1ps
`include "define.v"

module alu(a, b, f, s);

 input [15:0] a, b;
 input [4:0] 	f;
 output [15:0] s;
 reg  [15:0] 	 s;

//put your implementation here
//note: 'f' is the 5-bit opcode as in Table 2 in the manual.
//'a' and 'b' are the two operands
always@(*)

case(f)
    5'b00000: s <= a + b;
    5'b00001: s <= a - b;
    5'b00010: s <= a * b;
    5'b00011: s <= a << b;
    5'b00100: s <= a >> b;
    5'b00101: s <= a & b;
    5'b00110: s <= a | b;
    5'b00111: s <= a ^ b;
    5'b01000: s <= a && b;
    5'b01001: s <= a || b;
    5'b01010: s <= ( a == b );
    5'b01011: s <= ( a != b );
    5'b01100: s <= ( a >= b );
    5'b01101: s <= ( a <= b );
    5'b01110: s <= ( a > b );
    5'b01111: s <= ( a < b );
    5'b10000: s <= -b;
    5'b10001: s <= ~b;
    5'b10010: s <= !b;
endcase


endmodule
