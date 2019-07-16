struc __marks
	.maths:	resb	2
	.physics:	resb	2
	.chemistry:	resb	2
endstruc

section .data
	intwrite:	db	'%hd',10,0
	intread:	db	'%hd',0

section .text
	global main
	extern printf
	extern scanf

main:
	sub	rsp, 8

	mov	r8w, 1
	mov	[temp2 + 0], r8w
	mov	r8w, [temp2 + 0]
	mov	[b5], r8w
	mov	rdi, intread
	mov	rsi, d5cb34567
	mov	rax, 0
	call	scanf
	mov	r8w, 0
	mov	[temp2 + 0], r8w
	mov	r8w, [temp2 + 0]
	mov	[d4 + __marks.maths], r8w
	mov	r8w, 0
	mov	[temp2 + 0], r8w
	mov	r8w, [temp2 + 0]
	mov	[d4 + __marks.physics], r8w
	mov	r8w, 0
	mov	[temp2 + 0], r8w
	mov	r8w, [temp2 + 0]
	mov	[d4 + __marks.chemistry], r8w
label1:
	mov	r8w, [b5]
	mov	[temp2 + 0], r8w
	mov	r8w, [d5cb34567]
	mov	[temp2 + 2], r8w
	mov	r8w, [temp2 + 2]
	cmp	[temp2 + 0], r8w
	setle	r9b
	mov	[temp1 + 0], r9b
	cmp	[temp1 + 0], byte 1
	jne	label2
	mov	rdi, intread
	mov	rsi, b3c2 + __marks.maths
	mov	rax, 0
	call	scanf
	mov	rdi, intread
	mov	rsi, b3c2 + __marks.physics
	mov	rax, 0
	call	scanf
	mov	rdi, intread
	mov	rsi, b3c2 + __marks.chemistry
	mov	rax, 0
	call	scanf
	mov	r8w, [b3c2]
	mov	[temp2 + 0], r8w
	mov	r8w, [d4]
	mov	[temp2 + 2], r8w
	mov	r8w, [temp2 + 2]
	add	[temp2 + 0], r8w
	mov	r8w, [temp2 + 0]
	mov	[d4], r8w
	mov	r8w, [b5]
	mov	[temp2 + 0], r8w
	mov	r8w, 1
	mov	[temp2 + 2], r8w
	mov	r8w, [temp2 + 2]
	add	[temp2 + 0], r8w
	mov	r8w, [temp2 + 0]
	mov	[b5], r8w
	jmp	label1
label2:
	mov	rdi, intwrite
	mov	rsi, [d4]
	mov	rax, 0
	call	printf

	add	rsp, 8
	ret

section .bss
	d4:	resb	__marks_size
	b5:	resb	2
	d5cb34567:	resb	2
	b3c2:	resb	__marks_size
	temp1:	resb	1
	temp2:	resb	4
