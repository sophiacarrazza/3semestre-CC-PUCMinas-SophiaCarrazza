# Compilação -> pega o código inteiro para executar
# Interpretação -> pegar linha por linha executando uma por uma
# Diretivas de Compilação -> são comandos para para customizar a compilação

# Von Newmann:
# data-> dados
# text-> instruções

# x=1;
# y=2;
# z= x-y;
# x->$s0 ; y->$s1 ; z->$s2 

.text # diretiva de compilação - essa fala onde o espaço de instruções começa
.globl puc # declara o label global (declara o endereço de onde começa o main)

# texto seguido de dois pontos -> label (marcação de uma linha que é importante pra gnt)
# puc: é o inicio da nossa main
puc: 
	addi $s0, $zero, 1 #x = 0 + 1 
puc1:
	addi $s1, $zero, 2 #y = 0 + 1 
puc2:
	sub $s2, $s0, $s1 #z = x - 1

	j puc #jump para puc (volta para o label puc e executa dnv) (instrução de desvio)


.data # fala onde a memoria de dados começa