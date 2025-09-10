org 100h

section .data
    line1 db 0Dh, 0Ah, '__     ___              _                  $'
    line2 db 0Dh, 0Ah, '\ \   / (_)_ __ ___    / \   ___ _ __ ___  $'
    line3 db 0Dh, 0Ah, ' \ \ / /| | ,_ ` _ \  / _ \ / __| ,_ ` _ \ $'
    line4 db 0Dh, 0Ah, '  \ V / | | | | | | |/ ___ \\__ \ | | | | |$'
    line5 db 0Dh, 0Ah, '   \_/  |_|_| |_| |_/_/   \_\___/_| |_| |_|$'
    line6 db 0Dh, 0Ah, '$'
    
    contact db 'Contact: rizvihuihuihui@icloud.com$'
    github  db 'www.github.com/sanecodeguy/vimasm$'
    cmds    db 0Dh, 0Ah, 'Run inside Neovim:', 0Dh, 0Ah, ':Nc   (Compile + Run)', 0Dh, 0Ah, ':Nd   (Compile + Debug)$'

section .text
    mov ax, 0x0003
    int 10h
    mov ah, 09h

    mov dx, line1
    int 21h
    mov dx, line2
    int 21h
    mov dx, line3
    int 21h
    mov dx, line4
    int 21h
    mov dx, line5
    int 21h
    mov dx, line6
    int 21h

    mov dx, contact
    int 21h
    mov dx, github
    int 21h
    mov dx, cmds
    int 21h

    mov ah, 00h
    int 16h

    mov ax, 4C00h
    int 21h

