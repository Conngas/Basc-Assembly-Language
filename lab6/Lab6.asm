assume cs:codesg,ss:stacksg,ds:datasg

stacksg segment
	dw 0,0,0,0,0,0,0,0
stacksg ends

datasg segment
	db '1. disply       '
	db '2. brows        '
	db '3. replace      '
	db '4. modify       '
datasg ends

codesg segment
	start:	mov ax,datasg
		mov ds,ax
		mov bx,0
		mov cx,4
	s0:	push cx
		mov si,0
		mov cx,4
	s:	mov al,[bx+si+3]
		and al,11011111b
		mov [bx+si+3],al 
		inc si
		loop s
	
		pop cx
		add bx,10H
		loop s0
		
		mov ax,4c00H
		int 21h
	
codesg ends

end start