	.arch armv8-a+crypto+crc
	.file	"Filter.cpp"
	.text
	.align	2
	.p2align 4,,15
	.global	Filter_horizontal(unsigned char const*, unsigned char*)
	.type	Filter_horizontal(unsigned char const*, unsigned char*), %function
Filter_horizontal(unsigned char const*, unsigned char*):
.LFB21:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	neg	x12, x0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	and	x12, x12, 15
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	add	x20, x0, 126976
	mov	x10, x0
	add	x20, x20, 2624
	mov	x5, x1
	stp	x21, x22, [sp, 32]
	add	x19, x2, 28
	mov	w11, 474
	stp	x23, x24, [sp, 48]
	add	x30, x12, 1
	add	x18, x12, 2
	stp	x25, x26, [sp, 64]
	add	x17, x12, 3
	add	x16, x12, 4
	stp	x27, x28, [sp, 80]
	add	x15, x12, 5
	add	x14, x12, 6
	stp	d8, d9, [sp, 96]
	stp	d10, d11, [sp, 112]
	stp	d12, d13, [sp, 128]
	stp	d14, d15, [sp, 144]
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	.cfi_offset 72, -64
	.cfi_offset 73, -56
	.cfi_offset 74, -48
	.cfi_offset 75, -40
	.cfi_offset 76, -32
	.cfi_offset 77, -24
	.cfi_offset 78, -16
	.cfi_offset 79, -8
	.p2align 3,,7
.L10:
	add	x1, x5, 16
	add	x0, x10, 22
	cmp	x1, x10
	add	x13, x5, 474
	ccmp	x0, x5, 0, hi
	cset	w1, ls
	cmp	x5, x19
	ccmp	x13, x2, 0, cc
	cset	w0, ls
	tst	w1, w0
	beq	.L2
	neg	w8, w10
	ands	w8, w8, 15
	beq	.L11
	mov	x21, x5
	mov	x0, x10
	mov	w4, 0
	.p2align 3,,7
.L4:
	ldp	w23, w28, [x2]
	add	w4, w4, 1
	add	x0, x0, 1
	cmp	w4, w8
	ldp	w9, w27, [x2, 8]
	ldrb	w24, [x0, 1]
	ldrb	w25, [x0, -1]
	ldp	w3, w26, [x2, 16]
	mul	w24, w24, w9
	sub	w9, w11, w4
	ldrb	w22, [x0, 3]
	mul	w25, w25, w23
	ldrb	w1, [x0, 2]
	ldrb	w7, [x0]
	mul	w22, w22, w3
	ldrb	w6, [x0, 4]
	madd	w1, w1, w27, w24
	ldrb	w3, [x0, 5]
	madd	w7, w7, w28, w25
	ldr	w23, [x2, 24]
	madd	w6, w6, w26, w22
	add	w1, w1, w7
	add	w1, w1, w6
	madd	w1, w3, w23, w1
	lsr	w1, w1, 8
	strb	w1, [x21], 1
	bne	.L4
.L3:
	ldp	w21, w7, [x2, 4]
	sub	w28, w11, w8
	add	x27, x10, x12
	lsr	w26, w28, 4
	add	x25, x30, x10
	ld1r	{v18.4s}, [x2]
	add	x24, x18, x10
	add	x23, x17, x10
	add	x8, x16, x10
	add	x22, x15, x10
	ldp	w6, w3, [x2, 12]
	dup	v17.4s, w21
	ldp	w1, w0, [x2, 20]
	dup	v16.4s, w7
	dup	v7.4s, w6
	add	x6, x14, x10
	dup	v6.4s, w3
	add	x3, x5, x12
	dup	v5.4s, w1
	mov	w1, 0
	dup	v4.4s, w0
	mov	x0, 0
	.p2align 3,,7
