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
six db 'The Decimal of 6 is 6', 0				; message for output for the if else statements 
seven db 'The Decimal of 7 is 7', 0				; message for output for the if else statements 
eight db 'The Decimal of 8 is 8', 0				; message for output for the if else statements 
nine db 'The Decimal Value of 9 is 9', 0			; message for output for the if else statements 
ten db 'The Decimal Value of A is 10', 0			; message for output for the if else statements 
eleven db 'The Decimal Value of B is 11', 0			; message for output for the if else statements 
twelve db 'The Decimal Value of C is 12', 0			; message for output for the if else statements 
thirteen db 'The Decimal Value of D is 13', 0			; message for output for the if else statements 
fourteen db 'The Decimal Value of E is 14', 0			; message for output for the if else statements 
fifteen db 'The Decimal Value of F is 15', 0			; message for output for the if else statements 

msgCaption db 'Hexidecimal To Binary', 0
msg         db 'Please Choose An Option',13,10,0

    .code                       ; Tell MASM where the code starts
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
start:                          ; The CODE entry point to the program
    call main                   ; branch to the "main" procedure
    exit
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
main proc
    LOCAL txtinput:DWORD							; A "handle" for the text returned by "input"
    mov txtinput, input("Please Type Your First Name : ")			; Prints a message and asks for input, txtinput	
	printc "You Entered: "							; Prints a message and that tells what the user inputted
	printc txtinput								; Prints out what the user entered
	printc "\n"								; Makes a new line
	printc "\n"								; Makes a new line



		printc "Please Enter A Single Hexidecimal Value Between 0 And F, Then Press Enter. Press q And Then Enter To Quit\n"		; Prints a message and that tells the user what to do

	.repeat													; For loop for the converter
		
		invoke  crt_getchar										; Gets input from the user

		.if eax == '0'											; If the user enters 0

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset zero								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == '1'										; If the user enters 1

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset one									; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == '2'										; If the user enter 2

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset two									; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == '3'										; If the user enter 3

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset three								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == '4'										; If the user enter 4

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset four								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == '5'										; If the user enter 5

				push 0
				push offset msgCaption								; Push message on the stack for pop up window
				push offset five								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == '6'										; If the user enter 6

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset six									; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack


		.elseif eax == '7'										; If the user enter 7

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset seven								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == '8'										; If the user enter 8

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset eight								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == '9'										; If the user enter 9

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset nine								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == 'A' || eax == 'a'								; If the user enter A or a

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset ten									; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == 'B' || eax == 'b'								; If the user enter B or b

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset eleven								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == 'C' || eax == 'c'								; If the user enter C or c

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset twelve								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == 'D' || eax == 'd'								; If the user enter D or d

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset thirteen								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == 'E' || eax == 'e'								; If the user enter E or e

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset fourteen								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack

		.elseif eax == 'F' || eax == 'f'								; If the user enter F or f

				push 0										; Creates a variable
				push offset msgCaption								; Push message on the stack for pop up window
				push offset fifteen								; Creates a variable for pop up window
				push 0										; Creates a variable
				call MessageBoxA@16								; Calls the pop up window
				push eax									; Pushes what's on eax onto the stack


		.endif												; End of the loop

		.until eax == 'q'										; If the user enters q, it will exit the loop



    invoke show_text, txtinput											; Goes to the show_text and it will output the name that was entered at the beginning

    ret														; Pops everything back
main endp
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
show_text proc string:DWORD

    print chr$("Thank You",13,10)										; Prints out Thank you on the console window
    print string												; Prints the name that was entered at the beging in the console			
    print chr$(" For Using The Single Hexidecimal To Decimal Converter",13,10)					; Prints the message after the window
	printc "\n"												; Makes a new line
    ret
show_text endp
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
end start                     											; Tell MASM where the program ends
