.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

string_1 db "acadea"
string_2 db "dea"
length_1 dd 5
length_2 dd 2							

.code
start:
	
	;How to find if a word is a substring of another word. 

	mov esi, 0
	mov edi, 0
	
	mov eax, -1							
	
	mov ebx, 0							
	mov bl, string_1[esi]				
	
	mov ecx, 0							
	mov cl, string_2[edi]				
	
	while_loop :
		cmp bl, cl						
		jne not_equal 					
		
		while_loop_two :				
			cmp eax, -1					
			jne already_found_position				
			
			mov eax, esi				
			
			already_found_position :				
		
			add esi, 1					
			add edi, 1					
			
			mov bl, string_1[esi]		
			mov cl, string_2[edi]		
			
			cmp bl, cl					
			jne final_instructions					
			
			cmp edi, length_2			
			je found_substring					
			
			jmp while_loop_two			
			
		not_equal :
		
		add esi, 1						
		mov bl, string_1[esi]			
		
		final_instructions :							
			mov eax, -1
			mov edi, 0
		
		cmp esi, length_1			
		jne while_loop					
	
	
	found_substring : 							
	
	push 0
	call exit
end start