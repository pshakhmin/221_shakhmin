#
# x * 6 - y * 3
#
    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    ecall
    add t1, zero, a0

    slli t2, t0, 2
    slli t3, t0, 1
    add t0, t2, t3
    
    slli t2, t1, 1
    add t1, t2, t1
    
    sub a0, t0, t1

    addi a7, zero, 1
    ecall
