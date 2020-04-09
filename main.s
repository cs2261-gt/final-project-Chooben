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
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #7936
	mov	r0, #4352
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L7
	ldr	r2, .L7+4
	ldrh	r1, [r1, #48]
	strh	r0, [r3]	@ movhi
	strh	r1, [r2]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L11
	ldr	r4, .L11+4
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L11+8
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L11+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L11+16
	ldr	r1, .L11+20
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L11+24
	ldrh	r1, [r3]
	ldr	r3, .L11+28
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L11+32
	ldr	r1, .L11+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L11+40
	ldr	r1, .L11+44
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L11+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L11+52
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L11+56
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	waitForVBlank
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100726784
	.word	backgroundMap
	.word	vOff
	.word	hOff
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r4, .L20
	ldr	r3, [r4]
	ldr	r2, .L20+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L20+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L20+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r0, [r4]
	ldr	r3, .L20+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L20+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
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
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L24+8
	mov	lr, pc
	bx	r4
	mov	r3, #944
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L24+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L24+16
	ldr	r1, .L24+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L24+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L24+28
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L24+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r4, .L28+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L28+8
	mov	lr, pc
	bx	r4
	mov	r3, #752
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L28+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L28+16
	ldr	r1, .L28+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L28+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L28+28
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L28+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L29:
	.align	2
.L28:
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
	ldr	r3, .L37
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L30
	ldr	r3, .L37+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L36
.L30:
	pop	{r4, lr}
	bx	lr
.L36:
	pop	{r4, lr}
	b	goToStart
.L38:
	.align	2
.L37:
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
	ldr	r3, .L41
	mov	lr, pc
	bx	r3
	ldr	r4, .L41+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L41+8
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L41+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L41+16
	ldr	r1, .L41+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L41+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L41+28
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L41+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L42:
	.align	2
.L41:
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
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
	ldr	r3, .L52+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
.L44:
	ldr	r3, .L52+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L51
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goToLose
.L50:
	bl	goToPause
	b	.L44
.L53:
	.align	2
.L52:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	health
	.size	game, .-game
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
	ldr	r3, .L76
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L55
	ldr	r2, .L76+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L72
.L55:
	tst	r3, #4
	beq	.L56
	ldr	r2, .L76+12
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L73
.L56:
	tst	r3, #2
	beq	.L57
	ldr	r2, .L76+12
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L74
.L57:
	tst	r3, #1
	beq	.L54
	ldr	r3, .L76+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L75
.L54:
	pop	{r4, lr}
	bx	lr
.L72:
	pop	{r4, lr}
	b	goToGame
.L73:
	pop	{r4, lr}
	b	goToStart
.L74:
	pop	{r4, lr}
	b	goToLose
.L75:
	pop	{r4, lr}
	b	goToWin
.L77:
	.align	2
.L76:
	.word	waitForVBlank
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
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
	mov	r3, #67108864
	mov	r2, #7936
	mov	r1, #4352
	push	{r4, r7, fp, lr}
	strh	r2, [r3, #8]	@ movhi
	ldr	r4, .L89
	ldr	fp, .L89+4
	ldrh	r2, [r4, #48]
	strh	r1, [r3]	@ movhi
	ldr	r3, .L89+8
	strh	r2, [fp]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L89+12
	ldr	r5, .L89+16
	ldr	r10, .L89+20
	ldr	r9, .L89+24
	ldr	r8, .L89+28
	ldr	r7, .L89+32
.L79:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L80:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L80
.L82:
	.word	.L85
	.word	.L84
	.word	.L83
	.word	.L81
	.word	.L81
.L81:
	mov	lr, pc
	bx	r7
	b	.L79
.L83:
	mov	lr, pc
	bx	r8
	b	.L79
.L84:
	mov	lr, pc
	bx	r9
	b	.L79
.L85:
	mov	lr, pc
	bx	r10
	b	.L79
.L90:
	.align	2
.L89:
	.word	67109120
	.word	buttons
	.word	goToStart
	.word	state
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
