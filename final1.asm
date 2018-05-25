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