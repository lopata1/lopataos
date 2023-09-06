[org 0x7c00]
[bits 16]

mov ax, 0x1000
mov es, ax
xor bx, bx

mov ah, 0x02
mov al, 0x40
mov ch, 0x00
mov cl, 0x02
mov dh, 0x00
;mov dl, 0x80
int 0x13

mov ah, 0x01
int 0x13
;jc disk_status

xor ah, ah
mov al, 0x03
int 0x10

cli

in al, 0x92
or al, 2
out 0x92, al

mov ax, 0
mov ds, ax ; lukflug suggested this i think

lgdt [gdtr]
mov eax, cr0
or al, 1
mov cr0, eax


jmp 8h:protected_mode ; this works now

protected_mode:
    [bits 32]
    mov ax,10h
    mov ds,ax
    mov es,ax
    mov fs,ax
    mov gs,ax
    mov ss,ax
    mov esp, 0x105000

    jmp 0x10000 ; crashes here

gdt:
    ;null descriptor
    dq 0

    ;code descriptor
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b
    db 11001111b
    db 0x00
    
    ;data descriptor
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b
    db 11001111b
    db 0x00

gdtr:
    dw gdtr - gdt - 1
    dd gdt



disk_status:
    add ah, 'A'

    mov al, ah
    mov ah, 0x0e
    int 0x10

    jmp $


times 510 - ($ - $$) db 0
dw 0xaa55