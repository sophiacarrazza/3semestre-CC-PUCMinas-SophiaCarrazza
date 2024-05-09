# x -> 100000 = $s0
# y -> 200000 = $s1
# z = x + y = $s2

ori = $s0, $zero, 100000
ori = $s1, $zero, 200000
add = $s2, $s0, $s1
