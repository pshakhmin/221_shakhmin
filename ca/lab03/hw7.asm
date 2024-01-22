#
# 2 * x * x - 3 * y + 4
#
    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0

    addi t2, zero, 2
    mul t0, t0, t0
    mul t0, t0, t2
    
    addi t2, zero, 3
    mul t1, t1, t2
    
    
    sub t0, t0, t1
    addi t0, t0, 4
    
    
    add a0, zero, t0
    addi a7, zero, 1
    ecall
