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
	mov	ip, #2
	mov	lr, #16
	mov	r4, #3
	mov	r0, #20
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L7
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #16]
	ldr	lr, .L7+4
	str	ip, [r3, #20]
	ldr	ip, .L7+8
	str	r4, [r3, #48]
	str	r2, [lr]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	str	r2, [ip]
	pop	{r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
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
	ldr	r4, .L22
	ldr	r3, .L22+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L10
	ldr	r0, [r4, #44]
	ldr	r3, .L22+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L10:
	ldr	r3, .L22+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L22+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L22+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L13
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	bne	.L15
.L16:
	mov	r3, #3
	str	r3, [r4, #36]
.L15:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L16
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L15
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	ldr	r3, .L28
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L25
	ldr	r2, .L28+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L25:
	b	drawPlayer.part.0
.L29:
	.align	2
.L28:
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
	ldr	r3, .L31
	str	r2, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #32]
	str	r0, [r3, #24]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	bx	lr
.L32:
	.align	2
.L31:
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
	ldr	r4, .L43
	ldr	r2, [r4, #28]
	cmp	r2, #0
	bne	.L33
	mov	r1, #3968
	ldr	r3, .L43+4
	ldr	r0, .L43+8
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L43+12
	ldr	r3, [r2, #36]
	cmp	r3, #0
	str	r1, [r4, #28]
	beq	.L41
	cmp	r3, #1
	beq	.L41
	cmp	r3, #2
	beq	.L42
	cmp	r3, #3
	beq	.L42
.L33:
	pop	{r4, lr}
	bx	lr
.L41:
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #8]
	str	r3, [r4, #32]
	stm	r4, {r1, r2}
	pop	{r4, lr}
	bx	lr
.L42:
	add	r1, r2, #8
	ldm	r1, {r1, r2}
	str	r3, [r4, #32]
	str	r1, [r4, #4]
	str	r2, [r4]
	b	.L33
.L44:
	.align	2
.L43:
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
	ldr	r3, .L73
	ldrh	r2, [r3, #48]
	ldr	r4, .L73+4
	ldr	r3, .L73+8
	tst	r2, #64
	ldr	r0, [r3]
	ldr	r2, [r4, #8]
	sub	sp, sp, #16
	bne	.L46
	cmp	r2, #0
	ldrgt	r1, [r4, #16]
	subgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #0
	ble	.L46
	ldr	r1, [r4]
	cmp	r1, #79
	suble	r0, r0, #2
	strle	r0, [r3]
.L46:
	ldr	r1, .L73
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L48
	ldr	r1, [r4, #28]
	rsb	r1, r1, #256
	cmp	r1, r2
	ldrgt	r1, [r4, #16]
	addgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #95
	ble	.L69
.L48:
	ldr	r3, .L73
	ldrh	r3, [r3, #48]
	ldr	ip, .L73+12
	tst	r3, #32
	ldr	r1, [ip]
	ldr	r3, [r4, #12]
	bne	.L50
	ldr	lr, .L73+16
	ldr	lr, [lr]
	cmp	lr, #1
	beq	.L68
	cmp	r3, #0
	ble	.L52
.L68:
	ldr	lr, [r4, #20]
	sub	r3, r3, lr
	str	r3, [r4, #12]
.L52:
	cmp	r1, #0
	blt	.L50
	ldr	lr, [r4, #4]
	cmp	lr, #119
	suble	r1, r1, #2
	strle	r1, [ip]
.L50:
	ldr	lr, .L73
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L53
	ldr	lr, [r4, #24]
	rsb	lr, lr, #256
	cmp	lr, r3
	ldrgt	lr, [r4, #20]
	addgt	r3, r3, lr
	strgt	r3, [r4, #12]
	cmp	r1, #15
	ble	.L70
.L53:
	ldr	r5, .L73+20
	sub	r3, r3, r1
	sub	r2, r2, r0
	stm	r4, {r2, r3}
	bl	animatePlayer
	ldr	r3, [r5, #36]
	cmp	r3, #1
	mov	r6, #0
	ldr	r8, .L73+24
	ldr	r7, .L73+28
	beq	.L71
.L56:
	cmp	r6, #1
	add	r5, r5, #40
	bne	.L60
	ldr	r3, .L73+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L45
	ldr	r3, .L73+36
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L72
.L45:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L60:
	ldr	r3, [r5, #36]
	cmp	r3, #1
	mov	r6, #1
	bne	.L56
.L71:
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
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
	b	.L56
.L69:
	ldr	r1, [r4]
	cmp	r1, #80
	addgt	r0, r0, #2
	strgt	r0, [r3]
	b	.L48
.L70:
	ldr	lr, [r4, #4]
	cmp	lr, #120
	addgt	r1, r1, #2
	strgt	r1, [ip]
	b	.L53
.L72:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireBullet
.L74:
	.align	2
.L73:
	.word	67109120
	.word	player
	.word	vOff
	.word	hOff
	.word	currRegion
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
	beq	.L76
	ldr	r1, [r0, #32]
	cmp	r1, #0
	bne	.L77
	cmp	r3, #256
	ble	.L78
	str	r1, [r0, #28]
.L76:
	ldr	ip, .L91
	ldr	r1, .L91+4
	ldr	ip, [ip]
	ldr	r1, [r1]
	sub	r2, r2, ip
	sub	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L77:
	cmp	r1, #1
	beq	.L89
	cmp	r1, #2
	beq	.L90
	cmp	r2, #256
	bgt	.L88
	ldr	r1, [r0, #24]
	add	r2, r2, r1
	str	r2, [r0]
	b	.L76
.L78:
	ldr	r1, [r0, #24]
	add	r3, r3, r1
	str	r3, [r0, #4]
	b	.L76
.L89:
	cmp	r3, #0
	blt	.L88
	ldr	r1, [r0, #24]
	sub	r3, r3, r1
	str	r3, [r0, #4]
	b	.L76
.L90:
	cmp	r2, #0
	bgt	.L82
.L88:
	mov	r1, #0
	str	r1, [r0, #28]
	b	.L76
.L82:
	ldr	r1, [r0, #24]
	sub	r2, r2, r1
	str	r2, [r0]
	b	.L76
.L92:
	.align	2
.L91:
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
	beq	.L94
	mov	r1, #8
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	ldr	r2, .L96
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	bx	lr
.L94:
	mov	r2, #512
	ldr	r3, .L96
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L97:
	.align	2
.L96:
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
	ldr	r4, .L102
	ldr	r5, .L102+4
	ldr	r7, .L102+8
	ldr	r6, .L102+12
.L99:
	str	r8, [r4, #16]
	str	r8, [r4, #20]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #2
	mov	r10, #1
	smull	r3, r1, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #6
	add	r3, r3, r3, lsl r2
	sub	r0, r0, r3, lsl #5
	str	r0, [r4, #4]
	str	r10, [r4, #24]
	str	r2, [r4, #28]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, r10
	rsblt	r0, r0, #0
	cmp	r9, r10
	str	r0, [r4, #32]
	str	r10, [r4, #36]
	add	r4, r4, #40
	bne	.L100
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L100:
	mov	r9, r10
	b	.L99
.L103:
	.align	2
.L102:
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #2
	mov	r4, #0
	mov	r7, #3
	mov	r1, #16
	mov	r2, #20
	mov	r6, #1
	ldr	r3, .L106
	str	r5, [r3]
	ldr	r3, .L106+4
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	r7, [r3, #48]
	ldr	r2, .L106+8
	ldr	r3, .L106+12
	str	r4, [r2]
	str	r4, [r3]
	ldr	r1, .L106+16
	ldr	r2, .L106+20
	str	r4, [r3, #28]
	str	r7, [r3, #24]
	str	r4, [r3, #4]
	str	r4, [r3, #32]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	ldr	r3, .L106+24
	str	r4, [r1]
	str	r6, [r2]
	str	r6, [r3]
	bl	initEnemy
	mov	r2, #32
	mov	r1, #112
	ldr	r3, .L106+28
	str	r5, [r3]
	str	r6, [r3, #20]
	str	r6, [r3, #16]
	str	r4, [r3, #32]
	str	r4, [r3, #48]
	str	r7, [r3, #52]
	str	r4, [r3, #40]
	str	r1, [r3, #4]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	bossHealth
	.word	player
	.word	vOff
	.word	bullets
	.word	hOff
	.word	playerHealth
	.word	damage
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
	mov	r5, r0
	ldr	r0, [r0]
	cmp	r0, #0
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #28]
	sub	sp, sp, #16
	ble	.L112
	ldr	r2, [r5, #16]
	add	r2, r0, r2
	cmp	r2, #255
	ble	.L110
.L112:
	rsb	r3, r3, #0
	str	r3, [r5, #28]
.L111:
	ldr	r2, [r5, #32]
	cmp	r2, #0
	addeq	r0, r0, r3
	addne	r1, r1, r3
	ldr	r2, .L122
	ldr	r3, .L122+4
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	ip, [r5, #36]
	streq	r0, [r5]
	strne	r1, [r5, #4]
	sub	r2, r0, r2
	sub	r3, r1, r3
	cmp	ip, #1
	str	r2, [r5, #8]
	str	r3, [r5, #12]
	bne	.L121
	ldr	r4, .L122+8
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r6, .L122+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L117
.L121:
	ldr	r3, [r5, #24]
.L116:
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r5, #36]
	ldr	r3, .L122+16
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L108
	mov	r2, #512
	mov	r1, #0
	ldr	r3, .L122+20
	strh	r2, [r3], #8	@ movhi
	str	r1, [r5, #36]
	strh	r2, [r3]	@ movhi
.L108:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	mov	r2, #0
	ldr	r1, .L122+24
	ldr	r3, [r5, #24]
	ldr	r1, [r1]
	sub	r3, r3, r1
	str	r3, [r5, #24]
	str	r2, [r4, #28]
	b	.L116
.L110:
	cmp	r1, #0
	ble	.L112
	ldr	r2, [r5, #20]
	add	r2, r1, r2
	cmp	r2, #255
	ble	.L111
	b	.L112
.L123:
	.align	2
.L122:
	.word	hOff
	.word	vOff
	.word	bullets
	.word	collision
	.word	currRegion
	.word	shadowOAM+800
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
	@ link register save eliminated.
	ldr	r3, .L130
	ldr	r2, [r3, #36]
	cmp	r2, #1
	beq	.L125
	mov	r1, #512
	ldr	r2, .L130+4
	strh	r1, [r2]	@ movhi
	ldr	r2, [r3, #76]
	cmp	r2, #1
	beq	.L127
.L129:
	mov	r2, #512
	ldr	r3, .L130+8
	strh	r2, [r3]	@ movhi
	bx	lr
.L125:
	mov	r0, #10
	ldr	r2, [r3, #8]
	lsl	r2, r2, #23
	ldr	r1, .L130+4
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	strh	r2, [r1, #2]	@ movhi
	ldr	r2, [r3, #76]
	ldrb	ip, [r3, #12]	@ zero_extendqisi2
	cmp	r2, #1
	strh	ip, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bne	.L129
.L127:
	mov	r1, #10
	ldr	r2, [r3, #48]
	lsl	r2, r2, #23
	ldrb	r0, [r3, #52]	@ zero_extendqisi2
	lsr	r2, r2, #23
	ldr	r3, .L130+8
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L131:
	.align	2
.L130:
	.word	enemies
	.word	shadowOAM+800
	.word	shadowOAM+808
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
	ldr	r3, .L143
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L133
	ldr	r3, .L143+4
	ldrh	r2, [r3]
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
.L134:
	ldr	r1, .L143+8
	ldr	r2, [r1, #28]
	cmp	r2, #0
	beq	.L142
	mov	r0, #8
	ldr	r2, [r1, #8]
	lsl	r2, r2, #23
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
.L135:
	bl	drawEnemy
	ldr	r3, .L143+12
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L136
	ldr	r0, .L143+16
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r0, #40]
	ldr	r2, .L143+20
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	add	r1, r1, #12
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L136:
	ldr	r3, .L143+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L143+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L143+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L143+32
	ldrh	r1, [r2]
	ldr	r2, .L143+36
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L142:
	mov	r2, #512
	strh	r2, [r3, #8]	@ movhi
	b	.L135
.L133:
	bl	drawPlayer.part.0
	ldr	r3, .L143+4
	b	.L134
.L144:
	.align	2
.L143:
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
	ldr	r3, .L147
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
.L148:
	.align	2
.L147:
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
	ldr	r4, .L169
	ldr	r6, .L169+4
	ldr	r0, [r4]
	ldr	r3, [r6, #12]
	sub	r2, r0, r3
	cmp	r2, #0
	movlt	r3, #1
	sub	sp, sp, #20
	strlt	r3, [r4, #20]
	blt	.L151
	cmp	r0, r3
	moveq	r3, #0
	mvnne	r3, #0
	str	r3, [r4, #20]
.L151:
	ldr	r1, [r4, #4]
	ldr	r3, [r6, #8]
	sub	r2, r1, r3
	cmp	r2, #0
	blt	.L167
	cmp	r1, r3
	mvnne	r3, #0
	moveq	r3, #0
	strne	r3, [r4, #16]
	streq	r3, [r4, #16]
	addne	r1, r1, r3
.L154:
	ldr	ip, [r4, #20]
	ldr	r2, .L169+8
	ldr	r3, .L169+12
	ldr	r5, .L169+16
	add	r0, r0, ip
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	ip, [r5, #28]
	sub	r3, r1, r3
	sub	r2, r0, r2
	cmp	ip, #1
	stm	r4, {r0, r1, r2, r3}
	ldr	r3, [r4, #32]
	bne	.L156
	cmp	r3, #1
	beq	.L168
.L149:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L168:
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r7, .L169+20
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r1, #0
	ldrne	r2, .L169+24
	ldrne	r0, .L169+28
	ldrne	r3, [r2]
	ldrne	r0, [r0]
	subne	r3, r3, r0
	strne	r3, [r2]
	strne	r1, [r5, #28]
	ldr	r3, [r4, #32]
.L156:
	cmp	r3, #1
	bne	.L149
	add	r2, r6, #8
	ldm	r2, {r2, r3}
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r4, .L169+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r2, .L169+32
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L167:
	mov	r3, #1
	str	r3, [r4, #16]
	add	r1, r1, r3
	b	.L154
.L170:
	.align	2
.L169:
	.word	boss
	.word	player
	.word	hOff
	.word	vOff
	.word	bullets
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
	ldr	r0, .L175
	bl	updateBullet
	ldr	r0, .L175+4
	bl	updateEnemy
	ldr	r0, .L175+8
	bl	updateEnemy
	ldr	r3, .L175+12
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L174
	pop	{r4, lr}
	bx	lr
.L174:
	mov	r2, #1
	ldr	r3, .L175+16
	pop	{r4, lr}
	str	r2, [r3, #32]
	b	updateBoss
.L176:
	.align	2
.L175:
	.word	bullets
	.word	enemies
	.word	enemies+40
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
	ldr	r0, .L179
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L179+4
	ldr	r1, [r0, #40]
	ldrb	ip, [r0, #12]	@ zero_extendqisi2
	add	r1, r1, #12
	add	r0, r2, #1016
	add	r2, r2, #1020
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	bx	lr
.L180:
	.align	2
.L179:
	.word	boss
	.word	shadowOAM
	.size	drawBoss, .-drawBoss
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	currRegion,4,4
	.comm	bossHealth,4,4
	.comm	boss,56,4
	.comm	enemies,80,4
	.comm	bullets,36,4
	.comm	damage,4,4
	.comm	playerHealth,4,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
