# x -> $s0
# y -> $s1
# z -> $s2
# z = (15*x + 67*y)*4

.text
.global
main:
ori $s0, $zero, 3
ori $s1, $zero, 4
add $t0, $s0, $s0 # $t0 = 2x
add $t0, $t0, $t0 # $t0 = 4x
add $t0, $t0, $t0 # $t0 = 8x
add $t0, $t0, $t0 # $t0 = 16x
sub $t0, $t0, $s0 # $t0 = 16x - 1x = 15x
add $t1, $s1, $s1 # $t1 = 2y
add $t1, $t1, $t1 # $t1 = 4y
add $t1, $t1, $t1 # $t1 = 8y
add $t1, $t1, $t1 # $t1 = 16y
add $t1, $t1, $t1 # $t1 = 32y
add $t1, $t1, $t1 # $t1 = 64y
add $t2, $t1, $s1 # $t2 = 3y
add $t2, $t1, $t2 # $t2 = 64y + 3y = 67y
add $t2, $t2, $t0 # $t2 = 15x + 67y