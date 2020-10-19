main:	
################################################## SKIP TO LINE 736 FOR ACTUAL CODE #######################################################
	la $sp, 0x100103FC # DIRECCION FINAL DE LA MEMORIA DE DATOS
	addi $t1,$zero,0xFF
	addi $t2,$zero,0x00
	
	sb $t1, 0x10010080 #DIRECCION DE BLANCO
	sb $t2, 0x10010081 #DIRECCION DE NEGRO
	
osc1:
subiu $sp, $sp, 4
sw $ra, ($sp)

la $t3, 0xFFFF0000
li $a0, 1
li $a1, 3
jal createPixel

la $t3, 0xFFFF0000
li $a0, 1
li $a1, 4
jal createPixel

la $t3, 0xFFFF0000
li $a0, 1
li $a1, 5
jal createPixel

la $t3, 0xFFFF0000
li $a0, 1
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000
li $a0, 1
li $a1, 10
jal createPixel

la $t3, 0xFFFF0000
li $a0, 1
li $a1, 11
jal createPixel

la $t3, 0xFFFF0000
li $a0, 3
li $a1, 1
jal createPixel

la $t3, 0xFFFF0000
li $a0, 3
li $a1, 6
jal createPixel

la $t3, 0xFFFF0000
li $a0, 3
li $a1, 8
jal createPixel

la $t3, 0xFFFF0000
li $a0, 3
li $a1, 13
jal createPixel

la $t3, 0xFFFF0000
li $a0, 4
li $a1, 1
jal createPixel

la $t3, 0xFFFF0000
li $a0, 4
li $a1, 6
jal createPixel

la $t3, 0xFFFF0000
li $a0, 4
li $a1, 8
jal createPixel

la $t3, 0xFFFF0000
li $a0, 4
li $a1, 13
jal createPixel

la $t3, 0xFFFF0000
li $a0, 5
li $a1, 1
jal createPixel

la $t3, 0xFFFF0000
li $a0, 5
li $a1, 6
jal createPixel

la $t3, 0xFFFF0000
li $a0, 5
li $a1, 8
jal createPixel

la $t3, 0xFFFF0000
li $a0, 5
li $a1, 13
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 3
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 4
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 5
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 10
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 11
jal createPixel

la $t3, 0xFFFF0000
li $a0, 9
li $a1, 3
jal createPixel

la $t3, 0xFFFF0000
li $a0, 9
li $a1, 4
jal createPixel

la $t3, 0xFFFF0000
li $a0, 9
li $a1, 5
jal createPixel

la $t3, 0xFFFF0000
li $a0, 9
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000
li $a0, 9
li $a1, 10
jal createPixel

la $t3, 0xFFFF0000
li $a0, 9
li $a1, 11
jal createPixel

la $t3, 0xFFFF0000
li $a0, 10
li $a1, 1
jal createPixel

la $t3, 0xFFFF0000
li $a0, 10
li $a1, 6
jal createPixel

la $t3, 0xFFFF0000
li $a0, 10
li $a1, 8
jal createPixel

la $t3, 0xFFFF0000
li $a0, 10
li $a1, 13
jal createPixel

la $t3, 0xFFFF0000
li $a0, 11
li $a1, 1
jal createPixel

la $t3, 0xFFFF0000
li $a0, 11
li $a1, 6
jal createPixel

la $t3, 0xFFFF0000
li $a0, 11
li $a1, 8
jal createPixel

la $t3, 0xFFFF0000
li $a0, 11
li $a1, 13
jal createPixel

la $t3, 0xFFFF0000
li $a0, 12
li $a1, 1
jal createPixel

la $t3, 0xFFFF0000
li $a0, 12
li $a1, 6
jal createPixel

la $t3, 0xFFFF0000
li $a0, 12
li $a1, 8
jal createPixel

la $t3, 0xFFFF0000
li $a0, 12
li $a1, 13
jal createPixel

la $t3, 0xFFFF0000
li $a0, 14
li $a1, 3
jal createPixel

la $t3, 0xFFFF0000
li $a0, 14
li $a1, 4
jal createPixel

