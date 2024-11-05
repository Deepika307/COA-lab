ORG 100H               ; Start at offset 100H for .COM file format

MOV CX, 26             ; Loop counter for 26 characters (A to Z)
MOV DL, 'A'            ; Start with ASCII code of 'A'

PRINT_LOOP:
    MOV AH, 2          ; Function to print character
    INT 21H            ; Print character in DL

    INC DL             ; Move to the next character (A -> B -> C ...)
    LOOP PRINT_LOOP    ; Repeat until CX reaches 0

MOV AH, 4CH            ; Terminate the program
INT 21H