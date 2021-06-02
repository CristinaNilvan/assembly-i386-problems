.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

n_constant equ 3
n dd 3 

matrix dd 1, 2, 3
	dd 4, 5, 6
	dd 7, 8, 9
		
sum_of_columns dd 0

.code
start:
	;This program sums the columns of a matrix.
	
	mov esi, 0	
	mov edi, 0	
	mov eax, 0 	
	mov edx, 0	
	
	for_1 : 
	
		for_2 :
			add eax, matrix[esi][edi]
			add esi, n_constant * 4
			cmp esi, n_constant * n_constant * 4
			jne for_2
		
		mov esi, 0
		
		add edi, 4
		
		add edx, 1
		cmp edx, n
		jne for_1
		
	mov sum_of_columns, eax	

	push 0
	call exit
end start
