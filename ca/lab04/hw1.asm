 #lui t1, 444102 
 #addi t1, t1, 1352   
 #lui t2, 266755   
 #addi t2, t2, -913
 #lui t3, 1333   
 #addi t3, t3, -189
 #lui s0, 65552   
 #addi s0, s0, 0   
 #sw t1, 0(s0)   
 #sw t2, 4(s0)   
 #sw t3, 8(s0)   
 #addi a7, zero, 4
 #add a0, zero, s0   
 #ecall

# the program uses *magic numbers* that actually represent a string "Hello, ACOS" and prints it
.data
	str: .asciz "Hello, ACOS" 
.text
	li a7, 4
	la a0, str
	ecall