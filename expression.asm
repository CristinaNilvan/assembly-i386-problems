.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

final_value dd 0					
n dd 3
numbers dd 1, 2, 3					
value_to_add dd 0, 0, 0			

.code

expression macro esi
	finit
	fild numbers[esi]				
	fsqrt							
	fst value_to_add[esi]			
	
	finit
	fld value_to_add[esi]			
	fild numbers[esi]				
	fdiv							
	
	finit
	fld final_value					
	fld value_to_add[esi]			
	fadd							
	fst final_value					
endm

start:
	
	;Calculates this expression : E(n) = sqrt(1)/1 + sqrt(2)/2 + ... + sqrt(n)/n using the Intel 8087 coprocessor
	
	mov eax, n
	mov ebx, 0
	mov esi, 0						
	
	while_loop :
		cmp ebx, eax				
		je final 
		
		expression esi					
		add esi, 4					
		
		add ebx, 1
		
		jmp while_loop
		
	final :
		
	push 0
	call exit

end start