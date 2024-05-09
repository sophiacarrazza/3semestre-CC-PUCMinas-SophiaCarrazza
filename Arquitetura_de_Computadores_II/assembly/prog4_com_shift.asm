
ori $s0, $zero, 3
ori $s1, $zero, 4
sll $t0, $s0, 4 # $t0 = 16x
sub $t0, $t0, $s0 # $t0 = 16x - 1x = 15x
sll $t1, $s1, 6 # $t1 = 64y
sll $t2, $s1, 1 # $t2 = 2y
add $t2, $t2, $s1 # $t2 = 2y + y = 3y
add $t2, $t2, $t1 # $t2 = 67y
add $t2, $t2, $t0 # $t2 = 15x + 67y