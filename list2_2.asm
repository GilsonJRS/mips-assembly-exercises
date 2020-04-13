.text
main:
	li $t0, 3
	li $t1, 2
	add $a0, $t0, $zero
	add $a1, $t1, $zero
	jal MULT
	add $s1, $v0, $zero
	
	li $v0, 1
	add $a0, $s1, $zero
	syscall 
	
	j EXIT
MULT:
	mul $v0, $a0, $a1
	jr $ra
EXIT:
	li $v0, 10
	syscall