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
	ldr	r3, .L22
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L11
	ldr	r2, .L22+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L12:
	ldr	r0, .L22+8
	ldr	r3, [r0, #24]
	cmp	r3, #0
	blne	drawBullet.part.0
.L13:
	ldr	r3, .L22+12
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L14
	mov	r1, #12
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L22+16
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
.L14:
	ldr	r3, .L22+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L22+24
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L22+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L22+28
	ldrh	r1, [r2]
	ldr	r2, .L22+32
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L11:
	bl	drawPlayer.part.0
	b	.L12
.L23:
	.align	2
.L22:
	.word	player
	.word	shadowOAM
	.word	bullets
	.word	enemies
	.word	shadowOAM+800
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
	mov	r1, #16
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
	ldr	r3, .L80
	ldrh	r1, [r3, #48]
	ldr	r2, .L80+4
	ldr	r3, .L80+8
	tst	r1, #64
	push	{r4, lr}
	ldr	r1, [r3, #8]
	ldr	ip, [r2]
	bne	.L64
	cmp	r1, #0
	ldrgt	r0, [r3, #16]
	subgt	r1, r1, r0
	strgt	r1, [r3, #8]
	cmp	ip, #0
	ble	.L64
	ldr	r0, [r3]
	cmp	r0, #79
	suble	ip, ip, #1
	strle	ip, [r2]
.L64:
	ldr	r0, .L80
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L66
	ldr	r0, [r3, #28]
	rsb	r0, r0, #256
	cmp	r0, r1
	ldrgt	r0, [r3, #16]
	addgt	r1, r1, r0
	strgt	r1, [r3, #8]
	cmp	ip, #95
	ble	.L77
.L66:
	ldr	r2, .L80
	ldrh	r2, [r2, #48]
	ldr	lr, .L80+12
	tst	r2, #32
	ldr	r0, [lr]
	ldr	r2, [r3, #12]
	bne	.L68
	cmp	r2, #0
	ldrgt	r4, [r3, #20]
	subgt	r2, r2, r4
	strgt	r2, [r3, #12]
	cmp	r0, #0
	blt	.L68
	ldr	r4, [r3, #4]
	cmp	r4, #119
	suble	r0, r0, #1
	strle	r0, [lr]
.L68:
	ldr	r4, .L80
	ldrh	r4, [r4, #48]
	tst	r4, #16
	bne	.L70
	ldr	r4, [r3, #24]
	rsb	r4, r4, #256
	cmp	r4, r2
	ldrgt	r4, [r3, #20]
	addgt	r2, r2, r4
	strgt	r2, [r3, #12]
	cmp	r0, #15
	ble	.L78
.L70:
	sub	r1, r1, ip
	sub	r2, r2, r0
	stm	r3, {r1, r2}
	bl	animatePlayer
	ldr	r3, .L80+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L63
	ldr	r3, .L80+20
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L79
.L63:
	pop	{r4, lr}
	bx	lr
.L77:
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	ip, ip, #1
	strgt	ip, [r2]
	b	.L66
.L78:
	ldr	r4, [r3, #4]
	cmp	r4, #120
	addgt	r0, r0, #1
	strgt	r0, [lr]
	b	.L70
.L79:
	pop	{r4, lr}
	b	fireBullet
.L81:
	.align	2
.L80:
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
	bne	.L84
	ldr	r3, [r0, #4]
	cmp	r3, #256
	ble	.L85
.L87:
	mov	r3, #0
	str	r3, [r0, #24]
	bx	lr
.L84:
	cmp	r3, #1
	beq	.L92
	cmp	r3, #2
	ldr	r3, [r0]
	beq	.L93
	cmp	r3, #256
	bgt	.L87
	ldr	r2, [r0, #20]
	add	r3, r2, r3
	str	r3, [r0]
	bx	lr
.L85:
	ldr	r2, [r0, #20]
	add	r3, r2, r3
	str	r3, [r0, #4]
	bx	lr
.L92:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	blt	.L87
	ldr	r2, [r0, #20]
	sub	r3, r3, r2
	str	r3, [r0, #4]
	bx	lr
.L93:
	cmp	r3, #0
	blt	.L87
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
	bxeq	lr
	b	drawBullet.part.0
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
	mov	r1, #16
	mov	r2, #50
	mov	r3, #1
	push	{r4, lr}
	ldr	r4, .L98
	ldr	r0, .L98+4
	str	r1, [r4, #8]
	str	r1, [r4, #12]
	str	r2, [r4]
	str	r2, [r4, #4]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	mov	lr, pc
	bx	r0
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	str	r0, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L99:
	.align	2
.L98:
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
	push	{r4, r5, lr}
	mov	r0, #16
	mov	ip, #1
	mov	r4, #20
	mov	lr, #3
	mov	r5, #2
	ldr	r3, .L102
	ldr	r2, .L102+4
	str	r1, [r3]
	str	r1, [r2]
	ldr	r3, .L102+8
	ldr	r2, .L102+12
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	str	r1, [r2, #24]
	str	r1, [r2]
	str	r1, [r2, #4]
	str	r1, [r2, #28]
	ldr	r1, .L102+16
	str	r5, [r2, #20]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	lr, [r3, #48]
	str	lr, [r1]
	str	ip, [r2, #16]
	str	r0, [r2, #8]
	str	r0, [r2, #12]
	pop	{r4, r5, lr}
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	b	initEnemy
.L103:
	.align	2
.L102:
	.word	hOff
	.word	vOff
	.word	player
	.word	bullets
	.word	health
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
	@ link register save eliminated.
	ldr	r2, [r0]
	cmp	r2, #0
	ldr	r3, [r0, #20]
	ble	.L108
	ldr	r1, [r0, #8]
	add	r1, r2, r1
	cmp	r1, #255
	ble	.L106
.L108:
	rsb	r3, r3, #0
	str	r3, [r0, #20]
.L107:
	ldr	r1, [r0, #24]
	cmp	r1, #0
	ldrne	r2, [r0, #4]
	addeq	r3, r2, r3
	addne	r3, r2, r3
	streq	r3, [r0]
	strne	r3, [r0, #4]
	bx	lr
.L106:
	ldr	r1, [r0, #4]
	cmp	r1, #0
	ble	.L108
	ldr	ip, [r0, #12]
	add	r1, r1, ip
	cmp	r1, #255
	ble	.L107
	b	.L108
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
	bl	updatePlayer
	ldr	r0, .L113
	bl	updateBullet
	ldr	r0, .L113+4
	pop	{r4, lr}
	b	updateEnemy
.L114:
	.align	2
.L113:
	.word	bullets
	.word	enemies
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
	ldr	r3, .L120
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxeq	lr
	mov	r1, #12
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L120+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L121:
	.align	2
.L120:
	.word	enemies
	.word	shadowOAM+800
	.size	drawEnemy, .-drawEnemy
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	enemiesRemaining,4,4
	.comm	enemies,28,4
	.comm	bullets,32,4
	.comm	health,4,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