.L5:
	ldr	q0, [x25, x0]
	add	w1, w1, 1
	cmp	w1, w26
	ldr	q1, [x27, x0]
	ldr	q23, [x24, x0]
	ushll	v2.8h, v0.8b, 0
	ldr	q31, [x23, x0]
	ushll2	v0.8h, v0.16b, 0
	ushll	v25.8h, v1.8b, 0
	ldr	q27, [x8, x0]
	ushll2	v1.8h, v1.16b, 0
	ushll	v3.4s, v2.4h, 0
	ldr	q20, [x22, x0]
	ushll	v8.4s, v0.4h, 0
	ushll2	v2.4s, v2.8h, 0
	ldr	q19, [x6, x0]
	ushll2	v0.4s, v0.8h, 0
	ushll2	v24.4s, v1.8h, 0
	mul	v3.4s, v3.4s, v17.4s
	ushll	v14.4s, v1.4h, 0
	mul	v2.4s, v2.4s, v17.4s
	ushll	v15.4s, v25.4h, 0
	ushll2	v25.4s, v25.8h, 0
	mul	v1.4s, v8.4s, v17.4s
	ushll	v12.8h, v23.8b, 0
	ushll2	v23.8h, v23.16b, 0
	mul	v0.4s, v0.4s, v17.4s
	ushll	v9.8h, v31.8b, 0
	ushll2	v31.8h, v31.16b, 0
	mla	v2.4s, v25.4s, v18.4s
	ushll	v13.4s, v12.4h, 0
	ushll	v11.4s, v23.4h, 0
	mla	v3.4s, v15.4s, v18.4s
	ushll2	v23.4s, v23.8h, 0
	ushll2	v12.4s, v12.8h, 0
	mla	v0.4s, v24.4s, v18.4s
	ushll	v8.4s, v31.4h, 0
	ushll	v10.4s, v9.4h, 0
	mla	v1.4s, v14.4s, v18.4s
	ushll2	v9.4s, v9.8h, 0
	ushll2	v31.4s, v31.8h, 0
	mla	v3.4s, v13.4s, v16.4s
	ushll	v29.8h, v27.8b, 0
	ushll2	v27.8h, v27.16b, 0
	mla	v0.4s, v23.4s, v16.4s
	ushll	v22.8h, v20.8b, 0
	ushll2	v20.8h, v20.16b, 0
	mla	v2.4s, v12.4s, v16.4s
	ushll	v30.4s, v29.4h, 0
	ushll	v28.4s, v27.4h, 0
	mla	v1.4s, v11.4s, v16.4s
	ushll2	v29.4s, v29.8h, 0
	ushll2	v27.4s, v27.8h, 0
	mla	v3.4s, v10.4s, v7.4s
	ushll	v26.4s, v22.4h, 0
	ushll	v25.4s, v20.4h, 0
	mla	v2.4s, v9.4s, v7.4s
	ushll2	v22.4s, v22.8h, 0
	ushll2	v20.4s, v20.8h, 0
	mla	v1.4s, v8.4s, v7.4s
	ushll	v21.8h, v19.8b, 0
	ushll2	v19.8h, v19.16b, 0
	mla	v0.4s, v31.4s, v7.4s
	mla	v3.4s, v30.4s, v6.4s
	ushll	v24.4s, v21.4h, 0
	ushll	v23.4s, v19.4h, 0
	mla	v2.4s, v29.4s, v6.4s
	ushll2	v21.4s, v21.8h, 0
	ushll2	v19.4s, v19.8h, 0
	mla	v1.4s, v28.4s, v6.4s
	mla	v0.4s, v27.4s, v6.4s
	mla	v3.4s, v26.4s, v5.4s
	mla	v2.4s, v22.4s, v5.4s
	mla	v1.4s, v25.4s, v5.4s
	mla	v0.4s, v20.4s, v5.4s
	mla	v3.4s, v24.4s, v4.4s
	mla	v2.4s, v21.4s, v4.4s
	mla	v1.4s, v23.4s, v4.4s
	mla	v0.4s, v19.4s, v4.4s
	ushr	v3.4s, v3.4s, 8
	ushr	v2.4s, v2.4s, 8
	ushr	v1.4s, v1.4s, 8
	ushr	v0.4s, v0.4s, 8
	xtn	v8.4h, v3.4s
	xtn2	v8.8h, v2.4s
	xtn	v2.4h, v1.4s
	xtn2	v2.8h, v0.4s
	xtn	v0.8b, v8.8h
	xtn2	v0.16b, v2.8h
	str	q0, [x3, x0]
	add	x0, x0, 16
	bcc	.L5
	and	w0, w28, -16
	cmp	w28, w0
	add	w8, w0, w4
	mvn	w0, w0
	beq	.L8
	sxtw	x8, w8
	add	w9, w9, w0
	add	x9, x9, x8
	add	x1, x10, 1
	add	x0, x8, x10
	add	x9, x9, x1
	add	x8, x8, x5
	.p2align 3,,7
