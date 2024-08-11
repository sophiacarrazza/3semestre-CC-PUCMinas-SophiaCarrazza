#programa 3
# x = 3; y = 4;
# z = ( 15*x + 67*y)*4

addi $s0, $zero, 3 # x = 3
addi $s1, $zero, 4 # y = 4

add $t0, $s0, $s0 # t0 = 3 + 3 = 6
add $t0, $t0, $t0 # t0 = 6 + 6 = 12
add $t0, $t0, $t0 # t0 = 12 + 12 = 24
add $t0, $t0, $t0 # t0 = 24 + 24 = 48
sub $t0, $t0, $s0 # t0 = 48 - 3 = 45 (15 * 3)

add $t1, $s1, $s1 # t1 = 4 + 4 = 8
add $t1, $t1, $t1 # t1 = 8 + 8 = 16
add $t1, $t1, $t1 # t1 = 16 + 16 = 32
add $t1, $t1, $t1 # t1 = 32 + 32 = 64
add $t1, $t1, $t1 # t1 = 64 + 64 = 128
add $t1, $t1, $t1 # t1 = 128 + 128 = 256
add $t1, $t1, $s1 # t1 = 256 + 4 = 260
add $t1, $t1, $s1 # t1 = 260 + 4 = 264
add $t1, $t1, $s1 # t1 = 264 + 4 = 268

add $s2, $t0, $t1 # z = 268 + 45 
add $s2, $s2, $s2 # z = z + z (2z)
add $s2, $s2, $s2 # z = 2z + 2z

