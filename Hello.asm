.model small
.stack 100h

.data
msg db 'Tumi Parco Abir $'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg
    mov ah,9
    int 21h
    
    
exit:
   mov ah,4ch
   int 21h
   main endp
end main