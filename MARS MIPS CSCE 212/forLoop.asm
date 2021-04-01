#for (i==0; i<a; i++) b[i] = 1;
#a =s0
#i = s1
#b starts in s2

li $s0, 5 	#a = 5
li $s1, 0 	#i = 0

loop1:
	#i < a
	slt $t0, $s1, $s0
	beq $t0, $zero, exit
loop2:
	#b[i] = i
	sll $t1, $s1, 2 #t1 = i * 4
	add $t1, $t1, $s2
	sw $s1, 0($t1)
	
	addi $s1, $s1, 1 
	j loop1





	#b [3] = i
	#li $t1, 2
	#sll $t1, $t1, 2	#t1 = 3*4
	#value we want is $s2 + (3*4)
	#add $t1, $t1, $s2
	#sw $s1, 0($s2)	#store into $s2 + (3*4)
	#addi $s1, $s1, 1
	#j loop1
	
exit: 
	li $v0, 10
	syscall