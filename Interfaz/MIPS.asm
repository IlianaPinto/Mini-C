.data
_i:      .word 0
_resp:      .word 0
_msg1:     .asciiz "Ingrese numero: "
_msg2:     .asciiz "\nRespuesta: "
   .text
   .globl main
_factorial:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       sw $s0, -12($sp)
       move $fp, $sp
       sub $sp, $sp, 12
       move $s0, $a0
       move $t0, $s0
       li $t1, 1
       beq $t0, $t1, _etiq2
       b _etiq3
_etiq2:
       move $v0, $s0
       b _fin_factorial
       b _etiq1
_etiq3:
       move $t0, $s0
       li $t1, 1
       sub $t2, $t0, $t1
       move $a0, $t2
       jal _factorial
       move $t0, $v0
       move $t1, $s0
       mul $t2, $t1, $t0
       move $v0, $t2
       b _fin_factorial
_etiq1:
_fin_factorial:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       lw $s0, -12($sp)
       jr $ra
main:
       move $fp, $sp
       li $v0, 4
       la $a0, _msg1
       syscall
       li $v0, 5
       syscall
       sw $v0, -4($fp)
       lw $a0, -4($fp)
       jal _factorial
       move $t0, $v0
       sw $t0, _resp
       li $v0, 4
       la $a0, _msg2
       syscall
       li $v0, 1
       lw $a0, _resp
       syscall
       li $v0,10
       syscall
