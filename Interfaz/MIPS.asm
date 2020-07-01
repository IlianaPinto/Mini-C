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
_msg1:     .asciiz "Ingrese un numero: \n"
_msg2:     .asciiz "La suma es = "
   .text
   .globl main
main:
       move $fp, $sp
       li $t0, 5
       sw $t0, _b
       li $v0, 4
       la $a0, _msg1
       syscall
       li $v0, 5
       syscall
       sw $v0, _a
       li $v0, 4
       la $a0, _msg1
       syscall
       li $v0, 5
       syscall
       sw $v0, -4($fp)
       lw $t0, _a
       lw $t1, -4($fp)
       add $t2, $t0, $t1
       sw $t2, _c
       li $v0, 4
       la $a0, _msg2
       syscall
       li $v0, 1
       lw $a0, _c
       syscall
       li $v0,10
       syscall