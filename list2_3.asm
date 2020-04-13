.data
	#reservando um espaço de 200 bytes na memoria
	#o mesmo que um vetor de 50 posições
	A: .space 200
	B: .space 200
.text
main:
	# $t0 = index
	li $t0, 0
	# $t4 = A
	la $t4, A
	la $t1, B
	
loop_1:
	# while(index < 50)
	bgt $t0, 49, end_loop_1
	#guardando em $t3 index de  de 4 em 4
	#sll de 2 posições é o mesmo que multiplicar por 2^2 = 4
	#então $t0 for 1, segunda posição, vamos para 4
	sll $t3, $t0, 2
	sll $t5, $t0, 2
	#$t4 tem o endereço de A, então estamos fazendo o endereço andar
	#de 4 em 4
	addu $t3, $t3, $t4
	#guardando em A $t0
	sw $t0, 0($t3)
	#repetindo para o outro vetor
	addu $t5, $t5, $t1
	sw $t0, 0($t5)
	#aumentado iterator em 1
	addi $t0, $t0, 1
	#voltado ao inicio do loop
	j loop_1
	
end_loop_1:
	#zerando $t0
	addi $t0, $zero, 0
	li $t0, 0
loop_2:
	bgt $t0, 200, end_loop_2
	#outra maneira de acessar, usando o label e um index
	lw $s0, A($t0)
	lw $s1, B($t0)
	#A[i] = A[i] + B[i]
	add $t6, $s0, $s1
	sw $t6, A($t0)
	#andando para proxima posição, de 4 em 4
	addi $t0, $t0, 4
	j loop_2
end_loop_2:
	li $v0, 10
	syscall
	
	
	
	
	
