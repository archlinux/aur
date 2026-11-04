/*
 * ns4jmp: setjmp/longjmp without glibc pointer mangling, for Netscape 4.
 *
 * NSPR's classic (user-level) threads build a jmp_buf by hand, storing a
 * raw stack pointer in __jmpbuf[JB_SP].  glibc >= 2.4 demangles that slot
 * in longjmp, so the new thread lands on a garbage stack and segfaults in
 * PR_Start.  These replacements use the plain i386 glibc 2.0 layout:
 *   __jmpbuf[0..5] = ebx, esi, edi, ebp, esp, pc
 *   +24 int __mask_was_saved, +28 __sigset_t __saved_mask
 */

	.text

.macro SAVE_REGS
	movl	4(%esp), %eax
	movl	%ebx, 0(%eax)
	movl	%esi, 4(%eax)
	movl	%edi, 8(%eax)
	movl	%ebp, 12(%eax)
	leal	4(%esp), %ecx
	movl	%ecx, 16(%eax)
	movl	0(%esp), %ecx
	movl	%ecx, 20(%eax)
.endm

	.globl	__sigsetjmp
	.type	__sigsetjmp, @function
__sigsetjmp:
	SAVE_REGS
	pushl	8(%esp)
	pushl	%eax
	call	ns4jmp_save_mask
	addl	$8, %esp
	xorl	%eax, %eax
	ret
	.size	__sigsetjmp, .-__sigsetjmp

	.globl	setjmp
	.type	setjmp, @function
setjmp:
	SAVE_REGS
	pushl	$1
	pushl	%eax
	call	ns4jmp_save_mask
	addl	$8, %esp
	xorl	%eax, %eax
	ret
	.size	setjmp, .-setjmp

	.globl	_setjmp
	.type	_setjmp, @function
_setjmp:
	SAVE_REGS
	movl	$0, 24(%eax)
	xorl	%eax, %eax
	ret
	.size	_setjmp, .-_setjmp

/* void ns4jmp_restore(jmp_buf env, int val) -- does not return */
	.globl	ns4jmp_restore
	.hidden	ns4jmp_restore
	.type	ns4jmp_restore, @function
ns4jmp_restore:
	movl	4(%esp), %ecx
	movl	8(%esp), %eax
	testl	%eax, %eax
	jnz	1f
	incl	%eax
1:	movl	20(%ecx), %edx
	movl	0(%ecx), %ebx
	movl	4(%ecx), %esi
	movl	8(%ecx), %edi
	movl	12(%ecx), %ebp
	movl	16(%ecx), %esp
	jmp	*%edx
	.size	ns4jmp_restore, .-ns4jmp_restore

	.section .note.GNU-stack,"",@progbits
