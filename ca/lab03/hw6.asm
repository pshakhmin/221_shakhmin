#
# x * 6 - y * 3
#
    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0

    addi t2, zero, 6
    mul t0, t0, t2
    
    addi t2, zero, 3
    mul t1, t1, t2
    
    sub t0, t0, t1
    
    
    add a0, zero, t0
    addi a7, zero, 1
    ecall
