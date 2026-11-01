module SR_NAND_LATCH(
    input wire r_n,
    input wire s_n,
    output wire q,
    output wire q_n
);
    wire internal_wire_1;
    wire internal_wire_2;

    NAND_gate nand1(
        .a(r_n),
        .b(internal_wire_1),
        .y(internal_wire_2)
    );

    NAND_gate nand2(
        .a(internal_wire_2),
        .b(s_n),
        .y(internal_wire_1)
    );

    assign q = internal_wire_1;
    assign q_n = internal_wire_2;

endmodule
