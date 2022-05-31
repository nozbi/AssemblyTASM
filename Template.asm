.model small
.stack

.data
    new_line db "",13,10,"$"  ;dont use
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;variables start
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;variables end

.code

get_number_from_input:     ;mov NUMBER_VARIABLE,bx(after to store input in VARIABLE)
xor bx,bx 
read:
cmp bx,65535
ja return                                                                      
mov ah,7
int 21h
xor dx,dx
mov dl,al
cmp dl,13
je return
cmp dl,'0'
jl read
cmp dl,'9'
jg read
mov ah,2
int 21h
sub dl,'0'
push dx
mov ax,bx
mov cx,10
mul cx
pop dx
add ax,dx
mov bx,ax
jmp read
return:
ret

print_number: ;mov ax,NUMBER_VARIABLE
mov cx,0
loop1:
mov dx,0
mov bx,10
div bx
push dx
inc cx
cmp ax,0
jnz loop1
loop2:
pop dx
add dl,48
mov ah,2
int 21h
loop loop2
ret

print_string:   ;mov dx,offset STRING_VARIABLE  
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
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end
    mov ax, 4C00h          
    int 21h                 
end start
