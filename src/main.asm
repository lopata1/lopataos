[bits 32]
[org 0x10000]
main:
    call enable_interrupts

    push 1000
    call sleep

    call print_start_screen

    call prompt_loop


%include "src/system/disk.asm"
%include "src/system/timer.asm"
%include "src/system/interrupts.asm"
%include "src/system/input.asm"
%include "src/system/output.asm"
%include "src/structure/string.asm"

%include "src/math/convertion.asm"
%include "src/math/functions.asm"

%include "src/prompt/prompt.asm"
%include "src/prompt/utils.asm"
%include "src/prompt/cmds/general/info.asm"
%include "src/prompt/cmds/general/pomoc.asm"
%include "src/prompt/cmds/ram/rmem.asm"
%include "src/prompt/cmds/ram/rmema.asm"
%include "src/prompt/cmds/ram/wmem.asm"
%include "src/prompt/cmds/ram/wmema.asm"
%include "src/prompt/cmds/ram/wmemb.asm"
%include "src/prompt/cmds/general/ref.asm"
%include "src/prompt/cmds/general/run.asm"
%include "src/prompt/cmds/math/bin2hex.asm"
%include "src/prompt/cmds/math/hex2bin.asm"

%include "src/data/interrupt.asm"
%include "src/data/globals.asm"
%include "src/data/constants.asm"
%include "src/data/string_constants.asm"
