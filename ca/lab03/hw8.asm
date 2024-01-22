#
# (x + 5) / y + 10 / (y - 1)
#
    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0

    addi t0, t0, 5
    div t0, t0, t1
    addi t0, t0, 10
    
    addi t3, t1, -1
    
    
    div t0, t0, t3
    
    
    add a0, zero, t0
    addi a7, zero, 1
    ecall
