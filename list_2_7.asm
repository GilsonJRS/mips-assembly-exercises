.data
	vet: .word 25, 96, 65, 32
.text
main:
	la $s0, vet
	li $s1, 3
	
	add $a0, $s0, $zero
	add $a1, $s1, $zero
	jal bubble
	j exit
#-------- procedure bubble --------
#$a0 = vet
#$a1 = n
bubble: 
	#save $s registers and $ra
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	sw $s4, 16($sp)
	sw $s3, 12($sp)
	sw $s2, 8($sp)
	sw $s1, 4($sp)
	sw $s0, 0($sp)
	
	#copy $a0 and $a1
	move $s0, $a0
	move $s1, $a1
	
	li $s2, 0 #$s2 => i = 0
	outer_loop:
		bgt $s2, $s1, end_outer_loop
		li $s3, 0 #$s3 => j = 0
		sub $s4, $s1, $s2
		sub $s4, $s4, 1 #$t0 = n-i-1
		inner_loop:
			bgt $s3, $s4, end_inner_loop #if j > n-i-1
			sll $t1, $s3, 2
			addu $t2, $t1, $s0
			lw $t3, 0($t2)
			lw $t4, 4($t2)
			blt $t3, $t4, else #if vet[j] > vet[j+1]
			move $a0, $s0
			move $a1, $s3
			jal swap
		else:
			addi $s3, $s3, 1
			j inner_loop
		end_inner_loop:
		addi $s2, $s2, 1
		j outer_loop
	end_outer_loop:
	
	#restore $s registers and $ra
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $s4, 16($sp)
	lw $ra, 20($sp)	
	addi $sp, $sp, 20
	
	jr $ra
	
#-------- procedure swap --------
#swap vet[n] and vet[n+1]

swap:   #$a0 = vet
	#$a1 = n
	sll $t1, $a1, 2
	addu $t1, $a0, $t1
	
	lw $t0, 0($t1)
	lw $t2, 4($t1)
	
	sw $t2, 0($t1)
	sw $t0, 4($t1)
	
	jr $ra
#-------- procedure exit --------
exit:
	li $v0, 10
	syscall
