# From logic gates to RAM
My very first steps in Verilog: from basic structural elements (logic gates like NOT, NAND, etc.) to a 256 bytes bank of memory.

I used the structural Verilog modeling (instead of behavioural), bacause my goal was to learn the basics at the gate level. I'm aware that this approach isn't practicable in real world use cases.

## Modules
| Module        | Description                           |
|---------------|---------------------------------------|
| NOT_gate      | Inverter                              |
| OR_gate       | OR gate                               |
| AND_gate      | AND gate                              |
| NOR_gate      | NOR gate                              |
| NAND_gate     | NAND gate                             |
| SR_NOR_LATCH  | Set/Reset latch built with NOR gates  |
| SR_NAND_LATCH | Set/Reset latch built with NAND gates |
| D_LATCH       | D latch                               |
| REG8          | 8-bit register                        |
| MEM256        | 256 bytes of RAM                      |

Each module:
- is implemented in its own .v file
- has the corresponding *_tb.v testbench file

## Build and test tools
I used *OSS CAD Suite* version 20261030 ran in WSL. In particular:
- Icarus Verilog runtime version 14.0
- Icarus Verilog VVP Code Generator 14.0
- GTKWave Analyzer v4.0.0-prealpha

GNU Make 4.3 builds the simulation .vvp files.

## Build
```
make
```
This produces all the .vvp simulation files.

## Test
```
vvp filename.vvp
```
Running each testbench produces the corresponding .vcd graph file.

## Graph
```
gtkwave filename.vcd
```

## Disclaimer
Made for personal educational purposes: I'm pretty sure there could be better / more elegant ways to do the same things. This was my way to learn Verilog.
