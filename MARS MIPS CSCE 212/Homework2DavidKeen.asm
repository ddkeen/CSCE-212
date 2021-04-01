#David Keen
#CSCE 212
#Homework 2
#2/10/20
.data 
	enterVals: .asciiz "Enter two integers"
	newline: .asciiz "\n"
	l1: .asciiz "First int & second int = "
	l2: .asciiz "First int | second int = "
	l3: .asciiz "First int ^ second int = "
	l4: .asciiz "First int << 1 = "
	l5: .asciiz "First int >> 1 = "
	l6: .asciiz "~First int = "
	l7: .asciiz "Second int << 1 = "
	l8: .asciiz "Second int >> 1 = "
	l9: .asciiz "~Second int  = "
.text
main:
	
#print eneterVals
	la $a0, enterVals 
	li $v0,4 
	syscall
#newline
	la $a0, newline 
	li $v0,4 
	syscall
#read int 1
	li $v0, 5 #load syscall read_int into $v0
	syscall #make the syscall
	move $t0, $v0 #psuedo instruction, move the number and read into $t0
#read int 2
	li $v0, 5 #load syscall read_int into $v0
	syscall #make the syscall
	move $t1, $v0 #move the number read into $t1
#print a message and the bitwise &
	and $t2, $t0, $t1
	la $a0, l1
	jal print_newLine
#print a message and the bitwise |
	or $t2, $t0, $t1
	la $a0, l2
	jal print_newLine
#print a message and the bitwise ^
	xor $t2, $t0, $t1
	la $a0, l3
	jal print_newLine
#print a message and << of 1 for the first int
	sll $t2, $t0, 1
	la $a0, l4
	jal print_newLine
#print a message and >> of 1 for the first int
	srl $t2, $t0, 1
	la $a0, l5
	jal print_newLine
#print a message and bitwise ~ of the first int
	nor $t2,$t0, $zero
	la $a0, l6
	jal print_newLine
#print a message and << of 1 for the second int
	sll $t2, $t1, 1
	la $a0, l7
	jal print_newLine
#print a message and >> of 1 for the second int
	srl $t2, $t1, 1
	la $a0, l8
	jal print_newLine
#print a message and bitwise ~ for the second int
	nor $t2,$t1, $zero
	la $a0, l9
	jal print_newLine
#exit the program
	li $v0, 10
	syscall 
	
#method to print the message, print the value of $t2, and print a new line, then return back to the next line of code in main. 
#This is done to save space 
print_newLine: 
	li $v0,4 
	syscall
	add  $a0, $t2, $zero
	li $v0, 1
	syscall
	la $a0, newline
	li $v0,4 
	syscall
	jr $ra
	
	
