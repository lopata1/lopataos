rmem_command:
    push ebp
    mov ebp, esp
    sub esp, 12
    ; [ebp-4] = location
    ; [ebp-8] = number of times
    ; [ebp-12] = i

    push 1
    call get_argument
    push eax
    call hex_to_num_value

    mov dword [ebp-4], eax

    push 2
    call get_argument
    push eax
    call hex_to_num_value

    mov dword [ebp-8], eax

    mov dword [ebp-12], 0

    
    xor ebx, ebx

.loop:
    mov ecx, [ebp-8]
    mov ebx, [ebp-12]

    xor edx, edx
    mov eax, ebx
    mov ebx, 16
    div ebx

    or edx, edx
    jnz .endif
    ;mov ebx, [ebp-12]
    ;or ebx, ebx
    ;jz .endif
    push 0x0F
    push nl_cr_str
    call prints

.endif:

    mov esi, [ebp-4]
    mov ebx, [ebp-12]
    mov eax, [esi+ebx]

    push 0x0E
    push eax
    call printh

    push 0x0F
    push ' '
    call printc



    mov ecx, [ebp-8]
    mov ebx, [ebp-12]

    inc ebx
    mov dword [ebp-12], ebx

    cmp ebx, ecx
    jl .loop

    mov esp, ebp
    pop ebp
    ret