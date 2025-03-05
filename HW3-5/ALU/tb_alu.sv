///////////////////////////////////////////////////////////////////////////////
//
// ALU testbench
//
// A testbench for the behavioral modeled ALU
//
// module: tb_alu
// hdl: SystemVerilog
//
// author: Fisher Blumenfeld <fisher.blumenfeld@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps
`include "alu.sv"

module tb_alu;
    parameter int width = 8;

    reg [width-1:0] A,B;
    reg [3:0] op;
    wire [width-1:0] Z;

    alu #(.width(width)) dut(.A(A), .B(B), .op(op), .Z(Z));

    initial begin : dump_variables
      $dumpfile("tb_alu.vcd"); 
      $dumpvars(2, dut);
    end

    initial begin: display_variables
        // note: currently only simple signals or constant expressions may be passed to $monitor.
        $monitor ("inputs: a=%b\tb=%b\top=%b\t output=%b", A, B, op, Z);
    end

    initial begin: apply_stimuli
        for(int opI = 0; opI <= 8; opI++)begin
            for(int Ai = 2**(width-2); Ai < 2**width; Ai++)begin
                for(int Bi = 0; Bi < width; Bi++)begin
                    A = Ai;
                    B = Bi;
                    op = opI;
                    #5;
                end
            end
        end
    end
endmodule