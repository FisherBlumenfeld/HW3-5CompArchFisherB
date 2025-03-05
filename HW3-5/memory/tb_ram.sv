///////////////////////////////////////////////////////////////////////////////
//
// RAM Testbench module 
//
// A testbench module for the variable height, word adressable RAM 
//
// module: tb_ram
// hdl: SystemVerilog
//
// author: Fisher Blumenfeld <fisher.blumenfeld@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./ram.sv"

module tb_ram;

    localparam logHeight = 3;
    reg [7:0] bytein;
    reg [logHeight+1:0] adr;
    wire [7:0] byteout;
    logic clock, rwn;
    

    ram #(.logHeight(logHeight))dut(.bytein(bytein),.byteout(byteout),.adr(adr),.rwn(rwn),.clock(clock));
    clock timer(.clk(clock));

    initial begin : initialize_variables
        bytein = 0;
        adr = 0;
        rwn = 1;
    end

    initial begin : dump_variables
      $dumpfile("tb_ram.vcd"); // for Makefile, make dump file same as module name
      $dumpvars(1, dut);
    end

    initial begin: display_variables
        // note: currently only simple signals or constant expressions may be passed to $monitor.
        $monitor ("clk: %b, rwn: %b, adr: %b, bytein: %b, byteout: %b", clock,rwn,adr,bytein,byteout);
    end

    initial begin: apply_stimuli
        adr = 0;
        #50;
        bytein = 2**8-1;
        rwn = 0;
        #15;
        bytein = 0;
        rwn = 1;
        #50;
        adr = 1;
        bytein = 2**4-1;
        rwn = 0;
        #20;
        rwn = 1;
        bytein = 0;
        #50;
        adr = 0;
        #50;
        $finish;
    end


endmodule
