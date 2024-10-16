`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/10 19:39:55
// Design Name: 
// Module Name: ALU
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


module ALU(
	input [31:0] A,
	input [31:0] B,
	input [4:0] ALU_operation,
	output reg signed [31:0] res,
	output reg overflow,
	output wire zero
    );
	wire res_temp;
	assign res_temp = res;
	parameter one = 32'h00000001, zero_0 = 32'h00000000;
	wire signed [31:0] A_temp, B_temp;
	assign A_temp = A;
	assign B_temp = B;
	// always @ (A or B or ALU_operation) begin
	wire signed [32:0] result;
    always @ (*) begin
		case (ALU_operation)
//Write your code here
//Hints To Do "and,or,add,sub,XOR,SLT,SLTU,SLL,SRL,SRA"
            5'b00000:begin //and
                res = A_temp & B_temp;
                overflow = 0;
            end
            5'b00001:begin //or
                res = A_temp | B_temp;
                overflow = 0;
            end
            5'b00010:begin //add
                res = A_temp + B_temp;
                overflow = ( A_temp > 0 & B_temp > 0 & res < 0 ) | ( A_temp < 0 & B_temp < 0 & res > 0 );
            end
            5'b00011:begin //sub
                res = A_temp - B_temp;
                overflow = ( A_temp > 0 & B_temp < 0 & res < 0 ) | ( A_temp < 0 & B_temp > 0 & res > 0 );
            end
            5'b00100:begin //XOR
                res = A_temp ^ B_temp;
                overflow = 0;
            end
            5'b00101:begin //SLT
                overflow = 0;
                res = (A_temp <= B_temp) ? one : zero_0;
            end
            5'b00110:begin //SLTU
                overflow = 0;
                res = (A <= B) ? one : zero_0;
            end
            5'b00111:begin //SLL
                overflow = 0;
                res = A << B;
            end
            5'b01000:begin //SRL
                overflow = 0;
                res = A >> B;
            end
            5'b01001:begin //SRA
                overflow = 0;
                res = A_temp >>> B;
            end
//Write your code here
			5'b01010: begin // BGE
                res = (A_temp >= B_temp) ? one : zero_0;
                overflow = 0;
            end
            5'b01011: begin // BGEU
                res = (A >= B) ? one : zero_0;
                overflow = 0;
            end
			default: res = 32'hx;
		endcase
	end
	assign zero = (res == 0) ? 1 : 0;

endmodule
