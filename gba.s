	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"gba.c"
	.text
	.align	2
	.global	collision
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L5
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L8
.L5:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L8:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L5
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L10:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L10
	mov	r2, #67108864
.L11:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L11
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	lr, r3, #0
	ldrh	ip, [sp, #8]
	ble	.L18
	ldr	r3, .L26
	rsb	r1, r1, r1, lsl #4
	add	r0, r0, r1, lsl #4
	ldr	r1, [r3]
	add	r3, r0, r2
	mov	r0, #0
	rsb	r4, r2, r2, lsl #31
	add	r1, r1, r3, lsl #1
	lsl	r4, r4, #1
.L20:
	cmp	r2, #0
	addgt	r3, r1, r4
	ble	.L23
.L21:
	strh	ip, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L21
.L23:
	add	r0, r0, #1
	cmp	lr, r0
	add	r1, r1, #480
	bne	.L20
.L18:
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"A\000"
	.text
	.align	2
	.global	drawPaper
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPaper, %function
drawPaper:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	ip, .L40
	subs	r6, r3, #0
	ldr	r4, [ip]
	ldrh	lr, [sp, #24]
	ble	.L29
	mov	r5, #0
	rsb	ip, r1, r1, lsl #4
	add	ip, r0, ip, lsl #4
	add	ip, ip, r2
	rsb	r7, r2, r2, lsl #31
	add	ip, r4, ip, lsl #1
	lsl	r7, r7, #1
.L30:
	cmp	r2, #0
	addgt	r3, ip, r7
	ble	.L33
.L31:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L31
.L33:
	add	r5, r5, #1
	cmp	r6, r5
	add	ip, ip, #480
	bne	.L30
.L29:
	mov	r5, #0
	add	r2, r1, #1
	rsb	r2, r2, r2, lsl #4
	add	r6, r0, #1
	add	r3, r6, r2, lsl #4
	add	lr, r0, r2, lsl #4
	add	ip, r4, #14
	add	r3, r4, r3, lsl #1
	lsl	r2, r2, #4
	add	lr, ip, lr, lsl #1
.L34:
	strh	r5, [r3], #2	@ movhi
	cmp	r3, lr
	bne	.L34
	mov	lr, #0
	add	r3, r2, #480
	add	r2, r3, r0
	add	r6, r6, r3
	add	r3, r4, r6, lsl #1
	add	r2, ip, r2, lsl #1
.L35:
	strh	lr, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L35
	ldr	r4, .L40+4
	mov	r3, #31
	ldr	r2, .L40+8
	add	r1, r1, #5
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.word	drawString
	.word	.LC0
	.size	drawPaper, .-drawPaper
	.align	2
	.global	drawPaper1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPaper1, %function
drawPaper1:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L54
	subs	r7, r3, #0
	mov	r5, r0
	ldrh	lr, [sp, #24]
	ldr	r0, [r4]
	ble	.L43
	mov	r6, #0
	rsb	ip, r1, r1, lsl #4
	add	ip, r5, ip, lsl #4
	add	ip, ip, r2
	rsb	r8, r2, r2, lsl #31
	add	ip, r0, ip, lsl #1
	lsl	r8, r8, #1
.L44:
	cmp	r2, #0
	addgt	r3, ip, r8
	ble	.L47
.L45:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L45
.L47:
	add	r6, r6, #1
	cmp	r7, r6
	add	ip, ip, #480
	bne	.L44
.L43:
	mov	lr, #0
	add	r6, r1, #1
	rsb	r6, r6, r6, lsl #4
	add	r8, r5, #1
	add	r3, r8, r6, lsl #4
	add	ip, r5, r6, lsl #4
	add	r2, r0, #14
	add	r3, r0, r3, lsl #1
	lsl	r6, r6, #4
	add	ip, r2, ip, lsl #1
.L48:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L48
	mov	r7, #0
	add	r3, r6, #480
	add	ip, r3, r5
	add	r8, r8, r3
	add	r3, r0, r8, lsl #1
	add	r2, r2, ip, lsl #1
.L49:
	strh	r7, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L49
	mov	r0, r5
	mov	r3, #31
	ldr	r2, .L54+4
	ldr	r8, .L54+8
	add	r1, r1, #5
	mov	lr, pc
	bx	r8
	add	r1, r5, #7
	add	r2, r5, #6
	add	lr, r6, #720
	ldr	r3, [r4]
	add	r0, r6, #960
	add	r8, r1, lr
	add	lr, r2, lr
	add	ip, r6, #1200
	lsl	r4, lr, #1
	add	r6, r6, #1440
	add	lr, r1, r0
	lsl	r8, r8, #1
	strh	r7, [r3, r8]	@ movhi
	add	r5, r5, #5
	add	r8, r1, ip
	lsl	lr, lr, #1
	add	r1, r1, r6
	add	r6, r2, r6
	strh	r7, [r3, lr]	@ movhi
	lsl	lr, r6, #1
	add	r6, r2, r0
	add	r2, r2, ip
	add	r0, r5, r0
	add	r5, r5, ip
	lsl	r8, r8, #1
	lsl	r6, r6, #1
	lsl	ip, r5, #1
	lsl	r1, r1, #1
	lsl	r2, r2, #1
	lsl	r0, r0, #1
	strh	r7, [r3, r8]	@ movhi
	strh	r7, [r3, r1]	@ movhi
	strh	r7, [r3, r4]	@ movhi
	strh	r7, [r3, r6]	@ movhi
	strh	r7, [r3, r2]	@ movhi
	strh	r7, [r3, lr]	@ movhi
	strh	r7, [r3, r0]	@ movhi
	strh	r7, [r3, ip]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	.LC0
	.word	drawString
	.size	drawPaper1, .-drawPaper1
	.align	2
	.global	drawPaper2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPaper2, %function
drawPaper2:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L68
	subs	r7, r3, #0
	mov	r5, r0
	ldrh	lr, [sp, #32]
	ldr	r0, [r4]
	ble	.L57
	mov	r6, #0
	rsb	ip, r1, r1, lsl #4
	add	ip, r5, ip, lsl #4
	add	ip, ip, r2
	rsb	r8, r2, r2, lsl #31
	add	ip, r0, ip, lsl #1
	lsl	r8, r8, #1
.L58:
	cmp	r2, #0
	addgt	r3, ip, r8
	ble	.L61
.L59:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L59
.L61:
	add	r6, r6, #1
	cmp	r7, r6
	add	ip, ip, #480
	bne	.L58
.L57:
	mov	lr, #0
	add	r7, r1, #1
	rsb	r7, r7, r7, lsl #4
	add	r6, r5, #1
	add	r3, r6, r7, lsl #4
	add	ip, r5, r7, lsl #4
	add	r2, r0, #14
	add	r3, r0, r3, lsl #1
	lsl	r7, r7, #4
	add	ip, r2, ip, lsl #1
.L62:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L62
	mov	r8, #0
	add	r3, r7, #480
	add	ip, r3, r5
	add	lr, r6, r3
	add	r3, r0, lr, lsl #1
	add	r2, r2, ip, lsl #1
.L63:
	strh	r8, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L63
	mov	r0, r5
	mov	r3, #31
	ldr	r2, .L68+4
	ldr	r9, .L68+8
	add	r1, r1, #5
	mov	lr, pc
	bx	r9
	add	r2, r5, #7
	add	r9, r7, #720
	ldr	r3, [r4]
	add	r4, r2, r9
	add	r1, r7, #960
	lsl	r4, r4, #1
	strh	r8, [r3, r4]	@ movhi
	add	r4, r2, r1
	add	lr, r5, #6
	add	ip, r7, #1200
	add	r0, r7, #1440
	lsl	r4, r4, #1
	strh	r8, [r3, r4]	@ movhi
	add	r9, lr, r9
	add	r4, r2, ip
	add	r2, r2, r0
	lsl	r9, r9, #1
	lsl	r4, r4, #1
	lsl	r2, r2, #1
	strh	r8, [r3, r4]	@ movhi
	strh	r8, [r3, r2]	@ movhi
	add	r4, r5, #5
	strh	r8, [r3, r9]	@ movhi
	add	r9, lr, r1
	add	r0, lr, r0
	add	r2, lr, ip
	add	r1, r4, r1
	lsl	r9, r9, #1
	strh	r8, [r3, r9]	@ movhi
	lsl	r10, r0, #1
	add	r9, r7, #2160
	add	r0, r7, #2640
	add	lr, r7, #2400
	add	r4, r4, ip
	lsl	r2, r2, #1
	lsl	ip, r1, #1
	add	r1, r7, #1920
	add	r7, r5, #2
	strh	r8, [r3, r2]	@ movhi
	lsl	r4, r4, #1
	strh	r8, [r3, r10]	@ movhi
	add	r7, r7, r0
	add	r10, r5, r0
	add	r0, r6, r0
	strh	r8, [r3, ip]	@ movhi
	add	r1, r1, r5
	strh	r8, [r3, r4]	@ movhi
	lsl	ip, r0, #1
	add	r4, r5, lr
	add	r2, r5, r9
	add	lr, r6, lr
	add	r0, r6, r9
	lsl	r7, r7, #1
	lsl	r10, r10, #1
	lsl	r4, r4, #1
	lsl	lr, lr, #1
	lsl	r1, r1, #1
	lsl	r2, r2, #1
	lsl	r0, r0, #1
	strh	r8, [r3, r10]	@ movhi
	strh	r8, [r3, r4]	@ movhi
	strh	r8, [r3, r2]	@ movhi
	strh	r8, [r3, r1]	@ movhi
	strh	r8, [r3, r0]	@ movhi
	strh	r8, [r3, ip]	@ movhi
	strh	r8, [r3, r7]	@ movhi
	strh	r8, [r3, lr]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.word	.LC0
	.word	drawString
	.size	drawPaper2, .-drawPaper2
	.align	2
	.global	drawPaper3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPaper3, %function
drawPaper3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L82
	subs	r7, r3, #0
	mov	r5, r0
	ldrh	lr, [sp, #24]
	ldr	r0, [r4]
	ble	.L71
	mov	r6, #0
	rsb	ip, r1, r1, lsl #4
	add	ip, r5, ip, lsl #4
	add	ip, ip, r2
	rsb	r8, r2, r2, lsl #31
	add	ip, r0, ip, lsl #1
	lsl	r8, r8, #1
.L72:
	cmp	r2, #0
	addgt	r3, ip, r8
	ble	.L75
.L73:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L73
.L75:
	add	r6, r6, #1
	cmp	r7, r6
	add	ip, ip, #480
	bne	.L72
.L71:
	mov	lr, #0
	add	r6, r1, #1
	rsb	r6, r6, r6, lsl #4
	add	r8, r5, #1
	add	r3, r8, r6, lsl #4
	add	ip, r5, r6, lsl #4
	add	r2, r0, #14
	add	r3, r0, r3, lsl #1
	lsl	r6, r6, #4
	add	ip, r2, ip, lsl #1
.L76:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L76
	mov	ip, #0
	add	r7, r6, #480
	add	r3, r8, r7
	add	r3, r0, r3, lsl #1
	add	r0, r7, r5
	add	r2, r2, r0, lsl #1
.L77:
	strh	ip, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L77
	mov	r0, r5
	mov	r3, #31
	ldr	r2, .L82+4
	ldr	r8, .L82+8
	add	r1, r1, #5
	mov	lr, pc
	bx	r8
	mov	r0, #31
	add	r2, r5, #5
	add	lr, r6, #240
	add	r1, r5, #4
	add	r3, r5, #6
	add	r6, r6, #720
	ldr	ip, [r4]
	add	r6, r6, r2
	add	r4, lr, r2
	add	r3, r3, r7
	add	r2, r2, r7
	add	lr, r1, r7
	lsl	r4, r4, #1
	lsl	r1, r2, #1
	lsl	lr, lr, #1
	lsl	r2, r6, #1
	lsl	r3, r3, #1
	strh	r0, [ip, r4]	@ movhi
	strh	r0, [ip, r1]	@ movhi
	strh	r0, [ip, r2]	@ movhi
	strh	r0, [ip, lr]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	.LANCHOR0
	.word	.LC0
	.word	drawString
	.size	drawPaper3, .-drawPaper3
	.align	2
	.global	drawF
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawF, %function
drawF:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	subs	r7, r3, #0
	ldrh	r3, [sp, #24]
	ble	.L84
	mov	r6, r0
	ldr	r0, .L92
	add	r1, r1, r2
	ldr	r5, [r0]
	rsb	r1, r1, r1, lsl #4
	add	r1, r6, r1, lsl #4
	sub	r8, r2, r2, lsl #4
	add	r7, r7, r6
	add	r5, r5, r1, lsl #1
	lsl	r8, r8, #5
.L86:
	cmp	r2, #0
	addgt	r1, r8, r5
	ble	.L89
.L87:
	mov	r0, r1
	strh	r3, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	add	r1, r1, #480
	add	ip, r0, #1440
	add	r4, r0, #960
	add	lr, r0, #1920
	cmp	r5, r1
	add	r0, r0, #2400
	strh	r3, [r1]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r3, [lr]	@ movhi
	strh	r3, [r0]	@ movhi
	bne	.L87
.L89:
	add	r6, r6, #1
	cmp	r7, r6
	add	r5, r5, #2
	bne	.L86
.L84:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	.size	drawF, .-drawF
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L98
	ldr	r3, [r3]
	add	r2, r3, #76800
.L95:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L95
	bx	lr
.L99:
	.align	2
.L98:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	drawLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLine, %function
drawLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	ip, r2, #0
	bxle	lr
	ldr	r2, .L104
	rsb	r1, r1, r1, lsl #4
	ldr	r2, [r2]
	add	r0, r0, r1, lsl #4
	add	r1, r0, ip
	add	r1, r2, r1, lsl #1
	add	r2, r2, r0, lsl #1
.L102:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L102
	bx	lr
.L105:
	.align	2
.L104:
	.word	.LANCHOR0
	.size	drawLine, .-drawLine
	.align	2
	.global	drawHeart
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHeart, %function
drawHeart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L112
	push	{r4, r5, lr}
	rsb	lr, r1, r1, lsl #4
	add	r4, r0, #2
	ldr	ip, [r3]
	add	r5, r0, lr, lsl #4
	add	r4, r4, lr, lsl #4
	lsl	lr, lr, #4
	add	r1, lr, #240
	lsl	r4, r4, #1
	lsl	r5, r5, #1
	sub	r3, r0, #1
	add	r3, r3, r1
	strh	r2, [ip, r5]	@ movhi
	strh	r2, [ip, r4]	@ movhi
	add	r4, r1, r0
	add	r1, ip, #8
	add	r3, ip, r3, lsl #1
	add	r1, r1, r4, lsl #1
.L107:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L107
	add	r1, lr, #480
	add	r4, r0, r1
	add	r1, ip, #6
	add	r3, ip, r4, lsl #1
	add	r1, r1, r4, lsl #1
.L108:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L108
	add	r0, r0, lr
	add	r0, r0, #720
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r2, [ip, r0]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	.LANCHOR0
	.size	drawHeart, .-drawHeart
	.align	2
	.global	drawItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItem, %function
drawItem:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	ip, .L126
	subs	r7, r3, #0
	ldr	r5, [ip]
	ldrh	lr, [sp, #24]
	ldrh	r4, [sp, #28]
	ble	.L115
	mov	r6, #0
	rsb	ip, r1, r1, lsl #4
	add	ip, r0, ip, lsl #4
	add	ip, ip, r2
	rsb	r8, r2, r2, lsl #31
	add	ip, r5, ip, lsl #1
	lsl	r8, r8, #1
.L116:
	cmp	r2, #0
	addgt	r3, ip, r8
	ble	.L119
.L117:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L117
.L119:
	add	r6, r6, #1
	cmp	r7, r6
	add	ip, ip, #480
	bne	.L116
.L115:
	add	r3, r1, #3
	rsb	r3, r3, r3, lsl #4
	add	r2, r0, #4
	add	r6, r0, #6
	lsl	ip, r3, #4
	add	r6, r6, r3, lsl #4
	add	r1, r2, r3, lsl #4
	add	lr, ip, #240
	lsl	r1, r1, #1
	add	r3, r0, #3
	lsl	r6, r6, #1
	strh	r4, [r5, r1]	@ movhi
	add	r3, r3, lr
	add	r7, lr, r0
	strh	r4, [r5, r6]	@ movhi
	add	lr, r5, #16
	add	r3, r5, r3, lsl #1
	add	r1, lr, r7, lsl #1
.L120:
	strh	r4, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L120
	add	r1, ip, #480
	add	r3, r2, r1
	add	r1, r1, r0
	add	r2, r5, #14
	add	r3, r5, r3, lsl #1
	add	r2, r2, r1, lsl #1
.L121:
	strh	r4, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L121
	add	r3, r0, ip
	add	r3, r3, #724
	add	r3, r3, #1
	lsl	r3, r3, #1
	strh	r4, [r5, r3]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L127:
	.align	2
.L126:
	.word	.LANCHOR0
	.size	drawItem, .-drawItem
	.global	videoBuffer
	.comm	NOTES,2,2
	.comm	buffer,41,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
