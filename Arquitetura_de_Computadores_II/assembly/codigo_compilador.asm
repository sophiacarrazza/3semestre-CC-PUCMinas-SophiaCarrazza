# x = 30.000;
# x = 60.000;
# x = 90.000;
# x = 100.000;
# x->$s0  

.text 
.globl puc

main: 
	addi $t0, $zero, 30000 #t0 = 0 + 30000
	addi $t0, $t0, $t0 #t0 = t0(30000) + t0(30000)
	addi $s0, $t0, 10000 #s0 = t0(60000) + 10000
	j puc 


.data 