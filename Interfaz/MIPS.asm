.data
_a:      .word 0
_b:      .word 0
_c:      .word 0
_d:      .word 0
_e:      .word 0
_f:      .word 0
_g:      .word 0
_i:      .word 0
_j:      .word 0
_msg1:     .asciiz "Restultado = "
_msg2:     .asciiz "\n"
_msg3:     .asciiz "igual\n"
_msg4:     .asciiz "no igual\n"
   .text
   .globl main
_x:
main:
       li $t0, 4
       sw $t0, _a
       li $t0, 5
       sw $t0, _b
       lw $t0, _a
       lw $t1, _b
       mul $t2, $t0, $t1
       li $t0, 1
       sub $t1, $t2, $t0
       sw $t1, _c
       li $v0, 4
       la $a0, _msg1
       syscall
       li $v0, 1
       lw $a0, _c
       syscall
       li $v0, 4
       la $a0, _msg2
       syscall
       lw $t0, _a
       li $t1, 5
       beq $t0, $t1, _etiq3
       b _etiq4
_etiq3:
       li $v0, 4
       la $a0, _msg3
       syscall
       b _etiq2
_etiq4:
       li $v0, 4
       la $a0, _msg4
       syscall
_etiq2:
       li $v0,10
       syscall