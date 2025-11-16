# jump_complete.s -- test setx and bex flow
setx 5                # $rstatus = 5 (non-zero)
bex  SKIP             # if rstatus != 0, PC = SKIP
addi $1, $0, 99       # skipped if bex jumped
SKIP:
addi $1, $0, 1        # $1 = 1
