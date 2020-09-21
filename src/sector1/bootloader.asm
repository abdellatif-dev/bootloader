[org 0x7c00]

mov [BOOT_DISK], dl

mov bp, 0x7c00
mov sp, bp

call Read_Disk

jmp SOFTWARE_SPACE 

%include "./src/lib/printf.asm"
%include "./src/lib/diskread.asm"

times 510-($-$$) db 0
dw 0xaa55

