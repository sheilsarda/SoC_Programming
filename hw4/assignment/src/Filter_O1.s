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
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	neg	x12, x0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	and	x12, x12, 15
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
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
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	add	x15, x12, 5
	add	x14, x12, 6
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
	neg	w6, w10
	ands	w6, w6, 15
	beq	.L11
	mov	x21, x5
	mov	x0, x10
	mov	w4, 0
	.p2align 3,,7
.L4:
	ldrb	w7, [x0, 2]
	add	w4, w4, 1
	add	x0, x0, 1
	cmp	w6, w4
	ldrb	w23, [x0, -1]
	ldp	w25, w9, [x2]
	ldp	w24, w1, [x2, 8]
	ldrb	w3, [x0, 3]
	mul	w25, w25, w23
	ldp	w22, w8, [x2, 16]
	mul	w24, w24, w7
	sub	w7, w11, w4
	ldrb	w27, [x0, 2]
	ldrb	w28, [x0]
	mul	w22, w22, w3
	ldrb	w26, [x0, 4]
	madd	w1, w1, w27, w24
	ldrb	w23, [x0, 5]
	madd	w9, w9, w28, w25
	ldr	w3, [x2, 24]
	madd	w8, w8, w26, w22
	add	w1, w1, w9
	add	w1, w1, w8
	madd	w1, w3, w23, w1
	ubfx	x1, x1, 8, 8
	strb	w1, [x21], 1
	bne	.L4
.L3:
	ldp	w26, w25, [x2, 12]
	sub	w6, w11, w6
	add	x22, x12, x10
	lsr	w21, w6, 4
	add	x9, x30, x10
	ldp	w24, w23, [x2, 20]
	add	x8, x18, x10
	add	x3, x17, x10
	add	x1, x16, x10
	add	x0, x15, x10
	ldp	w28, w27, [x2, 4]
	dup	v3.4s, w26
	add	x26, x14, x10
	ld1r	{v6.4s}, [x2]
	dup	v2.4s, w25
	add	x25, x12, x5
	dup	v5.4s, w28
	dup	v4.4s, w27
	dup	v1.4s, w24
	xtn	v7.4h, v3.4s
	xtn2	v7.8h, v3.4s
	mov	w24, 0
	dup	v0.4s, w23
	xtn	v18.4h, v6.4s
	xtn2	v18.8h, v6.4s
	mov	x23, 0
	xtn	v6.4h, v2.4s
	xtn2	v6.8h, v2.4s
	xtn	v17.4h, v5.4s
	xtn2	v17.8h, v5.4s
	xtn	v16.4h, v4.4s
	xtn2	v16.8h, v4.4s
	xtn	v5.4h, v1.4s
	xtn2	v5.8h, v1.4s
	xtn	v4.4h, v0.4s
	xtn2	v4.8h, v0.4s
	.p2align 3,,7
.L5:
	ldr	q0, [x9, x23]
	add	w24, w24, 1
	cmp	w24, w21
	ldr	q21, [x22, x23]
	ldr	q20, [x8, x23]
	ushll	v1.8h, v0.8b, 0
	ldr	q19, [x3, x23]
	ushll2	v0.8h, v0.16b, 0
	ushll	v28.8h, v21.8b, 0
	ldr	q3, [x1, x23]
	ushll2	v21.8h, v21.16b, 0
	mul	v1.8h, v1.8h, v17.8h
	ushll	v27.8h, v20.8b, 0
	ldr	q22, [x0, x23]
	ushll2	v20.8h, v20.16b, 0
	mul	v0.8h, v0.8h, v17.8h
	ushll	v26.8h, v19.8b, 0
	ldr	q2, [x26, x23]
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
	str	q0, [x25, x23]
	add	x23, x23, 16
	bcc	.L5
	and	w0, w6, -16
	cmp	w6, w0
	add	w8, w0, w4
	mvn	w9, w0
	beq	.L8
	sxtw	x8, w8
	add	w9, w7, w9
	add	x9, x9, x8
	add	x1, x10, 1
	add	x0, x8, x10
	add	x9, x9, x1
	add	x8, x8, x5
	.p2align 3,,7
