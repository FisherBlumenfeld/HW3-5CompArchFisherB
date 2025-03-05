///////////////////////////////////////////////////////////////////////////////
//
// N bit register
//
// An N bit register module using dffs, with enable and reset inputs
// 
// module: register
// hdl: Verilog
// modeling: Behavioral Modeling
//
// author: Fisher Blumenfeld <fisher.blumenfeld@cooper.org>
//
///////////////////////////////////////////////////////////////////////////////
`include "dff.sv"
`ifndef REGISTER
`define REGISTER
// DO NOT FORGET TO RENAME MODULE_NAME to match your module_name

module register
#(parameter n = 32) //number of bits held by the register
(clk, A, reset, enable, Z);
   
   input logic [n-1:0] A;
   input logic reset, enable, clk;
   output logic [n-1:0] Z;
   genvar i;
   generate
    for (i = 0; i < n; i ++) begin
        dff instance_i(.clk(clk), .reset(reset), .enable(enable), .d(A[i]), .q(Z[i]));
    end
   endgenerate 
   

endmodule

`endif // EXAMPLE_MODULE