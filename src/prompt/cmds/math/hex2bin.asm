hex2bin_command:
    push ebp
    mov ebp, esp
    sub esp, 4
    ; [ebp-4] = value
    ; [ebp-8] = counter

    push 1
    call get_argument

    push eax
    call decode_hex

    mov [ebp-4], eax
    mov ecx, 8

.loop:
    mov [ebp-8], ecx
    and eax, 10000000b
    or eax, eax
    jz .else
    push 0x0F
    push '1'
    call printc
    jmp .endif
.else:
    push 0x0F
    push '0'
    call printc
.endif:

    mov eax, [ebp-4]
    shl eax, 1
    mov [ebp-4], eax

    mov ecx, [ebp-8]
    loop .loop

    mov esp, ebp
    pop ebp
    ret

hex2bin_num times 8 db 0