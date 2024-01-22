#
# set the y-th bit of x to 1 (bit numbers start from 0)
#
    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    
    addi t2, zero, 1
    sll t2, t2, t1
    or t0, t0, t2
    
    add a0, zero, t0
    addi a7, zero, 1
    ecall
