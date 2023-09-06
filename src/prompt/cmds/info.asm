info_command:
    push ebp
    mov ebp, esp

    lea eax, about_str
    push 0x0F
    push eax
    call prints

    mov esp, ebp
    pop ebp
    ret