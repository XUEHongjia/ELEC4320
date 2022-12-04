`include "define.v"
module one_D_DCT_kernal ( Clk, CNT,
A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7,
B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7
);
input [8:0] CNT;
input Clk;
input signed [`INPUTWIDTH-1:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7;
output signed [`INPUTWIDTH-1:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7;

wire signed [15:0] 	cos1 = 16'd1004,// cos( pi/16 )                                                  
					cos2 = 16'd946,// cos( 2pi/16 )  
					cos3 = 16'd851,// cos( 3pi/16 )  
					cos4 = 16'd724,// cos( 4pi/16 )  
					cos5 = 16'd569,// cos( 5pi/16 )  
					cos6 = 16'd392,// cos( 6pi/16 )  
					cos7 = 16'd200;// cos( 7pi/16 )  

//######################################################
reg signed [31:0] reg_state_1 [7:0];
reg signed [31:0] reg_state_2 [27:0];
reg signed [31:0] reg_state_3 [15:0];
reg signed [31:0] reg_state_4 [7:0];
reg signed [`OUTPUTWIDTH-1:0] reg_state_5 [7:0];
//state_1
always@(posedge Clk)
begin
	 //calculate add and sub
	if( CNT>=0 && CNT<`EXECYCLE -4)
	begin
	reg_state_1[0] <= A_0 + A_7;
	reg_state_1[1] <= A_1 + A_6;
	reg_state_1[2] <= A_2 + A_5;
	reg_state_1[3] <= A_3 + A_4;
	reg_state_1[4] <= A_0 - A_7;
	reg_state_1[5] <= A_1 - A_6;
	reg_state_1[6] <= A_2 - A_5;
	reg_state_1[7] <= A_3 - A_4;
	end
end
//state_2
always@(posedge Clk)
begin
	 //calculate terms in each sum
	if( CNT >= 1 && CNT < `EXECYCLE -3)
	begin
		//acf matrix
		reg_state_2[0] <= cos4 * reg_state_1[0];		
		reg_state_2[1] <= cos2 * reg_state_1[0];		
		reg_state_2[2] <= cos6 * reg_state_1[0];
		
		reg_state_2[3] <= cos4 * reg_state_1[1];		
		reg_state_2[4] <= cos2 * reg_state_1[1];		
		reg_state_2[5] <= cos6 * reg_state_1[1];
		
		reg_state_2[6] <= cos4 * reg_state_1[2];		
		reg_state_2[7] <= cos2 * reg_state_1[2];		
		reg_state_2[8] <= cos6 * reg_state_1[2];
		
		reg_state_2[9] <= cos4 * reg_state_1[3];		
		reg_state_2[10] <= cos2 * reg_state_1[3];		
		reg_state_2[11] <= cos6 * reg_state_1[3];	
		//bdeg matrix
		reg_state_2[12] <= cos1 * reg_state_1[4];		
		reg_state_2[13] <= cos3 * reg_state_1[4];
		reg_state_2[14] <= cos5 * reg_state_1[4];		
		reg_state_2[15] <= cos7 * reg_state_1[4];
		
		reg_state_2[16] <= cos1 * reg_state_1[5];		
		reg_state_2[17] <= cos3 * reg_state_1[5];
		reg_state_2[18] <= cos5 * reg_state_1[5];		
		reg_state_2[19] <= cos7 * reg_state_1[5];
		
		reg_state_2[20] <= cos1 * reg_state_1[6];		
		reg_state_2[21] <= cos3 * reg_state_1[6];
		reg_state_2[22] <= cos5 * reg_state_1[6];		
		reg_state_2[23] <= cos7 * reg_state_1[6];
		
		reg_state_2[24] <= cos1 * reg_state_1[7];		
		reg_state_2[25] <= cos3 * reg_state_1[7];
		reg_state_2[26] <= cos5 * reg_state_1[7];		
		reg_state_2[27] <= cos7 * reg_state_1[7];
		
	end	
end

