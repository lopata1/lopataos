switch_screens:
    push ebp
    mov ebp, esp

    xor eax, eax
    xor ecx, ecx

    mov esi, [video_mem]
    lea edi, saved_screen_buffer

.loop:
    mov ax, [2*ecx+esi] ;this
    mov bx, [2*ecx+edi]
    mov [2*ecx+edi], ax
    mov [2*ecx+esi], bx

    inc ecx
    ;cmp ecx, 80*25
    cmp ecx, 80*25
    jl .loop

    call get_cursor_pos

    mov ax, [cursor_pos]
    xor ebx, ebx
    mov bx, [saved_cursor_pos]

    mov [cursor_pos], bx
    mov [saved_cursor_pos], ax

    push ebx
    call set_cursor_pos

    mov esp, ebp
    pop ebp
    ret



handle_screen1_input:
    push ebp
    mov ebp, esp
    sub esp, 12
    ; ebp-4 = buffer
    ; ebp-8 = char_typed
    ; ebp-12 = i

;.loop_main:
    mov al, [ebp+8]


    mov al, [ebp+8]
    cmp al, 0x08 ; backspace
    jne .elseif_newline

    call get_cursor_pos
    xor ecx, ecx
    mov cx, [cursor_pos]

    or ecx, ecx
    jz .end

    dec ecx
    mov esi, [video_mem]
    mov al, [2*ecx+esi]
    or al, al
    jnz .endif_zero
        
.loop_while_zero:
    dec ecx
    mov esi, [video_mem]
    mov al, [2*ecx+esi]
    or al, al
    jz .loop_while_zero

    inc ecx

.endif_zero:


    push ecx
    call set_cursor_pos

    push 0x0F
    push 0
    call printc

    call get_cursor_pos
    mov eax, [cursor_pos]
    dec eax
    push eax
    call set_cursor_pos

    jmp .end
.elseif_newline:
    mov al, [ebp+8]
    cmp al, 0x0a
    jne .endif
    lea eax, nl_cr_str
    push 0
    push eax
    call prints

    jmp .end
.endif:

    mov al, [ebp+8]
    push 0x0F
    push eax
    call printc

.end:

    mov esp, ebp
    pop ebp
    ret