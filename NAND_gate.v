module NAND_gate(
    input wire a,
    input wire b,
    output wire y
);
    wire internal_wire;

	AND_gate and1 (
		.a(a),
        .b(b),
		.y(internal_wire)
	);

	NOT_gate not1 (
		.a(internal_wire),
		.y(y)
	);

endmodule
