.data
_p:      .word 0
_pg:      .word 0
_msg1:     .asciiz "print "
_msg2:     .asciiz " pueji"
   .text
   .globl main
main:
       move $fp, $sp
       li $t0, 5
       sw $t0, -12($fp)
       la $t0, -12($fp)
       sw $t0, -4($fp)
       lw $t0, -4($fp)
       sw $t0, -8($fp)
       lw $t0, -4($fp)
       lw $t0, 0($t0)
       li $t1, 5
       add $t2, $t0, $t1
       lw $t0, -8($fp)
       lw $t0, 0($t0)
       add $t1, $t2, $t0
       sw $t1, -12($fp)
       li $v0, 4
       la $a0, _msg1
       syscall
       lw $t9, -4($fp)
       li $v0, 1
       lw $a0, 0($t9)
       syscall
       li $v0, 4
       la $a0, _msg2
       syscall
       li $v0,10
       syscall
