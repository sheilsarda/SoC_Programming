	.arch armv8-a+crypto+crc
	.file	"Utilities.cpp"
	.text
	.align	2
	.p2align 4,,15
	.global	_Z15Exit_with_errorv
	.type	_Z15Exit_with_errorv, %function
_Z15Exit_with_errorv:
.LFB3013:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x0, 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	bl	perror
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE3013:
	.size	_Z15Exit_with_errorv, .-_Z15Exit_with_errorv
	.align	2
	.p2align 4,,15
	.global	_Z9Load_dataPh
	.type	_Z9Load_dataPh, %function
_Z9Load_dataPh:
.LFB3014:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	adrp	x1, .LC0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	adrp	x2, .LC1
	add	x1, x1, :lo12:.LC0
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	mov	x21, x0
	add	x0, x2, :lo12:.LC1
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	bl	fopen
	cbz	x0, .L6
	mov	x20, 1024
	movk	x20, 0x317, lsl 16
	mov	x3, x0
	mov	x19, x0
	mov	x1, 1
	mov	x2, x20
	mov	x0, x21
	bl	fread
	cmp	x0, x20
	bne	.L6
	mov	x0, x19
	bl	fclose
	cbnz	w0, .L6
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
.L6:
	.cfi_restore_state
	bl	_Z15Exit_with_errorv
	.cfi_endproc
.LFE3014:
	.size	_Z9Load_dataPh, .-_Z9Load_dataPh
	.align	2
	.p2align 4,,15
	.global	_Z17pin_thread_to_cpuRSt6threadi
	.type	_Z17pin_thread_to_cpuRSt6threadi, %function
_Z17pin_thread_to_cpuRSt6threadi:
.LFB3015:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	sxtw	x3, w1
	cmp	x3, 1023
	add	x2, x29, 32
	stp	xzr, xzr, [x29, 32]
	stp	xzr, xzr, [x29, 48]
	stp	xzr, xzr, [x29, 64]
	stp	xzr, xzr, [x29, 80]
	stp	xzr, xzr, [x29, 96]
	stp	xzr, xzr, [x29, 112]
	stp	xzr, xzr, [x29, 128]
	stp	xzr, xzr, [x29, 144]
	str	x19, [sp, 16]
	.cfi_offset 19, -144
	bhi	.L9
	lsr	x3, x3, 6
	and	w1, w1, 63
	ldr	x4, [x2, x3, lsl 3]
	mov	x5, 1
	lsl	x1, x5, x1
	orr	x1, x4, x1
	str	x1, [x2, x3, lsl 3]
.L9:
	mov	x1, 128
	ldr	x0, [x0]
	bl	pthread_setaffinity_np
	mov	w19, w0
	cbz	w0, .L8
	str	x20, [x29, 24]
	.cfi_offset 20, -136
	adrp	x1, .LC2
	adrp	x20, _ZSt4cerr
	add	x20, x20, :lo12:_ZSt4cerr
	mov	x2, 38
	add	x1, x1, :lo12:.LC2
	mov	x0, x20
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	w1, w19
	mov	x0, x20
	bl	_ZNSolsEi
	adrp	x1, .LC3
	mov	x2, 1
	add	x1, x1, :lo12:.LC3
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x20, [x29, 24]
	.cfi_restore 20
.L8:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 160
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3015:
	.size	_Z17pin_thread_to_cpuRSt6threadi, .-_Z17pin_thread_to_cpuRSt6threadi
	.align	2
	.p2align 4,,15
	.global	_Z23pin_main_thread_to_cpu0v
	.type	_Z23pin_main_thread_to_cpu0v, %function
_Z23pin_main_thread_to_cpu0v:
.LFB3016:
	.cfi_startproc
	stp	x29, x30, [sp, -176]!
	.cfi_def_cfa_offset 176
	.cfi_offset 29, -176
	.cfi_offset 30, -168
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x19, [sp, 16]
	.cfi_offset 19, -160
	mov	x19, 1
	bl	pthread_self
	add	x3, x29, 56
	stp	xzr, xzr, [x29, 56]
	add	x1, x29, 48
	mov	x2, x1
	mov	x1, 128
	str	x19, [x29, 48]
	stp	xzr, xzr, [x3, 16]
	stp	xzr, xzr, [x3, 32]
	stp	xzr, xzr, [x3, 48]
	stp	xzr, xzr, [x3, 64]
	stp	xzr, xzr, [x3, 80]
	stp	xzr, xzr, [x3, 96]
	str	xzr, [x3, 112]
	bl	pthread_setaffinity_np
	cbz	w0, .L15
	stp	x20, x21, [x29, 24]
	.cfi_offset 21, -144
	.cfi_offset 20, -152
	adrp	x1, .LC2
	adrp	x21, _ZSt4cerr
	add	x21, x21, :lo12:_ZSt4cerr
	mov	w20, w0
	mov	x2, 38
	add	x1, x1, :lo12:.LC2
	mov	x0, x21
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	w1, w20
	mov	x0, x21
	bl	_ZNSolsEi
	adrp	x1, .LC3
	mov	x2, x19
	add	x1, x1, :lo12:.LC3
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldp	x20, x21, [x29, 24]
	.cfi_restore 21
	.cfi_restore 20
