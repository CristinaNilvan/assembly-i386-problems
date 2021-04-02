.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

one_bits dw 0
number dw 3

.code
start:

	;Finds the number of one bits in the binary representation of a number.
	
	mov eax, 0
	mov ax, number			
	
	mov ebx, 0			
	mov bx, 2				
	
	mov ecx, 0				
	mov edx, 0
	
	while_loop : 
		div bx				 
		cmp dx, 1			
		jne not_equal		
		
		add cx, 1			
		
		not_equal :
		
		cmp al, 0			
		jne while_loop
	
	mov one_bits, cx
	
	push 0
	call exit
end start
