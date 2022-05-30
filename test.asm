.model small
.stack

.data
    new_line db "",13,10,"$"  ;dont use
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;variables start
    var1 dw ?
    var2 dw 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;variables end

.code

print_number: ;mov ax,NUMBER
mov cx,0
petla:
mov dx,0
mov bx,10
div bx
push dx
inc cx
cmp ax,0
jnz petla
petla_2:
pop dx
add dl,48
mov ah,2
int 21h
loop petla_2
ret

print_string:   ;mov dx,offset STRING  
mov ax, @data
mov ds, ax                  
mov ah, 09h             
int 21h   
ret

print_new_line:
mov dx, offset new_line 
mov ax, @data
mov ds, ax                  
mov ah, 09h             
int 21h 
ret

start:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;start    
    mov var1,69
    mov ax,var1
    call print_number
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end
    mov ax, 4C00h          
    int 21h                 
end start
