.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

Employee struct 
	name_of_employee db 20 dup(0)
	salary dw 0
Employee ends

number_of_employees dw 4
employees Employee 	{"Georgescu", 100}, 
					{"Pop", 100},
					{"Popescu", 300}, 
					{"Ionescu", 450}
total_sum dw 0

.code
start:

	;Illustration of how to work with a struct.
	
	lea ecx, employees						
	mov eax, 0								
	mov ax, number_of_employees					
	mov ebx, 0								
	mov esi, 0								
	
	while_loop :
		add bx, employees[esi].salary		
		add esi, sizeof Employee 			
		dec eax								
		jnz while_loop					
		
	mov total_sum, bx						
	
	push 0
	call exit
end start