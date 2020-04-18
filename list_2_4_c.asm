.data
	vet: .word 11, 2, 11, 4, 5
	vet_length: .word 5
.text
	la $s2, vet
	li $t0, 0
	lw $t1, vet_length
	sub $t1, $t1, 1
	li $s1, 0
loop:
	bgt $t0, $t1, end_loop
	sll $t2, $t0, 2
	addu $t3, $t2, $s2
	lw $t4, 0($t3)
	addi $t0, $t0, 1
	bgt $t4, 10, loop
	addu $s1, $s1, $t4
	j loop
end_loop:
	li $v0, 1
	add $a0, $zero, $s1
	syscall