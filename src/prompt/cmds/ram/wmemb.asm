wmemb_command:
    push ebp
    mov ebp, esp
    sub esp, 8
    ; [ebp-4] = location
    ; [ebp-8] = i

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
    test dl, dl
    jz .endloop

    push eax
    call decode_binary

    mov esi, [ebp-4]
    mov ecx, [ebp-8]
    mov byte [esi+ecx], al

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