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
	push	{r4, r5, lr}
	mov	ip, #2
	mov	lr, #3
	mov	r5, #14
	mov	r4, #16
	mov	r0, #20
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L7
	str	lr, [r3, #48]
	str	ip, [r3, #16]
	ldr	lr, .L7+4
	str	ip, [r3, #20]
	ldr	ip, .L7+8
	str	r5, [r3, #24]
	str	r4, [r3, #28]
	str	r2, [lr]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	str	r2, [ip]
	pop	{r4, r5, lr}
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
	ldr	r3, .L43+12
	ldr	r2, [r3, #36]
	cmp	r2, #0
	str	r1, [r4, #28]
	bne	.L36
	ldr	r1, [r3, #8]
	ldr	r0, [r3, #12]
	add	r3, r1, #11
	stm	r4, {r0, r3}
	str	r2, [r4, #32]
.L33:
	pop	{r4, lr}
	bx	lr
.L36:
	cmp	r2, #1
	beq	.L41
	cmp	r2, #2
	beq	.L42
	cmp	r2, #3
	bne	.L33
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
.L41:
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
.L42:
	add	r1, r3, #8
	ldm	r1, {r1, r3}
	add	r1, r1, #6
	sub	r3, r3, #1
	str	r2, [r4, #32]
	str	r1, [r4, #4]
	str	r3, [r4]
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
	ldr	r3, .L80
	ldrh	r2, [r3, #48]
	ldr	r4, .L80+4
	ldr	r3, .L80+8
	tst	r2, #64
	ldr	r0, [r3]
	ldr	r2, [r4, #8]
	sub	sp, sp, #16
	bne	.L46
	ldr	r1, .L80+12
	ldr	r1, [r1]
	cmp	r1, #1
	beq	.L75
	cmp	r2, #0
	ble	.L48
.L71:
	ldr	r1, [r4, #16]
	sub	r2, r2, r1
	str	r2, [r4, #8]
.L48:
	cmp	r0, #0
	ble	.L46
	ldr	r1, [r4]
	cmp	r1, #79
	suble	r0, r0, #2
	strle	r0, [r3]
.L46:
	ldr	r1, .L80
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L49
	ldr	r1, .L80+12
	ldr	r1, [r1]
	cmp	r1, #1
	ldr	r1, [r4, #28]
	beq	.L76
	rsb	r1, r1, #256
	cmp	r1, r2
	bgt	.L72
.L51:
	cmp	r0, #95
	bgt	.L49
	ldr	r1, [r4]
	cmp	r1, #80
	addgt	r0, r0, #2
	strgt	r0, [r3]
.L49:
	ldr	r3, .L80
	ldrh	r3, [r3, #48]
	ldr	ip, .L80+16
	tst	r3, #32
	ldr	r1, [ip]
	ldr	r3, [r4, #12]
	bne	.L52
	ldr	lr, .L80+12
	ldr	lr, [lr]
	cmp	lr, #1
	beq	.L73
	cmp	r3, #8
	ble	.L54
.L73:
	ldr	lr, [r4, #20]
	sub	r3, r3, lr
	str	r3, [r4, #12]
.L54:
	cmp	r1, #0
	blt	.L52
	ldr	lr, [r4, #4]
	cmp	lr, #119
	suble	r1, r1, #2
	strle	r1, [ip]
.L52:
	ldr	lr, .L80
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L55
	ldr	lr, .L80+12
	ldr	lr, [lr]
	cmp	lr, #1
	ldr	lr, [r4, #24]
	beq	.L77
	rsb	lr, lr, #256
	cmp	lr, r3
	bgt	.L74
.L57:
	cmp	r1, #15
	bgt	.L55
	ldr	lr, [r4, #4]
	cmp	lr, #120
	addgt	r1, r1, #2
	strgt	r1, [ip]
.L55:
	ldr	r5, .L80+20
	sub	r3, r3, r1
	sub	r2, r2, r0
	stm	r4, {r2, r3}
	bl	animatePlayer
	ldr	r3, [r5, #36]
	cmp	r3, #1
	mov	r6, #0
	ldr	r8, .L80+24
	ldr	r7, .L80+28
	beq	.L78
.L59:
	cmp	r6, #1
	add	r5, r5, #40
	bne	.L63
	ldr	r3, .L80+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L45
	ldr	r3, .L80+36
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L79
.L45:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L63:
	ldr	r3, [r5, #36]
	cmp	r3, #1
	mov	r6, #1
	bne	.L59
.L78:
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
	b	.L59
.L77:
	rsb	lr, lr, #248
	cmp	lr, r3
	ble	.L57
.L74:
	ldr	lr, [r4, #20]
	add	r3, r3, lr
	str	r3, [r4, #12]
	b	.L57
.L76:
	rsb	r1, r1, #248
	cmp	r1, r2
	ble	.L51
.L72:
	ldr	r1, [r4, #16]
	add	r2, r2, r1
	str	r2, [r4, #8]
	b	.L51
.L75:
	cmp	r2, #8
	ble	.L48
	b	.L71
.L79:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireBullet
.L81:
	.align	2
.L80:
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
	beq	.L83
	ldr	r1, [r0, #32]
	cmp	r1, #0
	bne	.L84
	cmp	r3, #256
	ble	.L85
	str	r1, [r0, #28]
.L83:
	ldr	ip, .L98
	ldr	r1, .L98+4
	ldr	ip, [ip]
	ldr	r1, [r1]
	sub	r2, r2, ip
	sub	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L84:
	cmp	r1, #1
	beq	.L96
	cmp	r1, #2
	beq	.L97
	cmp	r2, #256
	bgt	.L95
	ldr	r1, [r0, #24]
	add	r2, r2, r1
	str	r2, [r0]
	b	.L83
.L85:
	ldr	r1, [r0, #24]
	add	r3, r3, r1
	str	r3, [r0, #4]
	b	.L83
.L96:
	cmp	r3, #0
	blt	.L95
	ldr	r1, [r0, #24]
	sub	r3, r3, r1
	str	r3, [r0, #4]
	b	.L83
.L97:
	cmp	r2, #0
	bgt	.L89
.L95:
	mov	r1, #0
	str	r1, [r0, #28]
	b	.L83
.L89:
	ldr	r1, [r0, #24]
	sub	r2, r2, r1
	str	r2, [r0]
	b	.L83
.L99:
	.align	2
.L98:
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
	beq	.L101
	mov	r1, #8
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	ldr	r2, .L103
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	bx	lr
.L101:
	mov	r2, #512
	ldr	r3, .L103
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L104:
	.align	2
.L103:
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
	mov	r8, #22
	ldr	r4, .L109
	ldr	r5, .L109+4
	ldr	r7, .L109+8
	ldr	r6, .L109+12
.L106:
	mov	r3, #15
	str	r8, [r4, #16]
	str	r3, [r4, #20]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3, lsl #5
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #3
	mov	r2, #2
	smull	r3, ip, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #6
	add	ip, r3, r3, lsl r1
	add	r3, r3, ip, lsl #1
	sub	r0, r0, r3, lsl r1
	str	r0, [r4, #4]
	str	r1, [r4, #24]
	str	r2, [r4, #28]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	cmp	r0, #0
	and	r0, r0, r3
	rsblt	r0, r0, #0
	cmp	r9, r3
	str	r0, [r4, #32]
	str	r3, [r4, #36]
	add	r4, r4, #40
	bne	.L107
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L107:
	mov	r9, r3
	b	.L106
.L110:
	.align	2
.L109:
	.word	enemies
	.word	rand
	.word	-1840700269
	.word	1808407283
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
	mov	ip, #10
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	mov	r2, #16
	mov	r5, #2
	mov	r7, #3
	mov	r1, #20
	mov	r0, #14
	mov	r6, #1
	ldr	r3, .L113
	str	ip, [r3]
	ldr	r3, .L113+4
	str	r4, [r3]
	ldr	r3, .L113+8
	str	r4, [r3]
	ldr	r3, .L113+12
	str	r2, [r3, #28]
	ldr	r2, .L113+16
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r7, [r3, #48]
	ldr	r1, .L113+20
	str	r0, [r3, #24]
	ldr	r3, .L113+24
	str	r4, [r2, #28]
	str	r7, [r2, #24]
	str	r4, [r2]
	str	r4, [r2, #4]
	str	r4, [r2, #32]
	str	r5, [r2, #16]
	str	r5, [r2, #20]
	str	r6, [r1]
	str	r6, [r3]
	bl	initEnemy
	mov	r2, #32
	mov	r1, #112
	ldr	r3, .L113+28
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
.L114:
	.align	2
.L113:
	.word	bossHealth
	.word	hOff
	.word	vOff
	.word	player
	.word	bullets
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
	cmp	r0, #8
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #28]
	sub	sp, sp, #16
	ble	.L119
	ldr	r2, [r5, #16]
	add	r2, r0, r2
	cmp	r2, #247
	ble	.L117
.L119:
	rsb	r3, r3, #0
	str	r3, [r5, #28]
.L118:
	ldr	r2, [r5, #32]
	cmp	r2, #0
	addeq	r0, r0, r3
	addne	r1, r1, r3
	ldr	r2, .L131
	ldr	r3, .L131+4
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
	bne	.L123
	ldr	r4, .L131+8
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r6, .L131+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L130
.L123:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L115
	mov	r2, #512
	mov	r1, #0
	ldr	r3, .L131+20
	strh	r2, [r3], #8	@ movhi
	str	r1, [r5, #36]
	strh	r2, [r3]	@ movhi
.L115:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L130:
	mov	r2, #0
	ldr	r1, .L131+24
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	str	r2, [r5, #36]
	str	r2, [r4, #28]
	b	.L123
.L117:
	cmp	r1, #8
	ble	.L119
	ldr	r2, [r5, #20]
	add	r2, r1, r2
	cmp	r2, #247
	ble	.L118
	b	.L119
.L132:
	.align	2
.L131:
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
	ldr	r3, .L139
	ldr	r2, [r3, #36]
	cmp	r2, #1
	beq	.L134
	mov	r1, #512
	ldr	r2, .L139+4
	strh	r1, [r2]	@ movhi
	ldr	r2, [r3, #76]
	cmp	r2, #1
	beq	.L136
.L138:
	mov	r2, #512
	ldr	r3, .L139+8
	strh	r2, [r3]	@ movhi
	bx	lr
.L134:
	ldr	r2, [r3, #8]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	mov	ip, #10
	ldr	r1, .L139+4
	ldrb	r0, [r3, #12]	@ zero_extendqisi2
	strh	r2, [r1, #2]	@ movhi
	ldr	r2, [r3, #76]
	orr	r0, r0, #16384
	cmp	r2, #1
	strh	r0, [r1]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	bne	.L138
.L136:
	ldr	r2, [r3, #48]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mov	r0, #10
	mvn	r2, r2, lsr #17
	ldrb	r1, [r3, #52]	@ zero_extendqisi2
	ldr	r3, .L139+8
	orr	r1, r1, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	bx	lr
.L140:
	.align	2
.L139:
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
	ldr	r3, .L152
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L142
	ldr	r3, .L152+4
	ldrh	r2, [r3]
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
.L143:
	ldr	r1, .L152+8
	ldr	r2, [r1, #28]
	cmp	r2, #0
	beq	.L151
	mov	r0, #8
	ldr	r2, [r1, #8]
	lsl	r2, r2, #23
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
.L144:
	bl	drawEnemy
	ldr	r3, .L152+12
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L145
	ldr	r1, .L152+16
	ldr	r3, [r1, #8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r1, #40]
	ldr	ip, [r1, #48]
	ldr	r0, .L152+20
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	add	r2, r2, #14
	add	r2, r2, ip, lsl #7
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
.L145:
	ldr	r3, .L152+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L152+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L152+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L152+32
	ldrh	r1, [r2]
	ldr	r2, .L152+36
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L151:
	mov	r2, #512
	strh	r2, [r3, #8]	@ movhi
	b	.L144
.L142:
	bl	drawPlayer.part.0
	ldr	r3, .L152+4
	b	.L143
.L153:
	.align	2
.L152:
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
	ldr	r3, .L156
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
.L157:
	.align	2
.L156:
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
	ldr	r4, .L179
	ldr	r6, .L179+4
	ldr	r0, [r4]
	ldr	r3, [r6, #12]
	sub	r2, r0, r3
	cmp	r2, #0
	movlt	r3, #1
	sub	sp, sp, #20
	strlt	r3, [r4, #20]
	blt	.L160
	cmp	r0, r3
	moveq	r3, #0
	mvnne	r3, #0
	str	r3, [r4, #20]
.L160:
	ldr	r1, [r4, #4]
	ldr	r3, [r6, #8]
	sub	r2, r1, r3
	cmp	r2, #0
	blt	.L177
	cmp	r1, r3
	mvnne	r3, #0
	moveq	r3, #0
	strne	r3, [r4, #16]
	streq	r3, [r4, #16]
	addne	r1, r1, r3
.L163:
	ldr	ip, [r4, #20]
	ldr	r2, .L179+8
	ldr	r3, .L179+12
	ldr	r5, .L179+16
	add	r0, r0, ip
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	ip, [r5, #28]
	sub	r3, r1, r3
	sub	r2, r0, r2
	cmp	ip, #1
	stm	r4, {r0, r1, r2, r3}
	ldr	r3, [r4, #32]
	bne	.L165
	cmp	r3, #1
	beq	.L178
.L167:
	ldr	r5, [r4, #36]
	ldr	r3, .L179+20
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	bne	.L171
	ldr	r0, [r4, #48]
	ldr	r3, .L179+24
	ldr	r1, [r4, #52]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #48]
.L171:
	add	r5, r5, #1
	str	r5, [r4, #36]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L178:
	add	ip, r5, #16
	ldr	r2, [r5, #4]
	ldm	ip, {ip, lr}
	ldr	r3, [r5]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r7, .L179+28
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r1, #0
	ldrne	r2, .L179+32
	ldrne	r0, .L179+36
	ldrne	r3, [r2]
	ldrne	r0, [r0]
	subne	r3, r3, r0
	strne	r3, [r2]
	strne	r1, [r5, #28]
	ldr	r3, [r4, #32]
.L165:
	cmp	r3, #1
	bne	.L167
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
	ldr	r5, .L179+28
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r2, .L179+40
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	b	.L167
.L177:
	mov	r3, #1
	str	r3, [r4, #16]
	add	r1, r1, r3
	b	.L163
.L180:
	.align	2
.L179:
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
	ldr	r0, .L185
	bl	updateBullet
	ldr	r0, .L185+4
	bl	updateEnemy
	ldr	r0, .L185+8
	bl	updateEnemy
	ldr	r3, .L185+12
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L184
	pop	{r4, lr}
	bx	lr
.L184:
	mov	r2, #1
	ldr	r3, .L185+16
	pop	{r4, lr}
	str	r2, [r3, #32]
	b	updateBoss
.L186:
	.align	2
.L185:
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L190
	ldr	r3, .L190+4
	ldr	r4, [r5, #36]
	smull	r1, r2, r3, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L188
	ldr	r0, [r5, #48]
	ldr	r3, .L190+8
	ldr	r1, [r5, #52]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #48]
.L188:
	add	r4, r4, #1
	str	r4, [r5, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L191:
	.align	2
.L190:
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
	ldr	r0, .L194
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r0, #40]
	str	lr, [sp, #-4]!
	ldr	r1, .L194+4
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
.L195:
	.align	2
.L194:
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
