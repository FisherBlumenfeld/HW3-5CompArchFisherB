///////////////////////////////////////////////////////////////////////////////
//
// Scalable ALU
//
// A basic scalable ALU implementing addition, subtraction, multiply, divide, and, or, not, sll, slr for signed and unsigned ints
//
// module: alu
// hdl: Verilog
// modeling: choose from Behavioral Modeling
//
// author: Fisher Blumenfeld <fisher.blumenfeld@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef ALU
`define ALU

module alu 
#(parameter int width = 8)
(A, B, op, Z);
    input logic [width-1:0] A,B;
    input logic [3:0] op;
    output logic [width-1:0] Z;

    always @(*) begin;
        if (op == 4'b0000) Z = A+B; //signed and unsigned addition (2's comp)
        else if (op == 4'b0001) Z = A-B; //signed and unsigned subtraction (2's comp)
        else if (op == 4'b0010) Z = A*B; //signed and unsigned mult
        else if (op == 4'b0011) Z = A/B; //signed and unsigned div
        else if (op == 4'b0100) Z = A&B; //bitwise and
        else if (op == 4'b0101) Z = A|B; //bitwise or
        else if (op == 4'b0110) Z = !A; //bitwise not
        else if (op == 4'b0111) Z = A<<B; //sll
        else if (op == 4'b1000) Z = A>>B; //slr
        else Z=0;
    end

endmodule

`endif
