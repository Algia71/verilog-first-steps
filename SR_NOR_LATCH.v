module SR_NOR_LATCH(
    input wire r,
    input wire s,
    output wire q,
    output wire q_n
);
    wire internal_wire_1;
    wire internal_wire_2;

    NOR_gate nor1(
        .a(r),
        .b(internal_wire_1),
        .y(internal_wire_2)
    );

    NOR_gate nor2(
        .a(internal_wire_2),
        .b(s),
        .y(internal_wire_1)
    );

    assign q = internal_wire_2;
    assign q_n = internal_wire_1;

endmodule
