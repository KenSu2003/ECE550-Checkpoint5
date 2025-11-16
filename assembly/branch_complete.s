# branch_complete.s -- simple branch coverage (bne and blt, taken/not-taken)
addi $1, $0, 5       # $1 = 5
addi $2, $0, 5       # $2 = 5
bne  $1, $2, skip_bne
addi $3, $0, 99      # $3 = 99
skip_bne:
addi $3, $0, 7       # skipped if $1 = $2

addi $4, $0, -1      # $4 = -1 (0xFFFFFFFF)
blt  $4, $3, blt_pass
addi $5, $0, 0       # skipped if blt taken
blt_pass:
addi $5, $0, 3       # $5 = 3
