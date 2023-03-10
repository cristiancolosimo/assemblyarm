.global main  // entry point of libc

.section .rodata
mesg:
    .asciz "Hello World\n"
int_scan: .asciz "%d"
int_print: .asciz "%d\n"
scan_req: .asciz "value: "
richiesta_1: .asciz "quanti valori vuoi sommare ?"
richiesta_2: .asciz "Inserisci valore da sommare"

.section .data
max: .quad 10
input: .quad 0
temp: .quad 0
somma: .quad 0
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

.text  // short for .section .text
main:
    // print "Hello World\n"
    stp     x29, x30, [sp, #-16]!
    mov w18, #0
    # ldr  carica dalla memoria al registro
    # adr x0,mesg salva l'indirizzo di memoria  di meag in x0
    # str  x20, x1 salva dal registro dentro a un indirizzo di memoria, ma l'indirizzo deve essere passato tramite un secondo registro, a cui gli è stato assegnato come valore l'indirizzo tramite adr

    # cmp w18, w19, inizia comparazione tra w18 e w19, e sotto ci si mette beq equivalente, bge greater > , ble lower <
    
    printmsg richiesta_1
    scan int_scan, input
    print int_print, input
    ldr x19, input
    ldr x20, somma
    loop:
        cmp w18, w19
        beq endloop
        printmsg richiesta_2
        scan int_scan, temp
        ldr x21, temp
        add x20,x20,x21
        add x18,x18,#1
        b loop
    endloop:

    adr x1, somma
    str  x20, [x1]
    print int_print,  somma
    // return 0
    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
