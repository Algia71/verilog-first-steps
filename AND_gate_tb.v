module AND_gate_tb;
	reg a;
	reg b;
	wire c;

	AND_gate dut (
		.a(a),
		.b(b),
		.y(c)
	);

	initial begin

		$dumpfile("AND_gate_tb.vcd");
        $dumpvars(0, AND_gate_tb);

		$monitor("T=%0t a=%b b=%b c=%b", $time, a, b, c);

		#1 a = 1'b0; b = 1'b0;
		#1 a = 1'b1;
		#1 a = 1'b0; b = 1'b1;
		#1 a = 1'b1;

		#1 $finish;
	end
endmodule