.L7:
	ldrb	w22, [x0]
	add	x0, x0, 1
	ldr	w21, [x2]
	ldrb	w7, [x0, 1]
	ldrb	w6, [x0, 4]
	mul	w21, w22, w21
	ldr	w22, [x2, 8]
	ldrb	w5, [x0]
	ldrb	w1, [x0, 2]
	mul	w7, w7, w22
	ldr	w22, [x2, 20]
	ldrb	w4, [x0, 3]
	ldrb	w3, [x0, 5]
	cmp	x9, x0
	mul	w6, w6, w22
	ldr	w22, [x2, 4]
	madd	w5, w5, w22, w21
	ldr	w21, [x2, 12]
	madd	w1, w1, w21, w7
	ldr	w7, [x2, 16]
	add	w1, w1, w5
	madd	w4, w4, w7, w6
	add	w1, w1, w4
	ldr	w4, [x2, 24]
	madd	w1, w3, w4, w1
	lsr	w1, w1, 8
	strb	w1, [x8], 1
	bne	.L7
.L8:
	add	x10, x10, 480
	mov	x5, x13
	cmp	x10, x20
	bne	.L10
.L17:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	ldp	d12, d13, [sp, 128]
	ldp	d14, d15, [sp, 144]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.p2align 3,,7
.L2:
	.cfi_restore_state
	add	x9, x10, 474
	mov	x0, x10
	.p2align 3,,7
.L9:
	ldrb	w28, [x0]
	add	x0, x0, 1
	ldrb	w4, [x0, 1]
	ldp	w22, w25, [x2]
	ldp	w27, w24, [x2, 8]
	ldrb	w3, [x0, 3]
	mul	w22, w28, w22
	ldp	w26, w23, [x2, 16]
	mul	w4, w4, w27
	ldrb	w1, [x0]
	ldrb	w8, [x0, 2]
	mul	w3, w3, w26
	ldrb	w7, [x0, 4]
	madd	w1, w1, w25, w22
	ldrb	w6, [x0, 5]
	cmp	x9, x0
	madd	w4, w8, w24, w4
	ldr	w21, [x2, 24]
	madd	w3, w7, w23, w3
	add	w1, w1, w4
	add	w1, w1, w3
	madd	w1, w6, w21, w1
	lsr	w1, w1, 8
	strb	w1, [x5], 1
	bne	.L9
	add	x10, x10, 480
	mov	x5, x13
	cmp	x10, x20
	bne	.L10
	b	.L17
	.p2align 3,,7
.L11:
	mov	w9, 474
	mov	w4, 0
	b	.L3
	.cfi_endproc
.LFE21:
	.size	Filter_horizontal(unsigned char const*, unsigned char*), .-Filter_horizontal(unsigned char const*, unsigned char*)
	.align	2
	.p2align 4,,15
	.global	Filter_vertical(unsigned char const*, unsigned char*)
	.type	Filter_vertical(unsigned char const*, unsigned char*), %function
Filter_vertical(unsigned char const*, unsigned char*):
.LFB22:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	mov	x4, x1
	stp	x23, x24, [sp, 48]
	add	x11, x0, 474
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	mov	x24, x1
	stp	x25, x26, [sp, 64]
	add	x10, x0, 948
	.cfi_offset 25, -48
	.cfi_offset 26, -40
	add	x26, x1, 474
	stp	x27, x28, [sp, 80]
	add	x9, x0, 1422
	.cfi_offset 27, -32
	.cfi_offset 28, -24
	add	x28, x1, 16
	add	x8, x0, 1896
	add	x1, x2, 28
	stp	x19, x20, [sp, 16]
	add	x7, x0, 2370
	add	x6, x0, 2844
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	mov	x5, x0
	mov	x16, 0
	str	x1, [x29, 104]
	add	x27, x0, 2860
	mov	w18, 474
	.p2align 3,,7
.L26:
	add	x12, x28, x16
	add	x3, x27, x16
	cmp	x12, x5
	add	x1, x26, x16
	ccmp	x3, x4, 0, hi
	cset	w3, ls
	cmp	x1, x2
	ldr	x1, [x29, 104]
	ccmp	x4, x1, 2, hi
	cset	w1, cs
	tst	w3, w1
	beq	.L27
	neg	w17, w5
	ands	w17, w17, 15
	beq	.L28
	mov	x20, 0
	mov	w15, 0
	.p2align 3,,7
