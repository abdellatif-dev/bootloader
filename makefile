ASM = nasm 
BOOT = src/sector1/bootloader.asm
BIN= bin/bootloader.bin 
BIN2 = bin/extended.bin
OS = bin/tv.bin
EXTENDED= ./src/sector2+/extended.asm

asm:
	$(ASM) $(BOOT) -f bin -o $(BIN)
	$(ASM) $(EXTENDED) -f bin -o $(BIN2)
	cat $(BIN) $(BIN2) > $OS

clear:
	rm -rf $(BIN) $(BIN2) $(OS)
run:
	$(ASM) $(BOOT) -f bin -o $(BIN)
	$(ASM) $(EXTENDED) -f bin -o $(BIN2)
	cat $(BIN) $(BIN2) > $(OS)
	qemu-system-x86_64 $(OS)
