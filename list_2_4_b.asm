.data
	vet: .word 1, 2, 3, 4, 5
	vet_length: .word 4
	msg_i: .asciiz "Digite a posição i:\n"
.text
	la $s0, vet 
	lw $s1, vet_length
	li $t1, 0 #index
	
	li $v0, 4
	la $a0, msg_i
	syscall
	
	li $v0, 5
	syscall
	addu $t0, $v0, $zero #i
	
loop: 
	bgt $t1, $s1, end_loop
	sll $t2, $t1, 2
	addu $t3, $t2, $s0
	lw $t2, 0($t3)
	addu $t4, $t4, $t2
	addi $t1, $t1, 1
	bne $t1, $t0, loop
end_loop:
	sw $t4, 0($t3)
	li $v0, 1
	add $a0, $zero, $t4
	syscall
	
