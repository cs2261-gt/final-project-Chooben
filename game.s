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
	@ link register save eliminated.
	ldr	r2, .L42
	ldr	r3, [r2, #28]
	cmp	r3, #0
	bxne	lr
	mov	r0, #1
	ldr	r1, .L42+4
	ldr	r3, [r1, #36]
	cmp	r3, #0
	str	r0, [r2, #28]
	beq	.L40
	cmp	r3, #1
	beq	.L40
	cmp	r3, #2
	beq	.L41
	cmp	r3, #3
	bxne	lr
.L41:
	add	r0, r1, #8
	ldm	r0, {r0, r1}
	str	r3, [r2, #32]
	str	r0, [r2, #4]
	str	r1, [r2]
	bx	lr
.L40:
	ldr	r0, [r1, #12]
	ldr	r1, [r1, #8]
	str	r3, [r2, #32]
	stm	r2, {r0, r1}
	bx	lr
.L43:
	.align	2
.L42:
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
	ldr	r3, .L72
	ldrh	r2, [r3, #48]
	ldr	r4, .L72+4
	ldr	r3, .L72+8
	tst	r2, #64
	ldr	r0, [r3]
	ldr	r2, [r4, #8]
	sub	sp, sp, #16
	bne	.L45
	cmp	r2, #0
	ldrgt	r1, [r4, #16]
	subgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #0
	ble	.L45
	ldr	r1, [r4]
	cmp	r1, #79
	suble	r0, r0, #2
	strle	r0, [r3]
.L45:
	ldr	r1, .L72
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L47
	ldr	r1, [r4, #28]
	rsb	r1, r1, #256
	cmp	r1, r2
	ldrgt	r1, [r4, #16]
	addgt	r2, r2, r1
	strgt	r2, [r4, #8]
	cmp	r0, #95
	ble	.L68
.L47:
	ldr	r3, .L72
	ldrh	r3, [r3, #48]
	ldr	ip, .L72+12
	tst	r3, #32
	ldr	r1, [ip]
	ldr	r3, [r4, #12]
	bne	.L49
	ldr	lr, .L72+16
	ldr	lr, [lr]
	cmp	lr, #1
	beq	.L67
	cmp	r3, #0
	ble	.L51
.L67:
	ldr	lr, [r4, #20]
	sub	r3, r3, lr
	str	r3, [r4, #12]
.L51:
	cmp	r1, #0
	blt	.L49
	ldr	lr, [r4, #4]
	cmp	lr, #119
	suble	r1, r1, #2
	strle	r1, [ip]
.L49:
	ldr	lr, .L72
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L52
	ldr	lr, [r4, #24]
	rsb	lr, lr, #256
	cmp	lr, r3
	ldrgt	lr, [r4, #20]
	addgt	r3, r3, lr
	strgt	r3, [r4, #12]
	cmp	r1, #15
	ble	.L69
.L52:
	ldr	r5, .L72+20
	sub	r3, r3, r1
	sub	r2, r2, r0
	stm	r4, {r2, r3}
	bl	animatePlayer
	ldr	r3, [r5, #36]
	cmp	r3, #1
	mov	r6, #0
	ldr	r8, .L72+24
	ldr	r7, .L72+28
	beq	.L70
.L55:
	cmp	r6, #1
	add	r5, r5, #40
	bne	.L59
	ldr	r3, .L72+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L44
	ldr	r3, .L72+36
	ldrh	r2, [r3]
	ands	r2, r2, #1
	beq	.L71
.L44:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L59:
	ldr	r3, [r5, #36]
	cmp	r3, #1
	mov	r6, #1
	bne	.L55
.L70:
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
	b	.L55
.L68:
	ldr	r1, [r4]
	cmp	r1, #80
	addgt	r0, r0, #2
	strgt	r0, [r3]
	b	.L47
.L69:
	ldr	lr, [r4, #4]
	cmp	lr, #120
	addgt	r1, r1, #2
	strgt	r1, [ip]
	b	.L52
.L71:
	ldr	r1, .L72+40
	ldr	r3, .L72+44
	ldr	r0, .L72+48
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireBullet
.L73:
	.align	2
.L72:
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
	.word	10727
	.word	playSoundB
	.word	gunSound
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
	beq	.L75
	ldr	r1, [r0, #32]
	cmp	r1, #0
	bne	.L76
	cmp	r3, #256
	ble	.L77
	str	r1, [r0, #28]
.L75:
	ldr	ip, .L90
	ldr	r1, .L90+4
	ldr	ip, [ip]
	ldr	r1, [r1]
	sub	r2, r2, ip
	sub	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L76:
	cmp	r1, #1
	beq	.L88
	cmp	r1, #2
	beq	.L89
	cmp	r2, #256
	bgt	.L87
	ldr	r1, [r0, #24]
	add	r2, r2, r1
	str	r2, [r0]
	b	.L75
.L77:
	ldr	r1, [r0, #24]
	add	r3, r3, r1
	str	r3, [r0, #4]
	b	.L75
.L88:
	cmp	r3, #0
	blt	.L87
	ldr	r1, [r0, #24]
	sub	r3, r3, r1
	str	r3, [r0, #4]
	b	.L75
.L89:
	cmp	r2, #0
	bgt	.L81
.L87:
	mov	r1, #0
	str	r1, [r0, #28]
	b	.L75
.L81:
	ldr	r1, [r0, #24]
	sub	r2, r2, r1
	str	r2, [r0]
	b	.L75
.L91:
	.align	2
.L90:
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
	beq	.L93
	mov	r1, #8
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	ldr	r2, .L95
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	bx	lr
.L93:
	mov	r2, #512
	ldr	r3, .L95
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L96:
	.align	2
.L95:
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
	ldr	r4, .L101
	ldr	r5, .L101+4
	ldr	r7, .L101+8
	ldr	r6, .L101+12
.L98:
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
	bne	.L99
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L99:
	mov	r9, r10
	b	.L98
.L102:
	.align	2
.L101:
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
	ldr	r3, .L105
	str	r5, [r3]
	ldr	r3, .L105+4
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	r7, [r3, #48]
	ldr	r2, .L105+8
	ldr	r3, .L105+12
	str	r4, [r2]
	str	r4, [r3]
	ldr	r1, .L105+16
	ldr	r2, .L105+20
	str	r4, [r3, #28]
	str	r7, [r3, #24]
	str	r4, [r3, #4]
	str	r4, [r3, #32]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	ldr	r3, .L105+24
	str	r4, [r1]
	str	r6, [r2]
	str	r6, [r3]
	bl	initEnemy
	mov	r2, #32
	mov	r1, #112
	ldr	r3, .L105+28
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
.L106:
	.align	2
.L105:
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
	ble	.L111
	ldr	r2, [r5, #16]
	add	r2, r0, r2
	cmp	r2, #255
	ble	.L109
.L111:
	rsb	r3, r3, #0
	str	r3, [r5, #28]
.L110:
	ldr	r2, [r5, #32]
	cmp	r2, #0
	addeq	r0, r0, r3
	addne	r1, r1, r3
	ldr	r2, .L121
	ldr	r3, .L121+4
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
	bne	.L120
	ldr	r4, .L121+8
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r6, .L121+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L116
.L120:
	ldr	r3, [r5, #24]
.L115:
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r5, #36]
	ldr	r3, .L121+16
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L107
	mov	r2, #512
	mov	r1, #0
	ldr	r3, .L121+20
	strh	r2, [r3], #8	@ movhi
	str	r1, [r5, #36]
	strh	r2, [r3]	@ movhi
.L107:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L116:
	mov	r2, #0
	ldr	r1, .L121+24
	ldr	r3, [r5, #24]
	ldr	r1, [r1]
	sub	r3, r3, r1
	str	r3, [r5, #24]
	str	r2, [r4, #28]
	b	.L115
.L109:
	cmp	r1, #0
	ble	.L111
	ldr	r2, [r5, #20]
	add	r2, r1, r2
	cmp	r2, #255
	ble	.L110
	b	.L111
.L122:
	.align	2
.L121:
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
	ldr	r3, .L129
	ldr	r2, [r3, #36]
	cmp	r2, #1
	beq	.L124
	mov	r1, #512
	ldr	r2, .L129+4
	strh	r1, [r2]	@ movhi
	ldr	r2, [r3, #76]
	cmp	r2, #1
	beq	.L126
.L128:
	mov	r2, #512
	ldr	r3, .L129+8
	strh	r2, [r3]	@ movhi
	bx	lr
.L124:
	mov	r0, #10
	ldr	r2, [r3, #8]
	lsl	r2, r2, #23
	ldr	r1, .L129+4
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	strh	r2, [r1, #2]	@ movhi
	ldr	r2, [r3, #76]
	ldrb	ip, [r3, #12]	@ zero_extendqisi2
	cmp	r2, #1
	strh	ip, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bne	.L128
.L126:
	mov	r1, #10
	ldr	r2, [r3, #48]
	lsl	r2, r2, #23
	ldrb	r0, [r3, #52]	@ zero_extendqisi2
	lsr	r2, r2, #23
	ldr	r3, .L129+8
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L130:
	.align	2
.L129:
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
	ldr	r3, .L142
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L132
	ldr	r3, .L142+4
	ldrh	r2, [r3]
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
.L133:
	ldr	r1, .L142+8
	ldr	r2, [r1, #28]
	cmp	r2, #0
	beq	.L141
	mov	r0, #8
	ldr	r2, [r1, #8]
	lsl	r2, r2, #23
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
.L134:
	bl	drawEnemy
	ldr	r3, .L142+12
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L135
	ldr	r0, .L142+16
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r0, #40]
	ldr	r2, .L142+20
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	add	r1, r1, #12
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L135:
	ldr	r3, .L142+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L142+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L142+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L142+32
	ldrh	r1, [r2]
	ldr	r2, .L142+36
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L141:
	mov	r2, #512
	strh	r2, [r3, #8]	@ movhi
	b	.L134
.L132:
	bl	drawPlayer.part.0
	ldr	r3, .L142+4
	b	.L133
.L143:
	.align	2
.L142:
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
	ldr	r3, .L146
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
.L147:
	.align	2
.L146:
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
	ldr	r4, .L168
	ldr	r6, .L168+4
	ldr	r0, [r4]
	ldr	r3, [r6, #12]
	sub	r2, r0, r3
	cmp	r2, #0
	movlt	r3, #1
	sub	sp, sp, #20
	strlt	r3, [r4, #20]
	blt	.L150
	cmp	r0, r3
	moveq	r3, #0
	mvnne	r3, #0
	str	r3, [r4, #20]
.L150:
	ldr	r1, [r4, #4]
	ldr	r3, [r6, #8]
	sub	r2, r1, r3
	cmp	r2, #0
	blt	.L166
	cmp	r1, r3
	mvnne	r3, #0
	moveq	r3, #0
	strne	r3, [r4, #16]
	streq	r3, [r4, #16]
	addne	r1, r1, r3
.L153:
	ldr	ip, [r4, #20]
	ldr	r2, .L168+8
	ldr	r3, .L168+12
	ldr	r5, .L168+16
	add	r0, r0, ip
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	ip, [r5, #28]
	sub	r3, r1, r3
	sub	r2, r0, r2
	cmp	ip, #1
	stm	r4, {r0, r1, r2, r3}
	ldr	r3, [r4, #32]
	bne	.L155
	cmp	r3, #1
	beq	.L167
.L148:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L167:
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r7, .L168+20
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r1, #0
	ldrne	r2, .L168+24
	ldrne	r0, .L168+28
	ldrne	r3, [r2]
	ldrne	r0, [r0]
	subne	r3, r3, r0
	strne	r3, [r2]
	strne	r1, [r5, #28]
	ldr	r3, [r4, #32]
.L155:
	cmp	r3, #1
	bne	.L148
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
	ldr	r4, .L168+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r2, .L168+32
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L166:
	mov	r3, #1
	str	r3, [r4, #16]
	add	r1, r1, r3
	b	.L153
.L169:
	.align	2
.L168:
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
	ldr	r0, .L174
	bl	updateBullet
	ldr	r0, .L174+4
	bl	updateEnemy
	ldr	r0, .L174+8
	bl	updateEnemy
	ldr	r3, .L174+12
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L173
	pop	{r4, lr}
	bx	lr
.L173:
	mov	r2, #1
	ldr	r3, .L174+16
	pop	{r4, lr}
	str	r2, [r3, #32]
	b	updateBoss
.L175:
	.align	2
.L174:
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
	ldr	r0, .L178
	ldr	r3, [r0, #8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L178+4
	ldr	r1, [r0, #40]
	ldrb	ip, [r0, #12]	@ zero_extendqisi2
	add	r1, r1, #12
	add	r0, r2, #1016
	add	r2, r2, #1020
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	bx	lr
.L179:
	.align	2
.L178:
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
