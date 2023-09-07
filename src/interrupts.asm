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
    xor eax, eax

    in al, 0x60 

    mov bl, al
    
    shr bl, 7
    or bl, bl
    jnz .end

    cmp al, scancode_table_size
    jge .end

    lea esi, scancode_table

    mov al, byte [esi+eax]

    or al, al
    jz .end

    mov byte [character_from_input], al
    mov byte [changed_input], 1

    mov ah, 0x0f
    mov [0xb8000+158], ax

.end:
    mov al, 0x20
    out 0x20, al
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