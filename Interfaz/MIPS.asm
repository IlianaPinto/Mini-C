.data
_msg1:     .asciiz "i: "
_msg2:     .asciiz "El número es par"
_msg3:     .asciiz "El número es impar"
   .text
   .globl main
_impar:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       sw $s0, -12($sp)
       move $fp, $sp
       sub $sp, $sp, 12
       move $s0, $a0
       move $t0, $s0
       li $t1, 0
       beq $t0, $t1, _etiq2
       b _etiq1
_etiq2:
       li $v0, 0
       b _fin_impar
_etiq1:
_fin_impar:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       lw $s0, -12($sp)
       jr $ra
_par:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       sw $s0, -12($sp)
       move $fp, $sp
       sub $sp, $sp, 12
       move $s0, $a0
       move $t0, $s0
       li $t1, 0
       beq $t0, $t1, _etiq6
       b _etiq7
_etiq6:
       li $v0, 1
       b _fin_par
       b _etiq5
_etiq7:
       move $t0, $s0
       li $t1, 1
       sub $t2, $t0, $t1
       move $a0, $t2
       sw $t0,-4($sp)
       sub $sp, $sp, 4
       jal _impar
       lw $t0,0($sp)
       add $sp,$sp,4
       move $t0, $v0
       move $v0, $t0
       b _fin_par
_etiq5:
_fin_par:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       lw $s0, -12($sp)
       jr $ra
main:
       move $fp, $sp
       li $t0, 30
       sw $t0, -4($fp)
       lw $a0, -4($fp)
       jal _par
       move $t0, $v0
       sw $t0, -8($fp)
       li $v0, 4
       la $a0, _msg1
       syscall
       li $v0, 1
       lw $a0, -8($fp)
       syscall
       lw $t0, -8($fp)
       li $t1, 1
       beq $t0, $t1, _etiq12
       b _etiq13
_etiq12:
       li $v0, 4
       la $a0, _msg2
       syscall
       b _etiq11
_etiq13:
       li $v0, 4
       la $a0, _msg3
       syscall
_etiq11:
       li $v0,10
       syscall
