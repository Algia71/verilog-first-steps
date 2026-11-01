module OR_gate_tb;
	reg a;
	reg b;
	wire c;

	OR_gate dut (
		.a(a),
		.b(b),
		.y(c)
	);

	initial begin

		$dumpfile("OR_gate_tb.vcd");
        $dumpvars(0, OR_gate_tb);

		$monitor("T=%0t a=%b b=%b c=%b", $time, a, b, c);

		#1 a = 1'b0; b = 1'b0;
		#1 a = 1'b1;
		#1 a = 1'b0; b = 1'b1;
		#1 a = 1'b1;

		#1 $finish;
	end
endmodule
