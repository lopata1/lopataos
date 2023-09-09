; function print
; param1 = string
; param2 = color code
prints:
    push ebp
    mov ebp, esp
    sub esp, 4

    mov esi, [ebp+8]
     
    xor ecx, ecx
    xor ebx, ebx
    call get_cursor_pos
    mov bx, [cursor_pos]

    ; while ((al = byte [esi]) != 0)
.loop:
    mov al, byte [esi]
    or al, al
    jz .endloop

    ; new line
    cmp al, 0x0a
    jne .endif_newline
    xor eax, eax
    mov al, byte [text_width]
    add ecx, eax
    inc esi
    jmp .loop
.endif_newline:

    ; carriage return
    cmp al, 0x0d
    jne .endif_carry
    xor edx, edx
    mov eax, ebx
    add eax, ecx

    xor ebx, ebx
    mov bl, byte [text_width]
    div ebx
    mul ebx

    mov ebx, eax
    xor ecx, ecx
    inc esi
    jmp .loop
.endif_carry:

    mov ah, [ebp+12]
        
    mov edi, [video_mem]

    mov edx, ebx
    add edx, edx
    add edi, edx

    mov edx, ecx
    add edx, edx    
    add edi, edx

    mov [edi], ax

    inc ecx
    inc esi
    jmp .loop
.endloop:

    add ebx, ecx
    push ebx
    call set_cursor_pos

    mov esp, ebp
    pop ebp
    ret

printc:
    push ebp
    mov ebp, esp
     
    xor ecx, ecx
    xor ebx, ebx
    call get_cursor_pos
    mov bx, [cursor_pos]

    mov al, byte [ebp+8]

    ; new line
    cmp al, 0x0a
    jne .endif_newline
    xor eax, eax
    mov al, byte [text_width]
    add ebx, eax

    push ebx
    call set_cursor_pos

    mov esp, ebp
    pop ebp
    ret
.endif_newline:

    ; carriage return
    cmp al, 0x0d
    jne .endif_carry
    xor edx, edx
    mov eax, ebx
    xor ebx, ebx
    mov bl, byte [text_width]
    div ebx
    mul ebx
    mov ebx, eax
    xor ecx, ecx
.endif_carry:

    mov ah, [ebp+12]
    
    mov edi, [video_mem]

    mov ecx, ebx
    add ecx, ecx

    mov [edi+ecx], ax

    inc ebx
    push ebx
    call set_cursor_pos

    mov esp, ebp
    pop ebp
    ret

; function set_cursor_pos
; param1 = position
set_cursor_pos:
    push ebp
    mov ebp, esp
    

    mov bx, [ebp+8]

    mov dx, 0x03D4
	mov al, 0x0F
	out dx, al
 
	inc dl
	mov al, bl
	out dx, al
 
	dec dl
	mov al, 0x0E
	out dx, al
 
	inc dl
	mov al, bh
	out dx, al

    mov esp, ebp
    pop ebp
    ret

; function printh
; param1 = 8 bit number
; param2 = color
printh:
    push ebp
    mov ebp, esp

    xor eax, eax
    mov al, [ebp+8]
    shr al, 4
    lea esi, hex_digits
    mov dl, [esi+eax]

    mov bl, [ebp+12]
    push ebx
    push edx
    call printc
    

    xor eax, eax
    mov al, [ebp+8]
    and al, 0x0F
    lea esi, hex_digits
    mov dl, [esi+eax]

    mov bl, [ebp+12]
    push ebx
    push edx
    call printc

    


    mov esp, ebp
    pop ebp
    ret


;uint16_t pos = 0;
;    outb(0x3D4, 0x0F);
 ;   pos |= inb(0x3D5);
  ;  outb(0x3D4, 0x0E);
   ; pos |= ((uint16_t)inb(0x3D5)) << 8;
    ;return pos;

get_cursor_pos:
    push ebp
    mov ebp, esp

    ;outb(0x3D4, 0x0F);
    mov dx, 0x3D4
    mov al, 0x0F
    out dx, al

    ;pos |= inb(0x3D5);

    mov dx, 0x3D5
    in al, dx

    mov bl, al

    mov dx, 0x3D4
    mov al, 0x0E
    out dx, al

    mov dx, 0x3D5
    in al, dx

    mov bh, al

    mov [cursor_pos], bx

    mov esp, ebp
    pop ebp
    ret


clear_screen:
    push ebp
    mov ebp, esp


    mov bh, [ebp+8]
    xor bl, bl
    mov edi, [video_mem]

    mov ecx, 0
.loop:
    mov [edi+ecx], bx
    add ecx, 2
    cmp ecx, 80*25*2
    jl .loop

    push 0
    call set_cursor_pos

    mov esp, ebp
    pop ebp
    ret

; function printn
; param1 = number
; param2 = color
printn:
    push ebp
    mov ebp, esp
    sub esp, 4
    ; [ebp-4] = digit position

    mov dword [ebp-4], 0

    xor eax, eax
    mov eax, [ebp+8]


    mov esp, ebp
    pop ebp
    ret