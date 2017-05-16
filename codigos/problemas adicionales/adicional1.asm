ROMAN:  li $v0, 0           # Num = 0
        li $t0, 1000        # AN = 1000

WHILE:  lb $t1, 0($a0)      # *string
        beq $t1, $zero, FIN # si *string == 0 termina el while
        addi $a0, $a0, 1    # string++
        li $t2, 73          # char 'I'
        bne $t1, $t2, R_V   # si *string != 'I' prueba condicion siguiente
        li $t2, 1           # N = 1
        b F_SW
R_V:    li $t2, 86          # char 'V'
        bne $t1, $t2, R_X   # si *string != 'V' prueba condicion siguiente
        li $t2, 5           # N = 5
        b F_SW
R_X:    li $t2, 88          # char 'X'
        bne $t1, $t2, R_L   # si *string != 'X' prueba condicion siguiente
        li $t2, 10          # N = 10
        b F_SW
R_L:    li $t2, 76          # char 'L'
        bne $t1, $t2, R_C   # si *string != 'L' prueba condicion siguiente
        li $t2, 50          # N = 50
        b F_SW
R_C:    li $t2, 67          # char 'C'
        bne $t1, $t2, R_D   # si *string != 'C' prueba condicion siguiente
        li $t2, 100         # N = 100
        b F_SW
R_D:    li $t2, 68          # char 'D'
        bne $t1, $t2, R_M   # si *string != 'D' prueba condicion siguiente
        li $t2, 500         # N = 500
        b F_SW
R_M:    li $t2, 77          # char 'M'
        bne $t1, $t2, DEF   # si *string != 'M' prueba condicion siguiente
        li $t2, 500         # N = 1000
        b F_SW
DEF:    li $t2, 0           # N = 0

F_SW:   bge $t0, $t2, NORM  # si AN >= N salta a NORM
        sll $t0, $t0, 1     # 2*AN
        sub $v0, $v0, $t0   # Num = Num - 2*AN
NORM:   add $v0, $v0, $t2   # Num = Num + N
        move $t0, $t2       # AN = N
        b WHILE             # reinicia el ciclo
FIN:    jr $ra