.L15:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 176
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3016:
	.size	_Z23pin_main_thread_to_cpu0v, .-_Z23pin_main_thread_to_cpu0v
	.align	2
	.p2align 4,,15
	.global	_Z10Store_dataPKcPhj
	.type	_Z10Store_dataPKcPhj, %function
_Z10Store_dataPKcPhj:
.LFB3017:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	mov	x21, x1
	adrp	x1, .LC4
	add	x1, x1, :lo12:.LC4
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	uxtw	x19, w2
	bl	fopen
	cbz	x0, .L23
	mov	x3, x0
	mov	x20, x0
	mov	x1, 1
	mov	x2, x19
	mov	x0, x21
	bl	fwrite
	cmp	x19, x0
	bne	.L23
	mov	x0, x20
	bl	fclose
	cbnz	w0, .L23
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
.L23:
	.cfi_restore_state
	bl	_Z15Exit_with_errorv
	.cfi_endproc
.LFE3017:
	.size	_Z10Store_dataPKcPhj, .-_Z10Store_dataPKcPhj
	.align	2
	.p2align 4,,15
	.global	_Z10Check_dataPhj
	.type	_Z10Check_dataPhj, %function
_Z10Check_dataPhj:
.LFB3018:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	mov	x22, x0
	mov	x0, 8192
	movk	x0, 0x4e, lsl 16
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	mov	w20, w1
	str	x23, [sp, 48]
	.cfi_offset 23, -16
	bl	malloc
	mov	x21, x0
	adrp	x1, .LC0
	adrp	x0, .LC5
	add	x1, x1, :lo12:.LC0
	add	x0, x0, :lo12:.LC5
	bl	fopen
	cbz	x0, .L27
	uxtw	x19, w20
	mov	x3, x0
	mov	x23, x0
	mov	x1, 1
	mov	x2, x19
	mov	x0, x21
	bl	fread
	cmp	x19, x0
	bne	.L27
	mov	x0, x23
	bl	fclose
	cbnz	w0, .L27
	cbz	w20, .L28
	sub	w20, w20, #1
	mov	x19, 0
	add	x20, x20, 1
	.p2align 3,,7
.L30:
	ldrb	w1, [x21, x19]
	ldrb	w0, [x22, x19]
	cmp	w1, w0
	beq	.L29
	mov	x0, x21
	bl	free
.L29:
	add	x19, x19, 1
	cmp	x20, x19
	bne	.L30
.L28:
	mov	x0, x21
	bl	free
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	b	puts
.L27:
	.cfi_restore_state
	bl	_Z15Exit_with_errorv
	.cfi_endproc
.LFE3018:
	.size	_Z10Check_dataPhj, .-_Z10Check_dataPhj
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,15
	.type	_GLOBAL__sub_I__Z15Exit_with_errorv, %function
_GLOBAL__sub_I__Z15Exit_with_errorv:
.LFB3551:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	adrp	x19, .LANCHOR0
	add	x19, x19, :lo12:.LANCHOR0
	mov	x0, x19
	bl	_ZNSt8ios_base4InitC1Ev
	adrp	x2, __dso_handle
	adrp	x0, _ZNSt8ios_base4InitD1Ev
	mov	x1, x19
	add	x2, x2, :lo12:__dso_handle
	ldr	x19, [sp, 16]
	add	x0, x0, :lo12:_ZNSt8ios_base4InitD1Ev
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 0
	b	__cxa_atexit
	.cfi_endproc
.LFE3551:
	.size	_GLOBAL__sub_I__Z15Exit_with_errorv, .-_GLOBAL__sub_I__Z15Exit_with_errorv
	.section	.init_array,"aw"
	.align	3
	.xword	_GLOBAL__sub_I__Z15Exit_with_errorv
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZStL8__ioinit, %object
	.size	_ZStL8__ioinit, 1
_ZStL8__ioinit:
	.zero	1
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"rb"
	.zero	5
.LC1:
	.string	"../data/Input.bin"
	.zero	6
.LC2:
	.string	"Error calling pthread_setaffinity_np: "
	.zero	1
.LC3:
	.string	"\n"
	.zero	6
.LC4:
	.string	"wb"
	.zero	5
.LC5:
	.string	"../data/Golden.bin"
	.zero	5
.LC6:
	.string	"Application completed successfully."
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 7.3.1 20180712 (Red Hat 7.3.1-9)"
	.section	.note.GNU-stack,"",@progbits
