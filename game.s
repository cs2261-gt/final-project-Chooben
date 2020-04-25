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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #10
	mov	r7, #1
	ldr	r1, .L9
	str	r8, [r1]
	ldr	r1, .L9+4
	mov	ip, #0
	mov	r6, #2
	mov	r10, #16
	mov	r9, #3
	str	r8, [r1, #8]
	mov	r2, r8
	mov	fp, #14
	mov	r5, r8
	mov	r8, #230
	mov	r0, r7
	mov	r3, #5
	mov	r4, #22
	mov	lr, #15
	str	fp, [r1, #24]
	str	r8, [r1, #12]
	str	r10, [r1, #28]
	str	r6, [r1, #16]
	str	r6, [r1, #20]
	str	ip, [r1, #44]
	str	ip, [r1, #36]
	str	r9, [r1, #48]
	ldr	r1, .L9+8
	ldr	r8, .L9+12
	str	ip, [r1]
	str	r9, [r1, #24]
	str	ip, [r1, #28]
	str	ip, [r1, #4]
	str	ip, [r1, #32]
	str	r6, [r1, #16]
	str	r6, [r1, #20]
	ldr	r1, .L9+16
	str	r10, [r8]
	str	r7, [r1]
	ldr	r8, .L9+20
	ldr	r1, .L9+24
	str	ip, [r8]
	str	r7, [r1]
	ldr	r1, .L9+28
.L6:
	str	r3, [r1, #24]
	subs	r3, r3, #1
	stm	r1, {r2, r5}
	str	r4, [r1, #16]
	str	lr, [r1, #20]
	str	r0, [r1, #28]
	add	r2, r2, #26
	add	r1, r1, #32
	bne	.L6
	mov	r1, #32
	mov	r4, #2
	mov	lr, #112
	mov	ip, #3
	ldr	r2, .L9+32
	stm	r2, {r4, lr}
	str	r1, [r2, #24]
	str	r1, [r2, #28]
	str	r0, [r2, #20]
	str	r0, [r2, #16]
	str	r3, [r2, #32]
	str	r3, [r2, #48]
	str	r3, [r2, #40]
	str	ip, [r2, #52]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	bossHealth
	.word	player
	.word	bullets
	.word	hOff
	.word	playerHealth
	.word	vOff
	.word	damage
	.word	enemies
	.word	boss
	.size	initGame, .-initGame
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
	mov	ip, #3
	mov	lr, #230
	mov	r6, #14
	mov	r5, #16
	mov	r4, #10
	mov	r0, #2
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L13
	str	lr, [r3, #12]
	str	ip, [r3, #48]
	ldr	lr, .L13+4
	ldr	ip, .L13+8
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #8]
	str	r2, [lr]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	str	r2, [ip]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	player
	.word	playerHealth
	.word	damage
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
	ldr	r4, .L28
	ldr	r3, .L28+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L16
	ldr	r0, [r4, #44]
	ldr	r3, .L28+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L16:
	ldr	r3, .L28+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L28+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L28+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L19
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	bne	.L21
.L22:
	mov	r3, #3
	str	r3, [r4, #36]
.L21:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L22
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L21
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
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
	ldr	r3, .L34
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L31
	ldr	r2, .L34+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L31:
	b	drawPlayer.part.0
.L35:
	.align	2
.L34:
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
	mov	r0, #3
	ldr	r3, .L37
	str	r2, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #32]
	str	r0, [r3, #24]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	bx	lr
.L38:
	.align	2
.L37:
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
	push	{r4, lr}
	ldr	r4, .L49
	ldr	r2, [r4, #28]
	cmp	r2, #0
	bne	.L39
	mov	r1, #3968
	ldr	r3, .L49+4
	ldr	r0, .L49+8
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L49+12
	ldr	r2, [r3, #36]
	cmp	r2, #0
	str	r1, [r4, #28]
	bne	.L42
	ldr	r1, [r3, #8]
	ldr	r0, [r3, #12]
	add	r3, r1, #11
	stm	r4, {r0, r3}
	str	r2, [r4, #32]
.L39:
	pop	{r4, lr}
	bx	lr
.L42:
	cmp	r2, #1
	beq	.L47
	cmp	r2, #2
	beq	.L48
	cmp	r2, #3
	bne	.L39
	ldr	r1, [r3, #12]
	ldr	ip, [r3, #24]
	ldr	r0, [r3, #8]
	add	r3, r1, ip
	sub	r3, r3, #1
	add	r1, r0, #6
	str	r2, [r4, #32]
	str	r3, [r4]
	str	r1, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	r1, [r3, #12]
	ldr	ip, [r3, #24]
	ldr	r0, [r3, #8]
	add	r3, r1, ip
	sub	r3, r3, #1
	add	r1, r0, #2
	str	r2, [r4, #32]
	str	r3, [r4]
	str	r1, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L48:
	add	r1, r3, #8
	ldm	r1, {r1, r3}
	add	r1, r1, #6
	sub	r3, r3, #1
	str	r2, [r4, #32]
	str	r1, [r4, #4]
	str	r3, [r4]
	b	.L39
.L50:
	.align	2
.L49:
	.word	bullets
	.word	playSoundB
	.word	gunSound
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
	ldr	r3, .L86
	ldrh	r2, [r3, #48]
	ldr	r5, .L86+4
	ldr	r3, .L86+8
	tst	r2, #64
	ldr	r0, [r3]
	ldr	r2, [r5, #8]
	sub	sp, sp, #16
	bne	.L52
	ldr	r1, .L86+12
	ldr	r1, [r1]
	cmp	r1, #1
	beq	.L81
	cmp	r2, #0
	ble	.L54
.L77:
	ldr	r1, [r5, #16]
	sub	r2, r2, r1
	str	r2, [r5, #8]
.L54:
	cmp	r0, #0
	ble	.L52
	ldr	r1, [r5]
	cmp	r1, #79
	suble	r0, r0, #2
	strle	r0, [r3]
.L52:
	ldr	r1, .L86
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L55
	ldr	r1, .L86+12
	ldr	r1, [r1]
	cmp	r1, #1
	ldr	r1, [r5, #28]
	beq	.L82
	rsb	r1, r1, #256
	cmp	r1, r2
	bgt	.L78
.L57:
	cmp	r0, #95
	bgt	.L55
	ldr	r1, [r5]
	cmp	r1, #80
	addgt	r0, r0, #2
	strgt	r0, [r3]
.L55:
	ldr	r3, .L86
	ldrh	r3, [r3, #48]
	ldr	ip, .L86+16
	tst	r3, #32
	ldr	r1, [ip]
	ldr	r3, [r5, #12]
	bne	.L58
	ldr	lr, .L86+12
	ldr	lr, [lr]
	cmp	lr, #1
	beq	.L79
	cmp	r3, #0
	ble	.L60
.L79:
	ldr	lr, [r5, #20]
	sub	r3, r3, lr
	str	r3, [r5, #12]
.L60:
	cmp	r1, #0
	blt	.L58
	ldr	lr, [r5, #4]
	cmp	lr, #119
	suble	r1, r1, #2
	strle	r1, [ip]
.L58:
	ldr	lr, .L86
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L61
	ldr	lr, .L86+12
	ldr	lr, [lr]
	cmp	lr, #1
	ldr	lr, [r5, #24]
	beq	.L83
	rsb	lr, lr, #256
	cmp	lr, r3
	bgt	.L80
.L63:
	cmp	r1, #15
	bgt	.L61
	ldr	lr, [r5, #4]
	cmp	lr, #120
	addgt	r1, r1, #2
	strgt	r1, [ip]
.L61:
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r5, {r2, r3}
	bl	animatePlayer
	ldr	r4, .L86+20
	ldr	r8, .L86+24
	ldr	r7, .L86+28
	add	r6, r4, #160
.L67:
	ldr	r3, [r4, #28]
	cmp	r3, #1
	beq	.L84
.L65:
	add	r4, r4, #32
	cmp	r6, r4
	bne	.L67
	ldr	r3, .L86+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L51
	ldr	r3, .L86+36
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L85
.L51:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L84:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r7]
	subne	r3, r3, #1
	strne	r3, [r7]
	b	.L65
.L83:
	rsb	lr, lr, #248
	cmp	lr, r3
	ble	.L63
.L80:
	ldr	lr, [r5, #20]
	add	r3, r3, lr
	str	r3, [r5, #12]
	b	.L63
.L82:
	rsb	r1, r1, #248
	cmp	r1, r2
	ble	.L57
.L78:
	ldr	r1, [r5, #16]
	add	r2, r2, r1
	str	r2, [r5, #8]
	b	.L57
.L81:
	cmp	r2, #8
	ble	.L54
	b	.L77
.L85:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireBullet
.L87:
	.align	2
.L86:
	.word	67109120
	.word	player
	.word	vOff
	.word	currRegion
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	ldm	r0, {r2, r3}
	beq	.L89
	ldr	r1, [r0, #32]
	cmp	r1, #0
	bne	.L90
	cmp	r3, #256
	ble	.L91
	str	r1, [r0, #28]
.L89:
	ldr	ip, .L104
	ldr	r1, .L104+4
	ldr	ip, [ip]
	ldr	r1, [r1]
	sub	r2, r2, ip
	sub	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L90:
	cmp	r1, #1
	beq	.L102
	cmp	r1, #2
	beq	.L103
	cmp	r2, #256
	bgt	.L101
	ldr	r1, [r0, #24]
	add	r2, r2, r1
	str	r2, [r0]
	b	.L89
.L91:
	ldr	r1, [r0, #24]
	add	r3, r3, r1
	str	r3, [r0, #4]
	b	.L89
.L102:
	cmp	r3, #0
	blt	.L101
	ldr	r1, [r0, #24]
	sub	r3, r3, r1
	str	r3, [r0, #4]
	b	.L89
.L103:
	cmp	r2, #0
	bgt	.L95
.L101:
	mov	r1, #0
	str	r1, [r0, #28]
	b	.L89
.L95:
	ldr	r1, [r0, #24]
	sub	r2, r2, r1
	str	r2, [r0]
	b	.L89
.L105:
	.align	2
.L104:
	.word	hOff
	.word	vOff
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L107
	mov	r1, #8
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	ldr	r2, .L109
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	bx	lr
.L107:
	mov	r2, #512
	ldr	r3, .L109
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L110:
	.align	2
.L109:
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
	mov	r1, #10
	push	{r4, lr}
	mov	r2, #5
	mov	r4, r1
	mov	lr, #22
	mov	ip, #15
	mov	r0, #1
	ldr	r3, .L115
.L112:
	str	r2, [r3, #24]
	subs	r2, r2, #1
	stm	r3, {r1, r4}
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #28]
	add	r1, r1, #26
	add	r3, r3, #32
	bne	.L112
	pop	{r4, lr}
	bx	lr
.L116:
	.align	2
.L115:
	.word	enemies
	.size	initEnemy, .-initEnemy
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
	mov	r5, r0
	ldr	r0, [r0]
	cmp	r0, #8
	ldr	ip, [r5, #4]
	ldr	r1, [r5, #24]
	sub	sp, sp, #16
	ble	.L121
	ldr	r3, [r5, #16]
	add	r3, r0, r3
	cmp	r3, #247
	ble	.L119
.L121:
	rsb	r1, r1, #0
	str	r1, [r5, #24]
.L120:
	ldr	r2, .L129
	ldr	r3, .L129+4
	add	r1, r1, ip
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	ip, [r5, #28]
	sub	r2, r0, r2
	sub	r3, r1, r3
	cmp	ip, #1
	stmib	r5, {r1, r2, r3}
	bne	.L122
	ldr	r4, .L129+8
	ldr	r3, [r4, #28]
	cmp	r3, #1
	beq	.L128
.L122:
	ldr	r3, .L129+12
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L117
	ldr	r2, .L129+16
	mov	r3, #512
	mov	r1, r2
	mov	r0, #0
	strh	r3, [r1], #8	@ movhi
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	str	r0, [r5, #28]
	strh	r3, [r2, #32]	@ movhi
.L117:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L128:
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r6, .L129+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L122
	mov	r2, #0
	ldr	r1, .L129+24
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r2, [r5, #28]
	str	r3, [r1]
	str	r2, [r4, #28]
	b	.L122
.L119:
	cmp	ip, #8
	ble	.L121
	ldr	r3, [r5, #20]
	add	r3, ip, r3
	cmp	r3, #247
	ble	.L120
	b	.L121
.L130:
	.align	2
.L129:
	.word	hOff
	.word	vOff
	.word	bullets
	.word	currRegion
	.word	shadowOAM+800
	.word	collision
	.word	damage
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
	push	{r4, r5, r6, lr}
	mov	lr, #512
	mov	r6, #10
	ldr	r3, .L137
	ldr	r2, .L137+4
	ldr	r5, .L137+8
	ldr	r4, .L137+12
	add	ip, r3, #40
.L134:
	ldr	r1, [r2, #28]
	cmp	r1, #1
	ldreq	r1, [r2, #8]
	ldrbeq	r0, [r2, #12]	@ zero_extendqisi2
	andeq	r1, r1, r5
	orreq	r1, r1, r4
	orreq	r0, r0, #16384
	strheq	r6, [r3, #4]	@ movhi
	strheq	r1, [r3, #2]	@ movhi
	strheq	r0, [r3]	@ movhi
	strhne	lr, [r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #32
	bne	.L134
	pop	{r4, r5, r6, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	shadowOAM+800
	.word	enemies
	.word	511
	.word	-32768
	.size	drawEnemy, .-drawEnemy
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
	ldr	r3, .L150
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L140
	ldr	r3, .L150+4
	ldrh	r2, [r3]
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
.L141:
	ldr	r1, .L150+8
	ldr	r2, [r1, #28]
	cmp	r2, #0
	beq	.L149
	mov	r0, #8
	ldr	r2, [r1, #8]
	lsl	r2, r2, #23
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
.L142:
	bl	drawEnemy
	ldr	r3, .L150+12
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L143
	ldr	r1, .L150+16
	ldr	r3, [r1, #8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r1, #40]
	ldr	ip, [r1, #48]
	ldr	r0, .L150+20
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	add	r2, r2, #14
	add	r2, r2, ip, lsl #7
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
.L143:
	ldr	r3, .L150+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L150+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L150+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L150+32
	ldrh	r1, [r2]
	ldr	r2, .L150+36
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L149:
	mov	r2, #512
	strh	r2, [r3, #8]	@ movhi
	b	.L142
.L140:
	bl	drawPlayer.part.0
	ldr	r3, .L150+4
	b	.L141
.L151:
	.align	2
.L150:
	.word	player
	.word	shadowOAM
	.word	bullets
	.word	currRegion
	.word	boss
	.word	shadowOAM+1016
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
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
	push	{r4, lr}
	mov	r2, #0
	mov	r0, #32
	mov	r4, #2
	mov	lr, #112
	mov	r1, #1
	mov	ip, #3
	ldr	r3, .L154
	stm	r3, {r4, lr}
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #52]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #32]
	str	r2, [r3, #48]
	str	r2, [r3, #40]
	pop	{r4, lr}
	bx	lr
.L155:
	.align	2
.L154:
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L177
	ldr	r6, .L177+4
	ldr	r0, [r4]
	ldr	r3, [r6, #12]
	sub	r2, r0, r3
	cmp	r2, #0
	movlt	r3, #1
	sub	sp, sp, #20
	strlt	r3, [r4, #20]
	blt	.L158
	cmp	r0, r3
	moveq	r3, #0
	mvnne	r3, #0
	str	r3, [r4, #20]
.L158:
	ldr	r1, [r4, #4]
	ldr	r3, [r6, #8]
	sub	r2, r1, r3
	cmp	r2, #0
	blt	.L175
	cmp	r1, r3
	mvnne	r3, #0
	moveq	r3, #0
	strne	r3, [r4, #16]
	streq	r3, [r4, #16]
	addne	r1, r1, r3
.L161:
	ldr	ip, [r4, #20]
	ldr	r2, .L177+8
	ldr	r3, .L177+12
	ldr	r5, .L177+16
	add	r0, r0, ip
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	ip, [r5, #28]
	sub	r3, r1, r3
	sub	r2, r0, r2
	cmp	ip, #1
	stm	r4, {r0, r1, r2, r3}
	ldr	r3, [r4, #32]
	bne	.L163
	cmp	r3, #1
	beq	.L176
.L165:
	ldr	r5, [r4, #36]
	ldr	r3, .L177+20
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	bne	.L169
	ldr	r0, [r4, #48]
	ldr	r3, .L177+24
	ldr	r1, [r4, #52]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #48]
.L169:
	add	r5, r5, #1
	str	r5, [r4, #36]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L176:
	add	ip, r5, #16
	ldr	r2, [r5, #4]
	ldm	ip, {ip, lr}
	ldr	r3, [r5]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r7, .L177+28
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r1, #0
	ldrne	r2, .L177+32
	ldrne	r0, .L177+36
	ldrne	r3, [r2]
	ldrne	r0, [r0]
	subne	r3, r3, r0
	strne	r3, [r2]
	strne	r1, [r5, #28]
	ldr	r3, [r4, #32]
.L163:
	cmp	r3, #1
	bne	.L165
	add	r2, r6, #8
	ldm	r2, {r2, r3}
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r5, .L177+28
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r2, .L177+40
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	b	.L165
.L175:
	mov	r3, #1
	str	r3, [r4, #16]
	add	r1, r1, r3
	b	.L161
.L178:
	.align	2
.L177:
	.word	boss
	.word	player
	.word	hOff
	.word	vOff
	.word	bullets
	.word	1717986919
	.word	__aeabi_idivmod
	.word	collision
	.word	bossHealth
	.word	damage
	.word	playerHealth
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
	ldr	r0, .L183
	bl	updateBullet
	ldr	r0, .L183+4
	bl	updateEnemy
	ldr	r0, .L183+8
	bl	updateEnemy
	ldr	r0, .L183+12
	bl	updateEnemy
	ldr	r0, .L183+16
	bl	updateEnemy
	ldr	r0, .L183+20
	bl	updateEnemy
	ldr	r3, .L183+24
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L182
	pop	{r4, lr}
	bx	lr
.L182:
	mov	r2, #1
	ldr	r3, .L183+28
	pop	{r4, lr}
	str	r2, [r3, #32]
	b	updateBoss
.L184:
	.align	2
.L183:
	.word	bullets
	.word	enemies
	.word	enemies+32
	.word	enemies+64
	.word	enemies+96
	.word	enemies+128
	.word	currRegion
	.word	boss
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L188
	ldr	r3, .L188+4
	ldr	r4, [r5, #36]
	smull	r1, r2, r3, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L186
	ldr	r0, [r5, #48]
	ldr	r3, .L188+8
	ldr	r1, [r5, #52]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #48]
.L186:
	add	r4, r4, #1
	str	r4, [r5, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L189:
	.align	2
.L188:
	.word	boss
	.word	1717986919
	.word	__aeabi_idivmod
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
	ldr	r0, .L192
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r0, #40]
	str	lr, [sp, #-4]!
	ldr	r1, .L192+4
	ldr	lr, [r0, #48]
	ldrb	ip, [r0, #12]	@ zero_extendqisi2
	add	r2, r2, #14
	add	r0, r1, #1016
	add	r2, r2, lr, lsl #7
	add	r1, r1, #1020
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r1]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L193:
	.align	2
.L192:
	.word	boss
	.word	shadowOAM
	.size	drawBoss, .-drawBoss
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	currRegion,4,4
	.comm	bossHealth,4,4
	.comm	boss,56,4
	.comm	enemies,160,4
	.comm	bullets,36,4
	.comm	damage,4,4
	.comm	playerHealth,4,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
