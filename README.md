# Checkpoint 5: Full Processor Design

Name: Ken Su
NetID: hs452

## Design Implementation

I have completed the design of a single-cycle 32-bit processor that supports R-type, I-type, and J-type instructions as specified in the ISA.

### Key Design Decisions

**J-Type Implementation:**
To support J-type instructions (j, jal, jr, bex, setx), I expanded the control logic and datapath in the processor.v module.
* Jump Target Selection: I implemented a multiplexer logic in the Execute (EX) stage to select the next PC source. It chooses between the branch target (for bne/blt) and the jump target.
* jr Instruction: Unlike other jumps that use the immediate 'target' field, 'jr' requires jumping to the value stored in a register. I modified the ID stage to ensure $rd is read into data_readRegA for 'jr' instructions, and added a mux in the EX stage to select this register value as the jump address.
* bex Instruction: This instruction conditionally branches based on $r30 ($rstatus). I implemented specific logic in the ID stage to force the read address to register 30 (5'd30) when 'bex' is detected, ensuring the comparator checks the correct status register.

**Exception and Status Handling:**
* Overflows: I implemented logic to detect overflows in 'add', 'addi', and 'sub' operations. These events trigger a write to $r30 with specific codes (1 for add, 2 for addi, 3 for sub).
* Priority: The write logic prioritizes exception codes; if an overflow occurs, it overrides standard register writes to update $r30.

**Pipeline Organization:**
While the processor is single-cycle, I maintained the code structure organized into logical pipeline stages (IF, ID, EX, MEM, WB) within processor.v to ensure signal clarity and easier debugging.

## Main Modules

- processor.v: The top-level entity that integrates the datapath and control. It handles instruction decoding, ALU control signal generation, jump/branch target calculation, and interfaces with memory and the register file.
- alu.v: A 32-bit ALU performing operations (ADD, SUB, AND, OR, SLL, SRA) and generating status flags (isNotEqual, isLessThan, Overflow).
- regfile.v: A 32-word register file with two read ports and one write port. It handles the special behavior for $r0 (always zero) and $r31 (return address).
- imem.v / dmem.v: Memory modules instantiated with 12-bit addresses and 32-bit data width.
- mux_2_1.v: A generic 2-to-1 multiplexer used extensively for data path selection (e.g., selecting between ALU result and Memory data for Write Back).

## Bugs and Issues / Resolution

- jr Target Logic: I initially encountered an issue where 'jr' was jumping to the immediate 'target' field rather than the register value. I resolved this by adding a specific selection wire 'final_jump_target' that selects 'data_readRegA' only when 'jr_type' is active.
- bex Read Address: There was a bug where 'bex' failed to read the status register because the instruction format lacks an $rs field. I fixed this by modifying the 'ctrl_readRegA' assignment to explicitly select register 30 when 'bex' is high.
- Current Status: The processor passes the provided branch_jump.mif and the custom extreme_test cases, correctly handling all register writes, memory operations, and control flow.

## Citations / References
- [cite_start]Project specification and ISA details referenced from "Checkpoint 5 - Full Processor.pdf" [cite: 1-100].
- 4-bit CLA design referenced from Wikipedia.
- Single-cycle processor concepts referenced from ECE 550 course lectures.