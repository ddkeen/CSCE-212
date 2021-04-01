.data 
	array: .space 20
.text
	#for loop
	li $s0, 1	#$s0 = i
	li $t0, 5
	#user number is in $t0
	 sll $s1, $s0, 2	#s1 = i * 4	
	 sw $t0, array($s1)	#put into array[1]
	 
	 li $v0, 1
	 lw $a0, 0($s1)