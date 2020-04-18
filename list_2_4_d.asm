.data
	vet: .word 1, 2, 6, 4, 5
	vet_length: .word 5
	lineb: .asciiz "\n"
.text
	la $s3, vet
	li $t0, 1
	lw $t1, vet_length
	lw $s2, 0($s3) #$t3 = menor
	lw $s1, 0($s3) #$t4 = maior
loop:
	beq $t0, $t1, end_loop
	sll $t5, $t0, 2
	addu $t6, $t5, $s3
	addi $t0, $t0, 1
	lw $t7, 0($t6)
	bgt $t7, $s1, swap_maior
	bgt $s2, $t7, swap_menor
	j loop
swap_maior:
	add $s1, $t7, $zero
	bgt $s2, $t7, swap_menor
	j loop
swap_menor:
	add $s2, $t7, $zero
	j loop
end_loop:
	li $v0, 1
	add $a0, $s1, $zero
	syscall
	li $v0, 4
	la $a0, lineb
	syscall
	li $v0, 1
	add $a0, $s2, $zero
	syscall