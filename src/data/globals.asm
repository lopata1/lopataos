video_mem dd 0xb8000
video_width dw 640
video_height dw 200
text_width db 80
cursor_pos dw 0
prompt_args times 30*20 db 0
hex_digits db "0123456789ABCDEF"

arg_count equ 30
arg_size equ 20
buffer_size equ 1024

disk_buffer times 512 db 0