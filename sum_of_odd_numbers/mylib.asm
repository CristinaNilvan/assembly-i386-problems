display_message macro

	push offset get_number_message
	call printf
	
	add esp, 4
endm

read_number macro 

	push offset number
	push offset format
	call scanf
	
	add esp, 8
endm

sum_of_odd_numbers macro number

local while_loop, not_equal, final			

	mov edi, number
	mov esi, 2
	
	mov ecx, 0 								
	mov ebx, 1
	
	while_loop :
		cmp ebx, edi						
		je final
		
		mov eax, ebx						
		mov edx, 0
		div esi								
		
		cmp edx, 1							
		jne not_equal						
		
		add ecx, ebx						
		
		not_equal :
		
		add ebx, 1						
		
		jmp while_loop
	
	final :
endm

display_sum macro number

	push number
	push offset sum_message
	call printf
	
	add esp, 4
endm