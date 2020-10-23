main:	

	la $sp, 0x100103FC 

cleanScreen:
	la $t3, 0xFFFF0000
	li $t1, 0
		cleanLoop:
			li $t2, 0
			sb $t2, ($t3)
			addi $t3, $t3, 1
			addi $t1, $t1, 1
			bgt $t1, 255, osc1
			j cleanLoop

osc1:

la $t3, 0xFFFF0000
li $a0, 2
li $a1, 4
jal createPixel

la $t3, 0xFFFF0000
li $a0, 2
li $a1, 5
jal createPixel

la $t3, 0xFFFF0000
li $a0, 2
li $a1, 6
jal createPixel

la $t3, 0xFFFF0000
li $a0, 2
li $a1, 10
jal createPixel

la $t3, 0xFFFF0000
li $a0, 2
li $a1, 11
jal createPixel

la $t3, 0xFFFF0000 #NO
li $a0, 2
li $a1, 12
jal createPixel

la $t3, 0xFFFF0000
li $a0, 4
li $a1, 2
jal createPixel

la $t3, 0xFFFF0000
li $a0, 4
li $a1, 7
jal createPixel

la $t3, 0xFFFF0000
li $a0, 4
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000 #NO
li $a0, 4
li $a1, 14
jal createPixel

la $t3, 0xFFFF0000 
li $a0, 5
li $a1, 2
jal createPixel

la $t3, 0xFFFF0000
li $a0, 5
li $a1, 7
jal createPixel

la $t3, 0xFFFF0000
li $a0, 5
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000
li $a0, 5
li $a1, 14
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 2
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 7
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000
li $a0, 6
li $a1, 14
jal createPixel

la $t3, 0xFFFF0000
li $a0, 7
li $a1, 4
jal createPixel

la $t3, 0xFFFF0000
li $a0, 7
li $a1, 5
jal createPixel

la $t3, 0xFFFF0000
li $a0, 7
li $a1, 6
jal createPixel

la $t3, 0xFFFF0000
li $a0, 7
li $a1, 10
jal createPixel

la $t3, 0xFFFF0000
li $a0, 7
li $a1, 11
jal createPixel

la $t3, 0xFFFF0000
li $a0, 7
li $a1, 12
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
li $a1, 6
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
li $a0, 9
li $a1, 12
jal createPixel

la $t3, 0xFFFF0000
li $a0, 10
li $a1, 2
jal createPixel

la $t3, 0xFFFF0000
li $a0, 10
li $a1, 7
jal createPixel

la $t3, 0xFFFF0000
li $a0, 10
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000
li $a0, 10
li $a1, 14
jal createPixel

la $t3, 0xFFFF0000
li $a0, 11
li $a1, 2
jal createPixel

la $t3, 0xFFFF0000
li $a0, 11
li $a1, 7
jal createPixel

la $t3, 0xFFFF0000
li $a0, 11
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000
li $a0, 11
li $a1, 14
jal createPixel

la $t3, 0xFFFF0000
li $a0, 12
li $a1, 2
jal createPixel

la $t3, 0xFFFF0000
li $a0, 12
li $a1, 7
jal createPixel

la $t3, 0xFFFF0000
li $a0, 12
li $a1, 9
jal createPixel

la $t3, 0xFFFF0000
li $a0, 12
li $a1, 14
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
li $a1, 6
jal createPixel

la $t3, 0xFFFF0000
li $a0, 14
li $a1, 10
jal createPixel

la $t3, 0xFFFF0000
li $a0, 14
li $a1, 11
jal createPixel

la $t3, 0xFFFF0000
li $a0, 14
li $a1, 12
jal createPixel


		add $t1,$zero,$zero
		CONTADOR1:
		addi $t1,$t1,1
		bgt $t1, 1000000,continue
		j CONTADOR1

################################################ BEGINNING OF ACTUAL CODE #########################################################	

continue:
			
	loopScreen:
				
		jal updateScreen	
		j loopScreen

createPixel:
	la $t3, 0xFFFF0000			
	sll $t1, $a0, 0 			
	sll $t2, $a1, 4 
	add $t1, $t1, $t2  
	add $t3, $t3, $t1  
	li $t0, 0xFF		           	
	sb $t0, ($t3)		 	
	jr $ra

checkColor:
	
	la $t3, 0xFFFF0000			
	sll $t1, $a2, 0	
	sll $t2, $a3, 4	
	add $t1, $t1, $t2  		
	add $t3, $t3, $t1		
	lbu $v0, ($t3)	 		
	jr $ra
	

