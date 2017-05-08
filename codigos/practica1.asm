STRFIND: move $t3, $a1
         li   $t4, 0
         li   $v0, 0
WHILE:   lb   $t0, 0($a0)
         lb   $t1, 0($a1)
         beq  $t1, $zero, RETURN
         beq  $t0, $zero, FIN_W
         bne  $t0, $t1, ELSE
         addi $a1, $a1, 1
         b    FIN_IF
ELSE:    move $a1, $t3
         addi $v0, $t4, 1
FIN_IF:  addi $a0, $a0, 1
         addi $t4, $t4, 1
         b    WHILE
FIN_W:   li   $v0, 0
RETURN:  jr   $ra




PROM: li   $t0, 0
      li   $t1, 0
FOR:  bge  $t0, $a1, FIN
      sll  $t2, $t0, 3
      add  $t2, $t2, $a0
      lw   $t3, 0($t2)
      lw   $t4, 4($t2)
      div  $t3, $t4
      mflo $t3
      add  $t1, $t1, $t3
      addi $t0, $t0, 1
      b    FOR
FIN:  div  $t1, $a1
      mflo $v0
      jr   $ra
