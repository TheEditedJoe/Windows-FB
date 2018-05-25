; Program did not run because of this error: 1>C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V140\Microsoft.Cpp.Platform.targets(57,5): error MSB8020: The build tools for v141 (Platform Toolset = 'v141') cannot be found. To build using the v141 build tools, please install v141 build tools.  Alternatively, you may upgrade to the current Visual Studio tools by selecting the Project menu or right-click the solution, and then selecting "Retarget solution".
 It needs to be rebuilt.

include\masm32\include\masm32rt.inc

.data
	inp1 BYTE "none"
	inpend BYTE "stop"
		BYTE 0
.data?
	pszInput PCHAR ?
.code

start:
	mov pszInput,input("Enter your name:")
	printc "You Entered: "
	printc pszInput
	printc "\n"

	cld
	mov edi,pszInput
	xor eax,eax
	mov ecx,-1
	repne scasb
	sub edi,pszInput
	lea ecx,[edi-1]

	cmp ecx,LENGTHOF inpend
	jne start

	mov esi,OFFSET inpend
	mov edi,pszInput
	repe cmpsd
	jnz start

	print "method 2:",13,10

	start2:
		mov pszInput,input("The county you reside in:")
		invoke lstrcmp,OFFSET inpend,pszInput
		test eax,eax
		jnz start2

		print "method 3: ",13,10

	start3:
		mov pszInput,input
		switch$ pszInput
		case$ "stop"

		else$
			jmp start3 
		endsw$


		inkey
		exit
	end start