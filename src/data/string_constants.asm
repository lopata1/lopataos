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
cmd_wmema_str db "WMEMA", 0
cmd_wmemb_str db "WMEMB", 0
cmd_rmema_str db "RMEMA", 0
cmd_ref_str db "REF", 0
cmd_run_str db "RUN", 0
cmd_bin2hex_str db "BIN2HEX", 0
cmd_hex2bin_str db "HEX2BIN", 0

pomoc_str db "Pomoc komanda", 0x0d, 0x0a, 0x0a
db "POMOC - ova komanda", 0x0d, 0x0a 
db "INFO - informacije o operativnom sistemu", 0x0d, 0x0a
db "REF [IME] - pregled referenci: INS, INSSET1", 0x0d, 0x0a
db "RMEM [LOKACIJA] [KOLICINA] - cita radnu memoriju", 0x0d, 0x0a
db "RMEMA [LOKACIJA] [KOLICINA] - cita radnu memoriju u ASCII formatu", 0x0d, 0x0a
db "WMEM [LOKACIJA] [PODACI...] - pise u radnu memoriju date podatke", 0x0d, 0x0a, 0

rmem_address_numbers_str db "00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F", 0x0d, 0x0a, 0


about_str db "Verzija 0.05 DEV", 0x0d, 0x0a, 0x0a, "Napravio lopata", 0x0d, 0x0a, 0
ref_arg_not_found_str db "Referenca ne postoji.", 0x0d, 0x0a, 0
ref_arg_ins_str db "INS", 0
ref_arg_insset1_str db "INSSET1", 0
ref_arg_insset2_str db "INSSET2", 0
ref_arg_insset3_str db "INSSET3", 0
ref_arg_insset4_str db "INSSET4", 0
ref_arg_insset5_str db "INSSET5", 0
ref_arg_insset6_str db "INSSET6", 0
ref_ins_str: 
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

ref_insset_str db "INSSET1234567", 0

works_str db "works...", 0x0d, 0x0a, 0


ref_insset1_str:
db "ADD (Eb Gb) = 00        ADC (Eb Gb) = 10        AND (Eb Gb) = 20", 0x0d, 0x0a
db "ADD (Ev Gv) = 01        ADC (Ev Gv) = 11        AND (Ev Gv) = 21", 0x0d, 0x0a
db "ADD (Gb Eb) = 02        ADC (Gb Eb) = 12        AND (Gb Eb) = 22", 0x0d, 0x0a
db "ADD (Gv Ev) = 03        ADC (Gv Ev) = 13        AND (Gv Ev) = 23", 0x0d, 0x0a
db "ADD (AL Ib) = 04        ADC (AL Ib) = 14        AND (AL Ib) = 24", 0x0d, 0x0a
db "ADD (eAX Iv) = 05       ADC (eAX Iv) = 15       AND (eAX Iv) = 25", 0x0d, 0x0a
db "PUSH (ES) = 06          PUSH (SS) = 16          ES: = 26", 0x0d, 0x0a
db "POP (ES) = 07           POP (SS) = 17           DAA = 27", 0x0d, 0x0a
db "OR (Eb Gb) = 08         SBB (Eb Gb) = 18        SUB (Eb Gb) = 28", 0x0d, 0x0a
db "OR (Ev Gv) = 09         SBB (Ev Gv) = 19        SUB (Ev Gv) = 29", 0x0d, 0x0a
db "OR (Gb Eb) = 0A         SBB (Gb Eb) = 1A        SUB (Gb Eb) = 2A", 0x0d, 0x0a
db "OR (Gv Ev) = 0B         SBB (Gv Ev) = 1B        SUB (Gv Ev) = 2B", 0x0d, 0x0a
db "OR (AL Ib) = 0C         SBB (AL Ib) = 1C        SUB (AL Ib) = 2C", 0x0d, 0x0a
db "OR (eAX Iv) = 0D        SBB (eAX Iv) = 1D       SUB (eAX Iv) = 2D", 0x0d, 0x0a
db "PUSH (CS) = 0E          PUSH (DS) = 1E          CS: = 2E", 0x0d, 0x0a
db "TWOBYTE = 0F            POP (DS) = 1F           DAS = 2F", 0x0d, 0x0a, 0

