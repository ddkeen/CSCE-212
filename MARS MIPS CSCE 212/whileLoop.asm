#while (i<j) i++;
#while (i!=j) i++;
 li $s0, 0	#i
 li $s1, 10	#j
 loop:
 	slt $t0, $s0, $s1
 	beq $t0, $zero, exit
 	addi $s0, $s0, 1
 	
 	li $v0, 1
 	move $a0, $s0
 	syscall
 	
 	j loop
 	
 exit:
 
 	li $v0, 10	#exit command
 	syscall