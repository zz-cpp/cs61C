.globl factorial

.data
n: .word 8

.text
main:
    la t0, n    # t0 = &(n)
    lw a0, 0(t0)    # a0 = m(t0)
    jal ra, factorial   # save return address in ra and call factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # think as for an callee and caller seperally
    addi sp,sp -16
    sw ra,12(sp)
    sw s0,8(sp)
    sw s1,4(sp)
    sw s2,0(sp)

    # YOUR CODE HERE
    add s0,a0,x0
    addi s1,x0,1
    add s2,a0,x0

    # if n == 1 return
    beq s0,s1,equal
    # if n !=1 
    addi a0,s0,-1       # pass paramater into register
    jal ra,factorial    #call factorial --->factorial(n-1)
    mul a0,s2,a0    # add return value
    jal x0,end

equal:
    add a0,s0,x0

end:
    # end resume
    lw s2,0(sp)
    lw s1,4(sp)
    lw s0,8(sp)
    lw ra,12(sp)
    addi sp,sp,16
    jr ra