ref_insset2_str:
db "XOR (Eb Gb) = 30        INC (eAX) = 40        PUSH (eAX) = 50", 0x0d, 0x0a
db "XOR (Ev Gv) = 31        INC (eCX) = 41        PUSH (eCX) = 51", 0x0d, 0x0a
db "XOR (Gb Eb) = 32        INC (eDX) = 42        PUSH (eDX) = 52", 0x0d, 0x0a
db "XOR (Gv Ev) = 33        INC (eBX) = 43        PUSH (eBX) = 53", 0x0d, 0x0a
db "XOR (AL Ib) = 34        INC (eSP) = 44        PUSH (eSP) = 54", 0x0d, 0x0a
db "XOR (eAX Iv) = 35       INC (eBP) = 45        PUSH (eBP) = 55", 0x0d, 0x0a
db "SS: = 36                INC (eSI) = 46        PUSH (eSI) = 56", 0x0d, 0x0a
db "AAA = 37                INC (eDI) = 47        PUSH (eDI) = 57", 0x0d, 0x0a
db "CMP (Eb Gb) = 38        DEC (eAX) = 48        POP (eAX) = 58", 0x0d, 0x0a
db "CMP (Ev Gv) = 39        DEC (eCX) = 49        POP (eCX) = 59", 0x0d, 0x0a
db "CMP (Gb Eb) = 3A        DEC (eDX) = 4A        POP (eDX) = 5A", 0x0d, 0x0a
db "CMP (Gv Ev) = 3B        DEC (eBX) = 4B        POP (eBX) = 5B", 0x0d, 0x0a
db "CMP (AL Ib) = 3C        DEC (eSP) = 4C        POP (eSP) = 5C", 0x0d, 0x0a
db "CMP (eAX Iv) = 3D       DEC (eBP) = 4D        POP (eBP) = 5D", 0x0d, 0x0a
db "DS: = 3E                DEC (eSI) = 4E        POP (eSI) = 5E", 0x0d, 0x0a
db "AAS = 3F                DEC (eDI) = 4F        POP (eDI) = 5F", 0x0d, 0x0a, 0

ref_insset3_str:
db "PUSHA = 60                  JO (Jb) = 70          ADD (Eb Ib) = 80", 0x0d, 0x0a
db "POPA = 61                   JNO (Jb) = 71         ADD (Ev Iv) = 81", 0x0d, 0x0a
db "BOUND (Gv Ma) = 62          JB (Jb) = 72          SUB (Eb Ib) = 82", 0x0d, 0x0a
db "ARPL (Ew Gw) = 63           JNB (Jb) = 73         SUB (Ev Ib) = 83", 0x0d, 0x0a
db "FS: = 64                    JZ (Jb) = 74          TEST (Eb Gb) = 84", 0x0d, 0x0a
db "GS: = 65                    JNZ (Jb) = 75         TEST (Ev Gv) = 85", 0x0d, 0x0a
db "OPSIZE: = 66                JBE (Jb) = 76         XCHG (Eb Gb) = 86", 0x0d, 0x0a
db "ADSIZE: = 67                JA (Jb) = 77          XCHG (Ev Gv) = 87", 0x0d, 0x0a
db "PUSH (Iv) = 68              JS (Jb) = 78          MOV (Eb Gb) = 88", 0x0d, 0x0a
db "IMUL (Gv Ev Iv) = 69        JNS (Jb) = 79         MOV (Ev Gv) = 89", 0x0d, 0x0a
db "PUSH (Ib) = 6A              JP (Jb) = 7A          MOV (Gb Eb) = 8A", 0x0d, 0x0a
db "IMUL (Gv Ev Ib) = 6B        JNP (Jb) = 7B         MOV (Gv Ev) = 8B", 0x0d, 0x0a
db "INSB (Yb DX) = 6C           JL (Jb) = 7C          MOV (Ew Sw) = 8C", 0x0d, 0x0a
db "INSW (Yz DX) = 6D           JNL (Jb) = 7D         LEA (Gv M) = 8D", 0x0d, 0x0a
db "OUTSB (DX Xb) = 6E          JLE (Jb) = 7E         MOV (Sw Ew) = 8E", 0x0d, 0x0a
db "OUTSW (DX Xv) = 6F          JNLE (Jb) = 7F        POP (Ev) = 8F", 0x0d, 0x0a, 0

