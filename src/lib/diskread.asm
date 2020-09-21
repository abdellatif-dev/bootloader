SOFTWARE_SPACE equ 0x7e00

Read_Disk:
    mov ah, 0x02
    mov bx, SOFTWARE_SPACE
    mov al, 4
    mov dl, [BOOT_DISK]
    mov ch, 0x00
    mov dh, 0x00
    mov cl, 0x02

    int 0x13

    jc diskreadfailed

    ret

BOOT_DISK:
    db 0

diskreaderr: db 'error reading the disk', 0

diskreadfailed:
    mov bx, diskreaderr
    call printf
    
    jmp $
