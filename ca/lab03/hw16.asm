#
# x < -5 & y > 10 не понял что выводить, поэтому true=1 false=0
#

    .text
main:
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    addi t3, zero, -5
    
    blt t0, t3, if
    j endif
    if:
    addi t2, zero, 1 
    endif:
    
    
    addi t3, zero, 10
    bgt t1, t3, if2
    j endif2
    if2:
    andi t2, t2, 1
    endif2:
    
    
    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
