wmem_command:
    push ebp
    mov ebp, esp
    sub esp, 8
    ; [ebp-4] = location
    ; [ebp-8] = i

    push 1
    call get_argument
    push eax
    call hex_to_num_value

    mov dword [ebp-4], eax
    mov dword [ebp-8], 0

.looparg:
    mov ecx, [ebp-8]

    add ecx, 2
    push ecx
    call get_argument

    mov dl, byte [eax]
    or dl, dl
    jz .endloop

.endloop


    lea esi, wmem_success_str
    push 0x0E
    push esi
    call prints

    mov esp, ebp
    pop ebp
    ret