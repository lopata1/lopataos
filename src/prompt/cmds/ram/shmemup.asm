shmemup_command:
    push ebp
    mov ebp, esp
    sub esp, 12
    ; [ebp-4] = start_address
    ; [ebp-8] = size
    ; [ebp-12] = count
    ; [ebp-16] = i

    push 1
    call get_argument
    push eax
    call decode_hex

    mov [ebp-4], eax

    push 2
    call get_argument
    push eax
    call decode_hex

    mov [ebp-8], eax

    push 3
    call get_argument
    push eax
    call decode_hex

    mov ecx, [ebp-8]
    ;mov [ebp-16], ecx

.loop:
    mov [ebp-12], eax

    mov edi, [ebp-4]
    add edi, ecx

    mov dl, [edi]
    mov ebx, [ebp-12]
    mov [edi+ebx], dl
    mov byte [edi], 0

    dec ecx
    cmp ecx, 0
    jge .loop

    lea esi, shmem_success_str
    push 0x0E
    push esi
    call prints

    mov esp, ebp
    pop ebp
    ret