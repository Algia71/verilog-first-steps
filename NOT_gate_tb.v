module NOT_gate_tb;
	reg a;
	wire b;

	NOT_gate dut (
		.a(a),
		.y(b)
	);
	
	initial begin

		$dumpfile("NOT_gate_tb.vcd");
        $dumpvars(0, NOT_gate_tb);

		$monitor("T=%0t a=%b b=%b", $time, a, b);

		#1 a = 1'b0;
		#1 a = 1'b1;

		#1 $finish;
	end
endmodule
