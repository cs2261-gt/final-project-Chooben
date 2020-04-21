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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	ip, .L4
	ldr	r5, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #832
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r5
	mov	r1, #67108864
	mov	r3, #512
	strh	r4, [r1, #18]	@ movhi
	mov	r2, #117440512
	strh	r4, [r1, #16]	@ movhi
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+28
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	seed
	.word	DMANow
	.word	startScreenPal
	.word	startScreenTiles
	.word	100726784
	.word	startScreenMap
	.word	shadowOAM
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #7936
	push	{r4, lr}
	mov	lr, #4352
	mov	r1, #0
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L8
	ldr	r0, .L8+4
	ldrh	ip, [r2, #48]
	ldr	r2, .L8+8
	strh	lr, [r3]	@ movhi
	ldr	r3, .L8+12
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	ldr	r4, .L12+4
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r3, #96
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L12+24
	ldrh	r1, [r3]
	ldr	r3, .L12+28
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L12+32
	ldr	r1, .L12+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+40
	ldr	r1, .L12+44
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L12+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r1, .L12+56
	ldr	r2, .L12+60
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	waitForVBlank
	.word	DMANow
	.word	region1Pal
	.word	region1Tiles
	.word	100726784
	.word	region1Map
	.word	vOff
	.word	hOff
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	currRegion
	.word	state
	.size	goToGame1, .-goToGame1
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r0, [r4]
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame1
.L22:
	.align	2
.L21:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+8
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+16
	ldr	r1, .L27+20
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L27+24
	ldrh	r1, [r3]
	ldr	r3, .L27+28
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L27+32
	ldr	r1, .L27+36
	ldr	r5, .L27+40
	mov	lr, pc
	bx	r4
	ldr	r2, .L27+44
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L27+48
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	cmp	r2, #1
	beq	.L26
.L24:
	ldr	r3, .L27+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L27+56
	mov	lr, pc
	bx	r4
	mov	r3, #2
	ldr	r2, .L27+60
	str	r3, [r5]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	ldr	ip, .L27+64
	ldr	r3, [ip, #24]
	rsb	r3, r3, #256
	str	r3, [ip, #12]
	ldr	r1, .L27+68
	ldr	r3, .L27+72
	ldr	r0, .L27+76
	mov	lr, pc
	bx	r3
	b	.L24
.L28:
	.align	2
.L27:
	.word	waitForVBlank
	.word	DMANow
	.word	region2Pal
	.word	region2Tiles
	.word	100726784
	.word	region2Map
	.word	vOff
	.word	hOff
	.word	83886592
	.word	spritesheetPal
	.word	currRegion
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.word	player
	.word	539712
	.word	playSoundA
	.word	bossTheme
	.size	goToGame2, .-goToGame2
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L31
	mov	lr, pc
	bx	r3
	ldr	r4, .L31+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L31+8
	mov	lr, pc
	bx	r4
	mov	r3, #944
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L31+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L31+16
	ldr	r1, .L31+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L31+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L31+28
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L31+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L32:
	.align	2
.L31:
	.word	waitForVBlank
	.word	DMANow
	.word	pausePal
	.word	pauseTiles
	.word	100726784
	.word	pauseMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L35
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L35+8
	mov	lr, pc
	bx	r4
	mov	r3, #752
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L35+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L35+16
	ldr	r1, .L35+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L35+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L35+28
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L35+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100726784
	.word	winMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L44
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L37
	ldr	r3, .L44+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L43
.L37:
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	goToStart
.L45:
	.align	2
.L44:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L48
	mov	lr, pc
	bx	r3
	ldr	r4, .L48+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L48+8
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L48+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L48+16
	ldr	r1, .L48+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L48+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L48+28
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L48+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100726784
	.word	loseMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game1
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L64
	mov	lr, pc
	bx	r3
	ldr	r4, .L64+4
	ldr	r3, .L64+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L51
	ldr	r2, .L64+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L62
.L51:
	tst	r3, #2
	beq	.L52
	ldr	r3, .L64+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L52
	mvn	r0, #0
	ldr	r1, .L64+20
	ldr	r3, .L64+24
	ldr	r2, .L64+28
	str	r0, [r1]
	str	r2, [r3]
.L53:
	ldr	r3, .L64+32
	ldr	r3, [r3, #12]
	cmp	r3, #0
	blt	.L63
.L50:
	pop	{r4, lr}
	bx	lr
.L52:
	ldr	r3, .L64+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L53
	bl	goToLose
	ldr	r3, .L64+32
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bge	.L50
.L63:
	bl	goToGame2
	mov	r2, #17
	ldr	r3, .L64+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L62:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L51
.L65:
	.align	2
.L64:
	.word	updateGame
	.word	oldButtons
	.word	drawGame
	.word	waitForVBlank
	.word	buttons
	.word	playerHealth
	.word	damage
	.word	999
	.word	player
	.word	hOff
	.size	game1, .-game1
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
	ldr	r3, .L77+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
.L67:
	ldr	r3, .L77+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L75
	ldr	r3, .L77+24
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L76
.L66:
	pop	{r4, lr}
	bx	lr
.L75:
	bl	goToLose
	ldr	r3, .L77+24
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L66
.L76:
	ldr	r3, .L77+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToWin
.L74:
	ldr	r3, .L77+32
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L67
.L78:
	.align	2
.L77:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	playerHealth
	.word	bossHealth
	.word	stopSound
	.word	pauseSound
	.size	game2, .-game2
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L103
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
	ldr	r2, .L103+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L98
.L80:
	tst	r3, #4
	beq	.L82
	ldr	r2, .L103+12
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L99
.L82:
	tst	r3, #2
	beq	.L83
	ldr	r2, .L103+12
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L100
.L83:
	tst	r3, #1
	beq	.L79
	ldr	r3, .L103+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L101
.L79:
	pop	{r4, lr}
	bx	lr
.L98:
	ldr	r3, .L103+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+20
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L102
	pop	{r4, lr}
	b	goToGame2
.L99:
	pop	{r4, lr}
	b	goToStart
.L100:
	pop	{r4, lr}
	b	goToLose
.L101:
	pop	{r4, lr}
	b	goToWin
.L102:
	pop	{r4, lr}
	b	goToGame1
.L104:
	.align	2
.L103:
	.word	waitForVBlank
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.word	currRegion
	.size	pause, .-pause
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L112
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L112+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L105
	ldr	r3, .L112+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L111
.L105:
	pop	{r4, lr}
	bx	lr
.L111:
	ldr	r3, .L112+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L113:
	.align	2
.L112:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L127
	mov	lr, pc
	bx	r3
	ldr	r6, .L127+4
	ldr	r7, .L127+8
	ldr	r5, .L127+12
	ldr	fp, .L127+16
	ldr	r10, .L127+20
	ldr	r9, .L127+24
	ldr	r8, .L127+28
	ldr	r4, .L127+32
.L115:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L116:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L116
.L118:
	.word	.L123
	.word	.L122
	.word	.L121
	.word	.L120
	.word	.L119
	.word	.L117
.L117:
	ldr	r3, .L127+36
	mov	lr, pc
	bx	r3
	b	.L115
.L119:
	ldr	r3, .L127+40
	mov	lr, pc
	bx	r3
	b	.L115
.L120:
	mov	lr, pc
	bx	r8
	b	.L115
.L121:
	mov	lr, pc
	bx	r9
	b	.L115
.L122:
	mov	lr, pc
	bx	r10
	b	.L115
.L123:
	mov	lr, pc
	bx	fp
	b	.L115
.L128:
	.align	2
.L127:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game1
	.word	game2
	.word	pause
	.word	67109120
	.word	lose
	.word	win
	.size	main, .-main
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	currRegion,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