checkSelfColor:

	la $t3, 0xFFFF0000
	sll $t1, $a0, 0
	sll $t2, $a1, 4
	add $t1, $t1, $t2
	add $t3, $t3, $t1
	lbu $v1, ($t3)
	jr $ra
	
XYtoAddress:
	
	la $t3, 0xFFFF0000			
	sll $t0, $a0, 0 		
	sll $t6, $a1, 4 
	add $t0, $t0, $t6  		
	add $t3, $t3, $t0		
	move $v1, $t3	 	 	
	jr $ra	
	
updateScreen:
	
	subiu $sp, $sp, 4		
	sw $ra, ($sp)					
	li $t7, 0					
	li $a0, 0					
	li $a1, 0
	la $t8, 0x10010000					
	la $t9, 0x10010040
	
	checkPixel:
		jal checkSelfColor
		beqz $v1, black				
	colored:						
		addi $t7, $t7, 1				
		jal countNeighbors	
		blt $t5, 2, markDead 			
		bgt $t5, 3, markDead			
		j checkOOB				
		markDead:
			jal XYtoAddress 
			sw $v1, ($t9)			
			addi $t9, $t9, 4 			
			subi $t7, $t7, 1			
			j checkOOB			
		
	black:	
		jal countNeighbors
		beq $t5, 3, markLive			
		j checkOOB				
		markLive:
			jal XYtoAddress
			sw $v1, ($t8) 
			addi $t8, $t8, 4			
			addi $t7, $t7, 1 		

	checkOOB:
		addi $a0, $a0, 1
		bgt $a0, 15, resetX	
		blt $a0, 16, checkPixel			
		resetX:
			li $a0, 0
			addi $a1, $a1, 1
			bgt $a1, 15, endUpdateScreen 
			j checkPixel
	
	endUpdateScreen:
		jal nextGeneration			
		lw $ra, ($sp)
		addiu $sp, $sp, 4			
		jr $ra
	
nextGeneration:
	subiu $sp, $sp, 4		
	sw $s1, ($sp)					
	la $t8, 0x10010000 #lw por la					
	la $t9, 0x10010040#lw por la
	kill:	
		lw $s1, ($t9)
		beqz $s1, generate			
		lw $v1, ($t9) 
		#addi $v1, $v1,0xFFFF0000 #AGREGADO
		li $t0,0x00
		sb $t0, ($v1)				
		sw $zero, ($t9)
		addi $t9, $t9, 4 
		j kill
		
	generate:
		lw $s1, ($t8) 
		beqz $s1, endNextGen			
		lw $v1, ($t8)
		#addi $v1, $v1,0xFFFF0000
		li $t0, 0xFF 
		sb $t0, ($v1) 
		sw $zero, ($t8)				
		addi $t8, $t8, 4 
		j generate
	
	endNextGen:
		
	pause:	la $t1, 0xFFFF7000
		lw $t2, ($t1)
		beq $t2,0,cont1
 
	DIRECCION:	la $t3, 0xFFFF6000 
		lw $t5, ($t3)  
		beq $t5, 0, pause 
		
	CARGAR:	la $t3, 0xFFFF8000 
		lw $t4, ($t3)       
		addi $t4,$t4,0xFFFF0000 
		
		lbu $t6,($t4) 
		beq $t6,0x00,EQNEGRO
		beq $t6,0xFF,EQBLANCO
		j pause
		
		EQBLANCO: 	addi $t7,$zero,0x00
		  	sb   $t7, ($t4)
			addi $t1,$zero,0
		c1:	addi $t1,$t1,1
			bgt $t1, 1000000,something1
			j c1 
		something1: la $t3, 0xFFFF6000
			lw $t5, ($t3)  
			beq $t5, 1, EQBLANCO
			j pause
			
		EQNEGRO:
			addi $t7,$zero,0xFF
			sb   $t7, ($t4) 
			addi $t1,$zero,0
		c2:	addi $t1,$t1,1
			bgt $t1, 1000000,something2
			j c2
		something2: la $t3, 0xFFFF6000
			lw $t5, ($t3)  
			beq $t5, 1, EQNEGRO
			j pause
	
	cont1:	add $t1,$zero,$zero
		CONTADOR2:
		addi $t1,$t1,1
		bgt $t1, 1000000,END
		j CONTADOR2
		
		
	END:	lw $s1, ($sp)
		addiu $sp, $sp, 4			
		jr $ra


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