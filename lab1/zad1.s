	.file	"zad1.c"
	.section	.rodata
.LC0:
	.string	"x = %hd,y = %hd \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movw	$1, -4(%rbp)
	movw	$2, -2(%rbp)
	movzwl	-4(%rbp), %edx
#APP
# 10 "zad1.c" 1
	.intel_syntax noprefix ;mov ax,0;mov %dx;ax;.att_suntax prefix;
# 0 "" 2
#NO_APP
	movw	%dx, -2(%rbp)
	movswl	-2(%rbp), %edx
	movswl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
