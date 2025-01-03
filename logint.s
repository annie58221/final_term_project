.globl logint

.text
# ==============================================================================
# FUNCTION: Takes input N (a0), returns its log base 2 in a0
# Arguments:
# 	a0 is the integer
# Returns:
#	a0 as its log base 2
# ==============================================================================
logint:
    addi sp, sp, -4
    sw t0, 0(sp)          		# store t0

    add t0, a0, zero	  		# k = N
    add a0, zero, zero    		# i = 0

logloop:
    beq t0, zero, logloop_end 		# Exit if k == 0
    srai t0, t0, 1 			# k >>= 1
    addi a0, a0, 1 			# i++
    j logloop

logloop_end:
    addi a0, a0, -1 			# Return i - 1 as the counter was incremented one extra time.
    lw t0, 0(sp)
    addi sp, sp, 4
    jr ra