.L7:
	ldrb	w27, [x0, 2]
	add	x0, x0, 1
	ldrb	w22, [x0, -1]
	ldp	w28, w5, [x2]
	ldp	w7, w1, [x2, 8]
	ldrb	w26, [x0, 4]
	mul	w22, w28, w22
	ldp	w4, w6, [x2, 16]
	mul	w7, w7, w27
	ldrb	w24, [x0, 2]
	ldrb	w25, [x0]
	mul	w6, w6, w26
	ldrb	w23, [x0, 3]
	madd	w1, w1, w24, w7
	ldrb	w21, [x0, 5]
	cmp	x0, x9
	madd	w5, w5, w25, w22
	ldr	w3, [x2, 24]
	madd	w4, w4, w23, w6
	add	w1, w1, w5
	add	w1, w1, w4
	madd	w1, w3, w21, w1
	ubfx	x1, x1, 8, 8
	strb	w1, [x8], 1
	bne	.L7
.L8:
	add	x10, x10, 480
	mov	x5, x13
	cmp	x20, x10
	bne	.L10
.L17:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
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
.L2:
	.cfi_restore_state
	add	x9, x10, 474
	mov	x0, x10
	.p2align 3,,7
.L9:
	ldrb	w27, [x0, 2]
	add	x0, x0, 1
	ldrb	w22, [x0, -1]
	ldp	w28, w6, [x2]
	ldp	w8, w1, [x2, 8]
	ldrb	w26, [x0, 3]
	mul	w22, w28, w22
	ldp	w7, w4, [x2, 16]
	mul	w8, w8, w27
	ldrb	w24, [x0, 2]
	ldrb	w25, [x0]
	mul	w7, w7, w26
	ldrb	w23, [x0, 4]
	madd	w1, w1, w24, w8
	ldrb	w21, [x0, 5]
	cmp	x9, x0
	madd	w6, w6, w25, w22
	ldr	w3, [x2, 24]
	madd	w4, w4, w23, w7
	add	w1, w1, w6
	add	w1, w1, w4
	madd	w1, w3, w21, w1
	ubfx	x1, x1, 8, 8
	strb	w1, [x5], 1
	bne	.L9
	add	x10, x10, 480
	mov	x5, x13
	cmp	x20, x10
	bne	.L10
	b	.L17
	.p2align 3,,7
