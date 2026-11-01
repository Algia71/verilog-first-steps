module SR_NOR_LATCH_tb;

	localparam HIGH = 1'b1;
	localparam LOW  = 1'b0;

	reg r;
	reg s;
	wire q;
	wire q_n;

	SR_NOR_LATCH dut (
		.r(r),
		.s(s),
		.q(q),
		.q_n(q_n)
	);

	task init;
		begin
			r = HIGH;
			s = LOW;
		end
	endtask

	task single_test(
		input [8*8-1:0] in_cmd,
		input in_r,
		input in_s,
		input expected_out_q,
		input expected_out_q_n
	);
		begin
			r = in_r;
			s = in_s;
			#1
			$display(
				"[t=%0t] [cmd=%0s]  r=%0s s=%0s   =>   q=%0s q_n=%0s",
				$time,
				in_cmd,
				r ? "HIGH" : "LOW ",
				s ? "HIGH" : "LOW ",
				q ? "HIGH" : "LOW ",
				q_n ? "HIGH" : "LOW "
			);
			if((q != expected_out_q) || (q_n != expected_out_q_n)) begin
				$display(
					">>> ERROR: expected q=%0s q_n=%0s",
					expected_out_q ? "HIGH" : "LOW ",
					expected_out_q_n ? "HIGH" : "LOW "
				);
			end
		end
	endtask

	task all_tests;
		begin
			single_test("HOLD ", LOW,  LOW,  LOW, HIGH);	// hold / no change
			single_test("RESET", HIGH, LOW,  LOW, HIGH);	// reset
			single_test("HOLD ", LOW,  LOW,  LOW, HIGH);	// hold / no change
			single_test("SET  ", LOW, HIGH, HIGH,  LOW);	// set
			single_test("HOLD ", LOW,  LOW, HIGH,  LOW);	// hold / no change
			single_test("SET  ", LOW, HIGH, HIGH,  LOW);	// set
			single_test("HOLD ", LOW,  LOW, HIGH,  LOW);	// hold / no change
			single_test("RESET", HIGH, LOW,  LOW, HIGH);	// reset
			single_test("HOLD ", LOW,  LOW,  LOW, HIGH);	// hold / no change
		end
	endtask

	initial begin

		$dumpfile("SR_NOR_LATCH_tb.vcd");
        $dumpvars(0, SR_NOR_LATCH_tb);

		init;
		all_tests;
	end
endmodule
