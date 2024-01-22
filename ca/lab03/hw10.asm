#
# x & (-1 << 5)
#
    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0


    addi t1, zero, -1
    slli t1, t1, 5
    and t0, t0, t1
    
    add a0, zero, t0
    addi a7, zero, 1
    ecall
