.data
	s: .asciiz "Hello, World!\n"
	newline: .asciiz "\n"
.text
	la $a0, s
	li $v0, 4
	syscall 
	
	
li $s0,0
		
loop: 
	slti $t0, $s0, 10
	beq $t0, $zero, exit
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	la $a0, newline
	li $v0,4 
	syscall
	
	addi $s0, $s0, 1
	j loop
	
exit:
	li $v0, 10
	syscall 








