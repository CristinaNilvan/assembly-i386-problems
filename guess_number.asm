.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf : proc
extern scanf : proc

public start

.data

message db "Guess the number!", 10, "Give a number : ", 0
message_number_below db "The number you have to find is higher! ", 10, "Give another number : ", 0
message_number_above db "The number you have to find is smaller! ", 10, "Give another number : ", 0
message_number_found db "You found the number! ", 10, 0
message_attempts db "You had %d attempts. ", 0

format db "%d", 0

searched_number db 6
read_number db 0

.code
start:
	
	;Guess a predetermined number. 
	
	push offset message
	call printf
	
	add esp, 4
	
	mov ebx, 0
	mov bl, searched_number
	
	mov ecx, 0
	mov esi, 0								
	
	check_number :						
		push offset read_number
		push offset format
		call scanf							
		
		add esp, 8						
		
		mov cl, read_number				
		
		cmp bl, cl							
		je number_found						
		
		cmp bl, cl							
		ja number_below				
		
		cmp bl, cl							
		jb number_above				
	
	number_below :
		push offset message_number_below		
		call printf							
		
		add esp, 4						
		
		add esi, 1							
		
		jmp check_number					
		
	number_above :
		push offset message_number_above
		call printf
		
		add esp, 4
		
		add esi, 1							
		
		jmp check_number					
	
	number_found :							
		push offset message_number_found
		call printf
		
		add esp, 4
	
	number_of_attmpts :						
		push esi
		push offset message_attempts
		call printf
		
		add esp, 8
		
	push 0
	call exit
end start
