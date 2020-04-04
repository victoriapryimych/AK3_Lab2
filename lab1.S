.global lab1
.syntax unified
#define a #5
#define b #2
#define c #3

//(a-b)*3 + 2^c
lab1:
    push {lr}
    // calculate
    mov r0, a
    mov r1, b
    mov r2, c
    mov r3, #3
    mov r4, #1
    bl test_var
    pop {pc}

test_var:
    push {r0, r1, r2, r3, r4, lr}
    sub r0, r1
    mul r0, r3

pow:
    sub r2, #1
    lsl r4, #1
    cmp r2, #0
    bne pow

    add r0, r4
    pop {r0, r1, r2, r3, r4, pc}

