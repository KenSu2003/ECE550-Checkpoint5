# jump_isolated.s -- test jal and j interactions
addi $1, $0, 1        # $1 = 1           (instr 0)
jal  L1               # $31 = PC+1 (=2), PC -> L1 (instr 2)
addi $1, $0, 99       # skipped (instr 2)
L1:
addi $2, $0, 2        # $2 = 2           (instr 3)
j    L2               # jump to L2 (instr 5)
addi $2, $0, 99       # skipped (instr 5)
L2:
addi $3, $0, 3        # $3 = 3
