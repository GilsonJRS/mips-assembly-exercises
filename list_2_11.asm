.data
	space: .asciiz "\n"
.text
main:
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, space
	syscall
#------iterative fib------
	li $t1, 1 #actual 
	li $t2, 1 #previous
	li $t3, 0 #previousprevious
	li $t4, 1 #index
loop:
	beq $t4, $s0, end_loop
	addu $t1, $t2, $t3
	move $t3, $t2
	move $t2, $t1
	addi $t4, $t4, 1
	j loop
end_loop:
	li $v0, 1
	move $a0, $t1
	syscall