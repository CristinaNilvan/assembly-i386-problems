.386
.model flat, stdcall

includelib msvcrt.lib
extern exit : proc
extern printf : proc
extern scanf : proc

include mylib.asm

public start

.data

get_number_message db "Give a number : ", 0
sum_message db "The sum of the odd numbers less than the given number is : %d", 0
format db "%d", 0

number dd 0

.code

start:

	;Reads a number from the console and gets the sum of odd numbers less than it.

	display_message
	read_number
	
	sum_of_odd_numbers number
	display_sum ecx
	
	push 0
	call exit
end start
