.data #where we store all our global stuff in memory
	var1: .word 23
	
.text #code we use we put in here
main:
	lw $t0, var1
	li $t1, 5
	sw $t0, var1
	
	
