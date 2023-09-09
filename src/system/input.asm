init_keyboard:
    mov al, 0xFF
    out 0x64, al

    mov al, 0xF4
    out 0x60, al
    ret

getc:
    push ebp
    mov ebp, esp

    xor eax, eax

.loop:
    hlt
    mov al, [switch_screens_flag]
    or al, al
    jz .endif
    mov byte [switch_screens_flag], 0
    call switch_screens
.endif:

    mov al, [changed_input]
    or al, al
    jz .loop

    mov byte [changed_input], 0

    mov ax, [character_from_input]
    mov esp, ebp
    pop ebp
    ret