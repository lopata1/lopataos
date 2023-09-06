; function get_argument
; param1 = argument number
; return = argument pointer

get_argument:
    push ebp
    mov ebp, esp

    xor edx, edx
    mov eax, [ebp+8]
    mov ebx, arg_size
    mul ebx

    lea esi, prompt_args
    add esi, eax

    mov eax, esi

    mov esp, ebp
    pop ebp
    ret

clear_arguments:
    push ebp
    mov ebp, esp


    lea esi, prompt_args
    mov ecx, arg_count*arg_size-1

.loop:
    mov byte [esi+ecx], 0
    loop .loop

    mov esp, ebp
    pop ebp
    ret