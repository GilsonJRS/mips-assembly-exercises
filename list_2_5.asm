.data
	msg1: .asciiz "Digite o primeiro numero: "
	msg2: .asciiz "Digite o segundo numero: "
	n: .asciiz "\n"
.text
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $a0, $zero, $v0
	
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, n
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall 
	
	li $v0, 5
	syscall
	add $a0, $zero, $v0
	
	li $v0, 1
	syscall