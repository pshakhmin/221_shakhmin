#
# reset the y-th bit of x to 0 (bit numbers start from 0)

#
    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    
    blt t0, t1, else
    mv t2, zero
    j endif
    else:
    addi t2, zero, 1 
    endif:
    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
