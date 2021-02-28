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
		mov si,0
		mov di,0
		mov bx,0
		mov cx,4
	s:	mov al,[bx+si]
		and al,11011111b
		mov [bx+si],al
		add bx,16
		loop s
		
		mov ax,4c00H
		int 21H
codesg ends

end start
		
		
	