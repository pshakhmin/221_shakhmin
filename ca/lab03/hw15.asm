#
# (x == (y + 3)) ? 0 : 1
#

    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    addi t1, t1, 3
    
    
    beq t0, t1, else
    addi t2, zero, 1 
    j endif
    else:
    mv t2, zero
    endif:
    
    add a0, zero, t2
    addi a7, zero, 1
    ecall