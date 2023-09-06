; function pow
; param1 = number
; param2 = exponent

pow:
    push ebp
    mov ebp, esp

    mov ecx, [ebp+12]

    or ecx, ecx
    jnz .endif
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
.endif:

    dec ecx

    xor eax, eax
    mov ebx, [ebp+8]

    add eax, ebx

.loop:
    xor edx, edx
    mul ebx
    loop .loop

    mov esp, ebp
    pop ebp
    ret
