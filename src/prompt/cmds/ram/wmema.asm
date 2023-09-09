wmema_command:
    push ebp
    mov ebp, esp
    sub esp, 20
    ; [ebp-4] = location
    ; [ebp-8] = i
    ; [ebp-12] = j
    ; [ebp-16] = next_char_to_write_index
    ; [ebp-20] = current_arg

    push 1
    call get_argument
    push eax
    call decode_hex

    mov dword [ebp-4], eax
    mov dword [ebp-8], 0

.loop:
    mov ecx, [ebp-8]

    add ecx, 2
    push ecx
    call get_argument

    mov dl, byte [eax]
    or dl, dl
    jz .endloop

    mov [ebp-20], eax


    mov eax, [ebp-16]
    or eax, eax
    jz .endif
    mov esi, [ebp-4]
    mov ecx, [ebp-16]
    mov byte [esi+ecx], ' '

    inc ecx
    mov [ebp-16], ecx
.endif:



    mov dword [ebp-12], 0
.charloop:
    mov ecx, [ebp-12]
    mov eax, [ebp-20]
    mov eax, [eax+ecx]
    or eax, eax
    jz .endcharloop

    mov esi, [ebp-4]
    mov ecx, [ebp-16]
    mov byte [esi+ecx], al

    inc ecx
    mov [ebp-16], ecx

    mov ecx, [ebp-12]
    inc ecx
    mov [ebp-12], ecx

    jmp .charloop
.endcharloop:

    mov ecx, [ebp-8]
    inc ecx
    mov dword [ebp-8], ecx
    jmp .loop
.endloop:

    lea esi, wmem_success_str
    push 0x0E
    push esi
    call prints

    mov esp, ebp
    pop ebp
    ret