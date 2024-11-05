ORG 100h               ; Origin for COM file format

; Print characters from 'Z' to 'A'
MOV CX, 26             ; Loop counter set to 26 (for letters A to Z)
MOV AL, 'Z'            ; Start with the character 'Z'

print_loop:
    ; Print the character
    MOV DL, AL         ; Move the character to DL
    MOV AH, 02h        ; DOS function 02h: print character
    INT 21h            ; Call DOS interrupt

    ; Prepare for the next iteration
    DEC AL             ; Move to the previous character
    LOOP print_loop     ; Loop until CX is zero

; Terminate the program
MOV AH, 4Ch            ; DOS function 4Ch: terminate program
INT 21h                ; Call DOS interrupt to exit

END                     ; End of program