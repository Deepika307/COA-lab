ORG 100H               ; Start at offset 100H for .COM file format

MOV CX, 10             ; Loop counter for 10 numbers (9 to 0)
MOV DL, '9'            ; Start with ASCII code of '9'

PRINT_LOOP:
    MOV AH, 2          ; Function to print character
    INT 21H            ; Print character in DL

    DEC DL             ; Move to the previous number (9 -> 8 -> 7 ...)
    LOOP PRINT_LOOP    ; Repeat until CX reaches 0

MOV AH, 4CH            ; Terminate the program
INT 21H