///////////////////////////////////////////////////////////////////////////////
//
// Simplified RAM module
//
// A simple, byte adressable RAM module
//
// module: ram
// hdl: Verilog
// modeling: Behavioral Modeling
//
// author: Fisher Blumenfeld <fisher.blumenfeld@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`include "register.sv"
`ifndef RAM
`define RAM

module ram
#(parameter logHeight = 3) // 2^logHeight = height of RAM
(bytein, byteout, adr, rwn, clock); //A (input), Z(output), adr(adress), rwn(read/writenot), clk (clock)
    input logic [7:0] bytein;
    input logic [logHeight+1:0] adr;
    input logic rwn,clock;
    output logic [7:0] byteout;
    
    logic [7:0] ram_arr [2**(logHeight+2)-1 :0];
    logic [7:0] ram_out [2**(logHeight+2)-1 :0]; 

    genvar j;
    genvar k;
    generate
        for (j = 0; j < 2**logHeight; j = j + 1) begin
            for (k = 0; k < 4; k++)begin
                register #(.n(8)) instance_j_k (
                    .clk(clock), 
                    .reset(1'b0), 
                    .enable(1'b1), 
                    .A(ram_arr[j*4 + k]), 
                    .Z(ram_out[j*4 + k])
                );
            end
        end
    endgenerate     
    
    int bytenum;
    int wordnum;
    int bytestart;
    int byteend;
    always @(posedge(clock)) begin
        if (rwn) begin
            byteout =  ram_out [adr];
        end
        else begin
            ram_arr [adr] = bytein;
        end 
    end

endmodule

`endif