# branch_jump_combined.s -- use jal + internal branch + jr($31)
addi $1, $0, 7        # $1 = 7
addi $2, $0, 8        # $2 = 8
jal FUNC              # $31 = return addr (PC+1), jump to FUNC
addi $5, $0, 9        # executed after returning (marker)

nop

FUNC:
addi $3, $0, -5       # $3 = -5
blt  $3, $1, Lblt     # -5 < 7 -> branch taken to Lblt
addi $28, $0, 99      # skipped if branch taken
Lblt:
addi $28, $0, 4       # $28 = 4  (marker)
jr   $31              # return (PC <- $31)
