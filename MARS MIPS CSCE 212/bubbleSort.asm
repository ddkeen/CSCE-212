li $t0, 0 	#i
li $t1, 20
li $t2, 0
li $t3, 5


loop:
	beq $t0, $t1, exit
	li $s2, 0
	#...code...
	jal loop2
	
	addi $t0, $t0, 1
	j loop
	
loop2:
	beq $t2, $t3, jump
	
	#...code..
	li $v0, 1
	move $a0, $t2
	
	addi $s2, $s2, 1
	j loop2
	
jump:
	jr $ra
	
	
exit:
	li $v0, 10
	syscall