la $t3, 0xFFFF0000
li $a0, 14
li $a1, 5
jal createPixel

la $t3, 0xFFFF0000
li $a0, 14
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000
li $a0, 14
li $a1, 10
jal createPixel

la $t3, 0xFFFF0000
li $a0, 14
li $a1, 11
jal createPixel

lw $ra, ($sp)
addiu $sp, $sp, 4
j continue
	

################################################ BEGINNING OF ACTUAL CODE #########################################################	

continue:
	#li $t7, 1			# initialize number of live pixels to 1, to allow for an initial run on the configuration
	loopScreen:
		#beqz $t7, exit		# if num of live pixels = 0, exit the program.
		jal updateScreen	# loop through entire screen while there are still live pixels on the screen & not OOB
		j loopScreen
#exit:
#	la $v0, 10
#	syscall  
#CREATE PIXEL CORREGIDO	
createPixel:
	la $t3, 0xFFFF0000			# stores starting memory address
	sll $t1, $a0, 0 #Corregido 0 porque se utilizara byte			# calculates pixel x-position by multiplying x-position by 4, the size of a word.
	sll $t2, $a1, 4 #Corregido direccion por 4 por la pantalla 4x4			# calculates pixel y-position by multiplying y-position by 256, the size of an entire row in this display.
	add $t1, $t1, $t2  # CALCULO OFFSET		# add x and y positions together
	add $t3, $t3, $t1  #OFFSET + FFFF0000		# add the positions to the starting address to find the new location of the pixel
	lbu $t0, 0x10010080 		            # loads a ___white____ pixel	
	sb $t0, ($t3)		 	# places pixel in bitmap display
	jr $ra
# CHECK COLOR CORREGIDO	
checkColor:
	# Will determine the color of a neighbor 
	la $t3, 0xFFFF0000			# stores starting memory address
	sll $t1, $a2, 0	#cambiado 2 por 0		# calculates neighbor's x-position
	sll $t2, $a3, 4	#cambiado 8 por 2		# calculates neighbor's y-position
	add $t1, $t1, $t2  		# add x and y positions together
	add $t3, $t3, $t1		# add the positions to the starting address to find the neighbor's address
	lbu $v0, ($t3) #lw por lb	 		# loads the color of the neighbor into $v0
	jr $ra
	
# CHECKSELFCOLOR CORREGIDO
checkSelfColor:
	# Will determine the color of the current pixel in the display
	la $t3, 0xFFFF0000
	sll $t1, $a0, 0
	sll $t2, $a1, 4
	add $t1, $t1, $t2
	add $t3, $t3, $t1
	lbu $v1, ($t3)
	jr $ra
	
XYtoAddress:
	# Will convert a pixel with XY coordinates into an address
	la $t3, 0xFFFF0000			# stores starting memory address
	sll $t0, $a0, 0 #cambio			# calculates x-position
	sll $t6, $a1, 4 #cambio	2 por 3 para 8x8		# calculates y-position
	add $t0, $t0, $t6  		# add x and y positions together
	add $t3, $t3, $t0		# add the positions to the starting address
	move $v1, $t3	 	 	# loads address of pixel into $v1
	jr $ra	
	
