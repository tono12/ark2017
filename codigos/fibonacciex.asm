      .data
str1: .asciiz "world"      
str2: .asciiz "helloworld"
      .text
         la   $a1, str1        # load address of strings
         la   $a0, str2
MAIN:    move $t3, $a1
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
RETURN:  move $a0, $v0      # load fibonacci number for syscall
         li   $v0, 1           # specify Print Integer service
         syscall               # print fibonacci number
         li   $v0, 10          # system call for exit
         syscall               # we are out of here.

