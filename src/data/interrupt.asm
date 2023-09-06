ms_passed dd 0
changed_input db 0
buffer times 1024 db 0
character_from_input dw 0

address_to_rw_disk dd disk_buffer
is_disk_writing db 0