assume cs:code,ds:data,es:table,ss:stack

data segment 
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983' 
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992' 
	db '1993','1994','1995' 
	;以上是表示 21 年的字符串 4 * 21 = 84

	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514 
	dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000 
	;以上是表示 21 年公司总收入的 dword 型数据 4 * 21 = 84

	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226 
	dw 11542,14430,15257,17800 
	;以上是表示 21 年公司雇员人数的 21 个 word 型数据 2 * 21 = 42 
data ends

stack segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stack ends

table segment 
	db 21 dup ('year summ ne ?? ') 
	
	;'year summ ne ?? ' 刚好 16 个字节 
table ends

code segment
start:	mov ax,data
	mov ds,ax
	mov ax,table
	mov es,ax
	mov ax,stack
	mov ss,ax
	mov bp,0;year
	mov di,0;count year
	mov bx,0;year
	mov di,0;data year
	mov bp,0

	mov cx,21
	
	mov di,0;counts year
s0:	push cx
	mov cx,4
	mov si,0;bit(only for year,income)
s:	
	mov al,ds:[di]
	mov es:[bx+si],al
	
	mov al,ds:[si+054h]
	mov es:[bx+si+05h],al
	inc si
	inc di
	loop s

	;emp
	mov ax,ds:[bp+0a8h]
	mov es:[bx+0ah],ax

	;income avage, income 
	mov dx,es:[bx+07h]
	mov ax,es:[bx+05h]
	
	push bx
	mov bx,es:[bx+0ah]
	div bx
	pop bx
	mov es:[bx+0dh],ax
	
	add bp,2
	add bx,10h
	pop cx
	loop s0
	
	mov ax,4c00h
	int 21h

code ends

end start