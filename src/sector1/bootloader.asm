[org 0x7c00]

mov [BOOT_DISK], dl

mov bp, 0x7c00
mov sp, bp

mov bx, welcome
call printf
call Read_Disk

mov ah, 0x0e
mov al, [SOFTWARE_SPACE]

jmp $

%include "./src/sector1/lib/printf.asm"
%include "./src/sector1/lib/diskread.asm"

welcome: db 'welcome to TvOS',0

times 510-($-$$) db 0
dw 0xaa55

