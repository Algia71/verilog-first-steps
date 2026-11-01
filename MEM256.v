module MEM256(
    input wire EN,
    input wire [7:0] ADDR,
    input wire [7:0] DIN,
    output wire [7:0] DOUT
);
    wire [7:0] reg_outputs [255:0];

    genvar a;

    generate
        for(a = 0; a < 256; a = a + 1) begin : bytes
            REG8 b(
                .EN( (a == ADDR) ? EN : 1'b0 ),
                .DIN( (a == ADDR) ? DIN : 8'bzzzzzzzz ),
                .DOUT( reg_outputs[a] ) 
            );
        end
    endgenerate

    assign DOUT = reg_outputs[ADDR];

endmodule
