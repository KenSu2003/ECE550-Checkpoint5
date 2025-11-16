# branch_extreme.s -- test negative / zero comparisons and short branches
addi $1, $0, -1      # $1 = -1
addi $2, $0, 0       # $2 = 0
blt  $1, $2, L1      # -1 < 0 -> should take
addi $10, $0, 1      # skipped if branch taken
L1:
addi $10, $0, 5      # $10 = 5

