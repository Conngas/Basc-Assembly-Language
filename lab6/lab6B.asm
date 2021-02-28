assume cs:codesg,ds:datasg,ss:stacksg

stacksg segment
	dw 0,0,0,0,0,0,0,0
stacksg ends

datasg segment
	db 'disply          '
	db 'brows           '
	db 'replace         '
	db 'modify          '
datasg ends

codesg segment
	start:	mov ax,datasg
		mov ds,ax
		mov bx,0

		mov cx,4
	s0:	mov dx,cx
		mov si,0
		mov cx,4
	s:	mov al,[bx+si]
		and al,11011111b
		mov [bx+si],al
		inc si
		loop s
		
		add bx,10h
		mov cx,dx
		loop s0

		mov ax,4c00H
		int 21H

codesg ends

end start
		