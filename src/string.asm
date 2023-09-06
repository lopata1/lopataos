; function streq
; param1 = first string
; param2 = second string
; return = if equal
streq:
    push ebp
    mov ebp, esp

    xor ecx, ecx

    mov esi, [ebp+8]
    mov edi, [ebp+12]

.loop:
    mov al, [esi+ecx]
    mov bl, [edi+ecx]

    cmp al, bl
    je .endif_zero
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
.endif_zero:

    inc ecx

    or al, al
    jnz .loop

    mov eax, 1
    mov esp, ebp
    pop ebp
    ret

strlen:
    push ebp
    mov ebp, esp

    mov esi, [ebp+8]

    xor ecx, ecx

.loop:
    mov al, [esi+ecx]
    or al, al
    jz .endloop

    inc ecx
    jmp .loop
.endloop:

    mov eax, ecx

    mov esp, ebp
    pop ebp
    ret