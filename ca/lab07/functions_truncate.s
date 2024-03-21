j main
fraction_truncate:
	li t3, 10
	li t5, 10
	li t4, 1


	begin_for:
		bge t4, t2, end_for
		addi t4, t4, 1
		mul t3, t3, t5
		j begin_for
	end_for:


	fcvt.d.w f3, t3
	fmul.d f1, f1, f3

	fcvt.w.d t5, f1
	fcvt.d.w f1, t5
	fdiv.d fa0, f1, f3
	jr ra

main:

li a7, 5
ecall

mv t0, a0
ecall
mv t1, a0
ecall
mv t2, a0
fcvt.d.w f1, t0
fcvt.d.w f2, t1

fdiv.d fa0, f1, f2
mv a0, t2

jal fraction_truncate

	
li a7, 3
ecall