.L11:
	mov	w7, 474
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
	stp	x29, x30, [sp, -208]!
	.cfi_def_cfa_offset 208
	.cfi_offset 29, -208
	.cfi_offset 30, -200
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -192
	.cfi_offset 20, -184
	mov	x19, x0
	mov	x0, 62444
	movk	x0, 0x1, lsl 16
	stp	x1, x19, [x29, 160]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 21, -176
	.cfi_offset 22, -168
	.cfi_offset 23, -160
	.cfi_offset 24, -152
	.cfi_offset 25, -144
	.cfi_offset 26, -136
	.cfi_offset 27, -128
	.cfi_offset 28, -120
	bl	malloc
	mov	x10, x0
	adrp	x0, .LANCHOR0
	add	x1, x0, :lo12:.LANCHOR0
	ldr	w0, [x0, #:lo12:.LANCHOR0]
	add	x9, x19, 126976
	mov	x8, x19
	str	x10, [x29, 104]
	ldp	w6, w4, [x1, 4]
	add	x9, x9, 2624
	stp	x10, xzr, [x29, 192]
	ldp	w5, w2, [x1, 12]
	and	w17, w0, 65535
	ldp	w3, w7, [x1, 20]
	neg	x1, x19
	and	x1, x1, 15
	and	w16, w6, 65535
	dup	v18.8h, w17
	and	w15, w4, 65535
	and	w14, w5, 65535
	and	w13, w2, 65535
	stp	x1, x9, [x29, 176]
	add	x9, x1, 1
	dup	v17.8h, w16
	and	w12, w3, 65535
	and	w11, w7, 65535
	dup	v16.8h, w15
	str	x9, [x29, 152]
	add	x9, x1, 2
	dup	v7.8h, w14
	str	x9, [x29, 144]
	add	x9, x1, 3
	dup	v6.8h, w13
	str	x9, [x29, 136]
	add	x9, x1, 4
	dup	v5.8h, w12
	str	x9, [x29, 128]
	add	x9, x1, 5
	add	x1, x1, 6
	dup	v4.8h, w11
	stp	x1, x9, [x29, 112]
	.p2align 3,,7
.L42:
	neg	w19, w8
	ands	w19, w19, 15
	beq	.L47
	ldrb	w9, [x8]
	mov	x22, 0
	mov	w1, 0
	ldrb	w26, [x8, 1]
	ldrb	w25, [x8, 2]
	ldrb	w24, [x8, 3]
	ldrb	w23, [x8, 4]
	ldrb	w21, [x8, 5]
	.p2align 3,,7
.L38:
	mul	w9, w17, w9
	add	w1, w1, 1
	mul	w18, w14, w24
	cmp	w19, w1
	mul	w27, w16, w26
	madd	w20, w12, w21, w9
	mov	w9, w26
	madd	w18, w13, w23, w18
	madd	w26, w15, w25, w27
	add	w18, w18, w26
	mov	w26, w25
	add	w18, w18, w20
	add	x20, x8, x22
	mov	w25, w24
	mov	w24, w23
	mov	w23, w21
	ldrb	w21, [x20, 6]
	madd	w18, w11, w21, w18
	ubfx	x18, x18, 8, 8
	strb	w18, [x10, x22]
	mov	w18, 474
	add	x22, x22, 1
	sub	w20, w18, w1
	bne	.L38
.L37:
	ldr	x18, [x29, 152]
	mov	w9, 474
	sub	w19, w9, w19
	ldr	x9, [x29, 176]
	lsr	w27, w19, 4
	add	x28, x18, x8
	ldr	x18, [x29, 144]
	add	x30, x9, x8
	add	x21, x9, x10
	mov	x9, 0
	add	x26, x18, x8
	ldr	x18, [x29, 136]
	add	x25, x18, x8
	ldr	x18, [x29, 128]
	add	x24, x18, x8
	ldr	x18, [x29, 120]
	add	x23, x18, x8
	ldr	x18, [x29, 112]
	add	x22, x18, x8
	mov	w18, 0
	.p2align 3,,7
.L39:
	ldr	q0, [x30, x9]
	add	w18, w18, 1
	cmp	w18, w27
	ldr	q21, [x28, x9]
	ldr	q20, [x26, x9]
	ushll	v1.8h, v0.8b, 0
	ldr	q19, [x25, x9]
	ushll2	v0.8h, v0.16b, 0
	ushll	v28.8h, v21.8b, 0
	ldr	q3, [x24, x9]
	ushll2	v21.8h, v21.16b, 0
	mul	v1.8h, v1.8h, v18.8h
	ushll	v27.8h, v20.8b, 0
	ldr	q22, [x23, x9]
	ushll2	v20.8h, v20.16b, 0
	mul	v0.8h, v0.8h, v18.8h
	ushll	v26.8h, v19.8b, 0
	ldr	q2, [x22, x9]
	ushll2	v19.8h, v19.16b, 0
	ushll	v25.8h, v3.8b, 0
	mla	v1.8h, v28.8h, v17.8h
	ushll2	v3.8h, v3.16b, 0
	ushll	v24.8h, v22.8b, 0
	mla	v0.8h, v21.8h, v17.8h
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
	str	q0, [x21, x9]
	add	x9, x9, 16
	bcc	.L39
	and	w9, w19, -16
	cmp	w9, w19
	add	w1, w9, w1
	mvn	w28, w9
	beq	.L40
	sxtw	x21, w1
	ldr	x1, [x29, 200]
	add	w28, w28, w20
	add	x20, x21, 1
	ldr	x18, [x29, 168]
	add	x28, x28, x20
	add	x9, x21, x1
	add	x1, x18, x9
	ldrb	w27, [x18, x9]
	ldrb	w26, [x1, 1]
	ldrb	w25, [x1, 2]
	ldrb	w24, [x1, 3]
	ldrb	w23, [x1, 4]
	ldrb	w22, [x1, 5]
	.p2align 3,,7
.L41:
	mul	w9, w14, w24
	add	x18, x8, x21
	cmp	x28, x20
	mul	w1, w16, w26
	ldrb	w18, [x18, 6]
	mul	w19, w17, w27
	mov	w27, w26
	mov	w26, w25
	madd	w9, w13, w23, w9
	madd	w1, w15, w25, w1
	mov	w25, w24
	mov	w24, w23
	madd	w19, w12, w22, w19
	mov	w23, w22
	mov	w22, w18
	add	w1, w9, w1
	add	w1, w1, w19
	madd	w1, w11, w18, w1
	ubfx	x1, x1, 8, 8
	strb	w1, [x10, x21]
	mov	x21, x20
	add	x20, x20, 1
	bne	.L41
.L40:
	ldr	x1, [x29, 200]
	add	x8, x8, 480
	add	x10, x10, 474
	add	x1, x1, 480
	str	x1, [x29, 200]
	ldr	x1, [x29, 184]
	cmp	x1, x8
	bne	.L42
	ldr	x10, [x29, 160]
	mov	w8, w5
	mov	w5, w3
	mov	w3, w0
	mov	w0, w4
	ldr	x1, [x29, 192]
	ldr	x30, [x29, 104]
	add	x17, x10, 122880
	add	x17, x17, 2256
	add	x16, x1, 474
	add	x15, x1, 948
	add	x14, x1, 1422
	add	x13, x1, 1896
	add	x12, x1, 2370
	add	x11, x1, 2844
	adrp	x1, .LANCHOR0
	add	x18, x1, :lo12:.LANCHOR0
	.p2align 3,,7
.L46:
	mov	x1, 0
	b	.L44
	.p2align 3,,7
.L54:
	ldp	w3, w6, [x18]
	ldp	w0, w8, [x18, 8]
	ldp	w2, w5, [x18, 16]
	ldr	w7, [x18, 24]
.L44:
	ldrb	w23, [x14, x1]
	ldrb	w22, [x16, x1]
	ldrb	w21, [x12, x1]
	mul	w8, w8, w23
	ldrb	w20, [x15, x1]
	mul	w6, w6, w22
	ldrb	w19, [x30, x1]
	mul	w5, w5, w21
	ldrb	w9, [x13, x1]
	madd	w0, w0, w20, w8
	ldrb	w4, [x11, x1]
	madd	w3, w3, w19, w6
	madd	w2, w2, w9, w5
	add	w0, w0, w3
	add	w0, w0, w2
	madd	w0, w7, w4, w0
	ubfx	x0, x0, 8, 8
	strb	w0, [x10, x1]
	add	x1, x1, 1
	cmp	x1, 474
	bne	.L54
	add	x10, x10, 474
	add	x30, x30, 474
	cmp	x17, x10
	add	x16, x16, 474
	add	x15, x15, 474
	add	x14, x14, 474
	add	x13, x13, 474
	add	x12, x12, 474
	add	x11, x11, 474
	beq	.L45
	ldp	w3, w6, [x18]
	ldp	w0, w8, [x18, 8]
	ldp	w2, w5, [x18, 16]
	ldr	w7, [x18, 24]
	b	.L46
.L47:
	mov	w20, 474
	mov	w1, 0
	b	.L37
.L45:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldr	x0, [x29, 192]
	ldp	x29, x30, [sp], 208
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
