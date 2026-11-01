module D_LATCH(
    input wire D,
    input wire E,
    output wire Q,
    output wire Q_n 
);
    wire iw_not_nand2;
    wire iw_nand1_latch1S;
    wire iw_nand2_latch1R;

    NOT_gate not1(
        .a(D),
        .y(iw_not_nand2)
    );

    NAND_gate nand1(
        .a(D),
        .b(E),
        .y(iw_nand1_latch1S)
    );

    NAND_gate nand2(
        .a(E),
        .b(iw_not_nand2),
        .y(iw_nand2_latch1R)
    );

    SR_NAND_LATCH latch1(
        .r_n(iw_nand2_latch1R),
        .s_n(iw_nand1_latch1S),
        .q(Q),
        .q_n(Q_n)
    );

endmodule
