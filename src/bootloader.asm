[org 0x7c00]

mov bp, 0x7c00
mov sp, bp

mov bx, welcome
call printf

jmp $

printf:
    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    ret

welcome: db 'welcome to TvOS',0

times 510-($-$$) db 0
dw 0xaa55

