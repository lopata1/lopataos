scancode_table:
    ; padding
    db 0
    ; start
    db 0, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', 0x08, 0, 'Q',
    db 'W', 'E', 'R', 'T', 'Z', 'U', 'I', 'O', 'P', '[', ']', 0x0a, 'C', 'A', 'S', 'D'
    db 'F', 'G', 'H', 'J', 'K', 'L', ';', 0, 0, 0, '\', 'Y', 'X', 'C', 'V', 'B'
    db 'N', 'M', ',', '.', '/', 0, 0, 0, ' ', 0, 0x80, 0x81

scancode_table_size equ $-scancode_table