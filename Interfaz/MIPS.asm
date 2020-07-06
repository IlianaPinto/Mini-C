.data
_msg1:     .asciiz "1. Suma\n"
_msg2:     .asciiz "2. Potencia\n"
_msg3:     .asciiz "3. Fibonacci\n"
_msg4:     .asciiz "4. Salir\n"
_msg5:     .asciiz "Escoja una opción: "
_msg6:     .asciiz "Introduzca un numero: "
_msg7:     .asciiz "El resultado es: "
_msg8:     .asciiz "\n"
   .text
   .globl main
_sumar:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       sw $s0, -12($sp)
       sw $s1, -16($sp)
       move $fp, $sp
       sub $sp, $sp, 20
       move $s0, $a0
       move $s1, $a1
       move $t0, $s0
       move $t1, $s1
       add $t2, $t0, $t1
       sw $t2, -20($fp)
       lw $v0, -20($fp)
       b _fin_sumar
_fin_sumar:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       lw $s0, -12($sp)
       lw $s1, -16($sp)
       jr $ra
_potencia:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       sw $s0, -12($sp)
       sw $s1, -16($sp)
       move $fp, $sp
       sub $sp, $sp, 24
       move $s0, $a0
       move $s1, $a1
       li $t0, 1
       sw $t0, -24($fp)
       li $t0, 0
       sw $t0, -20($fp)
_etiq3:
       lw $t0, -20($fp)
       move $t1, $s1
       blt $t0, $t1, _etiq4
       b _etiq2
_etiq5:
       lw $t0, -20($fp)
       li $t1, 1
       add $t2, $t0, $t1
       sw $t2, -20($fp)
       b _etiq3
_etiq4:
       lw $t0, -24($fp)
       move $t1, $s0
       mul $t2, $t0, $t1
       sw $t2, -24($fp)
       b _etiq5
_etiq2:
       lw $v0, -24($fp)
       b _fin_potencia
_fin_potencia:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       lw $s0, -12($sp)
       lw $s1, -16($sp)
       jr $ra
_fib:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       sw $s0, -12($sp)
       move $fp, $sp
       sub $sp, $sp, 12
       move $s0, $a0
       move $t0, $s0
       li $t1, 0
       beq $t0, $t1, _etiq9
       b _etiq8
_etiq9:
       li $v0, 0
       b _fin_fib
_etiq8:
       move $t0, $s0
       li $t1, 1
       beq $t0, $t1, _etiq12
       b _etiq11
_etiq12:
       li $v0, 1
       b _fin_fib
_etiq11:
       move $t0, $s0
       li $t1, 1
       bgt $t0, $t1, _etiq15
       b _etiq14
_etiq15:
       move $t0, $s0
       li $t1, 1
       sub $t2, $t0, $t1
       move $a0, $t2
       sw $t0,-4($sp)
       sub $sp, $sp, 4
       jal _fib
       lw $t0,0($sp)
       add $sp,$sp,4
       move $t0, $v0
       move $t1, $s0
       li $t2, 2
       sub $t3, $t1, $t2
       move $a0, $t3
       sw $t0,-4($sp)
       sub $sp, $sp, 4
       jal _fib
       lw $t0,0($sp)
       add $sp,$sp,4
       move $t1, $v0
       add $t2, $t0, $t1
       move $v0, $t2
       b _fin_fib
_etiq14:
_fin_fib:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       lw $s0, -12($sp)
       jr $ra
_menu:
       sw $fp, -4($sp)
       sw $ra, -8($sp)
       move $fp, $sp
       sub $sp, $sp, 24
       li $t0, 0
       sw $t0, -12($fp)
_etiq19:
       lw $t0, -12($fp)
       li $t1, 4
       bne $t0, $t1, _etiq20
       b _etiq18
_etiq20:
       li $v0, 4
       la $a0, _msg1
       syscall
       li $v0, 4
       la $a0, _msg2
       syscall
       li $v0, 4
       la $a0, _msg3
       syscall
       li $v0, 4
       la $a0, _msg4
       syscall
       li $v0, 4
       la $a0, _msg5
       syscall
       li $v0, 5
       syscall
       sw $v0, -12($fp)
       lw $t0, -12($fp)
       li $t1, 4
       bne $t0, $t1, _etiq22
       b _etiq21
_etiq22:
       li $v0, 4
       la $a0, _msg6
       syscall
       li $v0, 5
       syscall
       sw $v0, -16($fp)
       li $v0, 4
       la $a0, _msg6
       syscall
       li $v0, 5
       syscall
       sw $v0, -20($fp)
       lw $t0, -12($fp)
       li $t1, 1
       beq $t0, $t1, _etiq24
       b _etiq25
_etiq24:
       lw $a0, -16($fp)
       lw $a1, -20($fp)
       jal _sumar
       move $t0, $v0
       sw $t0, -24($fp)
       b _etiq23
_etiq25:
       lw $t0, -12($fp)
       li $t1, 2
       beq $t0, $t1, _etiq28
       b _etiq27
_etiq28:
       lw $a0, -16($fp)
       lw $a1, -20($fp)
       jal _potencia
       move $t0, $v0
       sw $t0, -24($fp)
_etiq27:
       lw $t0, -12($fp)
       li $t1, 3
       beq $t0, $t1, _etiq31
       b _etiq30
_etiq31:
       lw $a0, -16($fp)
       jal _fib
       move $t0, $v0
       sw $t0, -24($fp)
_etiq30:
_etiq23:
       li $v0, 4
       la $a0, _msg7
       syscall
       li $v0, 1
       lw $a0, -24($fp)
       syscall
       li $v0, 4
       la $a0, _msg8
       syscall
_etiq21:
       b _etiq19
_etiq18:
_fin_menu:
       move $sp, $fp
       lw $fp, -4($sp)
       lw $ra, -8($sp)
       jr $ra
main:
       move $fp, $sp
       jal _menu
       move $t0, $v0
       li $v0,10
       syscall
