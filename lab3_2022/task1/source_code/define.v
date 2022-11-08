//`timescale 1ns / 1ps

`define IDLE   3'b000
`define FETCHA 3'b001
`define FETCHB 3'b010
`define EXECA  3'b011
`define EXECB  3'b100

`define  ADD  5'b00000
`define  SUB  5'b00001
`define  MUL  5'b00010
`define  SHL  5'b00011
`define  SHR  5'b00100
`define  BAND 5'b00101
`define  BOR  5'b00110
`define  BXOR 5'b00111
`define  AND  5'b01000
`define  OR   5'b01001
`define  EQ   5'b01010
`define  NE   5'b01011
`define  GE   5'b01100
`define  LE   5'b01101
`define  GT   5'b01110
`define  LT   5'b01111
`define  NEG  5'b10000
`define  BNOT 5'b10001
`define  NOT  5'b10010

`define HALT  4'b0000
`define PUSHI 4'b0001
`define PUSH  4'b0010
`define POP   4'b0011
`define JMP   4'b0100
`define JZ    4'b0101
`define JNZ   4'b0110
`define IN    4'b1101
`define OUT   4'b1110
`define OP    4'b1111
