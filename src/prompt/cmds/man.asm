man_command:
    push ebp
    mov ebp, esp
    sub esp, 4
    ; [ebp-4] = man argument

    push 0x0F
    call clear_screen

    push 1
    call get_argument

    mov dword [ebp-4], eax

    push eax
    lea esi, man_arg_ins_str
    push esi
    call streq
    or al, al
    jz .elseif
    lea esi, man_ins_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.elseif:
    mov eax, [ebp-4]
    push eax
    lea esi, man_arg_insset_str
    push esi
    call streq
    or al, al
    jz .else
    lea esi, man_insset_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.else:
    lea esi, man_arg_not_found_str

    push 0x0F
    push esi
    call prints
.endif:

    mov esp, ebp
    pop ebp
    ret