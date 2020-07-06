.data
_p:      .word 0
_pg:      .word 0
_msg1:     .asciiz "print "
_msg2:     .asciiz " pueji\n"
_msg3:     .asciiz "if "
_msg4:     .asciiz "else "
   .text
   .globl main
_x:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       sw $s0, -12($sp)
       move $fp, $sp
       sub $sp, $sp, 20
       move $s0, $a0
       li $t0, 10
       move $t1, $s0
       add $t2, $t0, $t1
       sw $t2, -20($fp)
       la $t0, -20($fp)
       sw $t0, -16($fp)
       lw $t0, -16($fp)
       lw $v0, 0($t0)
       b _fin_x
_fin_x:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       lw $s0, -12($sp)
       jr $ra
main:
       move $fp, $sp
       li $t0, 5
       sw $t0, -12($fp)
       la $t0, -12($fp)
       sw $t0, -4($fp)
       lw $t0, -4($fp)
       sw $t0, _pg
       lw $t0, -4($fp)
       lw $t0, 0($t0)
       li $t1, 5
       add $t2, $t0, $t1
       lw $t0, _pg
       lw $t0, 0($t0)
       add $t1, $t2, $t0
       sw $t1, -12($fp)
       li $v0, 4
       la $a0, _msg1
       syscall
       lw $t0, -4($fp)
       li $v0, 1
       lw $a0, 0($t0)
       syscall
       li $v0, 4
       la $a0, _msg2
       syscall
       lw $t0, -4($fp)
       lw $t0, 0($t0)
       li $t1, 6
       bgt $t0, $t1, _etiq3
       b _etiq4
_etiq3:
       li $v0, 4
       la $a0, _msg3
       syscall
       lw $t0, -4($fp)
       li $v0, 1
       lw $a0, 0($t0)
       syscall
       li $v0, 4
       la $a0, _msg2
       syscall
       li $a0, 61
       jal _x
       move $t0, $v0
       sw $t0, -12($fp)
       li $v0, 1
       lw $a0, -12($fp)
       syscall
       b _etiq2
_etiq4:
       li $v0, 4
       la $a0, _msg4
       syscall
       lw $t0, -4($fp)
       li $v0, 1
       lw $a0, 0($t0)
       syscall
       li $v0, 4
       la $a0, _msg2
       syscall
_etiq2:
       li $v0,10
       syscall
