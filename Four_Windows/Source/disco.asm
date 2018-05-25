.386 
.model flat,stdcall 
option casemap:none
WinMain proto :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD ;the dwords represtent the blank spaces in the thing to call

;#########################################################################################
;######								Includes									##########
;#########################################################################################
include \masm32\include\windows.inc 
include \masm32\include\user32.inc 
include \masm32\include\kernel32.inc 
include \masm32\include\gdi32.inc 
includelib \masm32\lib\user32.lib 
includelib \masm32\lib\kernel32.lib 
includelib \masm32\lib\gdi32.lib
include \masm32\macros\macros.asm 
include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib

;#########################################################################################
;######								Variables									##########
;#########################################################################################

.data 

ClassName db "SimpleWinClass",0	
AppName  db "A Tiny Box",0				; name of the window
char WPARAM 20h                         ; the character the program receives from keyboard
xtran db 225								; setting the original position to be translated by 200 for the x and y
ytran db 10
ucount db 0								; counter variable for the ammount of windows that are opened
OurText db "Press any button, There can only be four of us."		; window text

.data?									;uninitialized data section
hInstance HINSTANCE ? 
CommandLine LPSTR ?

;#########################################################################################
;######							Start of Program								##########
;#########################################################################################

.code 

start:									; start of program

    invoke GetModuleHandle, NULL		; invoking the instance handleing bit
    mov    hInstance,eax 
    invoke GetCommandLine				; practically unessary here but i may want to use it 
    mov CommandLine,eax

	invoke WinMain, hInstance,NULL,CommandLine, SW_SHOWDEFAULT, xtran, ytran			; start by invoking our winmain procedure at the possition X: 115, Y: 10


WinMain proc hInst:HINSTANCE,hPrevInst:HINSTANCE,CmdLine:LPSTR,CmdShow:DWORD,X:DWORD,Y:DWORD
LOCAL wc:WNDCLASSEX 
LOCAL msg:MSG 
LOCAL hwnd:HWND
    mov   wc.cbSize,SIZEOF WNDCLASSEX				;following is the items required to build the window
    mov   wc.style, CS_HREDRAW or CS_VREDRAW 
    mov   wc.lpfnWndProc, OFFSET WndProc
    mov   wc.cbClsExtra,NULL 
    mov   wc.cbWndExtra,NULL
    push  hInst 
    pop   wc.hInstance 
    mov   wc.hbrBackground,COLOR_WINDOW+15			;using color window with the offset of 15
    mov   wc.lpszMenuName,NULL 
    mov   wc.lpszClassName,OFFSET ClassName 
    invoke LoadIcon,NULL,IDI_APPLICATION 
    invoke LoadCursor,NULL,IDC_ARROW 
    mov   wc.hCursor,eax 
    invoke RegisterClassEx, addr wc				;register the window
    invoke CreateWindowEx,NULL,ADDR ClassName,ADDR AppName,\			;start the window with the position paramiters specified before 
           WS_POPUPWINDOW,X,\ 
           Y,350,150,NULL,NULL,\ 
           hInst,NULL 
    mov   hwnd,eax 
    invoke ShowWindow, hwnd,SW_SHOW										;bring the window into view
    invoke UpdateWindow, hwnd											
	.WHILE TRUE															; starts grabbing and waiting for input from the window 
				invoke GetMessage, ADDR msg,NULL,0,0					; is grabbing the input from the window and placing it in msg
                .BREAK .IF (!eax) 
                invoke TranslateMessage, ADDR msg 
                invoke DispatchMessage, ADDR msg 
     .ENDW 
    mov     eax,msg.wParam 
    ret 
WinMain endp

boxproc proc															; this used to do so much oh my god, now it is just a reminder of what could have been and it is another place where the who process can be left
invoke ExitProcess,NULL
ret
boxproc endp


WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM		; here we handle the logic behind the window 
    LOCAL hdc:HDC 
    LOCAL ps:PAINTSTRUCT
	LOCAL rect:RECT
    .IF uMsg==WM_DESTROY											;if the user somehow closes a window then leave the program
        invoke PostQuitMessage,NULL 
    .ELSEIF uMsg==WM_CHAR											; on the input of a charecter add one to count add X:200  and y:200 then open an new window and begin the paint sequence
		add ucount,1
		add xtran, 200
		add ytran, 100
		invoke WinMain, hInstance,NULL,CommandLine, SW_SHOWDEFAULT, xtran, ytran
		invoke PaintDesktop, hdc
    .ELSEIF uMsg==WM_PAINT											; on the message paint write the text on the window  from OurText
        invoke BeginPaint,hWnd, ADDR ps 
        mov    hdc,eax 
        invoke GetClientRect,hWnd, ADDR rect 
        invoke DrawText, hdc,ADDR OurText,-1, ADDR rect, \			;this specifically does that
                DT_SINGLELINE or DT_CENTER or DT_VCENTER 
		invoke EndPaint,hWnd, ADDR ps
		ret
	.ELSEIF ucount==4												; once 4 windows are open visavi ad ucount,1 to count the ammount of open windows
		invoke ExitProcess,NULL
		xor eax,eax
		ret
    .ELSE
        invoke DefWindowProc,hWnd,uMsg,wParam,lParam				; if it gets through then Do defwindow
    .ENDIF 
		 ret														;if we end make sure everything is returned 


WndProc endp 
end start