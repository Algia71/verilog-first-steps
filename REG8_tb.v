module REG8_tb;

	localparam HIGH = 1'b1;
	localparam LOW  = 1'b0;

	reg enable;
	reg [7:0] din;
	wire [7:0] dout;

	REG8 dut (
		.EN(enable),
		.DIN(din),
		.DOUT(dout)
	);

	task init;
		begin
			din = 8'b00000000;
            enable = HIGH;
            #1
            enable = LOW;
		end
	endtask

    task write_data(
        input [7:0] data
    );
        begin
            $display("[t=%0T] Write: %b", $time, data);
            din = data;
            enable = HIGH;
            #1
            enable = LOW;
        end
    endtask

    task read_data;
        begin
            $display("[t=%0T]  Read: %b", $time, dout);
        end
    endtask

	task all_tests;
		begin
            #1
            read_data;
            #1
            write_data(8'b10101010);
            #1
            read_data;
            #1
            write_data(8'b00010001);
            #1
            read_data;
            #1
            read_data;
            #1
            write_data(8'h55);
            #1
            read_data;
            #10
            read_data;
		end
	endtask

	initial begin

		$dumpfile("REG8_tb.vcd");
        $dumpvars(0, REG8_tb);

		init;
		all_tests;
	end
endmodule
