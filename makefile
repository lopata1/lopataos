binary:
	nasm -f bin src/bootloader.asm -o bin/bootloader.bin
	nasm -f bin src/main.asm -o bin/kernel.bin
	cat bin/bootloader.bin bin/kernel.bin > bin/lopataos.bin

floppy:
	nasm -f bin src/bootloader.asm -o bin/bootloader.bin
	nasm -f bin src/main.asm -o bin/kernel.bin
	cat bin/bootloader.bin bin/kernel.bin > bin/lopataos.bin
	dd if=/dev/zero of=bin/floppy.img bs=512 count=2880
	dd if=bin/lopataos.bin of=bin/floppy.img conv=notrunc