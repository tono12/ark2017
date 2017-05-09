.data
        vect:.word 1,15,30,21,4,6,10,8
.text
.globl main
main:   la $a0, vect            # *v = &vect
        li $a1, 8               # n=8   

        jal MAX                 # Llamada a la función MAX

        move $a0, $v0           # entero a imprimir en $a0
        li $v0, 1               # syscall 1 -- imprimir entero                          
        syscall                 # imprimir entero

        li $v0, 10              # syscall 10 -- terminar
        syscall                 # llamada a sistema

MAX:    li $t0, 2               # $t0=2    
        bge $a1, $t0, ELSE      # if(n >= 2)
        lw $v0, 0($a0)		# $v0=v[0]
        jr $ra

ELSE:   sra $a1, $a1, 1         # n=n/2
	sw $fp, -4($sp)         # respalda $sp
        addi $fp, $sp, -4       # reposiciona $fp
        sw $ra, -4($fp)         # respalda $ra
        sw $a0, -8($fp)         # respalda $a0
        sw $a1, -12($fp)        # respalda $a1
        addi $sp, $fp, -12      # reposiciona $sp

        jal MAX                 # max(v, n/2)

        lw $a0, -8($fp)
        lw $a1, -12($fp)
        sw $v0, -12($fp)


        sll $t0, $a1, 2         # direcciones multplos de 4
        add $a0, $a0, $t0	# v+n/2
        jal MAX	                # max(v+n/2, n/2)
        
        addi $sp, $fp, 4        # restaura $sp
        lw $t0, -12($fp)        # respalda $t2
        lw $ra, -4($fp)         # restaura $ra
        lw $fp, 0($fp)          # restaura $fp

        ble $t0,$v0, ELSE_2
        move $v0,$t0
ELSE_2: jr $ra
