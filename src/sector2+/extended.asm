[org 0x7e00]

jmp Enterprotecedmode

%include "./src/lib/printf.asm"

%include "./src/sector2+/paging.asm"
%include "./src/sector2+/gdt.asm"
%include "./src/sector2+/cpuid.asm"

Enterprotecedmode:
    call EnableA20
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
 
    jmp codeseg:Startprotecedmode

EnableA20:
    in al,0x92
    or al, 2
    out 0x92, al 

    ret

[bits 32]

Startprotecedmode:
    mov ax, dataseg
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    call DetectCPUid
    call Detectlongmode
    call setdetidentitypaging
    jmp $


times 2048-($-$$) db 0
