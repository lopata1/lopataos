enable_interrupts:
    mov al, 0x11
    out 0x20, al
    out 0xA0, al

    mov al, 0x20
    out 0x21, al
    mov al, 0x28
    out 0xA1, al

    mov al, 0x04
    out 0x21, al

    mov al, 0x02
    out 0xA1, al

    mov al, 0x01
    out 0x21, al
    out 0xA1, al

    lidt [idtr]

    call init_timer
    call init_keyboard

    sti

    ret

idt:
    times 0x20 dq 0

    dw system_timer_isr
    dw 0x8
    db 0
    db 10001110b
    dw 0x0001

    dw keyboard_isr
    dw 0x8
    db 0
    db 10001110b
    dw 0x0001

    times 0x06 dq 0

    times 0x06 dq 0

    dw ata_isr
    dw 0x8
    db 0
    db 10001110b
    dw 0x0001

    times 0x51 dq 0
    ; syscalls

    dw prints_isr
    dw 0x8
    db 0
    db 10001111b
    dw 0x0001

    times 0x20 dq 0

idtr:
    dw idtr - idt - 1
    dd idt

system_timer_isr:
    pusha

    mov eax, [ms_passed]
    inc eax
    mov [ms_passed], eax

    mov al, 0x20
    out 0x20, al

    popa
    iret

keyboard_isr:
    pusha

    push ebp
    mov ebp, esp

    xor eax, eax

    in al, 0x60 

    mov bl, al
    
    shr bl, 7
    test bl, bl
    jnz .end

    cmp al, scancode_table_size
    jge .end

    lea esi, scancode_table

    mov al, byte [esi+eax]

    test al, al
    jz .end

    mov bl, [screen_mode]

    cmp al, 0x80
    jne .endif_f1
    mov byte [screen_mode], 0
    test bl, bl
    jz .endif_screen1_f1
    mov byte [switch_screens_flag], 1
.endif_screen1_f1:
    jmp .end
.endif_f1:

    cmp al, 0x81
    jne .endif_f2
    mov byte [screen_mode], 1
    test bl, bl
    jnz .endif_screen1_f2
    mov byte [switch_screens_flag], 1
.endif_screen1_f2:
    jmp .end
.endif_f2:

    test bl, bl
    jz .endif_screen1

    push eax
    call handle_screen1_input

    jmp .end
.endif_screen1:

    mov byte [character_from_input], al
    mov byte [changed_input], 1

    mov ah, 0x0f
    mov [0xb8000+158], ax

.end:
    mov al, 0x20
    out 0x20, al

    mov esp, ebp
    pop ebp

    popa
    iret


ata_isr:
    pusha

    mov al, 0x20
    out 0x20, al
    popa
    iret


prints_isr:
    pusha

    push ebp
    mov ebp, esp

    push ebx
    push eax
    call prints

    mov esp, ebp
    pop ebp

    popa
    iret