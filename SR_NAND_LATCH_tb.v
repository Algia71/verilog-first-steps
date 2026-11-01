module SR_NAND_LATCH_tb;

	localparam HIGH = 1'b1;
	localparam LOW  = 1'b0;

	reg r_n;
	reg s_n;
	wire q;
	wire q_n;

	SR_NAND_LATCH dut (
		.r_n(r_n),
		.s_n(s_n),
		.q(q),
		.q_n(q_n)
	);

	task init;
		begin
			r_n = LOW;
			s_n = HIGH;
		end
	endtask

	task single_test(
		input [8*8-1:0] in_cmd,
		input in_r_n,
		input in_s_n,
		input expected_out_q,
		input expected_out_q_n
	);
		begin
			r_n = in_r_n;
			s_n = in_s_n;
			#1
			$display(
				"[t=%0t] [cmd=%0s]  r_n=%0s s_n=%0s   =>   q=%0s q_n=%0s",
				$time,
				in_cmd,
				r_n ? "HIGH" : "LOW ",
				s_n ? "HIGH" : "LOW ",
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
			single_test("HOLD ", HIGH, HIGH,  LOW, HIGH);	// hold / no change
			single_test("RESET", LOW,  HIGH,  LOW, HIGH);	// reset
			single_test("HOLD ", HIGH, HIGH,  LOW, HIGH);	// hold / no change
			single_test("SET  ", HIGH,  LOW, HIGH,  LOW);	// set
			single_test("HOLD ", HIGH, HIGH, HIGH,  LOW);	// hold / no change
			single_test("SET  ", HIGH,  LOW, HIGH,  LOW);	// set
			single_test("HOLD ", HIGH, HIGH, HIGH,  LOW);	// hold / no change
			single_test("RESET", LOW,  HIGH,  LOW, HIGH);	// reset
			single_test("HOLD ", HIGH, HIGH,  LOW, HIGH);	// hold / no change
		end
	endtask

	initial begin

		$dumpfile("SR_NAND_LATCH_tb.vcd");
        $dumpvars(0, SR_NAND_LATCH_tb);

		init;
		all_tests;
	end
endmodule
