; Adding two decimal numbers.
; Enter 1st number: 7
; Enter 2nd number: 8
;    The summation: 15


.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'Enter 1st number: $'
MSG2 DB 0DH, 0AH, 'Enter 2nd number: $'
MSG3 DB 0DH, 0AH, 'The summation: $'
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

ADD AL,A         ; CALCULATING SUMMATION
MOV C, AL
MOV AH,0
AAA         ;; ADJUST AFTER ADDITION
ADD AH,30H  ;; DECIMAL TO ASCII
ADD AL,30H  ;; DECIMAL TO ASCII
MOV BX,AX

LEA DX,MSG3      ; PRINT MSG3
MOV AH,9
INT 21H

MOV AH,2         ; SUMMATION OUTPUT
MOV DL,BH
INT 21H
MOV AH,2
MOV DL,BL
INT 21H


MOV AH, 4CH
INT 21H

MAIN ENDP
END MAIN


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


; Assembly program to read two capitals and display them on the next line in alphabetic order.


.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'Enter the capitals: $'
MSG2 DB 0DH, 0AH, 'In alphabetic order: $'

.CODE
MAIN PROC
MOV AX,@DATA
MOV DS, AX

LEA DX,MSG1
MOV AH,9
INT 21H

MOV AH,1         ; CAPITALS INPUT
INT 21H
MOV CL,AL        ; MOVE TO CL REGISTER
MOV AH,1
INT 21H
MOV BL,AL        ; MOVE TO BL REGISTER

LEA DX,MSG2
MOV AH,9
INT 21H

CMP CL,BL         ; COMPARE (CAPITAL) REGISTERS- CMP ONLY WORKS ON REGISTER, NOT VARIABLE
JL TOP            ; JUMP IF LESS THAN, [WORK AS IF]


MOV AH,2          ; OUTPUT
MOV DL,BL
INT 21H

MOV AH,2
MOV DL,CL
INT 21H

MOV AH, 4CH
INT 21H

TOP:               ; ELSE IF OUTPUT
MOV AH,2
MOV DL, CL
INT 21H

MOV AH,2
MOV DL, BL
INT 21H

MOV AH, 4CH
INT 21H

MAIN ENDP
END MAIN

 :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



; Multiplying two decimal numbers.
; Enter 1st number: 7
; Enter 2nd number: 8
;    The multiplicationn: 56


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