ref_insset4_str:
db "NOP = 90                   MOV (AL Ob) = A0           MOV (AL Ib) = B0", 0x0d, 0x0a
db "XCHG (eAX eCX) = 91        MOV (eAX Ov) = A1          MOV (CL Ib) = B1", 0x0d, 0x0a
db "XCHG (eAX eDX) = 92        MOV (Ob AL) = A2           MOV (DL Ib) = B2", 0x0d, 0x0a
db "XCHG (eAX eBX) = 93        MOV (Ov eAX) = A3          MOV (BL Ib) = B3", 0x0d, 0x0a
db "XCHG (eAX eSP) = 94        MOVSB (Xb Yb) = A4         MOV (AH Ib) = B4", 0x0d, 0x0a
db "XCHG (eAX eBP) = 95        MOVSW (Xv Yv) = A5         MOV (CH Ib) = B5", 0x0d, 0x0a
db "XCHG (eAX eSI) = 96        CMPSB (Xb Yb) = A6         MOV (DH Ib) = B6", 0x0d, 0x0a
db "XCHG (eAX eDI) = 97        CMPSW (Xv Yv) = A7         MOV (BH Ib) = B7", 0x0d, 0x0a
db "CBW = 98                   TEST (AL Ib) = A8          MOV (eAX Iv) = B8", 0x0d, 0x0a
db "CWD = 99                   TEST (eAX Iv) = A9         MOV (eCX Iv) = B9", 0x0d, 0x0a
db "CALL (Ap) = 9A             STOSB (Yb AL) = AA         MOV (eDX Iv) = BA", 0x0d, 0x0a
db "WAIT = 9B                  STOSW (Yv eAX) = AB        MOV (eBX Iv) = BB", 0x0d, 0x0a
db "PUSHF (Fv) = 9C            LODSB (AL Xb) = AC         MOV (eSP Iv) = BC", 0x0d, 0x0a
db "POPF (Fv) = 9D             LODSW (eAX Xv) = AD        MOV (eBP Iv) = BD", 0x0d, 0x0a
db "SAHF = 9E                  SCASB (AL Yb) = AE         MOV (eSI Iv) = BE", 0x0d, 0x0a
db "LAHF = 9F                  SCASW (eAX Yv) = AF        MOV (eDI Iv) = BF", 0x0d, 0x0a, 0


ref_insset5_str:
db "#2 (Eb Ib) = C0           #2 (Eb 1) = D0         LOOPNZ (Jb) = E0", 0x0d, 0x0a
db "#2 (Ev Ib) = C1           #2 (Ev 1) = D1         LOOPZ (Jb) = E1", 0x0d, 0x0a
db "RETN (Iw) = C2            #2 (Eb CL) = D2        LOOP (Jb) = E2", 0x0d, 0x0a
db "RETN = C3                 #2 (Ev CL) = D3        JCXZ (Jb) = E3", 0x0d, 0x0a
db "LES (Gv Mp) = C4          AAM (Ib) = D4          IN (AL Ib) = E4", 0x0d, 0x0a
db "LDS (Gv Mp) = C5          AAD (Ib) = D5          IN (eAX Ib) = E5", 0x0d, 0x0a
db "MOV (Eb Ib) = C6          SALC = D6              OUT (Ib AL) = E6", 0x0d, 0x0a
db "MOV (Ev Iv) = C7          XLAT = D7              OUT (Ib eAX) = E7", 0x0d, 0x0a
db "ENTER (Iw Ib) = C8        ESC (0) = D8           CALL (Jz) = E8", 0x0d, 0x0a
db "LEAVE = C9                ESC (1) = D9           JMP (Jz) = E9", 0x0d, 0x0a
db "RETF (Iw) = CA            ESC (2) = DA           JMP (Ap) = EA", 0x0d, 0x0a
db "RETF = CB                 ESC (3) = DB           JMP (Jb) = EB", 0x0d, 0x0a
db "INT3 = CC                 ESC (4) = DC           IN (AL DX) = EC", 0x0d, 0x0a
db "INT (Ib) = CD             ESC (5) = DD           IN (eAX DX) = ED", 0x0d, 0x0a
db "INTO = CE                 ESC (6) = DE           OUT (DX AL) = EE", 0x0d, 0x0a
db "IRET = CF                 ESC (7) = DF           OUT (DX eAX) = EF", 0x0d, 0x0a, 0

ref_insset6_str:
db "LOCK: = F0", 0x0d, 0x0a
db "INT1 = F1", 0x0d, 0x0a
db "REPNE: = F2", 0x0d, 0x0a
db "REP: = F3", 0x0d, 0x0a
db "HLT = F4", 0x0d, 0x0a
db "CMC = F5", 0x0d, 0x0a
db "#3 (Eb) = F6", 0x0d, 0x0a
db "#3 (Ev) = F7", 0x0d, 0x0a
db "CLC = F8", 0x0d, 0x0a
db "STC = F9", 0x0d, 0x0a
db "CLI = FA", 0x0d, 0x0a
db "STI = FB", 0x0d, 0x0a
db "CLD = FC", 0x0d, 0x0a
db "STD = FD", 0x0d, 0x0a
db "#4 (INC/DEC) = FE", 0x0d, 0x0a
db "#5 (INC/DEC) = FF", 0x0d, 0x0a, 0
