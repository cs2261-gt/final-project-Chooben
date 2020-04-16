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
	beq	.L6
	ldr	r3, .L22+4
	ldrh	r2, [r3]
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
.L7:
	ldr	r2, .L22+8
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L19
	mov	r0, #8
	ldm	r2, {r1, ip}
	orr	r2, r1, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	ldr	r3, .L22+12
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L9
.L20:
	mov	r1, #512
	ldr	r2, .L22+16
	strh	r1, [r2]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	beq	.L11
.L21:
	mov	r2, #512
	ldr	r3, .L22+20
	strh	r2, [r3]	@ movhi
.L12:
	ldr	r3, .L22+24
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L13
	ldr	r0, .L22+28
	ldr	r3, [r0]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r0, #28]
	ldr	r2, .L22+32
	ldr	r0, [r0, #4]
	add	r1, r1, #12
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L13:
	ldr	r3, .L22+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L22+40
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L22+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L22+44
	ldrh	r1, [r2]
	ldr	r2, .L22+48
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L19:
	mov	r2, #512
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L22+12
	ldr	r2, [r3, #28]
	cmp	r2, #1
	bne	.L20
.L9:
	mov	r0, #10
	ldr	r1, [r3]
	ldr	r2, .L22+16
	ldr	ip, [r3, #4]
	orr	r1, r1, #16384
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	bne	.L21
.L11:
	mov	r1, #10
	ldr	r2, [r3, #32]
	ldr	r0, [r3, #36]
	ldr	r3, .L22+20
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	b	.L12
.L6:
	bl	drawPlayer.part.0
	ldr	r3, .L22+4
	b	.L7
.L23:
	.align	2
.L22:
	.word	player
	.word	shadowOAM
	.word	bullets
	.word	enemies
	.word	shadowOAM+800
	.word	shadowOAM+808
	.word	currRegion
	.word	boss
	.word	shadowOAM+1016
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
	mov	ip, #16
	str	lr, [sp, #-4]!
	mov	r2, #1
	mov	lr, #3
	mov	r0, #20
	mov	r1, #0
	ldr	r3, .L26
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	ldr	ip, .L26+4
	str	lr, [r3, #48]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [ip]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L27:
	.align	2
.L26:
	.word	player
	.word	playerHealth
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
	mov	r1, #2
	mov	r0, #1
	ldr	r3, .L50
	str	r2, [r3, #24]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #28]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
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
	@ link register save eliminated.
	ldr	r2, .L61
	ldr	r3, [r2, #24]
	cmp	r3, #0
	bxne	lr
	mov	r0, #1
	ldr	r1, .L61+4
	ldr	r3, [r1, #36]
	cmp	r3, #0
	str	r0, [r2, #24]
	beq	.L59
	cmp	r3, #1
	beq	.L59
	cmp	r3, #2
	beq	.L60
	cmp	r3, #3
	bxne	lr
.L60:
	ldm	r1, {r0, r1}
	str	r3, [r2, #28]
	str	r0, [r2, #4]
	str	r1, [r2]
	bx	lr
.L59:
	ldr	r0, [r1, #4]
	ldr	r1, [r1]
	str	r3, [r2, #28]
	stm	r2, {r0, r1}
	bx	lr
.L62:
	.align	2
.L61:
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L88
	ldrh	r2, [r3, #48]
	ldr	r4, .L88+4
	ldr	r3, .L88+8
	tst	r2, #64
	ldr	r0, [r3]
	ldr	r2, [r4, #8]
	sub	sp, sp, #16
	bne	.L64
	cmp	r2, #0
	ldrgt	r1, [r4, #16]
	subgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #0
	ble	.L64
	ldr	r1, [r4]
	cmp	r1, #79
	suble	r0, r0, #1
	strle	r0, [r3]
.L64:
	ldr	r1, .L88
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L66
	ldr	r1, [r4, #28]
	rsb	r1, r1, #256
	cmp	r1, r2
	ldrgt	r1, [r4, #16]
	addgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #95
	ble	.L84
.L66:
	ldr	r3, .L88
	ldrh	r3, [r3, #48]
	ldr	ip, .L88+12
	tst	r3, #32
	ldr	r1, [ip]
	ldr	r3, [r4, #12]
	bne	.L68
	ldr	lr, [r4, #20]
	cmp	r1, #0
	sub	r3, r3, lr
	str	r3, [r4, #12]
	blt	.L68
	ldr	lr, [r4, #4]
	cmp	lr, #119
	suble	r1, r1, #1
	strle	r1, [ip]
.L68:
	ldr	lr, .L88
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L69
	ldr	lr, [r4, #24]
	rsb	lr, lr, #256
	cmp	lr, r3
	ldrgt	lr, [r4, #20]
	addgt	r3, r3, lr
	strgt	r3, [r4, #12]
	cmp	r1, #15
	ble	.L85
.L69:
	ldr	r5, .L88+16
	sub	r3, r3, r1
	sub	r2, r2, r0
	stm	r4, {r2, r3}
	bl	animatePlayer
	ldr	r3, [r5, #28]
	cmp	r3, #1
	mov	r6, #0
	ldr	r8, .L88+20
	ldr	r7, .L88+24
	beq	.L86
.L72:
	cmp	r6, #1
	add	r5, r5, #32
	bne	.L76
	ldr	r3, .L88+28
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L63
	ldr	r3, .L88+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L87
.L63:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L76:
	ldr	r3, [r5, #28]
	cmp	r3, #1
	mov	r6, #1
	bne	.L72
.L86:
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r7]
	subne	r3, r3, #1
	strne	r3, [r7]
	b	.L72
.L84:
	ldr	r1, [r4]
	cmp	r1, #80
	addgt	r0, r0, #1
	strgt	r0, [r3]
	b	.L66
.L85:
	ldr	lr, [r4, #4]
	cmp	lr, #120
	addgt	r1, r1, #1
	strgt	r1, [ip]
	b	.L69
.L87:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireBullet
.L89:
	.align	2
.L88:
	.word	67109120
	.word	player
	.word	vOff
	.word	hOff
	.word	enemies
	.word	collision
	.word	playerHealth
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
	bne	.L92
	ldr	r3, [r0, #4]
	cmp	r3, #256
	ble	.L93
.L95:
	mov	r3, #0
	str	r3, [r0, #24]
	bx	lr
.L92:
	cmp	r3, #1
	beq	.L100
	cmp	r3, #2
	ldr	r3, [r0]
	beq	.L101
	cmp	r3, #256
	bgt	.L95
	ldr	r2, [r0, #20]
	add	r3, r2, r3
	str	r3, [r0]
	bx	lr
.L93:
	ldr	r2, [r0, #20]
	add	r3, r2, r3
	str	r3, [r0, #4]
	bx	lr
.L100:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	blt	.L95
	ldr	r2, [r0, #20]
	sub	r3, r3, r2
	str	r3, [r0, #4]
	bx	lr
.L101:
	cmp	r3, #0
	ble	.L95
	ldr	r2, [r0, #20]
	sub	r3, r3, r2
	str	r3, [r0]
	bx	lr
	.size	updateBullet, .-updateBullet
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
	beq	.L103
	mov	r1, #8
	ldr	r2, [r0]
	ldr	r3, .L105
	ldr	r0, [r0, #4]
	orr	r2, r2, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	bx	lr
.L103:
	mov	r2, #512
	ldr	r3, .L105
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L106:
	.align	2
.L105:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #0
	mov	r8, #16
	ldr	r4, .L111
	ldr	r5, .L111+4
	ldr	r7, .L111+8
	ldr	r6, .L111+12
.L108:
	str	r8, [r4, #8]
	str	r8, [r4, #12]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	add	r0, r0, #50
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r10, #1
	smull	r3, r2, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #5
	add	r0, r0, #50
	str	r0, [r4, #4]
	str	r10, [r4, #16]
	str	r10, [r4, #20]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, r10
	rsblt	r0, r0, #0
	cmp	r9, r10
	str	r0, [r4, #24]
	str	r10, [r4, #28]
	add	r4, r4, #32
	bne	.L109
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L109:
	mov	r9, r10
	b	.L108
.L112:
	.align	2
.L111:
	.word	enemies
	.word	rand
	.word	-2004318071
	.word	1717986919
	.size	initEnemy, .-initEnemy
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
	mov	r1, #2
	push	{r4, r5, r6, lr}
	mov	r2, #1
	mov	r4, #0
	mov	ip, #16
	mov	r0, #20
	mov	r5, #3
	ldr	r3, .L116
	str	r1, [r3]
	ldr	r3, .L116+4
	str	r1, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r4, [r3, #24]
	str	r4, [r3]
	str	r4, [r3, #28]
	str	r2, [r3, #16]
	ldr	r1, .L116+8
	str	r4, [r3, #4]
	ldr	r3, .L116+12
	str	r4, [r1]
	str	r2, [r3]
	ldr	r1, .L116+16
	ldr	r3, .L116+20
	str	r4, [r1]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r5, [r3, #48]
	bl	initEnemy
	ldr	r3, .L116+24
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L113
	mov	r1, #128
	mov	r2, #32
	ldr	r3, .L116+28
	str	r1, [r3]
	str	r1, [r3, #4]
	str	r4, [r3, #36]
	str	r5, [r3, #40]
	str	r4, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
.L113:
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	bossHealth
	.word	bullets
	.word	hOff
	.word	playerHealth
	.word	vOff
	.word	player
	.word	currRegion
	.word	boss
	.size	initGame, .-initGame
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
	push	{r4, r5, r6, lr}
	ldr	r2, [r0]
	cmp	r2, #0
	mov	r4, r0
	ldr	r3, [r0, #20]
	sub	sp, sp, #16
	ble	.L122
	ldr	r1, [r0, #8]
	add	r1, r2, r1
	cmp	r1, #255
	ble	.L120
.L122:
	rsb	r3, r3, #0
	str	r3, [r4, #20]
.L121:
	ldr	r1, [r4, #24]
	cmp	r1, #0
	bne	.L123
	add	r3, r2, r3
	str	r3, [r4]
.L126:
	ldr	r3, [r4, #28]
	cmp	r3, #1
	bne	.L131
	ldr	r5, .L132
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r6, .L132+4
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L127
.L131:
	ldr	r3, [r4, #16]
.L125:
	cmp	r3, #0
	streq	r3, [r4, #28]
	ldr	r3, .L132+8
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L118
	mov	r2, #512
	mov	r1, #0
	ldr	r3, .L132+12
	strh	r2, [r3], #8	@ movhi
	str	r1, [r4, #28]
	strh	r2, [r3]	@ movhi
.L118:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L127:
	mov	r0, #0
	ldr	r1, .L132+16
	ldr	r3, [r4, #16]
	ldr	r2, [r1]
	ldr	ip, [r5, #16]
	sub	r2, r2, #1
	sub	r3, r3, ip
	str	r3, [r4, #16]
	str	r2, [r1]
	str	r0, [r5, #24]
	b	.L125
.L123:
	ldr	r2, [r4, #4]
	add	r3, r2, r3
	str	r3, [r4, #4]
	b	.L126
.L120:
	ldr	r1, [r0, #4]
	cmp	r1, #0
	ble	.L122
	ldr	r0, [r0, #12]
	add	r1, r1, r0
	cmp	r1, #255
	ble	.L121
	b	.L122
.L133:
	.align	2
.L132:
	.word	bullets
	.word	collision
	.word	currRegion
	.word	shadowOAM+800
	.word	bossHealth
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
	@ link register save eliminated.
	ldr	r3, .L140
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L135
	mov	r1, #512
	ldr	r2, .L140+4
	strh	r1, [r2]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	beq	.L137
.L139:
	mov	r2, #512
	ldr	r3, .L140+8
	strh	r2, [r3]	@ movhi
	bx	lr
.L135:
	mov	r0, #10
	ldr	r1, [r3]
	ldr	r2, .L140+4
	ldr	ip, [r3, #4]
	orr	r1, r1, #16384
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	bne	.L139
.L137:
	mov	r1, #10
	ldr	r2, [r3, #32]
	ldr	r0, [r3, #36]
	ldr	r3, .L140+8
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L141:
	.align	2
.L140:
	.word	enemies
	.word	shadowOAM+800
	.word	shadowOAM+808
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	initBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoss, %function
initBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #128
	mov	r1, #32
	mov	r2, #0
	mov	ip, #3
	ldr	r3, .L143
	str	r0, [r3]
	str	r0, [r3, #4]
	str	ip, [r3, #40]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	bx	lr
.L144:
	.align	2
.L143:
	.word	boss
	.size	initBoss, .-initBoss
	.align	2
	.global	updateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoss, %function
updateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L151
	ldr	r3, [r4, #24]
	cmp	r3, #1
	sub	sp, sp, #16
	bne	.L145
	ldr	r0, .L151+4
	add	r5, r4, #8
	ldm	r5, {r5, r6}
	ldm	r4, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	str	r6, [sp, #12]
	ldr	r5, .L151+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L150
.L145:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L150:
	mov	r1, #0
	ldr	r2, .L151+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	r1, [r4, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L152:
	.align	2
.L151:
	.word	bullets
	.word	boss
	.word	collision
	.word	bossHealth
	.size	updateBoss, .-updateBoss
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
	ldr	r0, .L157
	bl	updateBullet
	ldr	r0, .L157+4
	bl	updateEnemy
	ldr	r0, .L157+8
	bl	updateEnemy
	ldr	r3, .L157+12
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L156
	pop	{r4, lr}
	bx	lr
.L156:
	pop	{r4, lr}
	b	updateBoss
.L158:
	.align	2
.L157:
	.word	bullets
	.word	enemies
	.word	enemies+32
	.word	currRegion
	.size	updateGame, .-updateGame
	.align	2
	.global	animateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBoss, %function
animateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	animateBoss, .-animateBoss
	.align	2
	.global	drawBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoss, %function
drawBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L161
	ldr	r3, [r0]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L161+4
	ldr	r1, [r0, #28]
	ldr	ip, [r0, #4]
	add	r1, r1, #12
	add	r0, r2, #1016
	add	r2, r2, #1020
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	bx	lr
.L162:
	.align	2
.L161:
	.word	boss
	.word	shadowOAM
	.size	drawBoss, .-drawBoss
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	currRegion,4,4
	.comm	bossHealth,4,4
	.comm	boss,44,4
	.comm	enemies,64,4
	.comm	bullets,32,4
	.comm	playerHealth,4,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
