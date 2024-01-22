#
# (x / y) * y + x % y
#
    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0
	
    #div t3, t0, t1
    #mul t3, t3, t1 зачем делить и потом сразу умножать..
    rem t2, t0, t1
    add t2, t2, t0
    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
