# RISC-V-SINGLE-CYCLE-CORE
---

## Modules

| Module | File | Description |
|---|---|---|
| Top Level | `riscv_single_cycle.v` | Connects all modules together |
| Program Counter | `PC_module.v` | Holds and updates current PC |
| PC Adder | `pc_adder.v` | Computes PC+4 |
| Instruction Memory | `Instruction_memory.v` | Fetches instruction at PC |
| Register File | `Register_File.v` | 32x32 register file with sync write |
| ALU | `ALU.v` | Arithmetic and Logic Unit |
| Control Unit | `Control_unit.v` | Generates all control signals |
| Main Decoder | `main_decoder.v` | Decodes opcode |
| ALU Decoder | `Alu_decoder.v` | Decodes ALU operation |
| Sign Extend | `Sign_extend.v` | Sign extends immediate values |
| Data Memory | `Data_Memory.v` | Read/Write data memory |
| Mux | `Mux.v` | 2:1 32-bit multiplexer |
| Testbench | `riscv_single_cycle_tb.v` | Behavioral simulation testbench |

---

## Supported Instructions

| Type | Instructions |
|---|---|
| R-type | ADD, SUB, AND, OR, SLT |
| I-type | ADDI, LW |
| S-type | SW |
| B-type | BEQ |

---

## Datapath Signals

| Stage | Key Signals |
|---|---|
| Fetch | `pc[31:0]`, `RD[31:0]` |
| Decode | `op[6:0]`, `funct3[2:0]`, `A1`, `A2`, `A3`, `Imm_Ext[31:0]` |
| Register Read | `RD1[31:0]`, `RD2[31:0]` |
| Control | `ALUCONTROL[2:0]`, `RegWrite`, `WE3` |
| Execute | `RESULT[31:0]` |
| Writeback | `WD3[31:0]` |

---

## Control Signals

| Signal | Description |
|---|---|
| `RegWrite` | Enables write to register file |
| `MemWrite` | Enables write to data memory |
| `ALUSrc` | Selects ALU second operand (register or immediate) |
| `ResultSrc` | Selects writeback source (ALU result or memory data) |
| `ImmSrc` | Selects immediate encoding type |
| `ALUCONTROL` | Selects ALU operation |
| `Branch` | Enables branch condition check |

---

## ALU Operations

| ALUCONTROL | Operation |
|---|---|
| 000 | ADD |
| 001 | SUB |
| 010 | AND |
| 011 | OR |
| 101 | SLT (Set Less Than) |

---

## Project Structure
RISC_V_SINGLE_CYCLE_CORE/

│

├── src/

│   ├── riscv_single_cycle.v      ← Top level

│   ├── PC_module.v

│   ├── pc_adder.v

│   ├── Instruction_memory.v

│   ├── Register_File.v

│   ├── ALU.v

│   ├── Control_unit.v

│   ├── main_decoder.v

│   ├── Alu_decoder.v

│   ├── Sign_extend.v

│   ├── Data_Memory.v

│   └── Mux.v

│

├── sim/

│   ├── riscv_single_cycle_tb.v   ← Testbench

│   └── memfile.hex               ← Instruction memory file

│

└── README.md


## What I Learned

- RISC-V RV32I instruction encoding and decoding
- Single cycle datapath design and control signal generation
- Debugging X and Z states in Verilog simulation
- RTL design best practices in Verilog
- Xilinx Vivado simulation and synthesis flow

- 
Banshika Vardhan
Final Year B.Tech ECE Student
GitHub: https://github.com/banshika1
LinkedIn: https://www.linkedin.com/in/banshika-vardhan-b1a258296/

---

## License

This project is open source and available under the 
MIT License.
