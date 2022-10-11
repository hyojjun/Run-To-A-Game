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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy.part.0, %function
updateEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0]
	cmp	r3, #1
	push	{r4, lr}
	ldr	ip, [r0, #16]
	ble	.L2
	ldr	r2, [r0, #24]
	add	r2, r3, r2
	cmp	r2, #154
	bgt	.L2
.L3:
	ldr	r2, [r0, #4]
	cmp	r2, #2
	ldr	r1, [r0, #20]
	ble	.L4
	ldr	lr, [r0, #28]
	add	lr, r2, lr
	cmp	lr, #237
	ble	.L5
.L4:
	ldr	r4, .L8
	ldr	lr, [r4]
	rsb	r1, r1, #0
	add	lr, lr, #1
	str	r1, [r0, #20]
	str	lr, [r4]
.L5:
	add	r3, r3, ip
	add	r2, r2, r1
	str	r3, [r0]
	str	r2, [r0, #4]
	pop	{r4, lr}
	bx	lr
.L2:
	ldr	r1, .L8
	ldr	r2, [r1]
	rsb	ip, ip, #0
	add	r2, r2, #1
	str	ip, [r0, #16]
	str	r2, [r1]
	b	.L3
.L9:
	.align	2
.L8:
	.word	score
	.size	updateEnemy.part.0, .-updateEnemy.part.0
	.align	2
	.global	drawBoundary
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoundary, %function
drawBoundary:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L12
	sub	sp, sp, #12
	ldr	r4, .L12+4
	mov	r3, #1
	mov	r2, #240
	mov	r1, #159
	mov	r0, #0
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r2, #240
	mov	r1, r3
	mov	r0, #0
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mov	r3, #160
	mov	r1, r2
	mov	r0, #0
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mov	r3, #160
	mov	r1, r2
	mov	r0, #239
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	9919
	.word	drawRect
	.size	drawBoundary, .-drawBoundary
	.align	2
	.global	initArea
	.syntax unified
	.arm
	.fpu softvfp
	.type	initArea, %function
initArea:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L16
	mov	lr, pc
	bx	r6
	ldr	r5, .L16+4
	smull	r2, r3, r5, r0
	asr	r2, r0, #31
	add	r3, r3, r0
	rsb	r2, r2, r3, asr #6
	add	r2, r2, r2, lsl #1
	rsb	r2, r2, r2, lsl #4
	ldr	r4, .L16+8
	sub	r0, r0, r2, lsl #1
	add	r0, r0, #50
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	mov	ip, #1
	mov	r6, #120
	mov	lr, #80
	mov	r2, #10
	mov	r1, #0
	smull	r3, r5, r0, r5
	asr	r3, r0, #31
	add	r5, r5, r0
	rsb	r3, r3, r5, asr #6
	add	r3, r3, r3, lsl ip
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl ip
	add	r0, r0, #50
	str	r0, [r4]
	str	r6, [r4, #12]
	str	lr, [r4, #8]
	str	ip, [r4, #28]
	str	r1, [r4, #32]
	str	r2, [r4, #20]
	str	r2, [r4, #16]
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	rand
	.word	-1240768329
	.word	area
	.size	initArea, .-initArea
	.align	2
	.global	drawArea
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawArea, %function
drawArea:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L22
	ldr	r6, .L22+4
	sub	sp, sp, #8
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	str	r6, [sp]
	ldr	r5, .L22+8
	mov	lr, pc
	bx	r5
	ldr	r3, .L22+12
	ldr	r3, [r3]
	cmp	r3, #49
	bgt	.L21
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L21:
	mov	r2, #0
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #20]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r5
	str	r6, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	area
	.word	18367
	.word	drawRect
	.word	score
	.size	drawArea, .-drawArea
	.align	2
	.global	updateArea
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateArea, %function
updateArea:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L31
	ldm	r4, {r2, r3}
	ldr	r1, [r4, #20]
	ldr	ip, [r4, #16]
	sub	sp, sp, #16
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r0, .L31+4
	ldr	r5, .L31+8
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L30
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L30:
	ldr	r6, .L31+12
	mov	lr, pc
	bx	r6
	ldr	r5, .L31+16
	smull	r2, r3, r5, r0
	asr	r2, r0, #31
	add	r3, r3, r0
	rsb	r2, r2, r3, asr #6
	add	r2, r2, r2, lsl #1
	rsb	r2, r2, r2, lsl #4
	sub	r0, r0, r2, lsl #1
	add	r0, r0, #55
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	mov	r2, #10
	smull	r3, r5, r0, r5
	asr	r3, r0, #31
	add	r5, r5, r0
	rsb	r3, r3, r5, asr #6
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #55
	str	r0, [r4]
	str	r2, [r4, #20]
	str	r2, [r4, #16]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	area
	.word	player
	.word	collision
	.word	rand
	.word	-1240768329
	.size	updateArea, .-updateArea
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #1
	mov	r0, #140
	mov	r6, #13
	mov	r5, #8
	mvn	r4, #32768
	mov	lr, #0
	mov	r1, #80
	mov	ip, #3
	ldr	r3, .L35
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	strh	r4, [r3, #32]	@ movhi
	str	lr, [r3, #40]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	ip, [r3, #44]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L67
	ldr	r3, [r4]
	cmp	r3, #49
	sub	sp, sp, #16
	bhi	.L38
	ldr	r3, .L67+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L59
.L39:
	ldr	r3, .L67+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L40
	ldr	r5, .L67+8
	ldr	r0, [r5, #4]
	ldr	r2, [r5, #28]
	add	r3, r0, r2
	cmp	r3, #238
	ble	.L60
.L40:
	ldr	r3, .L67+4
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L41
	ldr	r5, .L67+8
	ldr	r1, [r5]
	ldr	r3, [r5, #24]
	add	r2, r1, r3
	cmp	r2, #15
	bgt	.L61
.L41:
	ldr	r3, .L67+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L58
	ldr	r5, .L67+8
	ldr	r1, [r5]
	ldr	r3, [r5, #24]
	add	r2, r1, r3
	cmp	r2, #158
	ble	.L62
.L58:
	ldr	r3, [r4]
.L38:
	cmp	r3, #49
	ble	.L37
	ldr	r3, .L67+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L63
.L47:
	ldr	r3, .L67+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L48
	ldr	r4, .L67+8
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #28]
	add	r3, r0, r2
	cmp	r3, #238
	ble	.L64
.L48:
	ldr	r3, .L67+4
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L49
	ldr	r4, .L67+8
	ldr	r1, [r4]
	ldr	r3, [r4, #24]
	add	r2, r1, r3
	cmp	r2, #15
	bgt	.L65
.L49:
	ldr	r3, .L67+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L37
	ldr	r4, .L67+8
	ldr	r1, [r4]
	ldr	r3, [r4, #24]
	add	r2, r1, r3
	cmp	r2, #158
	ble	.L66
.L37:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	ldr	r4, .L67+8
	ldr	r0, [r4, #4]
	cmp	r0, #1
	ble	.L47
	ldr	r3, .L67+12
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L47
	ldm	r3, {r1, r2}
	ldr	lr, [r3, #16]
	ldr	ip, [r3, #20]
	add	r1, r1, #1
	add	r3, r2, #1
	str	r1, [sp, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	r5, .L67+16
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L47
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	b	.L37
.L59:
	ldr	r5, .L67+8
	ldr	r0, [r5, #4]
	cmp	r0, #1
	ble	.L39
	ldr	r3, .L67+12
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L39
	add	r1, r3, #8
	ldm	r1, {r1, r2, lr}
	ldr	ip, [r3, #20]
	add	r1, r1, #1
	add	r3, r2, #1
	str	r1, [sp, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	r6, .L67+16
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	ldr	r1, [r5]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L39
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #16]
	sub	r2, r2, r3
	str	r2, [r5, #4]
	ldr	r3, [r4]
	b	.L38
.L60:
	ldr	r3, .L67+12
	add	r1, r3, #12
	ldm	r1, {r1, r6, lr}
	ldr	ip, [r3, #8]
	sub	r3, r1, #1
	sub	ip, ip, #1
	stm	sp, {r3, ip}
	str	r6, [sp, #12]
	str	lr, [sp, #8]
	ldr	r6, .L67+16
	ldr	r3, [r5, #24]
	ldr	r1, [r5]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L40
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #16]
	add	r2, r2, r3
	str	r2, [r5, #4]
	ldr	r3, [r4]
	b	.L38
.L64:
	ldr	r3, .L67+12
	ldr	ip, [r3]
	ldr	r1, [r3, #4]
	add	r5, r3, #16
	ldm	r5, {r5, lr}
	sub	r3, r1, #1
	sub	ip, ip, #1
	stm	sp, {r3, ip}
	str	r5, [sp, #12]
	str	lr, [sp, #8]
	ldr	r5, .L67+16
	ldr	r3, [r4, #24]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L48
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	str	r3, [r4, #4]
	b	.L37
.L65:
	ldr	r2, .L67+12
	ldr	ip, [r2]
	ldr	r0, [r2, #4]
	add	r5, r2, #16
	ldm	r5, {r5, lr}
	add	r2, r0, #1
	add	ip, ip, #1
	stm	sp, {r2, ip}
	str	r5, [sp, #12]
	str	lr, [sp, #8]
	ldr	r5, .L67+16
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L49
	ldr	r3, [r4]
	ldr	r2, [r4, #20]
	sub	r3, r3, r2
	str	r3, [r4]
	b	.L37
.L61:
	ldr	r2, .L67+12
	add	r0, r2, #12
	ldm	r0, {r0, r6, lr}
	ldr	ip, [r2, #8]
	add	r2, r0, #1
	add	ip, ip, #1
	stm	sp, {r2, ip}
	str	r6, [sp, #12]
	str	lr, [sp, #8]
	ldr	r6, .L67+16
	ldr	r2, [r5, #28]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L41
	ldr	r2, [r5]
	ldr	r3, [r5, #20]
	sub	r2, r2, r3
	str	r2, [r5]
	ldr	r3, [r4]
	b	.L38
.L62:
	ldr	r2, .L67+12
	add	r0, r2, #12
	ldm	r0, {r0, r6, lr}
	ldr	ip, [r2, #8]
	sub	r2, r0, #1
	sub	ip, ip, #1
	stm	sp, {r2, ip}
	str	r6, [sp, #12]
	str	lr, [sp, #8]
	ldr	r6, .L67+16
	ldr	r2, [r5, #28]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L58
	ldr	r2, [r5]
	ldr	r3, [r5, #20]
	add	r2, r2, r3
	str	r2, [r5]
	ldr	r3, [r4]
	b	.L38
.L66:
	ldr	r2, .L67+12
	ldr	ip, [r2]
	ldr	r0, [r2, #4]
	add	r5, r2, #16
	ldm	r5, {r5, lr}
	sub	r2, r0, #1
	sub	ip, ip, #1
	stm	sp, {r2, ip}
	str	r5, [sp, #12]
	str	lr, [sp, #8]
	ldr	r5, .L67+16
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldreq	r3, [r4]
	ldreq	r2, [r4, #20]
	addeq	r3, r3, r2
	streq	r3, [r4]
	b	.L37
.L68:
	.align	2
.L67:
	.word	score
	.word	67109120
	.word	player
	.word	area
	.word	collision
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L79
	ldr	r3, [r4, #44]
	cmp	r3, #4
	sub	sp, sp, #12
	beq	.L75
	cmp	r3, #3
	beq	.L76
.L71:
	cmp	r3, #2
	beq	.L77
.L72:
	cmp	r3, #1
	beq	.L78
.L73:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L75:
	mov	r2, #0
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #12]
	ldr	r5, .L79+4
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #44]
	cmp	r3, #3
	bne	.L71
.L76:
	mov	r2, #0
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #12]
	ldr	r5, .L79+8
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #44]
	cmp	r3, #2
	bne	.L72
.L77:
	mov	r2, #0
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #12]
	ldr	r5, .L79+12
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #44]
	cmp	r3, #1
	bne	.L73
.L78:
	mov	r2, #0
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #12]
	ldr	r5, .L79+16
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L73
.L80:
	.align	2
.L79:
	.word	player
	.word	drawPaper3
	.word	drawPaper
	.word	drawPaper1
	.word	drawPaper2
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawPlayerLife
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerLife, %function
drawPlayerLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L91
	ldr	r3, [r4, #44]
	cmp	r3, #4
	beq	.L87
	cmp	r3, #3
	beq	.L88
.L83:
	cmp	r3, #2
	beq	.L89
.L84:
	cmp	r3, #1
	beq	.L90
.L81:
	pop	{r4, r5, r6, lr}
	bx	lr
.L87:
	mov	r1, #30
	ldr	r5, .L91+4
	mov	r0, r1
	mov	r2, #31
	mov	lr, pc
	bx	r5
	mov	r2, #31
	mov	r1, #30
	mov	r0, #40
	mov	lr, pc
	bx	r5
	mov	r2, #31
	mov	r1, #30
	mov	r0, #50
	mov	lr, pc
	bx	r5
	mov	r2, #31
	mov	r1, #30
	mov	r0, #60
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #44]
	cmp	r3, #3
	bne	.L83
.L88:
	mov	r1, #30
	ldr	r5, .L91+4
	mov	r0, r1
	mov	r2, #31
	mov	lr, pc
	bx	r5
	mov	r2, #31
	mov	r1, #30
	mov	r0, #40
	mov	lr, pc
	bx	r5
	mov	r2, #31
	mov	r1, #30
	mov	r0, #50
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r1, #30
	mov	r0, #60
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #44]
	cmp	r3, #2
	bne	.L84
.L89:
	mov	r1, #30
	ldr	r5, .L91+4
	mov	r0, r1
	mov	r2, #31
	mov	lr, pc
	bx	r5
	mov	r2, #31
	mov	r1, #30
	mov	r0, #40
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r1, #30
	mov	r0, #50
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r1, #30
	mov	r0, #60
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #44]
	cmp	r3, #1
	bne	.L81
.L90:
	mov	r1, #30
	ldr	r4, .L91+4
	mov	r0, r1
	mov	r2, #31
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r1, #30
	mov	r0, #40
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r1, #30
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r1, #30
	mov	r0, #60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	player
	.word	drawHeart
	.size	drawPlayerLife, .-drawPlayerLife
	.align	2
	.global	updatePlayerLife
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerLife, %function
updatePlayerLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L104
	mov	r8, #0
	ldr	r5, .L104+4
	ldr	r7, .L104+8
	sub	sp, sp, #16
	add	r6, r4, #440
	b	.L97
.L95:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L103
.L97:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L95
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r5, #44]
	strne	r8, [r4, #36]
	subne	r3, r3, #1
	add	r4, r4, #44
	strne	r3, [r5, #44]
	cmp	r4, r6
	bne	.L97
.L103:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	enemies
	.word	player
	.word	collision
	.size	updatePlayerLife, .-updatePlayerLife
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L110
	ldr	r5, .L110+4
	ldr	r9, .L110+8
	ldr	r8, .L110+12
	ldr	r7, .L110+16
	add	r6, r4, #440
.L107:
	mov	r10, #1
	str	r10, [r4, #24]
	str	r10, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r9, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl r10
	add	r0, r0, #5
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r10
	ldr	r3, [r4]
	add	r0, r0, #40
	str	r3, [r4, #8]
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, r10
	rsblt	r0, r0, #0
	add	r0, r0, r10
	str	r0, [r4, #16]
	mov	lr, pc
	bx	r5
	mov	r2, #0
	smull	r1, r3, r7, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl r10
	sub	r0, r0, r3
	ldr	r3, .L110+20
	add	r0, r0, r10
	str	r10, [r4, #36]
	str	r0, [r4, #20]
	str	r2, [r4, #40]
	strh	r3, [r4, #32]	@ movhi
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L107
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L111:
	.align	2
.L110:
	.word	enemies
	.word	rand
	.word	156180629
	.word	2114445439
	.word	1431655766
	.word	21492
	.size	initEnemies, .-initEnemies
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy.part.0
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L118
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L119
.L116:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L119:
	str	r3, [sp]
	ldr	r5, .L120
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L116
.L118:
	mov	r2, #0
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r5, .L120
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L116
.L121:
	.align	2
.L120:
	.word	drawF
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	initLifeItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLifeItem, %function
initLifeItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L124
	mov	lr, pc
	bx	r6
	ldr	r5, .L124+4
	smull	r2, r3, r5, r0
	asr	r2, r0, #31
	add	r3, r3, r0
	rsb	r2, r2, r3, asr #6
	add	r2, r2, r2, lsl #1
	rsb	r2, r2, r2, lsl #4
	ldr	r4, .L124+8
	sub	r0, r0, r2, lsl #1
	add	r0, r0, #55
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	mov	r1, #1
	mov	lr, #10
	mov	ip, #11
	mov	r2, #0
	smull	r3, r5, r0, r5
	asr	r3, r0, #31
	add	r5, r5, r0
	rsb	r3, r3, r5, asr #6
	add	r3, r3, r3, lsl r1
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl r1
	add	r0, r0, #55
	str	r0, [r4]
	str	lr, [r4, #8]
	str	ip, [r4, #12]
	str	r1, [r4, #20]
	str	r2, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L125:
	.align	2
.L124:
	.word	rand
	.word	-1240768329
	.word	lifeitem
	.size	initLifeItem, .-initLifeItem
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, r5, r6, lr}
	mov	r2, #1
	mov	lr, #3
	mov	r0, #140
	mov	r1, #80
	mov	r6, #13
	mov	r5, #8
	mvn	r4, #32768
	ldr	r3, .L128
	str	ip, [r3]
	ldr	r3, .L128+4
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	strh	r4, [r3, #32]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #40]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	bl	initEnemies
	bl	initLifeItem
	pop	{r4, r5, r6, lr}
	b	initArea
.L129:
	.align	2
.L128:
	.word	score
	.word	player
	.size	initGame, .-initGame
	.align	2
	.global	drawLifeItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLifeItem, %function
drawLifeItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L137
	ldr	r3, [r3]
	cmp	r3, #49
	sub	sp, sp, #12
	bgt	.L134
	ldr	r4, .L137+4
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L136
.L130:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L134:
	mov	r3, #31
	ldr	r4, .L137+4
	str	r3, [sp, #4]
	ldr	ip, .L137+8
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r5, .L137+12
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L130
.L136:
	str	r3, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r4, .L137+12
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	score
	.word	lifeitem
	.word	18367
	.word	drawItem
	.size	drawLifeItem, .-drawLifeItem
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #12
	bl	drawBoundary
	mov	r2, #0
	mov	r3, #10
	mov	r1, #140
	mov	r0, #50
	str	r2, [sp]
	ldr	r4, .L143
	mov	r2, #20
	mov	lr, pc
	bx	r4
	bl	drawPlayerLife
	bl	drawArea
	bl	drawLifeItem
	bl	drawPlayer
	ldr	r4, .L143+4
	add	r5, r4, #440
.L140:
	mov	r0, r4
	add	r4, r4, #44
	bl	drawEnemy
	cmp	r4, r5
	bne	.L140
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	drawRect
	.word	enemies
	.size	drawGame, .-drawGame
	.align	2
	.global	updateLifeItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLifeItem, %function
updateLifeItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L163
	ldr	r3, [r3]
	cmp	r3, #49
	bxle	lr
	push	{r4, r5, r6, lr}
	ldr	r4, .L163+4
	ldr	r3, [r4, #20]
	cmp	r3, #0
	sub	sp, sp, #16
	bne	.L162
.L145:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L162:
	ldr	r5, .L163+8
	ldr	ip, [r4, #8]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r6, [r4, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldm	r5, {r0, r1}
	ldr	r6, .L163+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L145
	ldr	r3, .L163+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L145
	ldr	r3, .L163+20
	ldrh	r3, [r3]
	ands	r3, r3, #1
	ldreq	r2, [r5, #44]
	addeq	r2, r2, #1
	streq	r3, [r4, #20]
	streq	r2, [r5, #44]
	b	.L145
.L164:
	.align	2
.L163:
	.word	score
	.word	lifeitem
	.word	player
	.word	collision
	.word	oldButtons
	.word	buttons
	.size	updateLifeItem, .-updateLifeItem
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayerLife
	bl	updateLifeItem
	bl	updatePlayer
	bl	updateArea
	ldr	r0, .L173
	add	r4, r0, #440
.L167:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	blne	updateEnemy.part.0
.L166:
	add	r0, r0, #44
	cmp	r0, r4
	bne	.L167
	pop	{r4, lr}
	bx	lr
.L174:
	.align	2
.L173:
	.word	enemies
	.size	updateGame, .-updateGame
	.comm	area,36,4
	.comm	lifeitem,28,4
	.comm	enemies,440,4
	.comm	player,48,4
	.comm	score,4,4
	.comm	NOTES,2,2
	.comm	buffer,41,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
