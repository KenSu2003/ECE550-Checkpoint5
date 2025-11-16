# jump_extreme.s -- test jr by loading a PC index into a register
addi $4, $0, 5       # $4 = 5      (target PC for jr)
addi $1, $0, 1       # $1 = 1
jr   $4              # PC = $4 -> next executed instruction is index 5
addi $1, $0, 99      # skipped
addi $1, $0, 99      # skipped
addi $2, $0, 2       # label target: $2 = 2
