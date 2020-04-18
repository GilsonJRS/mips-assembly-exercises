.data
	A: .word 1,2,3,4
	MSG: .asciiz "$s1: "
.text
	la $s0, A
	li $t0, 0
	li $s1, 0
loop:
	bgt $t0, 3, end_loop
	sll $t2, $t0, 2
	addu $t2, $t2, $s0
	lw $t1, 0($t2)
	addu $s1, $s1, $t1
	addu $t0, $t0, 1
	j loop
end_loop:
	li $v0, 4
	la $a0, MSG
	syscall
	li $v0, 1
	addu $a0, $zero, $s1
	syscall
		