updateScreen:
	# This function will loop through every pixel on the display screen and determine if new cells will be born.
	# If there are no cells on the screen, we will exit the program.
	subiu $sp, $sp, 4		
	sw $ra, ($sp)					# push $ra to the stack
	li $t7, 0					# counter for how many live pixels we've encountered in the screen
	li $a0, 0					# initialize starting position on screen
	li $a1, 0
	la $t8, 0x10010000					# initialize arrays for live and dead pixels
	la $t9, 0x10010040
	#CHECK PIXEL ADAPTADO SIN CAMBIOS
	checkPixel:
		jal checkSelfColor
		beqz $v1, black				# if the pixel is black
	colored:						# otherwise, it's colored.
		addi $t7, $t7, 1				# since it's colored, we increment the live pixel counter
		jal countNeighbors	
		blt $t5, 2, markDead 			# cell dies of loneliness if # of neighbors < 2 (0, 1)
		bgt $t5, 3, markDead			# cell dies from overpopulation if # of neighbors > 3 (4+)
		j checkOOB				# cell remains alive if # of neighbors = 2 or 3, so we won't do anything in this case.
		markDead:
			jal XYtoAddress 
			sb $v1, ($t9)			# store current live pixel into dead array
			addi $t9, $t9, 1 #CAMBIADO 4 por 1			# go to next position in array	
			subi $t7, $t7, 1			# one less live cell now
			j checkOOB			# continue looping through screen.
		
	black:	
		jal countNeighbors
		beq $t5, 3, markLive			# if dead cell has exactly three live neighbors, it will become alive!
		j checkOOB				# otherwise, do nothing & continue looping.
		markLive:
			jal XYtoAddress
			sb $v1, ($t8) # sw por sb			# store new live pixel into live array
			addi $t8, $t8, 1 # 4 por 1			# go to next space in array			
			addi $t7, $t7, 1 		# increment live pixels

	checkOOB:
		addi $a0, $a0, 1
		bgt $a0, 15, resetX	#cambiado 63 por 3		# if x-coordinate is over the right of the screen (bound is 63), reset it and increment y-coordinate
		blt $a0, 16, checkPixel			# if x and y-coordinate are within bounds, continue looping through screen
		resetX:
			li $a0, 0
			addi $a1, $a1, 1
			bgt $a1, 15, endUpdateScreen #cambiado 63 por 3	# if y-coordinate reaches the bottom right of the screen, end
			j checkPixel
	
	endUpdateScreen:
		jal nextGeneration			# once we've reached the end of the screen, draw all the changes to the display.
		lw $ra, ($sp)
		addiu $sp, $sp, 4			# pop $ra from the stack
		jr $ra
	
nextGeneration:
	subiu $sp, $sp, 4		
	sw $s1, ($sp)					# push $s1 to the stack
	la $t8, 0x10010000 #lw por la					# reset arrays for live and dead pixels
	la $t9, 0x10010040#lw por la
	kill:	
		lbu $s1, ($t9)
		beqz $s1, generate			# continue killing pixels until there are no more in the array
		lbu $v1, ($t9) 
		addi $v1, $v1,0xFFFF0000 #AGREGADO
		lbu $t0, 0x10010081	#lb por lw		# loads color of dead pixel (black)
		sb $t0, ($v1)				# colors pixel black
		sb $zero, ($t9)
		addi $t9, $t9, 1 # 1 por 4
		j kill
		
	generate:
		lbu $s1, ($t8) #lw por lb
		beqz $s1, endNextGen			# continue generating pixels until there are no more in the array
		lbu $v1, ($t8)
		addi $v1, $v1,0xFFFF0000
		lbu $t0, 0x10010080 #lw por lb			# loads a white pixel	
		sb $t0, ($v1) #sw por sb		 		# places pixel in bitmap display
		sb $zero, ($t8)				# clear the address of the pixel we just created
		addi $t8, $t8, 1 # 1 por 4			# go to next pixel
		j generate
	
	endNextGen:
		add $t1,$zero,$zero
		CONTADOR:
		addi $t1,$t1,1
		bgt $t1, 1000000,END
		j CONTADOR
	
	END:
		lw $s1, ($sp)
		addiu $sp, $sp, 4			# pop $s1 from the stack
		jr $ra
