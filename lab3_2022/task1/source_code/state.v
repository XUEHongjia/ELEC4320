`timescale 1ns / 1ps
`include "define.v"

module state(clk,reset,run,cont,halt,cs);
  
  input clk, reset, run, cont, halt;
  output [2:0] cs;
  reg [2:0]cs;


//cs: current state
//run: is set high only to start the processor and bring it out of the IDLE state {check the testbench to see what is happening}
//cont: set for some instructions that need that extra state (EXECB) {check cpu.v to see what is happening}

//Put your implementation here
initial begin
    cs = `IDLE;
end

always@( posedge clk or posedge reset ) begin

    if ( reset == 1 || run == 0 ) begin
        cs = `IDLE;
        end
        
    else if ( run == 1 ) begin
        if ( cs == `IDLE ) begin
            cs = `FETCHA;
            end
        else if ( cs == `FETCHA ) begin
            cs = `FETCHB;
            end
        else if ( cs == `FETCHB ) begin
            cs = `EXECA;
            end
        else if ( cs == `EXECA ) begin
            if ( halt == 1 ) begin
                cs = `IDLE;
                end
            else if ( halt == 0 && cont == 0 ) begin
                cs = `FETCHA;
                end
            else if ( halt == 0 && cont == 1 ) begin
                cs = `EXECB;
                end
        end  
        else if ( cs == `EXECB ) begin
            cs = `FETCHA;
        end   
    end
    
end
endmodule
