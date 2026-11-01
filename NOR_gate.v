module NOR_gate(
    input wire a,
    input wire b,
    output wire y
);
    wire internal_wire;

	OR_gate or1 (
		.a(a),
        .b(b),
		.y(internal_wire)
	);

	NOT_gate not1 (
		.a(internal_wire),
		.y(y)
	);

endmodule
