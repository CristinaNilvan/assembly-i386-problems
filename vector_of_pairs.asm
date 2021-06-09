.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

pair_struct struct 
	first_number dd 0
	second_number dd 0
pair_struct ends

number_of_pairs dd 3
pairs pair_struct {1, 2},
	{2, 4},
	{3, 8}
	
result dd 30 dup (0)

.code
start:
	;This program takes a vector of pairs of numbers and puts the sum of the pair in another vector.
	
	mov ecx, 0
	mov esi, 0
	mov edi, 0
	
	for_loop :
		mov edx, 0
		
		add edx, pairs[esi].first_number
		add edx, pairs[esi].second_number
		add esi, sizeof pair_struct
		
		mov result[edi], edx
		add edi, 4
		
		add ecx, 1
		
		cmp ecx, number_of_pairs
		jne for_loop
	
	push 0
	call exit
end start
