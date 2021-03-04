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

table segment 
	db 21 dup ('year summ ne ?? ') 
	
	;'year summ ne ?? ' 刚好 16 个字节 
table ends

stack segment

	db 0,0,0,0,0,0,0,0

stack ends

code segment

	start:
	mov ax,data
	mov ds,ax
	mov ax,table
	mov es,ax
	mov ax,stack
	mov ss,ax


	mov dx,0
	mov cx,21
	s0:	push cx
		mov si,0
		mov cx,2
	
	s1:	mov ax,ds:[si+0H]
		mov es:[bx+si],ax
		add si,2
		loop s1
		add bx,10H
		add dx,4H
		pop cx
		loop s0
	
	mov bx,0
	mov cx,21
	s2:	push cx
		mov si,0
		mov cx,2
	s3:	mov ax,ds:[si+0H]
		mov es:[bx+si+6H],ax
		add si,2
		loop s3
		add bx,10H
		add dx,4
		pop cx
		loop s0

	
	mov ax,4c00H
	int 21H
			

code ends

end start
