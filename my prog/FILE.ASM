.286
.model tiny
.code
jumps

org 100h
locals @@


Start:
        mov ah, 3dh
        mov al, 01h
        mov dx, offset FILENAME
        int 21h
        mov bx, ax
        mov ah, 40h
        mov cx, 100h
        mov dx, 0h
        int 21h

        mov ax, 4c00h
        int 21h



FILENAME db 'W:\CRACKME\hahaha.asm', 00h

end start
