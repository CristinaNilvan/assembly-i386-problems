.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

vector_of_elements db 6, 7, 2
number_of_elements dd 3
average db 0

.code
start:
	
	;Illustration of how to get the average of a vector.
	
	lea ebx, vector_of_elements				
	mov eax, number_of_elements
	push eax					
	mov ecx, 0					
	mov esi, 0					
	
	while_loop :	
		add cl, vector_of_elements[esi]		
		add esi, 1				
		dec eax					
		jnz while_loop		
		
	mov al, cl					
	pop ecx					
	
	div cl					
	
	mov average, al				
	
	push 0
	call exit
end start
