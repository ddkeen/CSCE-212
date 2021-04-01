#add_nums(a,b,c)
#	int d = a+b
#	int e = d+c
#	return e
# a=4, b=2, c=8

li $a0, 4
li $a1, 2
li $a2, 8

jal add_nums
move $t0, $v0
li $v0,1 
move  $a0, $t0

exit:
	li $v0, 10
	syscall
	
add_nums:
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	add $t0, $a0, $a1
	add $t1, $t0, $a2
	move $v0, $t1
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	addi $sp, $sp, 8
	jr $ra