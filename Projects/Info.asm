    .486                                    ; create 32 bit code
    .model flat, stdcall                    ; 32 bit memory model
    option casemap :none                    ; case sensitive
    include \masm32\include\windows.inc     ; always first
    include \masm32\macros\macros.asm       ; MASM support macros
  ; -----------------------------------------------------------------
  ; include files that have MASM format prototypes for function calls
  ; -----------------------------------------------------------------
    include \masm32\include\masm32.inc
    include \masm32\include\gdi32.inc
    include \masm32\include\user32.inc
    include \masm32\include\kernel32.inc
  ; ------------------------------------------------
  ; Library files that have definitions for function
  ; exports and tested reliable prebuilt code.
  ; ------------------------------------------------
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\gdi32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib


    show_text PROTO :DWORD

	EXTERN MessageBoxA@16 : proc
EXTERN ExitProcess@4 : proc

.const
;msgText db 'Windows assembly language lives!', 0
msgText db 'Windows assembly language lives!', 0
msgCaption db 'Hello World', 0

    .code                       ; Tell MASM where the code starts
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
start:                          ; The CODE entry point to the program
    call main                   ; branch to the "main" procedure
    exit
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
main proc
    LOCAL txtinput:DWORD        ; a "handle" for the text returned by "input"
	

    ;mov txtinput, input("Type some text at the cursor : ")
	;mov txtinput, input("Type some other text at the cursor : ")

	push 0
	push offset msgCaption
	push offset msgText
	push 0
	call MessageBoxA@16
	push eax
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
