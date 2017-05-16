COMB: beq $a1, $zero, END1  # m == 0 ?
      bne $a1, $a0, CALL    # n == m?
END1: li $v0, 1             # return 1
      jr $ra                # retornar
CALL: sw $fp, -4($sp)       # salvar valor de $fp en stack
      addi $fp, $sp, -4     # cargar nuevo valor de $fp
      sw $ra, -4($fp)       # salvar valor de $ra en stack
      sw $a1, -8($fp)       # salvar valor de $a1 en stack
      sw $a0, -12($fp)      # salvar valor de $a0 en stack
      addi $sp, $fp, -12    # $sp apunta a nuevo tope de stack

      addi $a0, $a0, -1     # argumento `n' es igual a `n-1'
      addi $a1, $a1, -1     # argumento `m' es igual a `m-1'
      jal COMB              # llamar a la funcion comb

      lw $a0, -12($fp)      # restaurar valor de $a0 = n
      lw $a1, -8($fp)       # restaurar valor de $a1 = m
      sw $v0, -8($fp)       # guardar $t0 en stack
      addi $sp, $fp, -8     # $sp apunta al nuevo tope de stack
      addi $a0, $a0, -1     # argumento `n' es `n-1'
      jal COMB              # segundo llamado a comb

      lw $t0, -8($fp)       # restaurar valor de $t0 `comb(n-1,m-1)'
      lw $ra, -4($fp)       # restaurar valor de $ra 

      addi $sp, $fp, 4      # $sp apunta a cima del stack
      lw $fp, 0($fp)        # restaurar valor de $fp
      add $v0, $v0, $t0     # return comb(n-1,m-1) + comb(n-1,m)

      jr $ra                # volver a rutina previa del stack
