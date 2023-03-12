.global main  // entry point of libc

.section .rodata
int_scan: .asciz "%d"
int_print: .asciz "%d\n"
scan_req: .asciz "value: "
richiesta_1: .asciz "quanti numeri devo sommare ?\n"
.section .data
somma: .word 0
n_numeri: .word 0
.macro printmsg msg
    adr x0, \msg
    bl printf
.endm
.macro print fmt msg
    adr x0, \fmt
    ldr x1, \msg
    bl printf
.endm
.macro scan fmt value
    adr x0, scan_req
    bl printf


    adr x0, \fmt
    ldr x1, =\value
    bl scanf
.endm


.text
main:

    stp     x29, x30, [sp, #-16]!
    scan int_scan, n_numeri
    print int_print, n_numeri

    ldr x20, n_numeri
    adr x21, n_numeri
    adr x23, somma
    mov x22,0

    loop:
        cmp w20, 0
        beq loopexit

        add w22,w22, w20
        sub w20,w20,1
        b loop
    loopexit:
    str w22, [x23]
    print int_print somma
    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