.L21:
	ldp	w22, w13, [x2]
	add	w15, w15, 1
	cmp	w15, w17
	ldrb	w3, [x5, x20]
	ldrb	w23, [x10, x20]
	ldrb	w19, [x11, x20]
	mul	w3, w22, w3
	ldp	w14, w1, [x2, 8]
	ldrb	w25, [x8, x20]
	madd	w13, w13, w19, w3
	sub	w19, w18, w15
	ldr	w12, [x2, 16]
	mul	w14, w14, w23
	ldrb	w21, [x9, x20]
	ldrb	w22, [x7, x20]
	mul	w12, w12, w25
	ldp	w23, w3, [x2, 20]
	madd	w1, w1, w21, w14
	ldrb	w14, [x6, x20]
	add	w1, w1, w13
	madd	w12, w23, w22, w12
	add	w1, w1, w12
	madd	w1, w3, w14, w1
	ubfx	x1, x1, 8, 8
	strb	w1, [x4, x20]
	add	x20, x20, 1
	bne	.L21
.L20:
	ldp	w21, w20, [x2, 4]
	uxtw	x1, w17
	add	x30, x16, 474
	add	x22, x30, x1
	sub	w17, w18, w17
	ldp	w14, w13, [x2, 12]
	lsr	w25, w17, 4
	add	x22, x0, x22
	ldp	w12, w3, [x2, 20]
	dup	v5.4s, w21
	add	x21, x16, 948
	add	x21, x21, x1
	dup	v4.4s, w20
	add	x20, x16, 1422
	add	x21, x0, x21
	add	x20, x20, x1
	ld1r	{v6.4s}, [x2]
	add	x20, x0, x20
	dup	v3.4s, w14
	add	x14, x16, 1896
	add	x14, x14, x1
	dup	v2.4s, w13
	add	x13, x16, 2370
	add	x14, x0, x14
	add	x13, x13, x1
	dup	v1.4s, w12
	add	x12, x16, 2844
	add	x16, x1, x16
	add	x1, x12, x1
	add	x23, x0, x16
	dup	v0.4s, w3
	add	x12, x0, x1
	xtn	v17.4h, v5.4s
	xtn2	v17.8h, v5.4s
	xtn	v16.4h, v4.4s
	xtn2	v16.8h, v4.4s
	add	x13, x0, x13
	xtn	v18.4h, v6.4s
	xtn2	v18.8h, v6.4s
	add	x16, x24, x16
	xtn	v7.4h, v3.4s
	xtn2	v7.8h, v3.4s
	mov	x1, 0
	mov	w3, 0
	xtn	v6.4h, v2.4s
	xtn2	v6.8h, v2.4s
	xtn	v5.4h, v1.4s
	xtn2	v5.8h, v1.4s
	xtn	v4.4h, v0.4s
	xtn2	v4.8h, v0.4s
	.p2align 3,,7
.L22:
	ldr	q0, [x22, x1]
	add	w3, w3, 1
	cmp	w3, w25
	ldr	q21, [x23, x1]
	ldr	q20, [x21, x1]
	ushll	v1.8h, v0.8b, 0
	ldr	q19, [x20, x1]
	ushll2	v0.8h, v0.16b, 0
	ushll	v28.8h, v21.8b, 0
	ldr	q3, [x14, x1]
	ushll2	v21.8h, v21.16b, 0
	mul	v1.8h, v1.8h, v17.8h
	ushll	v27.8h, v20.8b, 0
	ldr	q22, [x13, x1]
	ushll2	v20.8h, v20.16b, 0
	mul	v0.8h, v0.8h, v17.8h
	ushll	v26.8h, v19.8b, 0
	ldr	q2, [x12, x1]
	ushll2	v19.8h, v19.16b, 0
	ushll	v25.8h, v3.8b, 0
	mla	v1.8h, v28.8h, v18.8h
	ushll2	v3.8h, v3.16b, 0
	ushll	v24.8h, v22.8b, 0
	mla	v0.8h, v21.8h, v18.8h
	ushll2	v22.8h, v22.16b, 0
	ushll	v23.8h, v2.8b, 0
	ushll2	v2.8h, v2.16b, 0
	mla	v1.8h, v27.8h, v16.8h
	mla	v0.8h, v20.8h, v16.8h
	mla	v1.8h, v26.8h, v7.8h
	mla	v0.8h, v19.8h, v7.8h
	mla	v1.8h, v25.8h, v6.8h
	mla	v0.8h, v3.8h, v6.8h
	mla	v1.8h, v24.8h, v5.8h
	mla	v0.8h, v22.8h, v5.8h
	mla	v1.8h, v23.8h, v4.8h
	mla	v0.8h, v2.8h, v4.8h
	ushll	v3.4s, v1.4h, 0
	ushll2	v1.4s, v1.8h, 0
	ushll	v2.4s, v0.4h, 0
	ushll2	v0.4s, v0.8h, 0
	sshr	v3.4s, v3.4s, 8
	sshr	v1.4s, v1.4s, 8
	sshr	v2.4s, v2.4s, 8
	sshr	v0.4s, v0.4s, 8
	xtn	v19.4h, v3.4s
	xtn2	v19.8h, v1.4s
	xtn	v1.4h, v2.4s
	xtn2	v1.8h, v0.4s
	xtn	v0.8b, v19.8h
	xtn2	v0.16b, v1.8h
	str	q0, [x16, x1]
	add	x1, x1, 16
	bcc	.L22
	and	w1, w17, -16
	cmp	w17, w1
	add	w15, w1, w15
	mvn	w1, w1
	beq	.L25
	sxtw	x22, w15
	add	w19, w19, w1
	add	x23, x22, 1
	add	x25, x19, x23
	.p2align 3,,7
