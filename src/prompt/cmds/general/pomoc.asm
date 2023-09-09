pomoc_command:
    push ebp
    mov ebp, esp

    ;xor edx, edx
    ;mov eax, 2
    ;mov ebx, buffer_size
    ;mul ebx

    ;lea esi, prompt_args
    ;add esi, eax

    lea esi, pomoc_str

    push 0x0F
    push esi
    call prints

    mov esp, ebp
    pop ebp
    ret