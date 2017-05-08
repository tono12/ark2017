.data				
DIVID:	.word 15				
DIVIS:	.word 20	
printf: .asciiz "El MCD es "	
fin:	.asciiz "\n"

.text

######## FUNCION MAIN ########

main:	la   $a0, DIVID  
        lw   $a0, 0($a0) 
	la   $a1, DIVIS   
	lw   $a1, 0($a1) 
	sw   $fp, -4($sp) # guarda el valor de fp en stack
	addi $fp, $sp, -4 # fp como la nueva base del stack
	sw   $ra, -4($fp) # guarda ra en stack
	addi $sp, $fp, -4 # sp como el tope del stack
	jal  GCD          # MAX(vect,N)
	addi $sp, $fp, 4  # recupera el tope del stack
	lw   $ra, -4($fp) # recupera ra
	lw   $fp, 0($fp)  # recupera fp
	move $t0, $v0	  # el valor maximo es guardado
	li   $v0, 4	  # se configura el syscall para imprimir string
	la   $a0, printf  # se carga el string a imprimir
	syscall		  # se imprime string
	li   $v0, 1	  # se configura el syscall para impimir entero
	move $a0, $t0	  # N para imprimir
	syscall		  # se imprime N
	li   $v0,4	  # se configura el syscall para imprimir string
	la   $a0, fin	  # se carga el string a imprimir
	syscall		  # se imprime string
	li   $v0, 10	  # se configura el syscall para finalizacion
	syscall		  # termina programa

GCD:    bnez $a1, L01
        move $v0, $a0
        jr $ra
L01:    sw $fp, -4($sp)
        addi $fp, $sp, -4
        sw $ra, -4($fp)
        addi $sp, $fp, -4
	jal MODULO
        move $a0, $a1
        move $a1, $v0
        jal GCD
L02:    addi $sp, $fp, -4
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra

MODULO: bge $a0, $a1, ELSE 
        move $v0, $a0
        jr $ra
        
ELSE:   sw   $fp, -4($sp)
        addi $fp, $sp, -4
        sw $ra, -4($fp)
        addi $sp, $fp, -4
        sub $a0, $a0, $a1
        jal MODULO
        
        addi $sp, $fp, 4
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra  
