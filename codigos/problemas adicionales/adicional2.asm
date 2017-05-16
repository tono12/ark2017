PROM: li $t0, 0           # i = 0
      li $t1, 0           # suma = 0
FOR:  bge $t0, $a1, FIN   # if i < n, va a FIN
      sll $t2, $t0, 3     # i*8
      add $t2, $t2, $a0   # p + i*8
      lw $t3, 0($t2)      # *(p+i*8)
      lw $t4, 4($t2)      # *(p+i*8+4)
      div $t3, $t4        # cantidad / tiempo
      mflo $t3            # resultado div
      add $t1, $t1, $t3   # suma = suma + cantidad / tiempo
      addi $t0, $t0, 1    # i = i + 1
      b FOR               # fin ciclo FOR
FIN:  div $t1, $a1        # suma/n
      mflo $v0            # $v0 = entero (suma/n)
      jr $ra              # volver a rutina
