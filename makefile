ASM = nasm 
BOOT = src/sector1/bootloader.asm
BIN= bin/bootloader.bin 
BIN2 = bin/extended.bin
OS = bin/os.bin
EXTENDED= ./src/sector2+/extended.asm

asm:
	$(ASM) $(BOOT) -f bin -o $(BIN)
	$(ASM) $(EXTENDED) -f bin -o $(BIN2)
	cat $(BIN) $(BIN2) > $(OS)

clear:
	rm -rf bin/*

run:
	$(ASM) $(BOOT) -f bin -o $(BIN)
	$(ASM) $(EXTENDED) -f bin -o $(BIN2)
	cat $(BIN) $(BIN2) > $(OS)
	qemu-system-x86_64 $(OS)

iso:
	mkisofs -J -l -R -V "Label CD" -iso-level 4 -o system.iso bin/tv.bin
