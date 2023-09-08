[bits 32]
[org 0x10000]
main:
    call enable_interrupts

    push 1000
    call sleep

    call print_start_screen

    call prompt_loop


%include "src/disk.asm"
%include "src/timer.asm"
%include "src/interrupts.asm"
%include "src/input.asm"
%include "src/output.asm"
%include "src/string.asm"

%include "src/math/convertion.asm"
%include "src/math/functions.asm"

%include "src/prompt/prompt.asm"
%include "src/prompt/utils.asm"
%include "src/prompt/cmds/info.asm"
%include "src/prompt/cmds/pomoc.asm"
%include "src/prompt/cmds/rmem.asm"
%include "src/prompt/cmds/rmema.asm"
%include "src/prompt/cmds/wmem.asm"
%include "src/prompt/cmds/wmema.asm"
%include "src/prompt/cmds/ref.asm"
%include "src/prompt/cmds/run.asm"
%include "src/prompt/cmds/bin2hex.asm"
%include "src/prompt/cmds/hex2bin.asm"

%include "src/data/interrupt.asm"
%include "src/data/globals.asm"
%include "src/data/constants.asm"
%include "src/data/string_constants.asm"
