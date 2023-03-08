.286
.model tiny
.code
jumps

org 100h
locals @@

;------------------------------------------------
; EXIT to DOS
;------------------------------------------------
; Entry:	None
; Exit: 	(not defined)
; Expects:	(none)
; Destroys:	...
;------------------------------------------------
EXIT		macro
			nop
			mov ax, 4c00h
			int 21h
			nop
			endm

Start:
                mov di, offset input                ; input string
                push di
                call Gets

                pop di
                push di
                add di, 254d
                mov byte ptr ah, [di]
                cmp ah, 25h
                pop di
                jne @@Wrong

                mov si, offset Password

                call StrCmp
                cmp ax, 0
                jne @@Wrong

                mov dx, offset Correct
                call Puts

                jmp @@Done


@@Wrong:        mov dx, offset Wrong
                call Puts

@@Done:
                EXIT

;------------------------------------------------
; GETS
;------------------------------------------------
; Entry:	DI = ptr of the destination
; Exit:		DI = string
; Expects:	none
; Destroys: AX DI
;------------------------------------------------

Gets            proc

                xor ax, ax
                mov ah, 01h

@@Next:         cmp al, 0Dh
                je @@Done

                int 21h
                stosb

                jmp @@Next
@@Done:
                dec di
                mov byte ptr [di], 24h

                ret
                endp


;------------------------------------------------
; PUTS
;------------------------------------------------
; Entry:	DX = ptr of the start src
; Exit:		none
; Expects:	none
; Destroys: none
;------------------------------------------------

Puts            proc

                mov ah, 09h
		        int 21h

                ret
                endp


;------------------------------------------------
; Comparing one string to another
;------------------------------------------------
; Entry:	SI = ptr of the start src
;			DI = ptr of the start dest
;			CX = size of src
; Exit:		AX = 1, 0, -1
; Expects:	none
; Destroys: CX
;------------------------------------------------
StrCmp		proc

			push di
			push si

@@Next:		cmp al, '$'
			je @@Done
			lodsb
			mov byte ptr ah, [di]
			inc di
			cmp ah, al
			je @@Next

@@Done:		sub al, ah
			xor ah, ah
			pop si
			pop di

			ret
			endp


.data

input           db 254 dup (0), 25h
Password        db 'Bebra$'
Correct         db 'Access Granted$'
Wrong           db 'Access Denied$'

end         start
