///////////////////////////////////////////////////////////////////////////////
//
// Clock Module
//
// A clock module that alternates between low and high at a set duty cycle and frequency
//
// module: clock
// hdl: Verilog
// modeling: Behavioral Modeling
//
// author: Fisher Blumenfeld <fisher.blumenfeld@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

`ifndef CLOCK
`define CLOCK

module clock(clk);
   parameter time_high = 5;
   parameter time_low = 10;
   //
   // ---------------- PORT DEFINITIONS ----------------
   //

   output logic clk;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
    initial clk = 0;
    always begin
        #time_low clk = ~clk;
        #time_high clk = ~clk;
    end
    


endmodule

`endif 