#programa 1 
# a = 2; b = 3; c = 4; d = 5;
# x = (a+b) - (c+d);
# y = a – b + x;
# b = x – y;

addi $s0, $zero, 2 # a
addi $s1, $zero, 3 # b
addi $s2, $zero, 4 # c
addi $s3, $zero, 5 # d

add $s4, $s0, $s1
add $s5, $s2, $s3
sub $s4, $s4, $s5 # x

sub $s5, $s2, $s3 
add $s5, $s5, $s4 # y

sub $s1, $s4, $s5 # b




