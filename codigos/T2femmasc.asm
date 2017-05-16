FINIT: bne  $a0, $zero, F
       li   $v0, 1
       jr   $ra
        
F:     sw   $fp, -4($sp)
       addi $fp, $sp, -4
       sw   $ra, -4($fp)
       sw   $a0, -8($fp)
       addi $sp, $fp, -8
      
       addi $a0, $a0, -1
       jal  FINIT
       
       move $a0, $v0
       jal  MINIT

       addi $sp, $fp, 4
       lw   $a0, -8($fp)
       lw   $ra, -4($fp)
       lw   $fp, 0($fp)

       sub  $v0, $a0, $v0
       jr   $ra


MINIT: bne  $a0, $zero, M
       li   $v0, 0
       jr   $ra
        
M:     sw   $fp, -4($sp)
       addi $fp, $sp, -4
       sw   $ra, -4($fp)
       sw   $a0, -8($fp)
       addi $sp, $fp, -8
        
       addi $a0, $a0, -1
       jal  MINIT
        
       move $a0, $v0
       jal  FINIT

       addi $sp, $fp, 4
       lw   $a0, -8($fp)
       lw   $ra, -4($fp)
       lw   $fp, 0($fp)

       sub  $v0, $a0, $v0
       jr   $ra
        
