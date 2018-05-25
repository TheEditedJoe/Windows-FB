    .486                                    ; create 32 bit code
    .model flat, stdcall                    ; 32 bit memory model
    option casemap :none                    ; case sensitive
    include \masm32\include\windows.inc     ; always first
    include \masm32\macros\macros.asm       ; MASM support macros
  ; -----------------------------------------------------------------
  ; include files that have MASM format prototypes for function calls
  ; -----------------------------------------------------------------
    include \masm32\include\masm32.inc
	include \masm32\include\windows.inc
    include \masm32\include\gdi32.inc
    include \masm32\include\user32.inc
    include \masm32\include\kernel32.inc
	include \masm32\include\msvcrt.inc
  ; ------------------------------------------------
  ; Library files that have definitions for function
  ; exports and tested reliable prebuilt code.
  ; ------------------------------------------------
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\gdi32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib
	includelib  \masm32\lib\msvcrt.lib

  ; --------------------------------------------------------------
  ; This is a prototype for a procedure used in the demo. It tells
  ; MASM how many parameters are passed to the procedure and how
  ; big they are. This makes procedure calls far more reliable as
  ; MASM will not allow different sizes or different numbers of
  ; parameters to be passed. Note that a C calling convention
  ; procedure CAN have a variable number of arguments but these
  ; examples use the normal Windows STDCALL convention which is
  ; different.
  ; --------------------------------------------------------------
    show_text PROTO :DWORD

	EXTERN MessageBoxA@16 : proc
EXTERN ExitProcess@4 : proc

.const
zero db 'The Decimal Value of 0 is 0', 0			; message for output for the if else statements 
one db 'The Decimal Value of 1 is 1', 0				; message for output for the if else statements 
two db 'The Decimal Value of 2 is 2', 0				; message for output for the if else statements 
three db 'The Decimal Value of 3 is 3', 0			; message for output for the if else statements 
four db 'The Decimal Value of 4 is 4', 0			; message for output for the if else statements 
five db 'The Decimal Value of 5 is 5', 0			; message for output for the if else statements 
six db 'The Decimal of 6 is 6', 0					; message for output for the if else statements 
seven db 'The Decimal of 7 is 7', 0					; message for output for the if else statements 
eight db 'The Decimal of 8 is 8', 0					; message for output for the if else statements 
nine db 'The Decimal Value of 9 is 9', 0			; message for output for the if else statements 
ten db 'The Decimal Value of A is 10', 0			; message for output for the if else statements 
eleven db 'The Decimal Value of B is 11', 0			; message for output for the if else statements 
twelve db 'The Decimal Value of C is 12', 0			; message for output for the if else statements 
thirteen db 'The Decimal Value of D is 13', 0		; message for output for the if else statements 
fourteen db 'The Decimal Value of E is 14', 0		; message for output for the if else statements 
fifteen db 'The Decimal Value of F is 15', 0		; message for output for the if else statements 

msgCaption db 'Hexidecimal To Binary', 0
msg         db 'Please Choose An Option',13,10,0

    .code                       ; Tell MASM where the code starts
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
start:                          ; The CODE entry point to the program
    call main                   ; branch to the "main" procedure
    exit
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
main proc
    LOCAL txtinput:DWORD										; A "handle" for the text returned by "input"
    mov txtinput, input("Please Type Your First Name : ")		; Prints a message and asks for input, txtinput	
	printc "You Entered: "										; Prints a message and that tells what the user inputted
	printc txtinput												; Prints out what the user entered
	printc "\n"													; Makes a new line
	printc "\n"													; Makes a new line



		printc "Please Enter A Hexidecimal Value Between 0 And F, Then Press Enter. Press q And Then Enter To Quit\n"

	.repeat
		
		invoke  crt_getchar

		.if eax == '0'

				push 0
				push offset msgCaption
				push offset zero
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == '1'

				push 0
				push offset msgCaption
				push offset one
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == '2'

				push 0
				push offset msgCaption
				push offset two
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == '3'

				push 0
				push offset msgCaption
				push offset three
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == '4'

				push 0
				push offset msgCaption
				push offset four
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == '5'

				push 0
				push offset msgCaption
				push offset five
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == '6'

				push 0
				push offset msgCaption
				push offset six
				push 0
				call MessageBoxA@16
				push eax


		.elseif eax == '7'

				push 0
				push offset msgCaption
				push offset seven
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == '8'

				push 0
				push offset msgCaption
				push offset eight
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == '9'

				push 0
				push offset msgCaption
				push offset nine
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == 'A' || eax == 'a'

				push 0
				push offset msgCaption
				push offset ten
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == 'B'

				push 0
				push offset msgCaption
				push offset eleven
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == 'C'

				push 0
				push offset msgCaption
				push offset twelve
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == 'D'

				push 0
				push offset msgCaption
				push offset thirteen
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == 'E'

				push 0
				push offset msgCaption
				push offset fourteen
				push 0
				call MessageBoxA@16
				push eax

		.elseif eax == 'F'

				push 0
				push offset msgCaption
				push offset fifteen
				push 0
				call MessageBoxA@16
				push eax


		.endif

		.until eax == 'q'

	;call ExitProcess@4

    invoke show_text, txtinput
    ret
main endp
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
show_text proc string:DWORD

    print chr$("Thank You",13,10)
    print string                ; show the string at the console
    print chr$(" For Using The Hexidecimal To Decimal Converter",13,10)
	printc "\n"																		; Makes a new line
    ret
show_text endp
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
end start                       ; Tell MASM where the program ends
