; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
;                 Build this with the "Project" menu using
;                        "Console Assemble & Link"
comment * «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
There is another method of allocating space for uninitialized data inMASM that can only be done within a procedure. The use of LOCAL variables is possible in a procedure because the memory from the "stack" can be used in this way.

In MASM, allocating a LOCAL uninitialized variable is done at the beginning of a procedure BEFORE you write any code in the procedure. With memory allocated on the stack, it can only be used within that procedure and is deallocated at the end of the procedure on exit.
    LOCAL MyVar:DWORD       ; allocate a 32 bit space on the stack
    LOCAL Buffer[128]:BYTE  ; allocate 128 BYTEs of space for TEXT data.

Variables created on the stack in this manner are sometimes called automatic variables and their main advantage is being fast, flexible and easy to use. This demo also shows how to get user input from the console using "input". It also introduces a simple procedure that has a value passed to it and the procedure uses a PROTOTYPE to enable size and parameter count checking to make the code more reliable.
««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««« *
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
;msgText db 'Windows assembly language lives!', 0
msgText db 'Windows assembly language lives!', 0
msgCaption db 'Hello World', 0
msg         db 'Press something',13,10,0

    .code                       ; Tell MASM where the code starts
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
start:                          ; The CODE entry point to the program
    call main                   ; branch to the "main" procedure
    exit
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
main proc
    LOCAL txtinput:DWORD        ; a "handle" for the text returned by "input"
    mov txtinput, input("Type some text at the cursor : ")
	printc "You Entered: "
	printc txtinput
	printc "\n"


	invoke  crt_printf,ADDR msg

	.repeat
    invoke  crt_getchar

	.if eax == '1'

	push 0
	push offset msgCaption
	push offset msgText
	push 0
	call MessageBoxA@16
	push eax

	.elseif eax == '2'
	printc "Two"
	printc "\n"
	.elseif eax == '3'
	printc "Three"
	printc "\n"
	.elseif eax == '4'
	printc "Four"
	printc "\n"
	.elseif eax == '5'
	printc "Five"
	printc "\n"
	.elseif eax == '6'
	printc "Six"
	printc "\n"

	.endif

	.until eax == 'q'

		printc "Left the loop"

	;call ExitProcess@4

    ;invoke show_text, txtinput
    ret
main endp
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
show_text proc string:DWORD

    print chr$("This is what you typed at the cursor",13,10,"     *** ")
    print string                ; show the string at the console
    print chr$(" ***",13,10)
    ret
show_text endp
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
end start                       ; Tell MASM where the program ends
