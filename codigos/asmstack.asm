GCD:bnez $a1,L01
move $v0,$a0
jr $ra
L01:sw $fp,‐4($sp)
addi $fp,$sp,‐4
sw $ra,‐4($fp)
addi $sp,$fp,‐4
div $a0,$a1
move $a0,$a1
mfhi $a1
jal GCD
L02:addi $sp,$fp,‐4
lw $ra,‐4($fp)
lw $fp,0($fp)
jr $ra

gcd(x,y) = x , si y = 0
gcd(x,y) = gcd(y,x%y) , si x>=y, y>0

----------------------

MODULO : bge $a0 , $a1 , ELSE
move $v0 , $a0
jr $ra
ELSE : sw $fp , -4( $sp )
addi $fp , $sp , -4
sw $ra , -4( $fp )
addi $sp , $fp , -4
sub $a0 , $a0 , $a1
jal MODULO
addi $sp , $fp ,4
lw $ra , -4( $fp )
lw $fp ,0( $fp )
jr $ra

----------------------

ACKER:bne $a0,$zero,ELSE_IF #
addi $v0,$a1,1
jr $ra
ELSE_IF: sw $fp,­4($sp)
addi $fp,$sp,­4
sw $ra,­4($fp)
sw $a0,­8($fp)
addi $sp,$fp,­8
bne $a1,$zero,ELSE
addi $a0,$a0,­1
li $a1,1
jal ACKER
addi $sp,$fp,4
lw $ra,­4($fp)
lw $fp,0($fp)
jr $ra
ELSE: addi $a1,$a1,­1
jal ACKER
move $a1,$v0
lw $a0,­8($fp)
addi $a0,$a0,­1
jal ACKER
addi $sp,$fp,4
lw $ra,­4($fp)
lw $fp,0($fp)
jr $ra

------------------------


CATALAN: bne   $a0, $zero, L1
		 li    $v0, 1
		 jr    $ra

L1:		 sw    $fp, -4($sp)
		 addi  $fp, $sp, -4
		 sw    $ra, -4($fp)
		 sw    $a0, -8($fp)
		 addi  $sp, $fp, -8

		 addiu $a0, $a0, -1
		 jal   CATALAN

L2:		 addi  $sp, $fp, 4
		 lw    $a0, -8($fp)
		 lw    $ra, -4($fp)
		 lw    $fp, 0($fp)

		 sll   $t0, $a0, 2
		 addiu $t0, $t0, -2
		 multu $t0, $v0
		 mflo  $t0
		 addiu $t1, $a0, 1
		 divu  $t0, $t1
		 mflo  $v0

		 jr    $ra

-------------------

M91:	 li    $t0, 100
		 ble   $a0, $t0, L1
		 addiu $v0, $a0, -10
		 jr    $ra
	 
L1:		 sw    $fp, -4($sp)
		 addi  $fp, $sp, -4
		 sw    $ra, -4($fp)
		 addi  $sp, $fp, -4

		 addiu $a0, $a0, 11
		 jal   M91

L2:		 move  $a0, $v0
		 jal   M91

L3:		 addi  $sp, $fp, 4
		 lw    $ra, -4($fp)
		 lw    $fp, 0($fp)

		 jr   $ra
