[org 0x7e00]

mov bx, welcome
call printf

jmp $

%include "./src/lib/printf.asm"

welcome: db "tvOS", 0

times 2048-($-$$) db 0
