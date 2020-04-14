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
	mov	r3, #128
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
	ldr	r1, .L11+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r1, .L11+56
	ldr	r2, .L11+60
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	r4, .L22
	ldr	r3, [r4]
	ldr	r2, .L22+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L22+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L21
	ldr	r3, .L22+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L21:
	ldr	r4, .L22+16
.L14:
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r0, [r4]
	ldr	r3, .L22+20
	ldr	r4, .L22+16
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	bl	goToGame1
	b	.L14
.L23:
	.align	2
.L22:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.word	srand
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
	push	{r4, lr}
	ldr	r3, .L26
	ldr	r4, .L26+4
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L26+8
	mov	lr, pc
	bx	r4
	mov	r3, #320
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L26+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L26+16
	ldr	r1, .L26+20
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L26+24
	ldrh	r1, [r3]
	ldr	r3, .L26+28
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L26+32
	ldr	r1, .L26+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #16384
	ldr	r2, .L26+40
	ldr	r1, .L26+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L26+48
	ldr	r3, [r2, #24]
	ldr	r1, .L26+52
	rsb	r3, r3, #256
	str	r3, [r2, #12]
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L26+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2
	ldr	r1, .L26+60
	ldr	r2, .L26+64
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
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
	.word	100728832
	.word	spritesheetTiles
	.word	player
	.word	hideSprites
	.word	shadowOAM
	.word	currRegion
	.word	state
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
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r4, .L30+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L30+8
	mov	lr, pc
	bx	r4
	mov	r3, #944
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L30+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L30+16
	ldr	r1, .L30+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L30+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L30+28
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L30+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
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
	ldr	r3, .L34
	mov	lr, pc
	bx	r3
	ldr	r4, .L34+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L34+8
	mov	lr, pc
	bx	r4
	mov	r3, #752
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L34+16
	ldr	r1, .L34+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L34+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L34+28
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L34+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
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
	ldr	r3, .L43
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L36
	ldr	r3, .L43+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L42
.L36:
	pop	{r4, lr}
	bx	lr
.L42:
	pop	{r4, lr}
	b	goToStart
.L44:
	.align	2
.L43:
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
	ldr	r3, .L47
	mov	lr, pc
	bx	r3
	ldr	r4, .L47+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L47+8
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L47+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L47+16
	ldr	r1, .L47+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L47+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L47+28
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L47+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
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
	ldr	r3, .L62
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
	ldr	r3, .L62+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
.L50:
	ldr	r3, .L62+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L59
	ldr	r3, .L62+20
	ldr	r3, [r3, #12]
	cmp	r3, #0
	blt	.L60
.L52:
	ldr	r3, .L62+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L61
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	goToWin
.L59:
	bl	goToLose
	ldr	r3, .L62+20
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bge	.L52
.L60:
	bl	goToGame2
	b	.L52
.L58:
	bl	goToPause
	b	.L50
.L63:
	.align	2
.L62:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	health
	.word	player
	.word	enemiesRemaining
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
	ldr	r3, .L75
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
	ldr	r3, .L75+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
.L65:
	ldr	r3, .L75+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L73
.L66:
	ldr	r3, .L75+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L74
	pop	{r4, lr}
	bx	lr
.L74:
	pop	{r4, lr}
	b	goToWin
.L73:
	bl	goToLose
	b	.L66
.L72:
	bl	goToPause
	b	.L65
.L76:
	.align	2
.L75:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	health
	.word	enemiesRemaining
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
	ldr	r3, .L100
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L78
	ldr	r2, .L100+12
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L78
	ldr	r3, .L100+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L96
	pop	{r4, lr}
	b	goToGame2
.L78:
	tst	r3, #4
	beq	.L80
	ldr	r2, .L100+12
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L97
.L80:
	tst	r3, #2
	beq	.L81
	ldr	r2, .L100+12
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L98
.L81:
	tst	r3, #1
	beq	.L77
	ldr	r3, .L100+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L99
.L77:
	pop	{r4, lr}
	bx	lr
.L97:
	pop	{r4, lr}
	b	goToStart
.L98:
	pop	{r4, lr}
	b	goToLose
.L99:
	pop	{r4, lr}
	b	goToWin
.L96:
	pop	{r4, lr}
	b	goToGame1
.L101:
	.align	2
.L100:
	.word	waitForVBlank
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.word	currRegion
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
	mov	r0, #4352
	push	{r4, r7, fp, lr}
	strh	r2, [r3, #8]	@ movhi
	ldr	r4, .L114
	ldr	r8, .L114+4
	ldrh	r2, [r4, #48]
	strh	r0, [r3]	@ movhi
	ldr	r3, .L114+8
	strh	r2, [r8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L114+12
	ldr	r5, .L114+16
	ldr	fp, .L114+20
	ldr	r10, .L114+24
	ldr	r9, .L114+28
	ldr	r7, .L114+32
.L103:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L104:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L104
.L106:
	.word	.L110
	.word	.L109
	.word	.L108
	.word	.L107
	.word	.L105
	.word	.L105
.L105:
	mov	lr, pc
	bx	r7
	b	.L103
.L107:
	ldr	r3, .L114+36
	mov	lr, pc
	bx	r3
	b	.L103
.L108:
	mov	lr, pc
	bx	r9
	b	.L103
.L109:
	mov	lr, pc
	bx	r10
	b	.L103
.L110:
	mov	lr, pc
	bx	fp
	b	.L103
.L115:
	.align	2
.L114:
	.word	67109120
	.word	buttons
	.word	goToStart
	.word	state
	.word	oldButtons
	.word	start
	.word	game1
	.word	game2
	.word	win
	.word	pause
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
	.comm	currRegion,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
