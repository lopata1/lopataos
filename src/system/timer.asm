init_timer:
    mov al, 00110110b
    out 0x43, al

    mov ax, 1193
    out 0x40, al
    mov al, ah
    out 0x40, al

    ret



sleep:
    push ebp
    mov ebp, esp
    
    mov dword [ms_passed], 0
    mov eax, [ebp+8]

.loop:
    hlt
    cmp eax, [ms_passed]
    jg .loop

    mov esp, ebp
    pop ebp
    ret