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
	mov	lr, #4864
	mov	r1, #0
	ldr	r0, .L8
	strh	r2, [r3, #8]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	ldr	r2, .L8+4
	ldr	r0, .L8+8
	ldrh	ip, [r2, #48]
	ldr	r2, .L8+12
	strh	lr, [r3]	@ movhi
	ldr	r3, .L8+16
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	4100
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
	ldr	r4, .L27+4
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+8
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r0, #3
	ldr	r2, .L27+12
	ldr	r1, .L27+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+20
	ldr	r1, .L27+24
	mov	lr, pc
	bx	r4
	mov	r3, #64
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+32
	ldr	r1, .L27+36
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L27+40
	ldrh	r1, [r3]
	ldr	r3, .L27+44
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L27+48
	ldr	r1, .L27+52
	ldr	r5, .L27+56
	mov	lr, pc
	bx	r4
	ldr	r2, .L27+60
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L27+64
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	cmp	r2, #1
	beq	.L26
.L24:
	ldr	r3, .L27+68
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L27+72
	mov	lr, pc
	bx	r4
	mov	r3, #2
	ldr	r2, .L27+76
	str	r3, [r5]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	ldr	ip, .L27+80
	ldr	r3, [ip, #24]
	rsb	r3, r3, #256
	str	r3, [ip, #12]
	ldr	r1, .L27+84
	ldr	r3, .L27+88
	ldr	r0, .L27+92
	mov	lr, pc
	bx	r3
	b	.L24
.L28:
	.align	2
.L27:
	.word	waitForVBlank
	.word	DMANow
	.word	region2Pal
	.word	100679680
	.word	region2Tiles
	.word	100696064
	.word	region2Map
	.word	fishTiles
	.word	100726784
	.word	fishMap
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
	mov	r3, #1504
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
	.global	goToInstruct
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruct, %function
goToInstruct:
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
	mov	r3, #3264
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
	mov	r2, #6
	ldr	r3, .L35+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	DMANow
	.word	instructPal
	.word	instructTiles
	.word	100726784
	.word	instructMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToInstruct, .-goToInstruct
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
	ldr	r3, .L56
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L38
	ldr	r2, .L56+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L52
.L38:
	tst	r3, #4
	beq	.L40
	ldr	r2, .L56+12
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L53
.L40:
	tst	r3, #1
	beq	.L37
	ldr	r3, .L56+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L54
.L37:
	pop	{r4, lr}
	bx	lr
.L52:
	ldr	r3, .L56+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+20
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L55
	pop	{r4, lr}
	b	goToGame2
.L53:
	pop	{r4, lr}
	b	goToStart
.L54:
	pop	{r4, lr}
	b	goToInstruct
.L55:
	pop	{r4, lr}
	b	goToGame1
.L57:
	.align	2
.L56:
	.word	waitForVBlank
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.word	currRegion
	.size	pause, .-pause
	.align	2
	.global	instruct
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruct, %function
instruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L65
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L58
	ldr	r3, .L65+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L64
.L58:
	pop	{r4, lr}
	bx	lr
.L64:
	pop	{r4, lr}
	b	goToPause
.L66:
	.align	2
.L65:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instruct, .-instruct
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
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	ldr	r4, .L69+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L69+8
	mov	lr, pc
	bx	r4
	mov	r3, #752
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L69+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L69+16
	ldr	r1, .L69+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L69+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L69+28
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L69+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L70:
	.align	2
.L69:
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
	ldr	r3, .L78
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L71
	ldr	r3, .L78+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L77
.L71:
	pop	{r4, lr}
	bx	lr
.L77:
	pop	{r4, lr}
	b	goToStart
.L79:
	.align	2
.L78:
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
	ldr	r3, .L82
	mov	lr, pc
	bx	r3
	ldr	r4, .L82+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L82+8
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L82+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L82+16
	ldr	r1, .L82+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L82+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L82+28
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L82+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L83:
	.align	2
.L82:
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
	ldr	r3, .L98
	mov	lr, pc
	bx	r3
	ldr	r4, .L98+4
	ldr	r3, .L98+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L85
	ldr	r2, .L98+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L96
.L85:
	tst	r3, #2
	beq	.L86
	ldr	r3, .L98+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L86
	mvn	r0, #0
	ldr	r1, .L98+20
	ldr	r3, .L98+24
	ldr	r2, .L98+28
	str	r0, [r1]
	str	r2, [r3]
.L87:
	ldr	r3, .L98+32
	ldr	r3, [r3, #12]
	cmp	r3, #0
	blt	.L97
.L84:
	pop	{r4, lr}
	bx	lr
.L86:
	ldr	r3, .L98+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L87
	bl	goToLose
	ldr	r3, .L98+32
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bge	.L84
.L97:
	bl	goToGame2
	mov	r2, #17
	ldr	r3, .L98+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L96:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L85
.L99:
	.align	2
.L98:
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
	ldr	r3, .L111
	mov	lr, pc
	bx	r3
	ldr	r3, .L111+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L111+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldr	r3, .L111+12
	ldrh	r1, [r3]
	ldr	r3, .L111+16
	ldr	r3, [r3]
	lsl	r3, r3, #17
	lsr	r3, r3, #16
	strh	r1, [r2, #20]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L111+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L101
	ldr	r3, .L111+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L108
.L101:
	ldr	r3, .L111+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L109
	ldr	r3, .L111+32
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L110
.L100:
	pop	{r4, lr}
	bx	lr
.L109:
	bl	goToLose
	ldr	r3, .L111+32
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L100
.L110:
	ldr	r3, .L111+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToWin
.L108:
	ldr	r3, .L111+40
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L101
.L112:
	.align	2
.L111:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	playerHealth
	.word	bossHealth
	.word	stopSound
	.word	pauseSound
	.size	game2, .-game2
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
	ldr	r3, .L120
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L120+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L113
	ldr	r3, .L120+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L119
.L113:
	pop	{r4, lr}
	bx	lr
.L119:
	ldr	r3, .L120+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L121:
	.align	2
.L120:
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
	ldr	r3, .L136
	mov	lr, pc
	bx	r3
	ldr	r6, .L136+4
	ldr	r7, .L136+8
	ldr	r5, .L136+12
	ldr	fp, .L136+16
	ldr	r10, .L136+20
	ldr	r9, .L136+24
	ldr	r8, .L136+28
	ldr	r4, .L136+32
.L123:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L124:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L124
.L126:
	.word	.L132
	.word	.L131
	.word	.L130
	.word	.L129
	.word	.L128
	.word	.L127
	.word	.L125
.L125:
	ldr	r3, .L136+36
	mov	lr, pc
	bx	r3
	b	.L123
.L127:
	ldr	r3, .L136+40
	mov	lr, pc
	bx	r3
	b	.L123
.L128:
	ldr	r3, .L136+44
	mov	lr, pc
	bx	r3
	b	.L123
.L129:
	mov	lr, pc
	bx	r8
	b	.L123
.L130:
	mov	lr, pc
	bx	r9
	b	.L123
.L131:
	mov	lr, pc
	bx	r10
	b	.L123
.L132:
	mov	lr, pc
	bx	fp
	b	.L123
.L137:
	.align	2
.L136:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game1
	.word	game2
	.word	pause
	.word	67109120
	.word	instruct
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
