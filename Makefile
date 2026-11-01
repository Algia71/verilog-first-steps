.PHONY: NOT, AND, all, clear, rebuild

IVERILOG=iverilog
IVERILOG_FLAGS=-pfileline=1

all: \
	NOT_gate_tb.vvp 		\
	OR_gate_tb.vvp 			\
	AND_gate_tb.vvp 		\
	NOR_gate_tb.vvp 		\
	NAND_gate_tb.vvp 		\
	SR_NOR_LATCH_tb.vvp		\
	SR_NAND_LATCH_tb.vvp	\
	D_LATCH_tb.vvp			\
	REG8_tb.vvp				\
	MEM256_tb.vvp

clean:
	rm -f *.vvp *.vcd

rebuild: clean all

NOT_gate_tb.vvp: NOT_gate.v NOT_gate_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^

OR_gate_tb.vvp: OR_gate.v OR_gate_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^

AND_gate_tb.vvp: AND_gate.v AND_gate_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^

NOR_gate_tb.vvp: NOR_gate.v OR_gate.v NOT_gate.v NOR_gate_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^

NAND_gate_tb.vvp: NAND_gate.v AND_gate.v NOT_gate.v NAND_gate_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^

SR_NOR_LATCH_tb.vvp: SR_NOR_LATCH.v NOR_gate.v OR_gate.v NOT_gate.v SR_NOR_LATCH_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^

SR_NAND_LATCH_tb.vvp: SR_NAND_LATCH.v NAND_gate.v AND_gate.v NOT_gate.v SR_NAND_LATCH_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^

D_LATCH_tb.vvp: D_LATCH.v SR_NAND_LATCH.v NAND_gate.v AND_gate.v NOT_gate.v D_LATCH_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^

REG8_tb.vvp: REG8.v D_LATCH.v SR_NAND_LATCH.v NAND_gate.v AND_gate.v NOT_gate.v REG8_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^

MEM256_tb.vvp: MEM256.v REG8.v D_LATCH.v SR_NAND_LATCH.v NAND_gate.v AND_gate.v NOT_gate.v MEM256_tb.v
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $^
