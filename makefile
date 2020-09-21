ASM = nasm 
BOOT = src/bootloader.asm
BIN= bin/bootloader.bin 


asm:
	$(ASM) $(BOOT) -f bin -o $(BIN)

clear:
	rm -rf $(BIN)

run:
	$(ASM) $(BOOT) -f bin -o $(BIN)
	qemu-system-x86_64 $(BIN)
