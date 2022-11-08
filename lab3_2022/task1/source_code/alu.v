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
    `ADD: s <= a + b;
    `SUB: s <= a - b;
    `MUL: s <= a * b;
    `SHL: s <= a << b;
    `SHR: s <= a >> b;
    `BAND: s <= a & b;
    `BOR: s <= a | b;
    `BXOR: s <= a ^ b;
    `AND: s <= a && b;
    `OR: s <= a || b;
    `EQ: s <= ( a == b );
    `NE: s <= ( a != b );
    `GE: s <= ( a >= b );
    `LE: s <= ( a <= b );
    `GT: s <= ( a > b );
    `LT: s <= ( a < b );
    `NEG: s <= -b;
    `BNOT: s <= ~b;
    `NOT: s <= !b;
endcase


endmodule
