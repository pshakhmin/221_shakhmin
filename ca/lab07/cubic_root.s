li a7, 7
ecall 
fmv.d ft0, fa0 # A
ecall
fmv.d ft1, fa0 # eps

li t1, 10
fcvt.d.w fa1, t1 # ft7 = 10 for dividing
fdiv.d ft1, ft1, fa1
fdiv.d ft1, ft1, fa1 # ft1 = eps * 10**(-2)

fmv.d ft5, ft0 # right, ft4 = left
li t1, 2
fcvt.d.w fa1, t1 # fa1 = 2 for dividing

# ft4 ... ft2 ... ft5
startloop:
fadd.d ft2, ft4, ft5
fdiv.d ft2, ft2, fa1 # ft2 = mid
fmul.d ft3, ft2, ft2
fmul.d ft3, ft3, ft2 # ft3 = mid**3
fabs.d ft3, ft3 # ft3 = abs(mid**3)
fabs.d ft6, ft0 # ft6 = abs(A)

fsub.d ft7, ft6, ft3 # ft7 = a - mid**3
fabs.d ft7, ft7
fle.d t2, ft7, ft1 # t2 = stop cycle
bgtz t2, endloop

fle.d t2, ft3, ft6
beqz t2, continue1
fmv.d ft4, ft2
continue1:

fge.d t2, ft3, ft6
beqz t2, continue2
fmv.d ft5, ft2
continue2:

j startloop
endloop:

fmv.d fa0, ft2
li a7, 3
ecall