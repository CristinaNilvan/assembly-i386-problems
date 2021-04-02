.386
.model flat, stdcall

includelib msvcrt.lib
extern printf : proc
extern scanf : proc
extern fprintf : proc
extern fopen: proc
extern fclose: proc
extern exit: proc

public start

.data

message db "Write a word : ", 0

file_name db "file.txt", 0

format_string db "%s", 0
format_file db "w", 0

given_word db 20 dup(0)
inverted_word db 20 dup(0)

.code
start:
	
	;Reads a word from the console and writes it in a file inverted.
	
	push offset message				
	call printf							
	
	add esp, 4							
	
	push offset given_word					
	push offset format_string			
	call scanf							
	
	add esp, 8							
	
	mov esi, 0							
	
	string_length :						
	
		cmp given_word[esi], 0				
		je not_equal						
		
		add esi, 1						
		
		jmp string_length				

	not_equal :

	push offset format_file		
	push offset file_name				
	call fopen							
	
	add esp, 8							
	
	mov ebx, eax 						
	
	mov ecx, esi						
	sub esi, 1							
	
	mov edi, 0					
	
	while_loop :						
		
		mov edx, 0
		mov dl, given_word[esi]				
		
		mov inverted_word[edi], dl	
		
		sub esi, 1
		add edi, 1
		
		sub ecx, 1
		cmp ecx, 0
		jnz while_loop					
	
	write_in_file : 
		
		push offset inverted_word		
		push offset format_string		
		push ebx						
		call fprintf					
	
	close_file :
		
		add esp, 12						
		
		push ebx						
		call fclose						
		
		add esp, 4						

	push 0
	call exit
end start