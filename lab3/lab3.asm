assume cs:lab3

lab3 segment
	
	mov ax,20h
	mov ds,ax	
	mov bx,0
	mov cx,64

s:	mov ds:[bx],bl
	inc bx;
	loop s

	mov ax,4c00h
	int 21h

lab3 ends

end

