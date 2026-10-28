.data
msg_pede_n: .asciiz "\nDigite o numero de termos (n > 0): "
msg_resultado: .asciiz "\nO valor de H é: "

.text 
main:

#loop de solicitação de n, caso ele seja maior que 0 ele sai, se não ele pede novamente.
escreva:
li $v0, 4
la $a0, msg_pede_n
syscall

li $v0, 5
syscall

move $t1, $v0

ble $v0,$zero,escreva

#aqui estou inicializando as variaveis.
li $t2, 0
li $t3, 1
li $t4, 2
li $t5, 0

#aqui estou fazendo o loop das somas.
loop:
beq $t1, $t2, fimloop
mul $t6, $t3, $t4
add $t5, $t6, $t5
addi $t3, $t3, 2
addi $t2, $t2, 1
j loop
syscall

#aqui irá imprimir o resultado, a mensagem e terminar.
fimloop:
li $v0, 4
la $a0, msg_resultado
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 10
syscall

