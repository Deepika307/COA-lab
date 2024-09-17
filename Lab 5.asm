org 100h

start:

    ; Set data segment to code segment
    mov ax, cs
    mov ds, ax

    ; Initialize dividend and divisor
    mov al, [dividend]  
    mov bl, [divisor]   

    xor ah, ah          ; Clear upper half of AX for division

    div bl              ; AL / BL -> quotient in AL, remainder in AH

    mov [quotient], al  ; Store quotient
    mov [remainder], ah ; Store remainder

    ; Display "Quotient: "
    mov dx, offset msg_quotient
    mov ah, 09h         
    int 21h             

    ; Display the quotient
    mov al, [quotient]
    add al, '0'         ; Convert to ASCII
    mov dl, al
    mov ah, 02h         
    int 21h             

    ; Print a newline
    mov dl, 0Dh         ; Carriage return
    int 21h
    mov dl, 0Ah         ; Line feed
    int 21h

    ; Display "Remainder: "
    mov dx, offset msg_remainder
    mov ah, 09h         
    int 21h             

    ; Display the remainder
    mov al, [remainder]
    add al, '0'         ; Convert to ASCII
    mov dl, al
    mov ah, 02h         
    int 21h             

    ; Exit the program
    mov ah, 4Ch
    int 21h

; Data Section
dividend  db 58        ; Dividend value
divisor   db 07        ; Divisor value
quotient  db 0         ; Placeholder for quotient
remainder db 0         ; Placeholder for remainder

; Messages
msg_quotient db "Quotient: $"
msg_remainder db "Remainder: $"
