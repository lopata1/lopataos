scancode_table:
    ; padding
    db 0
    ; start
    db 0, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-',
    db '=', 0x08, 0, 'Q', 'W', 'E', 'R', 'T', 'Z', 'U', 'I', 'O', 'P', '['
    db ']', 0x0a, 'C', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'
    db ';', 0, 0, 0, '\', 'Y', 'X', 'C', 'V', 'B', 'N', 'M', ',', '.'
    db '/', 0, 0, 0, ' ', 0

scancode_table_size equ $-scancode_table