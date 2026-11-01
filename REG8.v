module REG8(
    input  wire EN,
    input  wire [7:0] DIN,
    output wire [7:0] DOUT
);

    genvar i;

    generate
        for(i = 0; i < 8; i = i + 1) begin : bits
            D_LATCH Li(
                .D(DIN[i]),
                .E(EN),
                .Q(DOUT[i])
            );
        end
    endgenerate

endmodule
