#programa 2 
# x = 1;
# y = 5*x + 15;

addi $s0, $zero, 1
add $s1, $s0, $s0 # y = 1 + 1 = 2
add $s1, $s1, $s1 # y = 2 + 2 = 4
add $s1, $s1, $s0 # y = 4 + 1 = 5

addi $s1, $s1,15 # y = 5 + 15 = 20