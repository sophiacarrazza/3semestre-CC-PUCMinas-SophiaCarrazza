#programa 4
# x = 3; y = 4;
# z = ( 15*x + 67*y)*4

addi $s0, $zero, 3 # x = 3
addi $s1, $zero, 4 # y = 4


sll $t0, $s0, 4 # 3 * 16(4^2)
sub $t0, $t0, $s0 # 16x -x = 15x


sll $t1, $s1, 6 # 4 * (2^6) = 256 (64y)
sll $t2, $s0, 2 # 3 * 4 = 12 (3y)
add $t1, $t1, $t2 # 256 + 12 = 268 (67y)]

add $t0, $t0, $t1 # 15*x + 67*y
sll $s2, $t0, 2 # z = t0 * 4
