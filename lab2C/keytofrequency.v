`timescale 1ns / 1ps

module keytofrequency(clk_5MHz, notecode, countStart);

input  clk_5MHz;
input wire[4:0] notecode;
output wire[13:0] countStart;

	wire wea;		//state of read or write. if wea is one->enable writing, else state of reading
	reg [4:0] addra=0;	//operation address
	reg [13:0] dina=0;	//data_in address or write address
	wire [13:0] douta;	//datt_out address or read address
	reg [4:0] rdaddra=0;	//read_address, decoding from key_code
	reg [4:0] ini_cnt=0;	//initial state until storage done.

	always@(*)
	begin
		if(wea) addra=ini_cnt-1;	//keep writing in this state
		else addra=rdaddra;		//change to read_address
	end

blk_mem_gen_0 BRAMROM(
        .clka(clk_5MHz),
        .wea(wea), // input [0 : 0] wea
        .addra(addra), // input [4 : 0] addra
        .dina(dina), // input [12 : 0] dina
        .douta(douta),
        .ena(1)
       );
       
always @ (posedge clk_5MHz)
begin
    case ( notecode )
   //Add your own code below to read address to key_code.
   //List of low frequencies for the 7 notes
	5'b01001: rdaddra <= 5'b00001;						
	5'b01010: rdaddra <= 5'b00010;						
	5'b01011: rdaddra <= 5'b00011;						
	5'b01100: rdaddra <= 5'b00100;						
	5'b01101: rdaddra <= 5'b00101;							
	5'b01110: rdaddra <= 5'b00110;						
	5'b01111: rdaddra <= 5'b00111;		
	//List of medium frequencies for the 7 notes
	//Insert your code here
	5'b10001: rdaddra <= 5'b01000;						
	5'b10010: rdaddra <= 5'b01001;						
	5'b10011: rdaddra <= 5'b01010;						
	5'b10100: rdaddra <= 5'b01011;						
	5'b10101: rdaddra <= 5'b01100;						
	5'b10110: rdaddra <= 5'b01101;						
	5'b10111: rdaddra <= 5'b01110;
	//List of high frequencies for the 7 notes
	//Insert your code here
	5'b11001: rdaddra <= 5'b01111;						
	5'b11010: rdaddra <= 5'b010000;						
	5'b11011: rdaddra <= 5'b010001;						
	5'b11100: rdaddra <= 5'b010010;						
	5'b11101: rdaddra <= 5'b010011;						
	5'b11110: rdaddra <= 5'b010100;					
	5'b11111: rdaddra <= 5'b010101;		
	default: rdaddra <= 5'b000000;
    endcase
end

       
always @(*)
begin
    
    case ( ini_cnt )
    5'b00001: dina = 14'd0;
    5'b00010: dina = 14'd261;
    5'b00011: dina = 14'd293;
    5'b00100: dina = 14'd329;
    5'b00101: dina = 14'd349;
    5'b00110: dina = 14'd391;
    5'b00111: dina = 14'd439;
    
    5'b01000: dina = 14'd493;
    5'b01001: dina = 14'd523;
    5'b01010: dina = 14'd587;
    5'b01011: dina = 14'd659;
    5'b01100: dina = 14'd698;
    5'b01101: dina = 14'd783;
    5'b01110: dina = 14'd874;
    
    5'b01111: dina = 14'd987;
    5'b10000: dina = 14'd1046;
    5'b10001: dina = 14'd1174;
    5'b10010: dina = 14'd1318;
    5'b10011: dina = 14'd1369;
    5'b10100: dina = 14'd1568;
    5'b10101: dina = 14'd1760;
    5'b10110: dina = 14'd1974;

    
    endcase
    
end

	always@(posedge clk_5MHz) if(ini_cnt<23) ini_cnt<=ini_cnt+1;	//increase int_cnt until the storage done(21 freq)
	assign wea = (ini_cnt<23) && (ini_cnt>0);	// if wea is one->enable writing, else state of reading
	assign countStart = douta;	//imply that douta is the writing objective.
	 
endmodule