.L24:
	ldp	w13, w1, [x2]
	cmp	x25, x23
	ldrb	w21, [x5, x22]
	ldrb	w17, [x11, x22]
	ldrb	w20, [x10, x22]
	mul	w13, w13, w21
	ldr	w12, [x2, 8]
	ldrb	w16, [x9, x22]
	madd	w13, w1, w17, w13
	ldr	w1, [x2, 12]
	mul	w12, w12, w20
	ldrb	w3, [x7, x22]
	ldr	w19, [x2, 20]
	madd	w12, w1, w16, w12
	ldrb	w15, [x8, x22]
	ldr	w1, [x2, 16]
	mul	w3, w19, w3
	ldrb	w14, [x6, x22]
	madd	w3, w1, w15, w3
	ldr	w1, [x2, 24]
	add	w15, w12, w13
	add	w15, w15, w3
	madd	w14, w1, w14, w15
	ubfx	x14, x14, 8, 8
	strb	w14, [x4, x22]
	mov	x22, x23
	add	x23, x23, 1
	bne	.L24
.L25:
	sub	x1, x30, #122880
	add	x4, x4, 474
	subs	x1, x1, #2256
	add	x5, x5, 474
	add	x11, x11, 474
	add	x10, x10, 474
	add	x9, x9, 474
	add	x8, x8, 474
	add	x7, x7, 474
	add	x6, x6, 474
	mov	x16, x30
	bne	.L26
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.p2align 3,,7
.L27:
	.cfi_restore_state
	mov	x20, 0
	.p2align 3,,7
.L19:
	ldp	w19, w1, [x2, 8]
	ldrb	w15, [x10, x20]
	ldrb	w17, [x5, x20]
	ldp	w25, w13, [x2]
	mul	w15, w19, w15
	ldrb	w3, [x8, x20]
	ldp	w14, w12, [x2, 16]
	mul	w17, w25, w17
	ldrb	w22, [x9, x20]
	ldrb	w23, [x11, x20]
	mul	w14, w14, w3
	ldrb	w21, [x7, x20]
	madd	w1, w1, w22, w15
	ldrb	w19, [x6, x20]
	madd	w13, w13, w23, w17
	ldr	w3, [x2, 24]
	madd	w12, w12, w21, w14
	add	w1, w1, w13
	add	w1, w1, w12
	madd	w1, w3, w19, w1
	ubfx	x1, x1, 8, 8
	strb	w1, [x4, x20]
	add	x20, x20, 1
	cmp	x20, 474
	bne	.L19
	add	x30, x16, 474
	b	.L25
.L28:
	mov	w19, 474
	mov	w15, 0
	b	.L20
	.cfi_endproc
.LFE22:
	.size	Filter_vertical(unsigned char const*, unsigned char*), .-Filter_vertical(unsigned char const*, unsigned char*)
	.align	2
	.p2align 4,,15
	.global	Filter(unsigned char const*, unsigned char*)
	.type	Filter(unsigned char const*, unsigned char*), %function
