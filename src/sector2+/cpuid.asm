DetectCPUid:
    pushfd
    pop eax

    mov ecx, eax
    
    xor eax, 1 << 21
    push eax
    popfd

    pushfd
    pop eax
    
    push ecx
    popfd
    
    xor eax, ecx
    jz NOCPUID
    
    ret

Detectlongmode:
    mov eax, 0x80000001
    cpuid
    test edx, 1 << 29
    jz NOLONGMODE

    ret

NOCPUID:
    hlt ; NO CPU ID

NOLONGMODE:
    hlt ; NO LONG MODE
