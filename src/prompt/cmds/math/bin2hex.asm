bin2hex_command:
    push ebp
    mov ebp, esp

    push 1
    call get_argument

    push eax
    call decode_binary

    push 0x0F
    push eax
    call printh

    mov esp, ebp
    pop ebp
    ret