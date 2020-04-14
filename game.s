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
	ldr	r3, .L21
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L6
	ldr	r3, .L21+4
	ldrh	r2, [r3]
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	ldr	r2, .L21+8
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L18
.L13:
	mov	r0, #8
	ldm	r2, {r1, ip}
	orr	r2, r1, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	ldr	r3, .L21+12
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L9
.L19:
	mov	r1, #512
	ldr	r2, .L21+16
	strh	r1, [r2]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	beq	.L11
.L20:
	mov	r2, #512
	ldr	r3, .L21+20
	strh	r2, [r3]	@ movhi
.L12:
	ldr	r3, .L21+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L21+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L21+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L21+32
	ldrh	r1, [r2]
	ldr	r2, .L21+36
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L6:
	bl	drawPlayer.part.0
	ldr	r2, .L21+8
	ldr	r1, [r2, #24]
	cmp	r1, #0
	ldr	r3, .L21+4
	bne	.L13
.L18:
	mov	r2, #512
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L21+12
	ldr	r2, [r3, #28]
	cmp	r2, #1
	bne	.L19
.L9:
	mov	r0, #12
	ldr	r1, [r3]
	ldr	r2, .L21+16
	ldr	ip, [r3, #4]
	orr	r1, r1, #16384
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	bne	.L20
.L11:
	mov	r1, #12
	ldr	r2, [r3, #32]
	ldr	r0, [r3, #36]
	ldr	r3, .L21+20
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	b	.L12
.L22:
	.align	2
.L21:
	.word	player
	.word	shadowOAM
	.word	bullets
	.word	enemies
	.word	shadowOAM+800
	.word	shadowOAM+808
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
	ldr	r3, .L25
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	ldr	ip, .L25+4
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
.L26:
	.align	2
.L25:
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
	ldr	r4, .L40
	ldr	r3, .L40+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L28
	ldr	r0, [r4, #44]
	ldr	r3, .L40+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L28:
	ldr	r3, .L40+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L40+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L40+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L31
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	bne	.L33
.L34:
	mov	r3, #3
	str	r3, [r4, #36]
.L33:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L34
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L33
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	.align	2
.L40:
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
	ldr	r3, .L46
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L43
	ldr	r2, .L46+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L43:
	b	drawPlayer.part.0
.L47:
	.align	2
.L46:
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
	ldr	r3, .L49
	str	r2, [r3, #24]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #28]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	bx	lr
.L50:
	.align	2
.L49:
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
	ldr	r2, .L60
	ldr	r3, [r2, #24]
	cmp	r3, #0
	bxne	lr
	mov	r0, #1
	ldr	r1, .L60+4
	ldr	r3, [r1, #36]
	cmp	r3, #0
	str	r0, [r2, #24]
	beq	.L58
	cmp	r3, #1
	beq	.L58
	cmp	r3, #2
	beq	.L59
	cmp	r3, #3
	bxne	lr
.L59:
	ldm	r1, {r0, r1}
	str	r3, [r2, #28]
	str	r0, [r2, #4]
	str	r1, [r2]
	bx	lr
.L58:
	ldr	r0, [r1, #4]
	ldr	r1, [r1]
	str	r3, [r2, #28]
	stm	r2, {r0, r1}
	bx	lr
.L61:
	.align	2
.L60:
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
	ldr	r3, .L84
	ldrh	r2, [r3, #48]
	ldr	r4, .L84+4
	ldr	r3, .L84+8
	tst	r2, #64
	ldr	r0, [r3]
	ldr	r2, [r4, #8]
	sub	sp, sp, #16
	bne	.L63
	cmp	r2, #0
	ldrgt	r1, [r4, #16]
	subgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #0
	ble	.L63
	ldr	r1, [r4]
	cmp	r1, #79
	suble	r0, r0, #1
	strle	r0, [r3]
.L63:
	ldr	r1, .L84
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L65
	ldr	r1, [r4, #28]
	rsb	r1, r1, #256
	cmp	r1, r2
	ldrgt	r1, [r4, #16]
	addgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #95
	ble	.L81
.L65:
	ldr	r3, .L84
	ldrh	r3, [r3, #48]
	ldr	ip, .L84+12
	tst	r3, #32
	ldr	r1, [ip]
	ldr	r3, [r4, #12]
	bne	.L67
	ldr	lr, [r4, #20]
	cmp	r1, #0
	sub	r3, r3, lr
	str	r3, [r4, #12]
	blt	.L67
	ldr	lr, [r4, #4]
	cmp	lr, #119
	suble	r1, r1, #1
	strle	r1, [ip]
.L67:
	ldr	lr, .L84
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L68
	ldr	lr, [r4, #24]
	rsb	lr, lr, #256
	cmp	lr, r3
	ldrgt	lr, [r4, #20]
	addgt	r3, r3, lr
	strgt	r3, [r4, #12]
	cmp	r1, #15
	ble	.L82
.L68:
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	mov	r6, #0
	bl	animatePlayer
	ldr	r5, .L84+16
	ldr	r8, .L84+20
	ldr	r7, .L84+24
.L71:
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
	cmp	r6, #1
	add	r5, r5, #32
	bne	.L73
	ldr	r3, .L84+28
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L62
	ldr	r3, .L84+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L83
.L62:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L73:
	mov	r6, #1
	b	.L71
.L81:
	ldr	r1, [r4]
	cmp	r1, #80
	addgt	r0, r0, #1
	strgt	r0, [r3]
	b	.L65
.L82:
	ldr	lr, [r4, #4]
	cmp	lr, #120
	addgt	r1, r1, #1
	strgt	r1, [ip]
	b	.L68
.L83:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireBullet
.L85:
	.align	2
.L84:
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
	beq	.L99
	mov	r1, #8
	ldr	r2, [r0]
	ldr	r3, .L101
	ldr	r0, [r0, #4]
	orr	r2, r2, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	bx	lr
.L99:
	mov	r2, #512
	ldr	r3, .L101
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L102:
	.align	2
.L101:
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #1
	mov	r7, #16
	mov	r6, #50
	ldr	r4, .L105
	ldr	r8, .L105+4
	str	r7, [r4, #8]
	str	r7, [r4, #12]
	str	r6, [r4]
	str	r6, [r4, #4]
	str	r5, [r4, #16]
	str	r5, [r4, #20]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	and	r0, r0, r5
	rsblt	r0, r0, #0
	str	r0, [r4, #24]
	str	r5, [r4, #28]
	str	r7, [r4, #40]
	str	r7, [r4, #44]
	str	r6, [r4, #32]
	str	r6, [r4, #36]
	str	r5, [r4, #48]
	str	r5, [r4, #52]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	and	r0, r0, r5
	rsblt	r0, r0, #0
	str	r0, [r4, #56]
	str	r5, [r4, #60]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	enemies
	.word	rand
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
	mov	r1, #0
	mov	r2, #16
	push	{r4, lr}
	mov	r4, #3
	mov	r0, #1
	mov	ip, #2
	mov	lr, #20
	ldr	r3, .L109
	str	r1, [r3]
	ldr	r3, .L109+4
	str	r1, [r3]
	ldr	r3, .L109+8
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	ldr	r2, .L109+12
	str	r4, [r3, #48]
	ldr	r4, .L109+16
	str	r0, [r2, #16]
	str	r1, [r2, #24]
	str	r1, [r2]
	str	r1, [r2, #4]
	str	r1, [r2, #28]
	str	ip, [r2, #20]
	str	ip, [r2, #8]
	str	ip, [r2, #12]
	str	lr, [r3, #8]
	str	lr, [r3, #12]
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r0, [r4]
	bl	initEnemy
	ldr	r3, .L109+20
	ldr	r3, [r3, #16]
	ldr	r2, .L109+24
	lsl	r3, r3, #1
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	hOff
	.word	vOff
	.word	player
	.word	bullets
	.word	playerHealth
	.word	enemies
	.word	badHealth
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
	mov	r4, r0
	ldr	r0, [r0]
	cmp	r0, #0
	ldmib	r4, {r1, r2, r3}
	ldr	ip, [r4, #20]
	sub	sp, sp, #16
	ble	.L115
	add	lr, r0, r2
	cmp	lr, #255
	ble	.L113
.L115:
	rsb	ip, ip, #0
	str	ip, [r4, #20]
.L114:
	ldr	lr, [r4, #24]
	ldr	r5, .L122
	cmp	lr, #0
	addeq	r0, r0, ip
	addne	r1, r1, ip
	add	ip, r5, #8
	ldm	ip, {ip, lr}
	streq	r0, [r4]
	strne	r1, [r4, #4]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	ldr	r6, .L122+4
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldreq	r3, [r4, #16]
	beq	.L119
	mov	r0, #0
	ldr	r1, .L122+8
	ldr	r3, [r4, #16]
	ldr	r2, [r1]
	ldr	ip, [r5, #16]
	sub	r2, r2, #1
	sub	r3, r3, ip
	str	r3, [r4, #16]
	str	r2, [r1]
	str	r0, [r5, #24]
.L119:
	cmp	r3, #0
	streq	r3, [r4, #28]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L113:
	cmp	r1, #0
	ble	.L115
	add	lr, r1, r3
	cmp	lr, #255
	ble	.L114
	b	.L115
.L123:
	.align	2
.L122:
	.word	bullets
	.word	collision
	.word	badHealth
	.size	updateEnemy, .-updateEnemy
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
	ldr	r4, .L126
	bl	updatePlayer
	ldr	r0, .L126+4
	bl	updateBullet
	mov	r0, r4
	bl	updateEnemy
	add	r0, r4, #32
	pop	{r4, lr}
	b	updateEnemy
.L127:
	.align	2
.L126:
	.word	enemies
	.word	bullets
	.size	updateGame, .-updateGame
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
	ldr	r3, .L134
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L129
	mov	r1, #512
	ldr	r2, .L134+4
	strh	r1, [r2]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	beq	.L131
.L133:
	mov	r2, #512
	ldr	r3, .L134+8
	strh	r2, [r3]	@ movhi
	bx	lr
.L129:
	mov	r0, #12
	ldr	r1, [r3]
	ldr	r2, .L134+4
	ldr	ip, [r3, #4]
	orr	r1, r1, #16384
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	bne	.L133
.L131:
	mov	r1, #12
	ldr	r2, [r3, #32]
	ldr	r0, [r3, #36]
	ldr	r3, .L134+8
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L135:
	.align	2
.L134:
	.word	enemies
	.word	shadowOAM+800
	.word	shadowOAM+808
	.size	drawEnemy, .-drawEnemy
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	badHealth,4,4
	.comm	enemies,64,4
	.comm	bullets,32,4
	.comm	playerHealth,4,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
