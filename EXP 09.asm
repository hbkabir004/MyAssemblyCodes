.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'Enter 1st number: $'
MSG2 DB 0DH, 0AH, 'Enter 2nd number: $'
MSG3 DB 0DH, 0AH, 'The multiplication: $'
A DB ?
B DB ?
C DB ?

.CODE
MAIN PROC
MOV AX,@DATA
MOV DS, AX

LEA DX,MSG1      ; PRINT MSG1
MOV AH,9
INT 21H

MOV AH,1         ; 1ST NUMBER INPUT
INT 21H
SUB AL, 30H ;; ASCII TO DECIMAL
MOV A,AL

LEA DX,MSG2      ; PRINT MSG1
MOV AH,9
INT 21H

MOV AH,1         ; 2ND NUMBER INPUT
INT 21H
SUB AL, 30H
MOV B,AL

MUL A            ; CALCULATING MULTIPLICATION
MOV C, AL
MOV AH,0
AAM         ;; ADJUST AFTER MULTIPLICATION
ADD AH,30H  ;; DECIMAL TO ASCII
ADD AL,30H  ;; DECIMAL TO ASCII
MOV BX,AX

LEA DX,MSG3      ; PRINT MSG3
MOV AH,9
INT 21H

MOV AH,2         ; MULTIPLICATION OUTPUT
MOV DL,BH
INT 21H
MOV AH,2
MOV DL,BL
INT 21H


MOV AH, 4CH
INT 21H

MAIN ENDP
END MAIN