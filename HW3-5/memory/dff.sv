///////////////////////////////////////////////////////////////////////////////
//
// D flip flop
//
// A Dff module with reset and enable
//
// module: dff
// hdl: Verilog
// modeling: Behavioral Modeling
//
// author: Fisher Blumenfeld <fisher.blumenfeld@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef DFF
`define DFF

module dff(clk, reset, enable, d, q);
   input logic clk, enable, reset, d;
   output wire q;
   logic temp;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   // mix up the input bits
   always @(posedge clk) begin
      temp = d;
      if (reset) begin
         temp = 0;
      end
   end

   assign q = (enable) ? temp : 1'bz;
endmodule

`endif // EXAMPLE_MODULE