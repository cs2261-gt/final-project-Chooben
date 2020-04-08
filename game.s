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
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L3
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	lsl	r3, r3, #23
	ldr	r0, .L3+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
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
	mov	r2, #0
	push	{r4, lr}
	mov	ip, #1
	mov	lr, #16
	mov	r0, #20
	mov	r1, #3
	ldr	r3, .L7
	str	r2, [r3]
	ldr	r3, .L7+4
	ldr	r4, .L7+8
	str	r2, [r3]
	ldr	r3, .L7+12
	str	r1, [r4]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #48]
	pop	{r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	hOff
	.word	vOff
	.word	health
	.word	player
	.size	initGame, .-initGame
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
	ldr	r3, .L13
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L10
	ldr	r2, .L13+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L11:
	ldr	r3, .L13+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L13+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L13+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L13+16
	ldrh	r1, [r2]
	ldr	r2, .L13+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L10:
	bl	drawPlayer.part.0
	b	.L11
.L14:
	.align	2
.L13:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
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
	push	{r4, lr}
	mov	ip, #1
	mov	lr, #16
	mov	r0, #20
	mov	r1, #0
	mov	r2, #3
	ldr	r3, .L17
	ldr	r4, .L17+4
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r2, [r4]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	str	r2, [r3, #48]
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	health
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L32
	ldr	r3, .L32+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L20
	ldr	r0, [r4, #44]
	ldr	r3, .L32+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L20:
	ldr	r3, .L32+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L32+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L32+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L23
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	bne	.L25
.L26:
	mov	r3, #3
	str	r3, [r4, #36]
.L25:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L26
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L25
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
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
	ldr	r3, .L45
	ldrh	r1, [r3, #48]
	ldr	r2, .L45+4
	ldr	r3, .L45+8
	tst	r1, #64
	push	{r4, lr}
	ldr	r1, [r3, #8]
	ldr	ip, [r2]
	bne	.L35
	cmp	r1, #0
	ldrgt	r0, [r3, #16]
	subgt	r1, r1, r0
	strgt	r1, [r3, #8]
	cmp	ip, #0
	ble	.L35
	ldr	r0, [r3]
	cmp	r0, #79
	suble	ip, ip, #1
	strle	ip, [r2]
.L35:
	ldr	r0, .L45
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L37
	ldr	r0, [r3, #28]
	rsb	r0, r0, #256
	cmp	r0, r1
	ldrgt	r0, [r3, #16]
	addgt	r1, r1, r0
	strgt	r1, [r3, #8]
	cmp	ip, #95
	ble	.L44
.L37:
	ldr	r2, .L45
	ldrh	r2, [r2, #48]
	ldr	lr, .L45+12
	tst	r2, #32
	ldr	r0, [lr]
	ldr	r2, [r3, #12]
	bne	.L39
	cmp	r2, #0
	ldrgt	r4, [r3, #20]
	subgt	r2, r2, r4
	strgt	r2, [r3, #12]
	cmp	r0, #0
	blt	.L39
	ldr	r4, [r3, #4]
	cmp	r4, #119
	suble	r0, r0, #1
	strle	r0, [lr]
.L39:
	ldr	r4, .L45
	ldrh	r4, [r4, #48]
	tst	r4, #16
	bne	.L41
	ldr	r4, [r3, #24]
	rsb	r4, r4, #256
	cmp	r4, r2
	ldrgt	r4, [r3, #20]
	addgt	r2, r2, r4
	strgt	r2, [r3, #12]
	cmp	r0, #15
	bgt	.L41
	ldr	r4, [r3, #4]
	cmp	r4, #120
	addgt	r0, r0, #1
	strgt	r0, [lr]
.L41:
	sub	r1, r1, ip
	sub	r2, r2, r0
	pop	{r4, lr}
	stm	r3, {r1, r2}
	b	animatePlayer
.L44:
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	ip, ip, #1
	strgt	ip, [r2]
	b	.L37
.L46:
	.align	2
.L45:
	.word	67109120
	.word	vOff
	.word	player
	.word	hOff
	.size	updatePlayer, .-updatePlayer
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
	@ link register save eliminated.
	b	updatePlayer
	.size	updateGame, .-updateGame
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
	@ link register save eliminated.
	ldr	r3, .L52
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L49
	ldr	r2, .L52+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L49:
	b	drawPlayer.part.0
.L53:
	.align	2
.L52:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	enemiesRemaining,4,4
	.comm	enemies,24,4
	.comm	bullets,20,4
	.comm	health,4,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