#COUNTNEIGHBORS CORREGIDO
countNeighbors:
	# Each pixel will have 8 neighbors. We will check if each neighbor is alive or dead (black or colored).
	# We will implement the rules of the game in accordance to how many neighbors are alive.
	# This is how I will refer to each neighbor of pixel with position 'x, y' (with number identifiers for ease of reading):
	#
	# | 1: x-1, y-1 | 2: x, y-1 | 3: x+1, y-1 |
	# `````````````````````````````````````````
	# | 4: x-1, y   |    x, y   | 5: x+1, y   |
	# `````````````````````````````````````````
	# | 6: x-1, y+1 | 7: x, y+1 | 8: x+1, y+1 |
	# `````````````````````````````````````````
	#####################################################################################################
	subiu $sp, $sp, 4		
	sw $ra, ($sp)				# push $ra to the stack
	li $t5, 0				# alive counter
	######################################## check 1: top left ##########################################
	checkOOB1: # OOB means Out of Bounds	
		subi $a2, $a0, 1		# get neighbor's x-position
		blt $a2, 0, checkOOB2		# if x-position is OOB on the left side of display, go to next neighbor		
		subi $a3, $a1, 1		# get neighbor y-position
		blt $a3, 0, checkOOB2		# if y-position is OOB on the top of display, go to next neighbor
		# if not OOB, check if this cell is alive or dead
		jal checkColor
		sne $t6, $v0, 0 		# if the cell != black (0 in hexadecimal), increment alive counter
		add $t5, $t5, $t6
	########################################## check 2: up ##############################################
	checkOOB2: 
		move $a2, $a0			# neighbor's x-position will be the same as the pixel's x-position
		subi $a3, $a1, 1		
		blt $a3, 0, checkOOB3		
		# if not OOB, check if this cell is alive or dead
		jal checkColor
		sne $t6, $v0, 0 			
		add $t5, $t5, $t6
	######################################## check 3: top right #########################################
	checkOOB3:
		addi $a2, $a0, 1		# get neighbor's x-position
		bgt $a2, 15, checkOOB4 #CAMBIADO 63 por 3		# if x-position is OOB on the right side of display, go to next neighbor
		subi $a3, $a1, 1		# get neighbor y-position
		blt $a3, 0, checkOOB4		# if y-position is OOB on the top of display, go to next neighbor
		# if not OOB, check if this cell is alive or dead
		jal checkColor
		sne $t6, $v0, 0 			
		add $t5, $t5, $t6
	########################################## check 4: left ############################################
	checkOOB4:
		subi $a2, $a0, 1
		blt $a2, 0, checkOOB5
		move $a3, $a1			# neighbor's y-position will be the same as pixel's y-position (coordinate system, not address)
		# if not OOB, check if this cell is alive or dead
		jal checkColor
		sne $t6, $v0, 0 			
		add $t5, $t5, $t6
	######################################### check 5: right ############################################
	checkOOB5:
		addi $a2, $a0, 1
		bgt $a2, 15, checkOOB6 #CAMBIADO 63 por 3
		move $a3, $a1
		# if not OOB, check if this cell is alive or dead
		jal checkColor
		sne $t6, $v0, 0 			
		add $t5, $t5, $t6
	###################################### check 6: bottom left #########################################
	checkOOB6:
		subi $a2, $a0, 1
		blt $a2, 0, checkOOB7
		addi $a3, $a1, 1
		bgt $a3, 15, checkOOB7	#CAMBIADO 63 por 3	# if neighbor's y-position is OOB on the bottom of display, go to next neighbor
		# if not OOB, check if this cell is alive or dead
		jal checkColor
		sne $t6, $v0, 0 			
		add $t5, $t5, $t6
	######################################## check 7: down ##############################################
	checkOOB7:
		move $a2, $a0
		addi $a3, $a1, 1
		bgt $a3, 15, checkOOB8 #CAMBIADO 63 por 3
		# if not OOB, check if this cell is alive or dead
		jal checkColor
		sne $t6, $v0, 0 			
		add $t5, $t5, $t6
	##################################### check 8: bottom right #########################################
	checkOOB8:
		addi $a2, $a0, 1
		bgt $a2, 15, endCheck #CAMBIADO 63 por 3
		addi $a3, $a1, 1
		bgt $a3, 15, endCheck #CAMBIADO 63 por 3
		# if not OOB, check if this cell is alive or dead
		jal checkColor
		sne $t6, $v0, 0 			
		add $t5, $t5, $t6
	####################################################################################################
	endCheck:
		lw $ra, ($sp)
		addiu $sp, $sp, 4		# pop $ra from the stack 
		jr $ra
