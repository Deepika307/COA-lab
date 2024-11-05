ORG 100h               ; Origin for COM file format

; Print numbers from 0 to 9
MOV CX, 10             ; Loop counter set to 10 (for numbers 0 to 9)
MOV AL, 0              ; Start with the number 0

print_loop:
    ; Convert number in AL to ASCII character
    ADD AL, '0'        ; Convert number to ASCII

    ; Print the character
    MOV DL, AL         ; Move the ASCII character to DL
    MOV AH, 02h        ; DOS function 02h: print character
    INT 21h            ; Call DOS interrupt

    ; Prepare for the next iteration
    SUB AL, '0'        ; Convert back to integer
    INC AL             ; Increment the number
    LOOP print_loop     ; Loop until CX is zero

; Terminate the program
MOV AH, 4Ch            ; DOS function 4Ch: terminate program
INT 21h                ; Call DOS interrupt to exit

END                     ; End of program