.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

vector_of_elements dw -10, 2, 4, 6, -12
number_of_elements dd 5
minimum dw 0
maximum dw 0

.code
start:
	
	;Finds the minimum and the maximum.
	
	mov eax, 0					
	mov ebx, 0					
	mov esi, 0					
	
	mov ecx, number_of_elements			
	
	mov ax, vector_of_elements[esi]			
	mov bx, vector_of_elements[esi]			
	
	while_loop :
		cmp ax, vector_of_elements[esi]		
		jl check_if_max		
		
		mov ax, vector_of_elements[esi]		
		
		check_if_max : 		
		cmp bx, vector_of_elements[esi]		
		jg final_instructions				
		
		mov bx, vector_of_elements[esi]		
		
		final_instructions :
		add esi, 2						
	loop while_loop
	
	mov minimum, ax				
	mov maximum, bx 									
	
	push 0
	call exit
end start