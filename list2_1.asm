.data
.align 4
	string_1: .asciiz "\n" 
.text
main:
	li $t0, 3
	li $t1, 2
	add $a0, $t0, $zero
	add $a1, $t1, $zero
	jal SUM
	add $t2, $v0, $zero
	jal SUB
	add $t3, $v0, $zero
	
	li $v0, 1		#print SUM result
	add $a0, $t2, $zero
	syscall
	
	li $v0, 4		#print \n 
	la $a0, string_1
	syscall
	
	li $v0, 1		#print SUB result
	add $a0, $t3, $zero
	syscall
	j EXIT
SUM:
	add $v0, $a0, $a1
	jr $ra
SUB: 
	sub $v0, $a0, $a1
	jr $ra
EXIT:
	li $v0, 10
	syscall