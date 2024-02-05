# addi a7, zero, 5 # 3 
# ecall
# add t1, zero, a0 # 5 # store "a"
# srli t0, a0, 31 # 6 # store sign of "a"
# ecall
# add t4, zero, a0 # 9 # store "b"
# srli t3, a0, 31 # 10 # store sign of "b"
# beq t1, zero, l1 # 12 
# beq t4, zero, l1 # 13 
# beq t0, zero, l2 # 15 # if "a" < 0 then inverse it
# xori t1, t1, -1 # 16 
# addi t1, t1, 1 # 17 
#  l2:
# beq t3, zero, l3 # 19 # if "b" < 0 then inverse it
# xori t4, t4, -1 # 20 
# addi t4, t4, 1 # 21 
#  l3:
# bge t1, t4, l4 # 24 # if "a" < "b" swap them
# xor t4, t4, t1 # 25 
# xor t1, t4, t1 # 26 
# xor t4, t4, t1 # 27 
#  l4:
# add t2, zero, zero # 29 
#  l5:
# add t2, t2, t1 # 31 
# addi t4, t4, -1 # 32 
# blt zero, t4, l5 # 33 
# xor t6, t0, t3 # 36 
# beq t6, zero, l6 # 37 
# xori t2, t2, -1 # 38 
# addi t2, t2, 1 # 39 # t2 - result accumulator
#  l6:
# addi a7, zero, 1 # 41 
# add a0, zero, t2 # 42 
# ecall  # 43 
# addi a7, zero, 10 # 45 
# ecall # 46 
#  l1:
# addi a7, zero, 1 # 49 # if sign of "a" and "b" is different then negate the result
# add a0, zero, zero # 50 
# ecall  # 51 
# addi a7, zero, 10 # 52 
# ecall # 53 

# the program performs multiplication (considering signs)

li a7, 5
ecall
mv t0, a0
ecall
mul a0, a0, t0
li a7, 1
ecall