.386
.model flat, stdcall

includelib msvcrt.lib
extern printf : proc
extern scanf : proc
extern exit: proc

public start

.data

message_1 db "Write two numbers : ", 0
message_2 db "Their sum is = ", 0

number_1 db 0
number_2 db 0
result dd 0

format_1 db "%d %d", 0
format_2 db "%d", 0

.code
start:

	;Gets two numbers from the console and calculates their sum.
	
	push offset message_1		
	call printf				
	
	add esp, 4				
	
	push offset number_2	
	push offset number_1	
	push offset format_1	
	call scanf				
	
	add esp, 12				
	
	mov ebx, 0				
	add bl, number_1			
	add bl, number_2		
	mov result, ebx		
	
	push offset message_2		
	call printf				
	
	add esp, 4				
	
	push result			
	push offset format_2	
	call printf				
	
	add esp, 8				
	
	push 0
	call exit
end start