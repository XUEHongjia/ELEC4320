`include "define.v"
module dct_top (Clk, Start);

reg Rd_en = 1;
input Clk, Start;
// A = input matrix
wire [`INPUTWIDTH-1:0] A_value [`MATRIXSIZE-1:0];
// B = sum of each row of A with different freq
reg [`INPUTWIDTH-1:0] B_value [`MATRIXSIZE-1:0];
// C = output matrix
reg [`INPUTWIDTH-1:0] C_value [`MATRIXSIZE-1:0];

reg [`INPUTWIDTH-1:0] tempA_value [7:0];
wire [`INPUTWIDTH-1:0] tempB_value [7:0];

reg [`INPUTWIDTH-1:0] tempB_value1 [7:0];
wire signed [`INPUTWIDTH-1:0] tempC_value [7:0];

reg [`OUTADDRWIDTH-1:0] C_addr = 0;
reg Wr_en = 0;
reg finish = 1;
reg [8:0] cycle_cnt = `EXECYCLE;
//######################################################

genvar iter1;
generate 
    for( iter1 = 6'd0; iter1 < `MATRIXSIZE; iter1 = iter1 + 6'd1)
    begin: 
	 A_ram//input matrix
        input_RAM_A A_matrix (
            .clka( Clk ),
            .ena( Rd_en ),
            .wea( 1'b0 ),
            .addra( iter1 ),
            .dina(  ),
            .douta( A_value[ iter1 ] )
        );    
	 end 
endgenerate

//the result RAM
Output_RAM C_ram (
  .clka( Clk ),
  .wea( Wr_en ),
  .addra( C_addr ),
  .dina( C_value[ C_addr ] ),
  .douta(  )
);

// counter
always @( posedge Clk )
begin
    if( Start && cycle_cnt == `EXECYCLE ) 
    begin
        cycle_cnt <= 0;
        finish <= 0;
    end
    else if( !Start && cycle_cnt == `EXECYCLE ) 
    begin
        finish <= 1;
    end
    else if( cycle_cnt < `EXECYCLE )
    begin
        cycle_cnt <= cycle_cnt + 1;
    end
end

// control when and where to write into C_RAM, i.e. the result RAM
always @( posedge Clk )
begin
	if( cycle_cnt >= 21 && cycle_cnt <= 84 && !finish )
    	begin
        	Wr_en <= 1;
        	C_addr <= cycle_cnt - 21;
    	end
    else 
    	begin
        	Wr_en <= 0;
        	C_addr <= 0;
    	end
end	

// control inputs and outputs of row and column DCT modules.
always @( posedge Clk )
begin
	if ( cycle_cnt >= 0 && cycle_cnt < 8 )
		begin
			tempA_value[ 0 ] <= A_value[ ( cycle_cnt * 8 )+ 0 ];
			tempA_value[ 1 ] <= A_value[ ( cycle_cnt * 8 )+ 1 ];
			tempA_value[ 2 ] <= A_value[ ( cycle_cnt * 8 )+ 2 ];
			tempA_value[ 3 ] <= A_value[ ( cycle_cnt * 8 )+ 3 ];
			tempA_value[ 4 ] <= A_value[ ( cycle_cnt * 8 )+ 4 ];
			tempA_value[ 5 ] <= A_value[ ( cycle_cnt * 8 )+ 5 ];
			tempA_value[ 6 ] <= A_value[ ( cycle_cnt * 8 )+ 6 ];
			tempA_value[ 7 ] <= A_value[ ( cycle_cnt * 8 )+ 7 ];
		end
	if ( cycle_cnt >= 6 && cycle_cnt < 14 )
		begin
			B_value[ ( cycle_cnt - 6 )*8 + 0] <= tempB_value[ 0 ];
			B_value[ ( cycle_cnt - 6 )*8 + 1] <= tempB_value[ 1 ];
			B_value[ ( cycle_cnt - 6 )*8 + 2] <= tempB_value[ 2 ];
			B_value[ ( cycle_cnt - 6 )*8 + 3] <= tempB_value[ 3 ];
			B_value[ ( cycle_cnt - 6 )*8 + 4] <= tempB_value[ 4 ];
			B_value[ ( cycle_cnt - 6 )*8 + 5] <= tempB_value[ 5 ];
			B_value[ ( cycle_cnt - 6 )*8 + 6] <= tempB_value[ 6 ];
			B_value[ ( cycle_cnt - 6 )*8 + 7] <= tempB_value[ 7 ];
		end	
	if ( cycle_cnt >= 14 && cycle_cnt < 22 )
    	begin
			tempB_value1[0] <= B_value[ cycle_cnt-14+0*8 ];
			tempB_value1[1] <= B_value[ cycle_cnt-14+1*8 ];
			tempB_value1[2] <= B_value[ cycle_cnt-14+2*8 ];
			tempB_value1[3] <= B_value[ cycle_cnt-14+3*8 ];
			tempB_value1[4] <= B_value[ cycle_cnt-14+4*8 ];
			tempB_value1[5] <= B_value[ cycle_cnt-14+5*8 ];
			tempB_value1[6] <= B_value[ cycle_cnt-14+6*8 ];
			tempB_value1[7] <= B_value[ cycle_cnt-14+7*8 ];		
    	end
	if( cycle_cnt >= 20 && cycle_cnt < 28 )
	// right shift the temp_C and assign tempC value to the output Matrix
    	begin
			C_value[ cycle_cnt - 20+0*8 ] <= tempC_value[0] >>>2;
			C_value[ cycle_cnt - 20+1*8 ] <= tempC_value[1] >>>2;
			C_value[ cycle_cnt - 20+2*8 ] <= tempC_value[2] >>>2;
			C_value[ cycle_cnt - 20+3*8 ] <= tempC_value[3] >>>2;
			C_value[ cycle_cnt - 20+4*8 ] <= tempC_value[4] >>>2;
			C_value[ cycle_cnt - 20+5*8 ] <= tempC_value[5] >>>2;
			C_value[ cycle_cnt - 20+6*8 ] <= tempC_value[6] >>>2;
			C_value[ cycle_cnt - 20+7*8 ] <= tempC_value[7] >>>2;
    	end

end	

//row 1d dct	
one_D_DCT_kernal row_one_d_dct ( .Clk( Clk ), .CNT( cycle_cnt ),
	.A_0( tempA_value[0] ), .A_1( tempA_value[1] ), .A_2( tempA_value[2] ), .A_3( tempA_value[3] ), 
	.A_4( tempA_value[4] ), .A_5( tempA_value[5] ), .A_6( tempA_value[6] ), .A_7( tempA_value[7] ),
	.B_0( tempB_value[0] ), .B_1( tempB_value[1] ), .B_2( tempB_value[2] ), .B_3( tempB_value[3] ), 
	.B_4( tempB_value[4] ), .B_5( tempB_value[5] ), .B_6( tempB_value[6] ), .B_7( tempB_value[7] )
		);

//col 1d dct
one_D_DCT_kernal col_one_d_dct ( .Clk( Clk ), .CNT( cycle_cnt ),
	.A_0( tempB_value1[0] ), .A_1( tempB_value1[1] ), .A_2( tempB_value1[2] ), .A_3( tempB_value1[3] ), 
	.A_4( tempB_value1[4] ), .A_5( tempB_value1[5] ), .A_6( tempB_value1[6] ), .A_7( tempB_value1[7] ),
	.B_0( tempC_value[0] ), .B_1( tempC_value[1] ), .B_2( tempC_value[2] ), .B_3( tempC_value[3] ), 
	.B_4( tempC_value[4] ), .B_5( tempC_value[5] ), .B_6( tempC_value[6] ), .B_7( tempC_value[7] )
		);

endmodule