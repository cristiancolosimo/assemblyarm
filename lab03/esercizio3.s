.section .rodata
fmt: 
    .asciz "%d\n"

.macro print n
    adr x0, fmt
    mov w1, \n
    bl printf
.endm

.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!

    print 1
    print 2
    print 3
    print 4
    print 5

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)

