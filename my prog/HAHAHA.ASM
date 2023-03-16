.286
.model tiny
.code
jumps

org 100h
locals @@

Start:

db  0FCDFh dup (90h)
db 	0CDh, 020h, 0FFh, 09Fh, 000h, 0EAh, 0FFh, 0FFh, 0ADh, 0DEh, 0E0h, 001h
db	0A4h, 019h, 0AAh, 001h, 0A4h, 019h, 089h, 002h, 0FFh, 013h, 071h, 005h
db	001h, 004h, 001h, 000h, 002h, 007h, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
db	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 072h, 052h, 0E0h, 0FFh
db	088h, 052h, 014h, 000h, 018h, 000h, 088h, 052h, 0FFh, 0FFh, 0FFh, 0FFh
db	000h, 000h, 000h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
db	000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0CDh, 021h, 0CBh, 000h
db	000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
db	000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
db	000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
db	000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00Ah, 000h, 000h
db	006h, 000h, 0A2h, 01Fh, 002h, 000h, 0AEh, 0F6h, 0C0h, 01Bh, 081h, 005h
db	016h, 072h, 0B0h, 0F6h, 0C8h, 00Ah, 081h, 005h, 006h, 000h, 006h, 000h
db	0C6h, 0F6h, 092h, 007h, 0CEh, 0F6h, 028h, 006h, 018h, 000h, 014h, 000h
db	0CAh, 0F6h, 01Ch, 021h, 081h, 005h, 0A0h, 0ADh, 014h, 000h, 000h, 000h
db	0A0h, 0ADh, 0DAh, 0F6h, 026h, 000h, 091h, 00Ch, 0A0h, 0ADh, 000h, 000h
db	014h, 000h, 062h, 0ABh, 07Ch, 0ADh, 0E8h, 0F6h, 093h, 000h, 01Fh, 016h
db	014h, 000h, 062h, 0ABh, 07Ch, 0ADh, 001h, 000h, 0F8h, 0F6h, 06Eh, 001h
db	077h, 00Fh, 002h, 000h, 001h, 000h, 07Ch, 0ADh, 0F7h, 053h, 062h, 0ABh
db	086h, 0F7h, 0C0h, 002h, 0F9h, 03Eh, 062h, 0ABh, 07Ch, 0ADh, 0F7h, 053h
db	000h, 000h, 053h, 03Ah, 05Ch, 042h, 049h, 04Eh, 05Ch, 054h, 044h, 05Ch
db	054h, 044h, 048h, 045h
db  34h dup (4Fh)
db  0dh

end start
