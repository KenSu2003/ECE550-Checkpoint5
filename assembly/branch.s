# Isolation branch test for BNE and BLT
# Test 1: BNE (should take branch and set r31 = 2)
addi $1, $0, 7        # $1 = 7
addi $2, $0, 8        # $2 = 8
bne  $1, $2, bne_pass
addi $31, $0, 99  # should be skipped if BNE works
bne_pass:
addi $31, $0, 2  # marker for BNE taken

# Small separator (safe no-op)
nop

# Test 2: BLT (signed) (should take branch and set r28 = 4)
addi $3, $0, -2       # $3 = -2
addi $4, $0, 3        # $4 = 3
blt  $3, $4, blt_pass
addi $28, $0, 99  # should be skipped if BLT works
blt_pass:
addi $28, $0, 1   # marker for BLT taken

# End
nop
