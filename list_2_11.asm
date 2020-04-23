.data
	msg_1: .asciiz "\niterative result: "
	msg_2: .asciiz "\nrecursive result: "
	space: .asciiz "\n"
.text

main:	
	addi $sp, $sp, -4
	sw $s0, 0($sp) 
	
	li $v0, 5
	syscall
	move $s0, $v0
	
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
	li $v0, 4
	la $a0, msg_1
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
#--------------------------
	
	move $a0, $s0
	jal fib
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg_2
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, space
	syscall
	
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	j exit

#------recursive fib------
fib:
	addi $sp, $sp, -16
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	
	
	beq $a0, 0, L1 #if n==0 return 0
	beq $a0, 1, L2 #if n==1 return 1
	
	addi $s0, $a0, -1
	addi $s1, $a0, -2
	
	move $a0, $s0
	jal fib
	move $s0, $v0
	
	move $a0, $s1
	jal fib
	move $s1, $v0
	
	addu $v0, $s0, $s1 #return fib(n-1) + fib(n-2)
	
	j s_exit
	
	L1:
	addi $v0, $zero, 0
	j s_exit
	L2:
	addi $v0, $zero, 1
	j s_exit
	
	s_exit:
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra

exit:
	li $v0, 10
	syscall