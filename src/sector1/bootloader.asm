[org 0x7c00]

mov [BOOT_DISK], dl

mov bp, 0x7c00
mov sp, bp

call Read_Disk

jmp $

%include "./src/sector1/lib/printf.asm"
%include "./src/sector1/lib/diskread.asm"

times 510-($-$$) db 0
dw 0xaa55

