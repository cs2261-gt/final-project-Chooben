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
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L26
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L11
	ldr	r2, .L26+4
	ldrh	r3, [r2]
	ldr	r0, .L26+8
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L23
.L18:
	bl	drawBullet.part.0
	ldr	r3, .L26+12
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L14
.L24:
	mov	r1, #512
	ldr	r2, .L26+16
	strh	r1, [r2]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	beq	.L16
.L25:
	mov	r2, #512
	ldr	r3, .L26+20
	strh	r2, [r3]	@ movhi
.L17:
	ldr	r3, .L26+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L26+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L26+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L26+32
	ldrh	r1, [r2]
	ldr	r2, .L26+36
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L11:
	bl	drawPlayer.part.0
	ldr	r0, .L26+8
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L18
.L23:
	mov	r2, #512
	ldr	r3, .L26+4
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L26+12
	ldr	r2, [r3, #28]
	cmp	r2, #1
	bne	.L24
.L14:
	mov	r0, #12
	ldr	r1, [r3]
	ldr	r2, .L26+16
	ldr	ip, [r3, #4]
	orr	r1, r1, #16384
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	bne	.L25
.L16:
	mov	r1, #12
	ldr	r2, [r3, #32]
	ldr	r0, [r3, #36]
	ldr	r3, .L26+20
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	b	.L17
.L27:
	.align	2
.L26:
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
	ldr	r3, .L30
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	ldr	ip, .L30+4
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
.L31:
	.align	2
.L30:
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
	ldr	r4, .L45
	ldr	r3, .L45+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L33
	ldr	r0, [r4, #44]
	ldr	r3, .L45+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L33:
	ldr	r3, .L45+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L45+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L45+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L36
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	bne	.L38
.L39:
	mov	r3, #3
	str	r3, [r4, #36]
.L38:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L39
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L38
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	.align	2
.L45:
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
	ldr	r3, .L51
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L48
	ldr	r2, .L51+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L48:
	b	drawPlayer.part.0
.L52:
	.align	2
.L51:
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
	mov	r1, #16
	mov	ip, #2
	mov	r0, #1
	ldr	r3, .L54
	str	r2, [r3, #24]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #28]
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	bx	lr
.L55:
	.align	2
.L54:
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
	bxne	lr
.L64:
	ldm	r1, {r0, r1}
	str	r3, [r2, #28]
	str	r0, [r2, #4]
	str	r1, [r2]
	bx	lr
.L63:
	ldr	r0, [r1, #4]
	ldr	r1, [r1]
	str	r3, [r2, #28]
	stm	r2, {r0, r1}
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L89
	ldrh	r2, [r3, #48]
	ldr	r4, .L89+4
	ldr	r3, .L89+8
	tst	r2, #64
	ldr	r0, [r3]
	ldr	r2, [r4, #8]
	sub	sp, sp, #16
	bne	.L68
	cmp	r2, #0
	ldrgt	r1, [r4, #16]
	subgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #0
	ble	.L68
	ldr	r1, [r4]
	cmp	r1, #79
	suble	r0, r0, #1
	strle	r0, [r3]
.L68:
	ldr	r1, .L89
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L70
	ldr	r1, [r4, #28]
	rsb	r1, r1, #256
	cmp	r1, r2
	ldrgt	r1, [r4, #16]
	addgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #95
	ble	.L86
.L70:
	ldr	r3, .L89
	ldrh	r3, [r3, #48]
	ldr	ip, .L89+12
	tst	r3, #32
	ldr	r1, [ip]
	ldr	r3, [r4, #12]
	bne	.L72
	ldr	lr, [r4, #20]
	cmp	r1, #0
	sub	r3, r3, lr
	str	r3, [r4, #12]
	blt	.L72
	ldr	lr, [r4, #4]
	cmp	lr, #119
	suble	r1, r1, #1
	strle	r1, [ip]
.L72:
	ldr	lr, .L89
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L73
	ldr	lr, [r4, #24]
	rsb	lr, lr, #256
	cmp	lr, r3
	ldrgt	lr, [r4, #20]
	addgt	r3, r3, lr
	strgt	r3, [r4, #12]
	cmp	r1, #15
	ble	.L87
.L73:
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	mov	r6, #0
	bl	animatePlayer
	ldr	r5, .L89+16
	ldr	r8, .L89+20
	ldr	r7, .L89+24
.L76:
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
	bne	.L78
	ldr	r3, .L89+28
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L67
	ldr	r3, .L89+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L88
.L67:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L78:
	mov	r6, #1
	b	.L76
.L86:
	ldr	r1, [r4]
	cmp	r1, #80
	addgt	r0, r0, #1
	strgt	r0, [r3]
	b	.L70
.L87:
	ldr	lr, [r4, #4]
	cmp	lr, #120
	addgt	r1, r1, #1
	strgt	r1, [ip]
	b	.L73
.L88:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireBullet
.L90:
	.align	2
.L89:
	.word	67109120
	.word	player
	.word	vOff
	.word	hOff
	.word	enemies
	.word	collision
	.word	health
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
	bne	.L93
	ldr	r3, [r0, #4]
	cmp	r3, #256
	ble	.L94
.L96:
	mov	r3, #0
	str	r3, [r0, #24]
	bx	lr
.L93:
	cmp	r3, #1
	beq	.L101
	cmp	r3, #2
	ldr	r3, [r0]
	beq	.L102
	cmp	r3, #256
	bgt	.L96
	ldr	r2, [r0, #20]
	add	r3, r2, r3
	str	r3, [r0]
	bx	lr
.L94:
	ldr	r2, [r0, #20]
	add	r3, r2, r3
	str	r3, [r0, #4]
	bx	lr
.L101:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	blt	.L96
	ldr	r2, [r0, #20]
	sub	r3, r3, r2
	str	r3, [r0, #4]
	bx	lr
.L102:
	cmp	r3, #0
	blt	.L96
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
	bne	drawBullet.part.0
.L104:
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #1
	mov	r7, #16
	mov	r6, #50
	ldr	r4, .L109
	ldr	r8, .L109+4
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
.L110:
	.align	2
.L109:
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
	mov	r2, #3
	mov	ip, #1
	push	{r4, lr}
	mov	r0, #16
	mov	r4, #2
	mov	lr, #20
	ldr	r3, .L113
	str	r1, [r3]
	ldr	r3, .L113+4
	str	r1, [r3]
	ldr	r3, .L113+8
	str	r2, [r3, #48]
	ldr	r2, .L113+12
	str	ip, [r2]
	ldr	r2, .L113+16
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	str	r1, [r2, #24]
	str	r1, [r2]
	str	r1, [r2, #4]
	str	r1, [r2, #28]
	ldr	r1, .L113+20
	str	lr, [r3, #8]
	str	r4, [r2, #20]
	str	r4, [r1]
	str	lr, [r3, #12]
	str	ip, [r2, #16]
	str	r0, [r2, #8]
	str	r0, [r2, #12]
	pop	{r4, lr}
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	b	initEnemy
.L114:
	.align	2
.L113:
	.word	hOff
	.word	vOff
	.word	player
	.word	health
	.word	bullets
	.word	enemiesRemaining
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
	ble	.L119
	add	lr, r0, r2
	cmp	lr, #255
	ble	.L117
.L119:
	rsb	ip, ip, #0
	str	ip, [r4, #20]
.L118:
	ldr	lr, [r4, #24]
	cmp	lr, #0
	addeq	r0, r0, ip
	addne	r1, r1, ip
	ldr	ip, .L131
	ldr	lr, [ip, #28]
	streq	r0, [r4]
	strne	r1, [r4, #4]
	cmp	lr, #1
	movhi	r6, #2
	ldr	lr, [ip]
	movhi	r5, #3
	ldr	ip, [ip, #4]
	movls	r6, #3
	movls	r5, #2
.L130:
	str	r5, [sp, #8]
	str	ip, [sp, #4]
	str	lr, [sp]
	str	r6, [sp, #12]
	ldr	r5, .L131+4
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #16]
	cmp	r0, #0
	subne	r3, r3, #1
	strne	r3, [r4, #16]
	cmp	r3, #0
	bne	.L115
	ldr	r1, .L131+8
	ldr	r2, [r1]
	sub	r2, r2, #1
	str	r3, [r4, #28]
	str	r2, [r1]
.L115:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	cmp	r1, #0
	ble	.L119
	add	lr, r1, r3
	cmp	lr, #255
	ble	.L118
	b	.L119
.L132:
	.align	2
.L131:
	.word	bullets
	.word	collision
	.word	enemiesRemaining
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
	ldr	r4, .L135
	bl	updatePlayer
	ldr	r0, .L135+4
	bl	updateBullet
	mov	r0, r4
	bl	updateEnemy
	add	r0, r4, #32
	pop	{r4, lr}
	b	updateEnemy
.L136:
	.align	2
.L135:
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
	ldr	r3, .L143
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L138
	mov	r1, #512
	ldr	r2, .L143+4
	strh	r1, [r2]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	beq	.L140
.L142:
	mov	r2, #512
	ldr	r3, .L143+8
	strh	r2, [r3]	@ movhi
	bx	lr
.L138:
	mov	r0, #12
	ldr	r1, [r3]
	ldr	r2, .L143+4
	ldr	ip, [r3, #4]
	orr	r1, r1, #16384
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldr	r2, [r3, #60]
	cmp	r2, #1
	bne	.L142
.L140:
	mov	r1, #12
	ldr	r2, [r3, #32]
	ldr	r0, [r3, #36]
	ldr	r3, .L143+8
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L144:
	.align	2
.L143:
	.word	enemies
	.word	shadowOAM+800
	.word	shadowOAM+808
	.size	drawEnemy, .-drawEnemy
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	enemiesRemaining,4,4
	.comm	enemies,64,4
	.comm	bullets,32,4
	.comm	health,4,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