Filter(unsigned char const*, unsigned char*):
.LFB23:
	.cfi_startproc
	stp	x29, x30, [sp, -224]!
	.cfi_def_cfa_offset 224
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -176
	.cfi_offset 24, -168
	mov	x23, x0
	mov	x0, 62444
	movk	x0, 0x1, lsl 16
	str	x1, [x29, 208]
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -208
	.cfi_offset 20, -200
	.cfi_offset 21, -192
	.cfi_offset 22, -184
	.cfi_offset 25, -160
	.cfi_offset 26, -152
	.cfi_offset 27, -144
	.cfi_offset 28, -136
	mov	x28, 0
	stp	d8, d9, [sp, 96]
	stp	d10, d11, [sp, 112]
	stp	d12, d13, [sp, 128]
	stp	d14, d15, [sp, 144]
	.cfi_offset 72, -128
	.cfi_offset 73, -120
	.cfi_offset 74, -112
	.cfi_offset 75, -104
	.cfi_offset 76, -96
	.cfi_offset 77, -88
	.cfi_offset 78, -80
	.cfi_offset 79, -72
	bl	malloc
	adrp	x2, .LANCHOR0
	add	x3, x2, :lo12:.LANCHOR0
	ldp	w8, w6, [x3, 4]
	neg	x18, x23
	mov	x13, x0
	and	x18, x18, 15
	mov	x12, x0
	ldp	w7, w4, [x3, 12]
	mov	x10, x23
	mov	w17, 474
	ldp	w5, w9, [x3, 20]
	add	x3, x23, 126976
	add	x3, x3, 2624
	dup	v17.4s, w8
	ldr	w1, [x2, #:lo12:.LANCHOR0]
	str	x3, [x29, 216]
	add	x3, x18, 1
	dup	v16.4s, w6
	str	x3, [x29, 200]
	add	x3, x18, 2
	dup	v7.4s, w7
	str	x3, [x29, 192]
	add	x3, x18, 3
	dup	v18.4s, w1
	str	x3, [x29, 184]
	add	x3, x18, 4
	dup	v6.4s, w4
	str	x3, [x29, 176]
	add	x3, x18, 5
	dup	v5.4s, w5
	str	x3, [x29, 168]
	add	x3, x18, 6
	dup	v4.4s, w9
	str	x3, [x29, 160]
	.p2align 3,,7
.L42:
	neg	w24, w10
	ands	w24, w24, 15
	beq	.L47
	ldrb	w3, [x10]
	mov	x19, 0
	mov	w16, 0
	ldrb	w26, [x10, 1]
	ldrb	w22, [x10, 2]
	ldrb	w21, [x10, 3]
	ldrb	w20, [x10, 4]
	ldrb	w15, [x10, 5]
	.p2align 3,,7
.L38:
	mul	w11, w21, w7
	add	w16, w16, 1
	mul	w25, w26, w8
	cmp	w24, w16
	mul	w3, w3, w1
	madd	w11, w20, w4, w11
	madd	w25, w22, w6, w25
	madd	w14, w15, w5, w3
	mov	w3, w26
	mov	w26, w22
	mov	w22, w21
	mov	w21, w20
	add	w11, w11, w25
	mov	w20, w15
	add	w11, w11, w14
	add	x14, x10, x19
	ldrb	w15, [x14, 6]
	sub	w14, w17, w16
	madd	w11, w15, w9, w11
	lsr	w11, w11, 8
	strb	w11, [x12, x19]
	add	x19, x19, 1
	bne	.L38
.L37:
	ldr	x3, [x29, 200]
	sub	w24, w17, w24
	add	x30, x18, x10
	lsr	w26, w24, 4
	add	x15, x18, x12
	mov	w11, 0
	add	x27, x3, x10
	ldr	x3, [x29, 192]
	add	x25, x3, x10
	ldr	x3, [x29, 184]
	add	x22, x3, x10
	ldr	x3, [x29, 176]
	add	x21, x3, x10
	ldr	x3, [x29, 168]
	add	x20, x3, x10
	ldr	x3, [x29, 160]
	add	x19, x3, x10
	mov	x3, 0
	.p2align 3,,7
.L39:
	ldr	q0, [x30, x3]
	add	w11, w11, 1
	cmp	w11, w26
	ldr	q1, [x27, x3]
	ldr	q23, [x25, x3]
	ushll	v2.8h, v0.8b, 0
	ldr	q31, [x22, x3]
	ushll2	v0.8h, v0.16b, 0
	ushll	v25.8h, v1.8b, 0
	ldr	q27, [x21, x3]
	ushll2	v1.8h, v1.16b, 0
	ushll	v3.4s, v2.4h, 0
	ldr	q20, [x20, x3]
	ushll	v8.4s, v0.4h, 0
	ushll2	v2.4s, v2.8h, 0
	ldr	q19, [x19, x3]
	ushll2	v0.4s, v0.8h, 0
	ushll2	v24.4s, v1.8h, 0
	mul	v3.4s, v3.4s, v18.4s
	ushll	v14.4s, v1.4h, 0
	mul	v2.4s, v2.4s, v18.4s
	ushll	v15.4s, v25.4h, 0
	ushll2	v25.4s, v25.8h, 0
	mul	v1.4s, v8.4s, v18.4s
	ushll	v12.8h, v23.8b, 0
	ushll2	v23.8h, v23.16b, 0
	mul	v0.4s, v0.4s, v18.4s
	ushll	v9.8h, v31.8b, 0
	ushll2	v31.8h, v31.16b, 0
	mla	v2.4s, v25.4s, v17.4s
	ushll	v13.4s, v12.4h, 0
	ushll	v11.4s, v23.4h, 0
	mla	v3.4s, v15.4s, v17.4s
	ushll2	v23.4s, v23.8h, 0
	ushll2	v12.4s, v12.8h, 0
	mla	v0.4s, v24.4s, v17.4s
	ushll	v8.4s, v31.4h, 0
	ushll	v10.4s, v9.4h, 0
	mla	v1.4s, v14.4s, v17.4s
	ushll2	v9.4s, v9.8h, 0
	ushll2	v31.4s, v31.8h, 0
	mla	v3.4s, v13.4s, v16.4s
	ushll	v29.8h, v27.8b, 0
	ushll2	v27.8h, v27.16b, 0
	mla	v0.4s, v23.4s, v16.4s
	ushll	v22.8h, v20.8b, 0
	ushll2	v20.8h, v20.16b, 0
	mla	v2.4s, v12.4s, v16.4s
	ushll	v30.4s, v29.4h, 0
	ushll	v28.4s, v27.4h, 0
	mla	v1.4s, v11.4s, v16.4s
	ushll2	v29.4s, v29.8h, 0
	ushll2	v27.4s, v27.8h, 0
	mla	v3.4s, v10.4s, v7.4s
	ushll	v26.4s, v22.4h, 0
	ushll	v25.4s, v20.4h, 0
	mla	v2.4s, v9.4s, v7.4s
	ushll2	v22.4s, v22.8h, 0
	ushll2	v20.4s, v20.8h, 0
	mla	v1.4s, v8.4s, v7.4s
	ushll	v21.8h, v19.8b, 0
	ushll2	v19.8h, v19.16b, 0
	mla	v0.4s, v31.4s, v7.4s
	mla	v3.4s, v30.4s, v6.4s
	ushll	v24.4s, v21.4h, 0
	ushll	v23.4s, v19.4h, 0
	mla	v2.4s, v29.4s, v6.4s
	ushll2	v21.4s, v21.8h, 0
	ushll2	v19.4s, v19.8h, 0
	mla	v1.4s, v28.4s, v6.4s
	mla	v0.4s, v27.4s, v6.4s
	mla	v3.4s, v26.4s, v5.4s
	mla	v2.4s, v22.4s, v5.4s
	mla	v1.4s, v25.4s, v5.4s
	mla	v0.4s, v20.4s, v5.4s
	mla	v3.4s, v24.4s, v4.4s
	mla	v2.4s, v21.4s, v4.4s
	mla	v1.4s, v23.4s, v4.4s
	mla	v0.4s, v19.4s, v4.4s
	ushr	v3.4s, v3.4s, 8
	ushr	v2.4s, v2.4s, 8
	ushr	v1.4s, v1.4s, 8
	ushr	v0.4s, v0.4s, 8
	xtn	v8.4h, v3.4s
	xtn2	v8.8h, v2.4s
	xtn	v2.4h, v1.4s
	xtn2	v2.8h, v0.4s
	xtn	v0.8b, v8.8h
	xtn2	v0.16b, v2.8h
	str	q0, [x15, x3]
	add	x3, x3, 16
	bcc	.L39
	and	w3, w24, -16
	cmp	w3, w24
	add	w16, w3, w16
	mvn	w3, w3
	beq	.L40
	sxtw	x16, w16
	add	w14, w3, w14
	add	x11, x28, x16
	add	x15, x16, 1
	add	x3, x23, x11
	ldrb	w24, [x23, x11]
	add	x25, x14, x15
	ldrb	w22, [x3, 1]
	ldrb	w21, [x3, 2]
	ldrb	w20, [x3, 3]
	ldrb	w19, [x3, 4]
	ldrb	w26, [x3, 5]
	.p2align 3,,7
.L41:
	mul	w11, w20, w7
	add	x14, x10, x16
	cmp	x25, x15
	mul	w3, w22, w8
	ldrb	w14, [x14, 6]
	mul	w27, w24, w1
	mov	w24, w22
	mov	w22, w21
	madd	w11, w19, w4, w11
	madd	w3, w21, w6, w3
	mov	w21, w20
	mov	w20, w19
	madd	w27, w26, w5, w27
	mov	w19, w26
	mov	w26, w14
	add	w3, w11, w3
	add	w3, w3, w27
	madd	w3, w14, w9, w3
	lsr	w3, w3, 8
	strb	w3, [x12, x16]
	mov	x16, x15
	add	x15, x15, 1
	bne	.L41
.L40:
	ldr	x3, [x29, 216]
	add	x10, x10, 480
	add	x12, x12, 474
	add	x28, x28, 480
	cmp	x3, x10
	bne	.L42
	ldr	x12, [x29, 208]
	mov	w10, w7
	add	x19, x0, 474
	mov	w7, w5
	add	x18, x0, 948
	mov	w5, w1
	add	x17, x0, 1422
	add	x16, x0, 1896
	add	x15, x0, 2370
	add	x14, x0, 2844
	add	x2, x2, :lo12:.LANCHOR0
	add	x20, x12, 122880
	mov	w24, w4
	mov	w1, w6
	add	x20, x20, 2256
	.p2align 3,,7
.L46:
	mov	x3, 0
	b	.L44
	.p2align 3,,7
.L54:
	ldp	w5, w8, [x2]
	ldp	w1, w10, [x2, 8]
	ldp	w24, w7, [x2, 16]
	ldr	w9, [x2, 24]
.L44:
	ldrb	w25, [x17, x3]
	ldrb	w23, [x19, x3]
	ldrb	w22, [x15, x3]
	mul	w10, w10, w25
	ldrb	w21, [x18, x3]
	mul	w8, w8, w23
	ldrb	w11, [x13, x3]
	mul	w7, w7, w22
	ldrb	w4, [x16, x3]
	madd	w1, w1, w21, w10
	ldrb	w6, [x14, x3]
	madd	w5, w5, w11, w8
	madd	w4, w24, w4, w7
	add	w1, w1, w5
	add	w1, w1, w4
	madd	w1, w9, w6, w1
	ubfx	x1, x1, 8, 8
	strb	w1, [x12, x3]
	add	x3, x3, 1
	cmp	x3, 474
	bne	.L54
	add	x12, x12, 474
	add	x13, x13, 474
	cmp	x20, x12
	add	x19, x19, 474
	add	x18, x18, 474
	add	x17, x17, 474
	add	x16, x16, 474
	add	x15, x15, 474
	add	x14, x14, 474
	beq	.L45
	ldp	w5, w8, [x2]
	ldp	w1, w10, [x2, 8]
	ldp	w24, w7, [x2, 16]
	ldr	w9, [x2, 24]
	b	.L46
.L47:
	mov	w14, 474
	mov	w16, 0
	b	.L37
.L45:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	ldp	d12, d13, [sp, 128]
	ldp	d14, d15, [sp, 144]
	ldp	x29, x30, [sp], 224
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	b	free
	.cfi_endproc
.LFE23:
	.size	Filter(unsigned char const*, unsigned char*), .-Filter(unsigned char const*, unsigned char*)
	.global	Coefficients
	.data
	.align	4
	.set	.LANCHOR0,. + 0
	.type	Coefficients, %object
	.size	Coefficients, 28
Coefficients:
	.word	2
	.word	15
	.word	62
	.word	98
	.word	62
	.word	15
	.word	2
	.ident	"GCC: (GNU) 7.3.1 20180712 (Red Hat 7.3.1-9)"
	.section	.note.GNU-stack,"",@progbits
