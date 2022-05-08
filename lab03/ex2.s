.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text
main:
    addi t0, x0, 0  # t0 = 0
    addi s0, x0, 0  # s0 = 0
    la s1, source   # s1 = M(source)
    la s2, dest     # s2 = M(dest)
loop:
    slli s3, t0, 2  # s3 = t0 * 4 s3
    add t1, s1, s3  # t1 = s1 + s3
    lw t2, 0(t1)    # t2 = M(t1 + 0)
    beq t2, x0, exit    # if t2 == 0 jump exit
    add a0, x0, t2      # a0 = t2 + 0

    addi sp, sp, -8     # add sp(calling) 
    sw t0, 0(sp)        # save t0
    sw t2, 4(sp)        # save t2 --> source
    jal square          # call square
    lw t0, 0(sp)        # resume t0
    lw t2, 4(sp)        # resume t2  t2 --> source
    addi sp, sp, 8      # substract assignment space
    add t2, x0, a0      # t2 = a0
    add t3, s2, s3      # t3 = s3 + s2  -->comclude the address od dest[k]
    sw t2, 0(t3)        # [t3] = t2  t3 --> dest[k]
    add s0, s0, t2      # s0 = s0 + t2  ==> S0 --> sum
    addi t0, t0, 1      # t0 = t0 + 1   ==> t0 --> k
    jal x0, loop
square:
    add t0, a0, x0
    add t1, a0, x0
    addi t0, t0, 1
    addi t2, x0, -1
    mul t1, t1, t2
    mul a0, t0, t1
    jr ra
exit:
    add a0, x0, s0
    add a1, x0, x0
    ecall # Terminate ecall