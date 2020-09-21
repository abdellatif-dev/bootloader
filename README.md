

# bootloader
* magic number

    ```assembly
    jmp $

    times 510-($-$$) db 10
    dw 0x55aa
    ```

## install
``` console
mkdir bin
make 
```


## install and run
``` console
mkdir bin
make run
```
