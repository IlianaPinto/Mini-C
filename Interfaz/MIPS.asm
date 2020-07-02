.data
_msg1:     .asciiz "\nHola "
_msg2:     .asciiz " asd"
   .text
   .globl main
main:
       move $fp, $sp
       li $t0, 2
       sw $t0, -4($fp)
       li $t0, 4
       sw $t0, -8($fp)
       li $t0, 6
       sw $t0, -12($fp)
       li $t0, '#'
       sb $t0, -17($fp)
       li $v0, 12
       syscall
       sb $v0, -18($fp)
       lw $t0, -4($fp)
       lw $t1, -8($fp)
       blt $t0, $t1, _etiq2
       b _etiq3
_etiq3:
       lw $t0, -12($fp)
       lw $t1, -8($fp)
       bgt $t0, $t1, _etiq2
       b _etiq1
_etiq2:
       li $v0, 4
       la $a0, _msg1
       syscall
       li $v0, 11
       lb $a0, -18($fp)
       syscall
       li $v0, 4
       la $a0, _msg2
       syscall
_etiq1:
       li $v0,10
       syscall