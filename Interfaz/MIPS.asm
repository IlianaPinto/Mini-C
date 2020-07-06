.data
_a:      .word 0
_b:      .word 0
_c:      .word 0
_msg1:     .asciiz " "
_msg2:     .asciiz "aaaa: "
_msg3:     .asciiz "\n"
   .text
   .globl main
_acceso:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       sw $s0, -12($sp)
       move $fp, $sp
       sub $sp, $sp, 20
       move $s0, $a0
       li $t0, 5
       sw $t0, -16($fp)
       move $t0, $s0
       lw $t1, -16($fp)
       add $t2, $t0, $t1
       sw $t2, -20($fp)
       li $v0, 1
       lw $a0, -20($fp)
       syscall
       li $v0, 4
       la $a0, _msg1
       syscall
_fin_acceso:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       lw $s0, -12($sp)
       jr $ra
_acceso2:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       sw $s0, -12($sp)
       move $fp, $sp
       sub $sp, $sp, 12
       move $s0, $a0
       li $v0, 1
       move $a0, $s0
       syscall
       li $v0, 4
       la $a0, _msg1
       syscall
_fin_acceso2:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       lw $s0, -12($sp)
       jr $ra
main:
       move $fp, $sp
       li $t0, 1
       sw $t0, _a
       li $t0, 2
       li $t1, 2
       add $t2, $t0, $t1
       sw $t2, _b
       li $t0, 5
       sw $t0, _c
       lw $a0, _a
       jal _acceso
       li $v0, 4
       la $a0, _msg2
       syscall
       li $v0, 1
       lw $a0, _c
       syscall
       li $v0, 4
       la $a0, _msg3
       syscall
       lw $a0, _b
       jal _acceso2
       li $v0,10
       syscall
