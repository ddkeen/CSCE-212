#David Keen
#CSCE 212
#Homework 3
#2/19/20

#bubble sort an array of 5 elements in ascending order that were read from user input

.data
	a: .space 20 #space for array of 5, can be changed
	newline: .asciiz "\n"
	enterVal: "Please type number to add to list:"
	sorting: "Sorting..."
	done: "Done!"
	comma: ","
	list: "Sorted List: "
.text
li $t2,0 #set initial value of $t2 to 0 for the populate_array function
jal populate_array #populate array 
next0: #populate array jumps to this when complete
jal print_line #newline
la $a0, sorting 
li $v0,4 
syscall #print out "Sorting..."
jal print_line #newline
jal print_line #newline
jal while_loop #do the bubble sort
next: #while loop jumps to this when complete
la $a0, done 
li $v0,4 
syscall #print out "Done!"
jal print_line #newline
la $a0, list
li $v0,4 
syscall #print out "Sorted List: "
li $t2,0 #reset inital value of $t2 to 0 for the print array function
jal print_array #print all elements of the sorted array on the same line, exit when complete

exit: #exit the program
	li $v0, 10
	syscall 
	
read_int: #integer read from user input
	la $a0, enterVal
	li $v0,4 
	syscall #print "Please type a number to add to the list:"
	li $v0, 5 #load syscall read_int into $v0
	syscall #make the syscall
	move $a0, $v0 #psuedo instruction, move the number and read into $a0
	jr $ra
print_line: #prints a new line so numbers are separate
	la $a0, newline 
	li $v0,4 
	syscall
	jr $ra
populate_array:
	la $t0, a #make 0 the base adress of array a
	li $t3, 20 #20 because there 5 elements in the array, can be changed
	add $t1, $t0 $t2 #t2 starts at 0 (outside of function),but increases by 4 each loop, t1 becomes offset of array t0 by t2
	jal read_int #read an integer from user
	sw $a0, 0($t1) #store that  integer in the next spot of t0, t1 has been offset by how ever many bits were needed
	add $t2, $t2, 4 #increment the offset amount by 4 bits for the next spot in the array
	beq $t2, $t3, next0 #exit if all spots in then array have been filled
	jal populate_array #run the loop again otherwise
	
while_loop:
	li $s0, 0 #0 means hasSwapped = false
	li $s1, 16 #limit=16: (SIZE-1) * 4bits (can change for a bigger array)
	li $s2, 0 #set the for loop counter to 0
	jal for_loop #jump to for loop, I tried to change this to beq $zero, $zero, for_loop and then line 62 to jr $ra, but that would only swap two elements and exit
	beq $s0, 1, while_loop # if $s0 = 1, then we've swapped, so jump back to while loop  
	jal next #cannot jr $ra becuse it would just jump back to line 60 for an infinite loop, so jump to next
for_loop:
	add $t1, $t0, $s2 #$t1 becomes the offset of $t0 by whatever amount s2 is (i)
	lw $t2, 0($t1) #$t2 becomes first int A[i]
	add $s2, $s2, 4 #i += 4 
	add $t1, $t0, $s2 # $t1 becomes the offset address of $t0 by what s2 is now, (i+1)
	lw $t3, 0($t1) #t3 = whatever is in A[i+1]
	bgt $t2, $t3, if_statement #jump to if statement if the first number is greater than the second (A[i]>A[i+1])
	bne $s2, $s1 for_loop #if counter is not equal to limit, run for loop again 
	jr $ra #return to while loop
if_statement:
	li $s0, 1 #hasSwapped = true
	sw $t3, -4($t1) #A[i] = A[i+1] 
	sw $t2, 0($t1) #A[i+1] = A[i] #no temp needed
	jr $ra #return to end of for loop
	
print_array:
	li $t3, 20 #20 because there 5 elements in the array, can be changed
	add $t1, $t0, $t2 #t2 starts at 0 (outside of function),but increases by 4 each loop, t1 becomes offset of array t0 by t2
	lw $a0, 0($t1)
	li $v0, 1
	syscall #print the value
	add $t2, $t2, 4 #move the offset amount by 4 for the next number to print
	beq $t2, $t3, exit #exit if all numbers have been printed
	la $a0, comma
	li $v0,4 
	syscall
	jal print_array #run the loop again otherwise
	
#i used this function originally to sort an array of random ints 0-9, but this wasn't used in submission
#just need to change read_int to print_random_int in the populate_array function to sort random numbers
print_random_int: #print out a random integer from 0 to 10
	addi $a1, $zero 10 #10 is the upper limit exclusive, can be changed
	addi $v0 $zero 42 #42 is the syscall number for random integer
	syscall
	li $v0, 1
	syscall #print the random integer
	jr $ra