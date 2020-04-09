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
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet.part.0, %function
drawBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #2
	movcc	ip, #8
	movcs	ip, #10
	ldr	r2, [r0]
	ldr	r1, [r0, #4]
	ldr	r3, .L8
	orr	r2, r2, #16384
	strh	ip, [r3, #12]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	shadowOAM
	.size	drawBullet.part.0, .-drawBullet.part.0
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
	mov	r1, #0
	mov	r2, #16
	push	{r4, r5, lr}
	mov	r0, #1
	mov	r4, #20
	mov	lr, #3
	mov	r5, #2
	mov	ip, #8
	ldr	r3, .L12
	str	r1, [r3]
	ldr	r3, .L12+4
	str	r1, [r3]
	ldr	r3, .L12+8
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	ldr	r2, .L12+12
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	str	r1, [r2, #24]
	str	r1, [r2]
	str	r1, [r2, #4]
	str	r1, [r2, #28]
	ldr	r1, .L12+16
	str	r5, [r2, #20]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	lr, [r3, #48]
	str	lr, [r1]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r0, [r2, #16]
	str	ip, [r2, #8]
	str	ip, [r2, #12]
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	hOff
	.word	vOff
	.word	player
	.word	bullets
	.word	health
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
	ldr	r3, .L22
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L15
	ldr	r2, .L22+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L16:
	ldr	r0, .L22+8
	ldr	r3, [r0, #24]
	cmp	r3, #0
	blne	drawBullet.part.0
.L17:
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L22+16
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L22+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L22+20
	ldrh	r1, [r2]
	ldr	r2, .L22+24
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L15:
	bl	drawPlayer.part.0
	b	.L16
.L23:
	.align	2
.L22:
	.word	player
	.word	shadowOAM
	.word	bullets
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
	ldr	r3, .L26
	ldr	r4, .L26+4
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
.L27:
	.align	2
.L26:
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
	ldr	r4, .L41
	ldr	r3, .L41+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L29
	ldr	r0, [r4, #44]
	ldr	r3, .L41+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L29:
	ldr	r3, .L41+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L41+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L41+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L32
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	bne	.L34
.L35:
	mov	r3, #3
	str	r3, [r4, #36]
.L34:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L35
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L34
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
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
	ldr	r3, .L47
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L44
	ldr	r2, .L47+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L44:
	b	drawPlayer.part.0
.L48:
	.align	2
.L47:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #8
	mov	ip, #2
	mov	r0, #1
	ldr	r3, .L50
	str	r2, [r3, #24]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #28]
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	bx	lr
.L51:
	.align	2
.L50:
	.word	bullets
	.size	initBullet, .-initBullet
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L65
	ldr	r3, [r2, #24]
	cmp	r3, #0
	bxne	lr
	mov	r0, #1
	ldr	r1, .L65+4
	ldr	r3, [r1, #36]
	cmp	r3, #0
	str	r0, [r2, #24]
	beq	.L63
	cmp	r3, #1
	beq	.L63
	cmp	r3, #2
	beq	.L64
	cmp	r3, #3
	addeq	r0, r1, #8
	ldmeq	r0, {r0, r1}
	streq	r3, [r2, #28]
	streq	r0, [r2, #4]
	streq	r1, [r2]
	bx	lr
.L63:
	ldr	r0, [r1, #12]
	ldr	r1, [r1, #8]
	str	r3, [r2, #28]
	stm	r2, {r0, r1}
	bx	lr
.L64:
	str	lr, [sp, #-4]!
	ldr	r0, [r1, #12]
	ldr	lr, [r2, #8]
	ldr	ip, [r1, #8]
	add	r1, r0, lr
	stm	r2, {r1, ip}
	str	r3, [r2, #28]
	ldr	lr, [sp], #4
	bx	lr
.L66:
	.align	2
.L65:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	ldr	r3, .L84
	ldrh	r1, [r3, #48]
	ldr	r2, .L84+4
	ldr	r3, .L84+8
	tst	r1, #64
	push	{r4, lr}
	ldr	r1, [r3, #8]
	ldr	ip, [r2]
	bne	.L68
	cmp	r1, #0
	ldrgt	r0, [r3, #16]
	subgt	r1, r1, r0
	strgt	r1, [r3, #8]
	cmp	ip, #0
	ble	.L68
	ldr	r0, [r3]
	cmp	r0, #79
	suble	ip, ip, #1
	strle	ip, [r2]
.L68:
	ldr	r0, .L84
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L70
	ldr	r0, [r3, #28]
	rsb	r0, r0, #256
	cmp	r0, r1
	ldrgt	r0, [r3, #16]
	addgt	r1, r1, r0
	strgt	r1, [r3, #8]
	cmp	ip, #95
	ble	.L81
.L70:
	ldr	r2, .L84
	ldrh	r2, [r2, #48]
	ldr	lr, .L84+12
	tst	r2, #32
	ldr	r0, [lr]
	ldr	r2, [r3, #12]
	bne	.L72
	cmp	r2, #0
	ldrgt	r4, [r3, #20]
	subgt	r2, r2, r4
	strgt	r2, [r3, #12]
	cmp	r0, #0
	blt	.L72
	ldr	r4, [r3, #4]
	cmp	r4, #119
	suble	r0, r0, #1
	strle	r0, [lr]
.L72:
	ldr	r4, .L84
	ldrh	r4, [r4, #48]
	tst	r4, #16
	bne	.L74
	ldr	r4, [r3, #24]
	rsb	r4, r4, #256
	cmp	r4, r2
	ldrgt	r4, [r3, #20]
	addgt	r2, r2, r4
	strgt	r2, [r3, #12]
	cmp	r0, #15
	ble	.L82
.L74:
	sub	r1, r1, ip
	sub	r2, r2, r0
	stm	r3, {r1, r2}
	bl	animatePlayer
	ldr	r3, .L84+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L67
	ldr	r3, .L84+20
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L83
.L67:
	pop	{r4, lr}
	bx	lr
.L81:
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	ip, ip, #1
	strgt	ip, [r2]
	b	.L70
.L82:
	ldr	r4, [r3, #4]
	cmp	r4, #120
	addgt	r0, r0, #1
	strgt	r0, [lr]
	b	.L74
.L83:
	pop	{r4, lr}
	b	fireBullet
.L85:
	.align	2
.L84:
	.word	67109120
	.word	vOff
	.word	player
	.word	hOff
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L88
	ldr	r3, [r0, #4]
	cmp	r3, #256
	ble	.L89
.L91:
	mov	r3, #0
	str	r3, [r0, #24]
	bx	lr
.L88:
	cmp	r3, #1
	beq	.L96
	cmp	r3, #2
	ldr	r3, [r0]
	beq	.L97
	cmp	r3, #256
	bgt	.L91
	ldr	r2, [r0, #20]
	add	r3, r2, r3
	str	r3, [r0]
	bx	lr
.L89:
	ldr	r2, [r0, #20]
	add	r3, r2, r3
	str	r3, [r0, #4]
	bx	lr
.L96:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	blt	.L91
	ldr	r2, [r0, #20]
	sub	r3, r3, r2
	str	r3, [r0, #4]
	bx	lr
.L97:
	cmp	r3, #0
	blt	.L91
	ldr	r2, [r0, #20]
	sub	r3, r3, r2
	str	r3, [r0]
	bx	lr
	.size	updateBullet, .-updateBullet
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
	bl	updatePlayer
	ldr	r0, .L100
	pop	{r4, lr}
	b	updateBullet
.L101:
	.align	2
.L100:
	.word	bullets
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	drawBullet.part.0
	.size	drawBullet, .-drawBullet
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	enemiesRemaining,4,4
	.comm	enemies,32,4
	.comm	bullets,32,4
	.comm	health,4,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
