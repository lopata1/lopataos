title_str db "                          Lopata Operativni Sistem", 0x0d, 0x0a, 0x0a, 0
welcome_str db "Dobrodosli!", 0x0d, 0x0a, 0x0a, 0x0a, 0
command_input_str db "Komanda >", 0
text_after_command_str db 0x0d, 0x0a, 0x0a, "Pritisni enter da bi ponovo kucao komandu...", 0
nl_cr_str db 0x0d, 0x0a, 0
unknown_command_str db "Nepoznata komanda", 0xd, 0xa, 0
wmem_success_str db "Podaci uspjesno upisani u adresu.", 0x0d, 0x0a, 0

; COMMANDS

cmd_info_str db "INFO", 0
cmd_pomoc_str db "POMOC", 0
cmd_rmem_str db "RMEM", 0
cmd_wmem_str db "WMEM", 0
cmd_rmema_str db "RMEMA", 0
cmd_man_str db "MAN", 0

pomoc_str db "Pomoc komanda", 0x0d, 0x0a, 0x0a
db "POMOC - ova komanda", 0x0d, 0x0a 
db "INFO - informacije o operativnom sistemu", 0x0d, 0x0a
db "MAN [IME] - pregled prirucnika gdje ime moze biti INS", 0x0d, 0x0a
db "RMEM [LOKACIJA] [KOLICINA] - cita radnu memoriju", 0x0d, 0x0a
db "RMEMA [LOKACIJA] [KOLICINA] - cita radnu memoriju u ASCII formatu", 0x0d, 0x0a
db "WMEM [LOKACIJA] [PODACI...] - pise u radnu memoriju date podatke", 0x0d, 0x0a, 0


about_str db "Verzija v0.02 DEV", 0x0d, 0x0a, 0x0a, "Napravio lopata", 0x0d, 0x0a, 0
man_arg_not_found_str db "Prirucnik ne postoji.", 0x0d, 0x0a, 0
man_arg_ins_str db "INS", 0
man_arg_insset_str db "INSSET", 0
man_ins_str: 
db "INSTRUCTION:", 0x0d, 0x0a
db "[OPCODE] [MOD R/M] [SIB] [DISPLACEMENT] [IMMEDIATE]", 0x0d, 0x0a
db "  1/2       0/1     0/1     0/1/2/4       0/1/2/4    BYTES", 0x0d, 0x0a
db 0x0a
db "[MOD R/M]:", 0x0d, 0x0a
db "7 6    5 4 3    2 1 0", 0x0d, 0x0a
db "MOD REG/OP/CODE  R/M", 0x0d, 0x0a
db 0x0a
db "[SIB BYTE]:", 0x0d, 0x0a
db " 7 6   5 4 3  2 1 0", 0x0d, 0x0a
db "SCALE  INDEX   BASE", 0x0d, 0x0a
db 0x0a
db "REGISTERS:", 0x0d, 0x0a
db "       00 01 02 03 04 05 06 07", 0x0d, 0x0a
db "REG8   AL CL DL BL AH CH DH BH", 0x0d, 0x0a
db "REG16  AX CX DX BX SP BP SI DI", 0x0d, 0x0a
db "REG32  AX CX DX BX SP BP SI DI (PREFIX E)", 0x0d, 0x0a
db "SEG    DS ES FS GS SS CS IP", 0x0d, 0x0a, 0

man_insset_str db "INSSET1234567", 0

works_str db "works...", 0x0d, 0x0a, 0