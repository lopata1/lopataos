pomoc_command:
    push ebp
    mov ebp, esp

    push 0x0F
    call clear_screen

    push 1
    call get_argument

    push eax
    call decode_hex

    or al, al
    jnz .elseif_pomoc1
    lea esi, pomoc0_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.elseif_pomoc1:
    cmp al, 1
    jne .else
    lea esi, pomoc1_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.else:
    lea esi, pomoc_not_found_str

    push 0x0F
    push esi
    call prints
.endif:

    mov esp, ebp
    pop ebp
    ret