TITLE Program 4		(prog4.asm)

; Author:					Nils Streedain
; Last Modified:			2/12/2022
; OSU email address:		streedan@oregonstate.edu
; Course number/section:	271-001
; Assignment Number:		4
; Due Date:					2/13/2022
; Description:				Write a program to calculate composite numbers. First, the user is instructed to enter the number of
;							composites to be displayed, and is prompted to enter an integer in the range [1 ... 300]. The user
;							enters a number, n, and the program verifies that 1 < n < 300. If n is out of range, the user is
;							re-prompted until they enter a value in the specified range. The program then calculates and
;							displays all of the composite numbers up to and including the nth composite. The results should be
;							displayed 10 composites per line with at least 3 spaces between the numbers.

INCLUDE Irvine32.inc

; constants
RANGE_MIN = 1
RANGE_MAX = 300

.data
	; interface strings
	intro		BYTE		"Welcome to the Composite Number Spreadsheet", 13, 10, "Programmed by Nils Streedain", 13, 10, "This program is capable of generating a list of composite numbers.", 13, 10, "Simply let me know how many you would like to see.", 13, 10, "I'll accept orders for up to 300 composites.", 13, 10, 0
	;extra		BYTE		"**EC: Calculate and display the average as a floating-point number, rounded to the nearest .001.", 13, 10, 0
	prompt		BYTE		"How many composites do you want to view? [1 .. 300]: ", 0
	error		BYTE		"Out of range. Please try again.", 13, 10, 0
	bye			BYTE		13, 10, "Thanks for using my program!", 0
	spacer		BYTE		"   ", 0

	; program variables
	num			DWORD		?
	curr		DWORD		0
	newline		DWORD		0

.code
main PROC
	call	introduction		; Prints the program title, author's name, & extra credit tag.
	call	getUserData			; Repeatedly prompts the user for a number until one is given in the range 1 to 300.
	call	showComposites		; Loops a num ammount of composite numbers
	call	goodbye				; tells the user goodbye & prints their name
	exit						; exit to operating system
main ENDP

introduction PROC
	mov		edx, OFFSET intro	; prints the program intro to the user
	call	WriteString
	;mov	edx, OFFSET extra
	;call	WriteString
	ret
introduction ENDP

getUserData PROC
	mov		edx, OFFSET prompt	; repeatedly prompts the user to input a number
	call	WriteString			; until a valid number is input
	call	ReadInt
	mov		num, eax
	call	validate
	ret
getUserData ENDP

validate PROC
	cmp		num, RANGE_MIN		; validates the input number is between min & max
	jl		outOfRange			; if it is not valid, outOfRange is called,
	cmp		num, RANGE_MAX		; otherwise, valid is called
	jg		outOfRange
	jmp		valid
	
; Gives the user an out of range error & then jumps to numPrompt to get another user input.
outOfRange:
	mov		edx, OFFSET error
	call	WriteString
	call	getUserData

; Returns when a valid number is given by the user.
valid:
	ret
	
validate ENDP

showComposites PROC
	mov		ecx, num			; loops num times, increasing curr each time and calling isComposite to
findComposite:					; check if curr is composite, if not ecx is increased to account for 
	inc		curr				; loop decreasing it
	call	isComposite

	loop	findComposite
	ret
showComposites ENDP

isComposite PROC
	cmp		curr, 4				; if curr < 4, it cannot be composite
	jl		notComp

; Checks each number between 2 & the square root of curr to see if curr is divisible by this number
; The upper limit is the square root because, if larger, the factors multipled together would exceed curr
	mov		ebx, 1
divisibleLoop:
	inc		ebx					; increments ebx by 1 each loop

	mov		eax, curr			; checks if curr is divisible by ebx
	cdq
	div		ebx
	cmp		edx, 0				; when remainer (edx) is 0, curr is divisible by ebx
	je		isComp				; if curr is divisible by ebx, curr is a composite num

	mov		eax, ebx			; loops divisibleLoop when ebx^2 <= curr
	mul		ebx
	cmp		eax, curr		
	jle		divisibleLoop

	jmp		notComp				; when a comp has not been found after looping, call notComp

; Prints the curr number when it is a composite
isComp:
	mov		eax, curr			; prints curr with 3 spaces after
	call	WriteDec
	mov		edx, OFFSET spacer
	call	WriteString

	inc		newline				; after each comp is printed, neline is increased by 1
	mov		eax, newline		; when newline is divisible by 10, a new line is printed
	mov		ebx, 10				; this effectively prints a new line after each 10 comps
	cdq
	div		ebx
	cmp		edx, 0
	je		createNewline
	ret

; Prints a newline & returns procedure
createNewline:
	call	Crlf
	ret

; Increases ecx to account for the showComposites loop decreasing ecx, even when a comp was not found
notComp:
	inc		ecx
	ret
isComposite ENDP

goodbye PROC
	mov		edx, OFFSET bye	; say goodbye to the user
	call	WriteString
	ret
goodbye ENDP

END main
