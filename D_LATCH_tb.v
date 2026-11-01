module D_LATCH_tb;

	localparam HIGH = 1'b1;
	localparam LOW  = 1'b0;

	reg d;
	reg e;
	wire q;
	wire q_n;

	D_LATCH dut (
		.D(d),
		.E(e),
		.Q(q),
		.Q_n(q_n)
	);

	task init;
		begin
			d = LOW;
			e = HIGH;
            #1
			d = LOW;
			e = LOW;
		end
	endtask

	task single_test(
		input [8*8-1:0] in_cmd,
		input in_d,
		input in_e,
		input expected_out_q,
		input expected_out_q_n
	);
		begin
			d = in_d;
			e = in_e;
			#1
			$display(
				"[t=%0t] [cmd=%0s]  d=%0s e=%0s   =>   q=%0s q_n=%0s",
				$time,
				in_cmd,
				d ? "HIGH" : "LOW ",
				e ? "HIGH" : "LOW ",
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
			single_test("READ ",  LOW,  LOW,  LOW, HIGH);
			single_test("READ ",  LOW,  LOW,  LOW, HIGH);
			single_test("CLEAR",  LOW, HIGH,  LOW, HIGH);
			single_test("READ ",  LOW,  LOW,  LOW, HIGH);
			single_test("SET  ", HIGH, HIGH, HIGH,  LOW);
			single_test("READ ",  LOW,  LOW, HIGH,  LOW);
			single_test("SET  ", HIGH, HIGH, HIGH,  LOW);
			single_test("READ ",  LOW,  LOW, HIGH,  LOW);
			single_test("CLEAR",  LOW, HIGH,  LOW, HIGH);
			single_test("READ ",  LOW,  LOW,  LOW, HIGH);
		end
	endtask

	initial begin

		$dumpfile("D_LATCH_tb.vcd");
        $dumpvars(0, D_LATCH_tb);

		init;
		all_tests;
	end
endmodule
