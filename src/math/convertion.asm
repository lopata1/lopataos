hex_to_num_value:
    push ebp
    mov ebp, esp
    sub esp, 16
    ; [ebp-4] = result
    ; [ebp-8] = digit position
    ; [ebp-12] = length
    ; [ebp-16] = i

    mov dword [ebp-4], 0
    mov dword [ebp-8], 0
    mov dword [ebp-16], 0

    mov esi, [ebp+8]
    push esi
    call strlen
    mov dword [ebp-12], eax

    mov ecx, eax
    xor edx, edx

.loop:
    xor edx, edx
    mov eax, dword [ebp-16]
    mov dl, [esi+eax]

    or dl, dl
    jz .endloop

    sub dl, '0'

    cmp dl, 10
    jl .endif
    sub dl, 7
.endif:


    mov eax, ecx
    dec eax
.shiftingloop:
    or eax, eax
    jz .shiftingloopend
    shl edx, 4

    dec eax
    jmp .shiftingloop
.shiftingloopend:


    mov eax, [ebp-4]
    add eax, edx
    mov dword [ebp-4], eax

    mov eax, dword [ebp-16]
    inc eax
    mov dword [ebp-16], eax
    loop .loop
.endloop:

    mov eax, [ebp-4]

    mov esp, ebp
    pop ebp
    ret