//state_3
always@(posedge Clk)
begin
    //To do: finish pipeline stage 3
	if( CNT >= 2 && CNT < `EXECYCLE-2)
	begin
		
		reg_state_3[0] <= reg_state_2[0] + reg_state_2[3];
		reg_state_3[1] <= reg_state_2[6] + reg_state_2[9];//a+a+a+a
		
		reg_state_3[2] <= reg_state_2[1] + reg_state_2[5];
		reg_state_3[3] <= -reg_state_2[8] - reg_state_2[10];//c+f-f-c
		
		reg_state_3[4] <= reg_state_2[0] - reg_state_2[3];
		reg_state_3[5] <= -reg_state_2[6] + reg_state_2[9];//a-a-a+a
		
		reg_state_3[6] <= reg_state_2[2] - reg_state_2[4];
		reg_state_3[7] <= reg_state_2[7] - reg_state_2[11];//f-c+c-f
		
		reg_state_3[8] <= reg_state_2[12] + reg_state_2[17];
		reg_state_3[9] <= reg_state_2[22] + reg_state_2[27];//b+d+e+g
		
		reg_state_3[10] <= reg_state_2[13] - reg_state_2[19];
		reg_state_3[11] <= -reg_state_2[20] - reg_state_2[26];//d-g-b-e
		
		reg_state_3[12] <= reg_state_2[14] - reg_state_2[16];
		reg_state_3[13] <= reg_state_2[23] + reg_state_2[25];//e-b+g+d
		
		reg_state_3[14] <= reg_state_2[15] - reg_state_2[18];
		reg_state_3[15] <= reg_state_2[21] - reg_state_2[24];//g-e+d-b
	end
end

//state_4
always@(posedge Clk)
begin
    //To do: finish pipeline stage 4
	if( CNT >= 3 && CNT < `EXECYCLE-1)
	begin
		//B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7;
		reg_state_4[0] <= reg_state_3[0] + reg_state_3[1];//a+a+a+a
		reg_state_4[2] <= reg_state_3[2] + reg_state_3[3];//c+f-f-c
		reg_state_4[4] <= reg_state_3[4] + reg_state_3[5];//a-a-a+a
		reg_state_4[6] <= reg_state_3[6] + reg_state_3[7];//f-c+c-f
		
		reg_state_4[1] <= reg_state_3[8] + reg_state_3[9];//b+d+e+g
		reg_state_4[3] <= reg_state_3[10] + reg_state_3[11];//d-g-b-e
		reg_state_4[5] <= reg_state_3[12] + reg_state_3[13];//e-b+g+d
		reg_state_4[7] <= reg_state_3[14] + reg_state_3[15];//g-e+d-b
	end
end

// state 5
always@(posedge Clk)
begin
    //To do: finish pipeline stage 5
	if( CNT >= 4 && CNT < `EXECYCLE)
	begin
		//B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7;
		reg_state_5[0] <= reg_state_4[0] >>> 11;//a+a+a+a
		reg_state_5[1] <= reg_state_4[1] >>> 11;//c+f-f-c
		reg_state_5[2] <= reg_state_4[2] >>> 11;//a-a-a+a
		reg_state_5[3] <= reg_state_4[3] >>> 11;//f-c+c-f
		
		reg_state_5[4] <= reg_state_4[4] >>> 11;//b+d+e+g
		reg_state_5[5] <= reg_state_4[5] >>> 11;//d-g-b-e
		reg_state_5[6] <= reg_state_4[6] >>> 11;//e-b+g+d
		reg_state_5[7] <= reg_state_4[7] >>> 11;//g-e+d-b
	end
end

assign B_0 = reg_state_5[0];
assign B_1 = reg_state_5[1];
assign B_2 = reg_state_5[2];
assign B_3 = reg_state_5[3];
assign B_4 = reg_state_5[4];
assign B_5 = reg_state_5[5];
assign B_6 = reg_state_5[6];
assign B_7 = reg_state_5[7];
endmodule