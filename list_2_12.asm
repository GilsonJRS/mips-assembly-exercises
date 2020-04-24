.data
	space: .asciiz "\n"
.text
main:
	li $v0, 5
	syscall
	move $a0, $v0
	jal fat
	move $a0, $v0
	
	li $v0, 1
	syscall

	j exit
fat:
	addi $sp, $sp, -8
	sw $s0, 4($sp)
	sw $ra, 0($sp)

	bne $a0, 1, L1
	addu $v0, $zero, 1
	j f_exit
	
	L1:
	move $s0, $a0
	addi $a0, $a0, -1
	jal fat
	move $t0, $v0
	mul $v0, $t0, $s0
	j f_exit
	
	f_exit:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra
	
exit:
	li $v0, 10
	syscall

	