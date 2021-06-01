.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

number dd 3
number_of_elemnets dd 5 
vector db 1, 2, 3, 3, 2
frequency db 0, 0, 0, 0

.code
start:

	;In this vector the numbers are from 1 to a given number. One o them appears once, and the others appear twice.
	;This program finds the number which appears once.
	
	lea ebx, vector				
	mov eax, number_of_elemnets						
	mov esi, 0						
	mov edi, number						
	
	go_through_vector :
		mov ecx, 0					
		mov cl, vector[esi]			
		add frequency[ecx], 1		
		add esi, 1					
		dec eax						
		jnz go_through_vector			
		
	go_through_frequency :
		cmp frequency[edi], 2		
		jne found			
		dec edi						
		jnz go_through_frequency			
	
	found :
		mov eax, edi				
	
	push 0
	call exit
end start
