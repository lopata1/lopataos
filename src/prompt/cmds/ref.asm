ref_command:
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
    lea esi, ref_arg_ins_str
    push esi
    call streq
    or al, al
    jz .elseif_insset1
    lea esi, ref_ins_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.elseif_insset1:
    mov eax, [ebp-4]
    push eax
    lea esi, ref_arg_insset1_str
    push esi
    call streq
    or al, al
    jz .elseif_insset2
    lea esi, ref_insset1_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.elseif_insset2:
    mov eax, [ebp-4]
    push eax
    lea esi, ref_arg_insset2_str
    push esi
    call streq
    or al, al
    jz .elseif_insset3
    lea esi, ref_insset2_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.elseif_insset3:
    mov eax, [ebp-4]
    push eax
    lea esi, ref_arg_insset3_str
    push esi
    call streq
    or al, al
    jz .elseif_insset4
    lea esi, ref_insset3_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.elseif_insset4:
    mov eax, [ebp-4]
    push eax
    lea esi, ref_arg_insset4_str
    push esi
    call streq
    or al, al
    jz .elseif_insset5
    lea esi, ref_insset4_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.elseif_insset5:
    mov eax, [ebp-4]
    push eax
    lea esi, ref_arg_insset5_str
    push esi
    call streq
    or al, al
    jz .elseif_insset6
    lea esi, ref_insset5_str

    push 0x0F
    push esi
    call prints

    jmp .endif
.elseif_insset6:
    mov eax, [ebp-4]
    push eax
    lea esi, ref_arg_insset6_str
    push esi
    call streq
    or al, al
    jz .else
    lea esi, ref_insset6_str

    push 0x0F
    push esi
    call prints

    jmp .endif

.else:
    lea esi, ref_arg_not_found_str

    push 0x0F
    push esi
    call prints
.endif:

    mov esp, ebp
    pop ebp
    ret
