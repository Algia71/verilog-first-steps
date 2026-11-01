module MEM256_tb;

	localparam HIGH = 1'b1;
	localparam LOW  = 1'b0;

    reg en;
    reg [7:0] addr;
    reg [7:0] data_to_write;
    wire [7:0] data_read;

    MEM256 dut(
        .EN(en),
        .ADDR(addr),
        .DIN(data_to_write),
        .DOUT(data_read)
    );

	task init;
		begin
            en = LOW;
		end
	endtask

    task write_data(
        input [7:0] address,
        input [7:0] data
    );
        begin
            $display("[t=%0T] [WRITE] [ADDR:0x%H] DATA: 0x%H", $time, address, data);
            data_to_write = data;
            addr = address;
            en = HIGH;
            #1
            en = LOW;
        end
    endtask

    task read_data(
        input [7:0] address
    );
        begin
            addr = address;
            #1
            $display("[t=%0T] [READ ] [ADDR:0x%H] DATA: 0x%H", $time, address, data_read);
        end
    endtask

	task all_tests;
		begin
            #1
            read_data(8'h0);
            #1
            write_data(8'h0, 8'h55);
            #1
            read_data(8'h0);
            #1
            read_data(8'hAA);
            #1
            write_data(8'hAA, 8'h11);
            #1
            read_data(8'hAA);
            #1
            read_data(8'h0);
            #1
            read_data(8'hAA);
            #1
            read_data(8'hFF);
		end
	endtask

	initial begin

		$dumpfile("MEM256_tb.vcd");
        $dumpvars(0, MEM256_tb);

		init;
		all_tests;
	end
endmodule
