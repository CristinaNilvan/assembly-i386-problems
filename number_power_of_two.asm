.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

number dd 7

.code
start:

	;Checks if a number is a power of two.

	mov ebx, number		
	mov ecx, number
	
	sub ebx, 1		
	
	and ecx, ebx	

	cmp ecx, 0		
	jne not_equal			
	
	mov eax, 0
	
	not_equal :
	
	push 0
	call exit
end start
