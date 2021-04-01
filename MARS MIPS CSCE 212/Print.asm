.data
	a:	.space 12
.text
main:
	la $t0, a #store values into the array
	li $s0, 5
	sw $s0, 0($t0)
	li $s0, 2
	sw $s0, 4($t0)
	li $s0, -7
	sw $s0, 8($t0)
	
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	
	lw $a0, 4($t0)
	li $v0, 1
	syscall
	
	lw $a0, 8($t0)
	li $v0, 1
	syscall