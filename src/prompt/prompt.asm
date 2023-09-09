print_start_screen:
    push ebp
    mov ebp, esp

    push 0x0f
    call clear_screen

    lea esi, title_str
    push 0x04
    push esi
    call prints

    lea esi, welcome_str
    push 11001111b
    push esi
    call prints

    lea esi, command_input_str
    push 0x0F
    push esi
    call prints

    mov esp, ebp
    pop ebp
    ret


prompt_loop:
    push ebp
    mov ebp, esp
    sub esp, 12
    ; ebp-4 = buffer
    ; ebp-8 = char_typed
    ; ebp-12 = i
    mov dword [ebp-12], 0

    lea edi, buffer
    mov [ebp-4], edi

.loop_main:
    call getc
    mov [ebp-8], al


    mov al, [ebp-8]
    cmp al, 0x08 ; backspace
    jne .elseif_newline

    mov ecx, [ebp-12]

    or ecx, ecx
    jz .loop_main
    
    dec ecx

    mov edi, [ebp-4]
    mov byte [edi+ecx], 0

    mov dword [ebp-12], ecx

    call get_cursor_pos
    mov eax, [cursor_pos]
    dec eax
    push eax
    call set_cursor_pos

    push 0x0F
    push 0
    call printc

    call get_cursor_pos
    mov eax, [cursor_pos]
    dec eax
    push eax
    call set_cursor_pos

    jmp .loop_main
.elseif_newline:
    mov al, [ebp-8]
    cmp al, 0x0a
    jne .endif
    lea eax, nl_cr_str
    push 0
    push eax
    call prints

    mov eax, [ebp-12]
    mov edi, [ebp-4]
    mov byte [edi+eax], 0

    call handle_command

    lea eax, text_after_command_str
    push 10001111b
    push eax
    call prints

.loop_wait_for_enter:
    call getc
    cmp al, 0xa
    jne .loop_wait_for_enter

    call print_start_screen

    mov dword [ebp-12], 0
    jmp .loop_main
.endif:

    mov al, [ebp-8]
    push 0x0F
    and eax, 0xFF
    push eax
    call printc

    mov edi, [ebp-4]
    mov al, [ebp-8]
    mov ecx, [ebp-12]
    mov [edi+ecx], al
    inc ecx
    mov [ebp-12], ecx
    jmp .loop_main

    mov esp, ebp
    pop ebp
    ret



handle_command:
    push ebp
    mov ebp, esp

    call clear_arguments
    call parse_command

    lea esi, prompt_args

.if_cmd_info:
    push esi
    lea esi, cmd_info_str
    push esi
    call streq
    or al, al
    jz .elseif_cmd_pomoc
    call info_command

    jmp .endif
.elseif_cmd_pomoc:
    lea esi, prompt_args
    push esi
    lea esi, cmd_pomoc_str
    push esi
    call streq
    or al, al
    jz .elseif_cmd_rmem
    call pomoc_command

    jmp .endif

.elseif_cmd_rmem:
    lea esi, prompt_args
    push esi
    lea esi, cmd_rmem_str
    push esi
    call streq
    or al, al
    jz .elseif_cmd_wmem
    call rmem_command

    jmp .endif

.elseif_cmd_wmem:
    lea esi, prompt_args
    push esi
    lea esi, cmd_wmem_str
    push esi
    call streq
    or al, al
    jz .elseif_ref_man
    call wmem_command

    jmp .endif

.elseif_ref_man:
    lea esi, prompt_args
    push esi
    lea esi, cmd_ref_str
    push esi
    call streq
    or al, al
    jz .elseif_cmd_run
    call ref_command

    jmp .endif
.elseif_cmd_run:
    lea esi, prompt_args
    push esi
    lea esi, cmd_run_str
    push esi
    call streq
    or al, al
    jz .elseif_cmd_bin2hex
    call run_command

    jmp .endif

.elseif_cmd_bin2hex:
    lea esi, prompt_args
    push esi
    lea esi, cmd_bin2hex_str
    push esi
    call streq
    or al, al
    jz .elseif_cmd_hex2bin
    call bin2hex_command

    jmp .endif
.elseif_cmd_hex2bin:
    lea esi, prompt_args
    push esi
    lea esi, cmd_hex2bin_str
    push esi
    call streq
    or al, al
    jz .elseif_cmd_wmema
    call hex2bin_command

    jmp .endif
.elseif_cmd_wmema:
    lea esi, prompt_args
    push esi
    lea esi, cmd_wmema_str
    push esi
    call streq
    or al, al
    jz .elseif_cmd_wmemb
    call wmema_command

    jmp .endif
.elseif_cmd_wmemb:
    lea esi, prompt_args
    push esi
    lea esi, cmd_wmemb_str
    push esi
    call streq
    or al, al
    jz .elseif_cmd_rmema
    call wmemb_command

    jmp .endif

.elseif_cmd_rmema:
    lea esi, prompt_args
    push esi
    lea esi, cmd_rmema_str
    push esi
    call streq
    or al, al
    jz .else
    call rmema_command

    jmp .endif

.else:
    lea esi, unknown_command_str
    push 0x0F
    push esi
    call prints
.endif:
    mov esp, ebp
    pop ebp
    ret

parse_command:
    push ebp
    mov ebp, esp
    sub esp, 12
    ; [ebp-4] = arg_number
    ; [ebp-8] = arg_iterator
    ; [ebp-12] = cmd_char

    mov dword [ebp-4], 0
    mov dword [ebp-8], 0

    lea esi, buffer
    xor ecx, ecx
.loop:
    mov dl, byte [esi+ecx]
    mov byte [ebp-12], dl

.if_space:
    cmp dl, ' '
    jne .elseif_null
    mov dword [ebp-8], 0
    mov eax, [ebp-4]
    inc eax
    mov dword [ebp-4], eax

    inc ecx
    jmp .loop
.elseif_null:
    or dl, dl
    jnz .else
    
    lea edi, prompt_args
    
    ; base+i*arg_size+j
    mov eax, [ebp-4]
    mov ebx, arg_size
    mul ebx
    mov ebx, [ebp-8]
    add eax, ebx

    mov byte [edi+eax], 0

    jmp .endloop
.else:

    lea edi, prompt_args
    
    ; base+i*arg_size+j
    mov eax, [ebp-4]
    mov ebx, arg_size
    mul ebx
    mov ebx, [ebp-8]
    add eax, ebx

    mov dl, byte [ebp-12]
    mov byte [edi+eax], dl

.endif:

    

    mov eax, [ebp-8]
    inc eax
    mov [ebp-8], eax

    inc ecx
    jmp .loop
.endloop:

    mov esp, ebp
    pop ebp
    ret
