# x=1;
# y=2;
# z= x-y;
# x->$s0 ; y->$s1 ; z->$s2 

#inicio
addi $s0, $zero, 1 #x = 0 + 1 
addi $s1, $zero, 2 #y = 0 + 1 
sub $s2, $s0, $s1 #z = x - 1
#fim

#essa linguagem funciona com complemento, então o resultado sera 0xffffffff, que é -1 em complemento.
