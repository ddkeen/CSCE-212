#fact
#if n<1 return 1
#else return  n* fact(n-1)

li $a0, 5
jal fact

move $a0, $v0
li $v0, 1
syscall

exit:
	li $v0, 10
	syscall
	
fact: 	
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	slti $t0, $a0, 1
	beq $t0, $zero, L1	#if
	#else
	li $v0,1
	addi $sp, $sp, 8
	jr $ra
	
	
	
	
L1:
	addi $a0, $a0, -1
	jal fact
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	mul $v0, $v0, $a0
	jr $ra
	