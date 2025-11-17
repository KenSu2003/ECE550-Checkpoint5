# branch_jump.s -- simple branch coverage (bne and blt, taken/not-taken)

# --- BNE CHECK (Not Taken Case: $1 = $2) ---
addi $1, $0, 5       # $1 = 5
addi $2, $0, 5       # $2 = 5
bne  $1, $2, bne_taken
addi $3, $0, 99         # NOT TAKEN PATH
j    next_test          # UNCONDITIONAL JUMP to skip the taken path

bne_taken:
addi $3, $0, 7       # SKIPPED by the jump above since $1 = $2.

# --- BLT CHECK (Taken Case: $4 < $3) ---
next_test:
addi $4, $0, 2      # $4 = 2
addi $6, $0, 7      # $6 = 7
blt  $4, $3, blt_pass
addi $5, $0, 0       #  SKIPPED

blt_pass:
addi $5, $0, 3       # $5 = 3
