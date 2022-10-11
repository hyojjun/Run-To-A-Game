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
	.file	"main.c"
	.text
	.align	2
	.global	soundEffect
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	soundEffect, %function
soundEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L53
	mov	r7, #0
	ldr	r5, .L53+4
	ldr	r8, .L53+8
	ldr	r9, .L53+12
	sub	sp, sp, #20
	add	r6, r4, #440
	b	.L3
.L2:
	add	r4, r4, #44
	cmp	r6, r4
	beq	.L50
.L3:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L2
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
	bx	r8
	cmp	r0, #0
	beq	.L2
	mov	r2, #67108864
	mov	r1, #61440
	orr	r3, r7, r9
	lsl	r3, r3, #16
	add	r4, r4, #44
	lsr	r3, r3, #16
	add	r7, r7, #1
	cmp	r6, r4
	strh	r1, [r2, #120]	@ movhi
	and	r7, r7, #7
	strh	r3, [r2, #124]	@ movhi
	bne	.L3
.L50:
	ldr	ip, .L53+16
	ldrh	r2, [ip]
	tst	r2, #32
	beq	.L4
	ldr	r3, .L53+20
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L4
.L5:
	ldr	r1, .L53+24
	ldrh	r3, [r1]
	ldr	r0, .L53+28
	lsl	lr, r3, #2
	ldrh	lr, [r0, lr]
	cmp	lr, #0
	bne	.L51
.L9:
	add	r3, r3, #1
	ldr	r0, [r0, #236]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	r3, r0
	strh	r3, [r1]	@ movhi
	movcs	r3, #0
	strhcs	r3, [r1]	@ movhi
.L8:
	tst	r2, #1
	beq	.L1
	ldr	r3, .L53+20
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L1
	ldr	r1, .L53+24
	ldrh	r3, [r1]
	ldr	r0, .L53+28
	lsl	r2, r3, #2
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	beq	.L13
	mov	r3, #67108864
	mov	ip, #127
	ldr	r2, .L53+32
	strh	r2, [r3, #98]	@ movhi
	ldrh	r2, [r1]
	lsl	r2, r2, #2
	ldrh	r2, [r0, r2]
	orr	r2, r2, #49152
	strh	r2, [r3, #100]	@ movhi
	strh	ip, [r3, #96]	@ movhi
	ldrh	r3, [r1]
.L13:
	add	r3, r3, #1
	ldr	r2, [r0, #236]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	r3, r2
	strh	r3, [r1]	@ movhi
	movcs	r3, #0
	strhcs	r3, [r1]	@ movhi
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L4:
	tst	r2, #16
	beq	.L6
	ldr	r3, .L53+20
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L5
.L6:
	tst	r2, #64
	bne	.L52
.L7:
	tst	r2, #128
	beq	.L8
	ldr	r3, .L53+20
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L8
	b	.L5
.L51:
	mov	r2, #67108864
	ldr	r3, .L53+32
	strh	r3, [r2, #104]	@ movhi
	ldrh	r3, [r1]
	lsl	r3, r3, #2
	ldrh	r3, [r0, r3]
	orr	r3, r3, #49152
	strh	r3, [r2, #108]	@ movhi
	ldrh	r2, [ip]
	ldrh	r3, [r1]
	b	.L9
.L52:
	ldr	r3, .L53+20
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L5
	b	.L7
.L54:
	.align	2
.L53:
	.word	enemies
	.word	player
	.word	collision
	.word	-16264
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	-2176
	.size	soundEffect, .-soundEffect
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"press SELECT to play\000"
	.align	2
.LC1:
	.ascii	"Run To A Game\000"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #0
	ldr	r5, .L57
	mov	r0, r6
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	ldr	lr, .L57+8
	ldr	ip, .L57+12
	mov	r1, r6
	mov	r3, r5
	ldr	r4, .L57+16
	mov	r0, #66
	ldr	r2, .L57+20
	str	r6, [lr]
	str	r6, [ip]
	mov	lr, pc
	bx	r4
	ldr	r2, .L57+24
	mov	r3, r5
	mov	r1, #100
	ldr	r5, .L57+28
	mov	r0, #84
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+36
	mov	r1, r6
	mov	r0, r5
	mov	lr, pc
	bx	r4
	add	r0, r5, #8
	mov	r1, #1
	mov	lr, pc
	bx	r4
	add	r0, r5, #16
	mov	r1, #2
	mov	lr, pc
	bx	r4
	add	r0, r5, #24
	mov	r1, #3
	mov	lr, pc
	bx	r4
	add	r0, r5, #32
	mov	r1, #4
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	18367
	.word	fillScreen
	.word	state
	.word	seed
	.word	drawString
	.word	.LC0
	.word	.LC1
	.word	characters
	.word	initializeCharacters
	.word	drawCharacter
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mvn	r1, #170
	mov	r2, #2
	ldr	ip, .L60
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	b	goToStart
.L61:
	.align	2
.L60:
	.word	1027
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState.part.0, %function
winState.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L64
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L65:
	.align	2
.L64:
	.word	buttons
	.size	winState.part.0, .-winState.part.0
	.set	loseState.part.0,winState.part.0
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L73
	ldr	r4, .L73+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #4
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L66
	ldr	r3, .L73+8
	ldrh	r0, [r3]
	ands	r0, r0, #4
	beq	.L72
.L66:
	pop	{r4, lr}
	bx	lr
.L72:
	ldr	r3, .L73+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L73+16
	ldr	r0, [r4]
	ldr	r3, .L73+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	fillScreen
	.word	state
	.word	srand
	.word	initGame
	.size	startState, .-startState
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L77
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L77+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L78:
	.align	2
.L77:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Pause\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #31744
	ldr	r3, .L81
	mov	lr, pc
	bx	r3
	mov	lr, #2
	ldr	ip, .L81+4
	ldr	r4, .L81+8
	mov	r1, #5
	mov	r0, #105
	ldr	r3, .L81+12
	ldr	r2, .L81+16
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	fillScreen
	.word	state
	.word	drawString
	.word	18367
	.word	.LC2
	.size	goToPause, .-goToPause
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L95
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L84
	ldr	r2, .L95+4
	ldrh	r0, [r2]
	ands	r0, r0, #4
	beq	.L93
.L84:
	tst	r3, #8
	beq	.L83
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L94
.L83:
	pop	{r4, lr}
	bx	lr
.L94:
	pop	{r4, lr}
	b	goToStart
.L93:
	ldr	r3, .L95+8
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L95+12
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L84
.L96:
	.align	2
.L95:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.size	pauseState, .-pauseState
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"You win!\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #992
	ldr	r3, .L99
	mov	lr, pc
	bx	r3
	mov	lr, #3
	ldr	ip, .L99+4
	ldr	r4, .L99+8
	mov	r3, #0
	mov	r1, #5
	mov	r0, #99
	ldr	r2, .L99+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	fillScreen
	.word	state
	.word	drawString
	.word	.LC3
	.size	goToWin, .-goToWin
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L103
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	b	winState.part.0
.L104:
	.align	2
.L103:
	.word	oldButtons
	.size	winState, .-winState
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"You Lose!\000"
	.align	2
.LC5:
	.ascii	"%u\000"
	.align	2
.LC6:
	.ascii	"score:\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #31
	ldr	r3, .L107
	mov	lr, pc
	bx	r3
	mov	lr, #4
	ldr	ip, .L107+4
	ldr	r4, .L107+8
	mov	r1, #5
	mov	r0, #99
	ldr	r3, .L107+12
	ldr	r2, .L107+16
	str	lr, [ip]
	ldr	r6, .L107+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L107+24
	ldr	r5, .L107+28
	ldr	r2, [r3]
	mov	r0, r6
	ldr	r1, .L107+32
	ldr	r3, .L107+36
	mov	lr, pc
	bx	r3
	mov	r2, r6
	mov	r3, r5
	mov	r1, #140
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #140
	mov	r0, #10
	ldr	r2, .L107+40
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L108:
	.align	2
.L107:
	.word	fillScreen
	.word	state
	.word	drawString
	.word	18367
	.word	.LC4
	.word	buffer
	.word	score
	.word	32767
	.word	.LC5
	.word	sprintf
	.word	.LC6
	.size	goToLose, .-goToLose
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L120
	ldr	r3, .L120+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L120+8
	ldr	r3, .L120+12
	ldr	r0, .L120+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L120+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L120+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L120+28
	mov	r1, #140
	mov	r0, #10
	ldr	r3, .L120+32
	ldr	r2, .L120+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L120+32
	mov	r1, #140
	mov	r0, #50
	ldr	r2, .L120+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L120+40
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L117
.L110:
	ldr	r3, [r4]
	cmp	r3, #300
	bge	.L118
.L111:
	ldr	r3, .L120+44
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L109
	ldr	r3, .L120+48
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L119
.L109:
	pop	{r4, r5, r6, lr}
	bx	lr
.L118:
	bl	goToWin
	b	.L111
.L117:
	bl	goToLose
	b	.L110
.L119:
	pop	{r4, r5, r6, lr}
	b	goToPause
.L121:
	.align	2
.L120:
	.word	score
	.word	updateGame
	.word	.LC5
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	drawGame
	.word	drawString
	.word	32767
	.word	.LC6
	.word	player
	.word	oldButtons
	.word	buttons
	.size	gameState, .-gameState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	ip, #128
	mvn	r0, #170
	mov	r1, #2
	push	{r4, r7, fp, lr}
	ldr	lr, .L140
	ldr	r2, .L140+4
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #132]	@ movhi
	strh	r0, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r8, .L140+8
	ldr	r4, .L140+12
	ldr	r7, .L140+16
	ldr	r6, .L140+20
	ldr	fp, .L140+24
	ldr	r10, .L140+28
	ldr	r9, .L140+32
	ldr	r5, .L140+36
.L124:
	mov	lr, pc
	bx	r8
	ldrh	r2, [r4]
	strh	r2, [r7]	@ movhi
	ldr	r3, [r6]
	ldrh	r1, [r5, #48]
	strh	r1, [r4]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L124
.L126:
	.word	.L130
	.word	.L129
	.word	.L128
	.word	.L127
	.word	.L125
.L125:
	tst	r2, #4
	beq	.L124
	ldr	r3, .L140+40
	mov	lr, pc
	bx	r3
	b	.L124
.L127:
	tst	r2, #4
	beq	.L124
	ldr	r3, .L140+44
	mov	lr, pc
	bx	r3
	b	.L124
.L128:
	mov	lr, pc
	bx	r9
	b	.L124
.L129:
	mov	lr, pc
	bx	r10
	b	.L124
.L130:
	mov	lr, pc
	bx	fp
	b	.L124
.L141:
	.align	2
.L140:
	.word	1027
	.word	goToStart
	.word	soundEffect
	.word	buttons
	.word	oldButtons
	.word	state
	.word	startState
	.word	gameState
	.word	pauseState
	.word	67109120
	.word	loseState.part.0
	.word	winState.part.0
	.size	main, .-main
	.text
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
	.global	song
	.global	playing
	.global	note
	.global	songLength
	.comm	characters,40,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	score,4,4
	.comm	NOTES,2,2
	.comm	buffer,41,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	song, %object
	.size	song, 236
song:
	.short	0
	.short	60
	.short	1547
	.short	15
	.short	1547
	.short	30
	.short	1714
	.short	15
	.short	1750
	.short	15
	.short	1750
	.short	30
	.short	1750
	.short	60
	.short	1750
	.short	60
	.short	1750
	.short	15
	.short	1750
	.short	20
	.short	1714
	.short	30
	.short	1673
	.short	15
	.short	1673
	.short	40
	.short	1714
	.short	30
	.short	1750
	.short	30
	.short	1602
	.short	30
	.short	1750
	.short	30
	.short	1714
	.short	15
	.short	1673
	.short	30
	.short	1602
	.short	15
	.short	1673
	.short	30
	.short	1673
	.short	30
	.short	1673
	.short	15
	.short	1673
	.short	30
	.short	1714
	.short	15
	.short	1673
	.short	30
	.short	1673
	.short	60
	.short	1547
	.short	30
	.short	1547
	.short	30
	.short	1547
	.short	30
	.short	1547
	.short	40
	.short	1602
	.short	15
	.short	1602
	.short	30
	.short	1650
	.short	15
	.short	1673
	.short	30
	.short	1547
	.short	30
	.short	1547
	.short	30
	.short	1602
	.short	15
	.short	1602
	.short	15
	.short	1650
	.short	30
	.short	1673
	.short	40
	.short	1673
	.short	30
	.short	1714
	.short	15
	.short	1750
	.short	15
	.short	1714
	.short	15
	.short	1673
	.short	15
	.short	1602
	.short	15
	.short	1673
	.short	15
	.short	1673
	.short	30
	.short	1673
	.short	30
	.short	1714
	.short	15
	.short	1750
	.short	15
	.short	1714
	.short	15
	.short	1673
	.short	15
	.short	1602
	.short	15
	.short	1547
	.short	30
	.short	1714
	.short	15
	.short	1673
	.short	15
	.short	1547
	.short	40
	.type	songLength, %object
	.size	songLength, 4
songLength:
	.word	59
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	note, %object
	.size	note, 2
note:
	.space	2
	.space	2
	.type	playing, %object
	.size	playing, 4
playing:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
