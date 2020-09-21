# tvOS

## bootloader
* magic number

    ```assembly
    jmp $

    times 510-($-$$) db 10
    dw 0x55aa
    ```
