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
	ldr	r3, .L20+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame1
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
	ldr	r3, .L24
	ldr	r4, .L24+4
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L24+8
	mov	lr, pc
	bx	r4
	mov	r3, #320
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L24+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L24+16
	ldr	r1, .L24+20
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r5, .L24+24
	ldr	r3, .L24+28
	ldrh	r1, [r5]
	ldrh	r3, [r3]
	mov	r0, #3
	strh	r3, [r2, #18]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L24+32
	ldr	r1, .L24+36
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L24+40
	ldr	r1, .L24+44
	mov	lr, pc
	bx	r4
	ldr	r1, .L24+48
	ldr	r2, [r5]
	ldr	r3, [r1, #24]
	add	r2, r2, #8
	rsb	r3, r3, #256
	ldr	r0, .L24+52
	str	r2, [r5]
	str	r3, [r1, #12]
	mov	lr, pc
	bx	r0
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L24+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2
	ldr	r1, .L24+60
	ldr	r2, .L24+64
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	waitForVBlank
	.word	DMANow
	.word	region2Pal
	.word	region2Tiles
	.word	100726784
	.word	region2Map
	.word	hOff
	.word	vOff
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
	mov	r3, #944
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
	ldr	r3, .L32
	mov	lr, pc
	bx	r3
	ldr	r4, .L32+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L32+8
	mov	lr, pc
	bx	r4
	mov	r3, #752
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L32+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L32+16
	ldr	r1, .L32+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L32+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L32+28
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L32+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L33:
	.align	2
.L32:
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
	ldr	r3, .L41
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L34
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
.L34:
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToStart
.L42:
	.align	2
.L41:
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
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L45+8
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L45+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L45+16
	ldr	r1, .L45+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L45+24
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L45+28
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L45+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L46:
	.align	2
.L45:
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
	ldr	r3, .L60
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
	ldr	r3, .L60+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
.L48:
	ldr	r3, .L60+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L57
	ldr	r3, .L60+20
	ldr	r3, [r3, #12]
	cmp	r3, #0
	blt	.L58
.L50:
	ldr	r3, .L60+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L59
	pop	{r4, lr}
	bx	lr
.L59:
	pop	{r4, lr}
	b	goToWin
.L57:
	bl	goToLose
	ldr	r3, .L60+20
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bge	.L50
.L58:
	bl	goToGame2
	b	.L50
.L56:
	bl	goToPause
	b	.L48
.L61:
	.align	2
.L60:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	playerHealth
	.word	player
	.word	badHealth
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
	ldr	r3, .L73
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
	ldr	r3, .L73+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
.L63:
	ldr	r3, .L73+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L71
.L64:
	ldr	r3, .L73+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L72
	pop	{r4, lr}
	bx	lr
.L72:
	pop	{r4, lr}
	b	goToWin
.L71:
	bl	goToLose
	b	.L64
.L70:
	bl	goToPause
	b	.L63
.L74:
	.align	2
.L73:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	playerHealth
	.word	badHealth
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
	ldr	r3, .L98
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
	ldr	r2, .L98+12
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L76
	ldr	r3, .L98+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L94
	pop	{r4, lr}
	b	goToGame2
.L76:
	tst	r3, #4
	beq	.L78
	ldr	r2, .L98+12
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L95
.L78:
	tst	r3, #2
	beq	.L79
	ldr	r2, .L98+12
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L96
.L79:
	tst	r3, #1
	beq	.L75
	ldr	r3, .L98+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L97
.L75:
	pop	{r4, lr}
	bx	lr
.L95:
	pop	{r4, lr}
	b	goToStart
.L96:
	pop	{r4, lr}
	b	goToLose
.L97:
	pop	{r4, lr}
	b	goToWin
.L94:
	pop	{r4, lr}
	b	goToGame1
.L99:
	.align	2
.L98:
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
	ldr	r4, .L112
	ldr	r8, .L112+4
	ldrh	r2, [r4, #48]
	strh	r0, [r3]	@ movhi
	ldr	r3, .L112+8
	strh	r2, [r8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L112+12
	ldr	r5, .L112+16
	ldr	fp, .L112+20
	ldr	r10, .L112+24
	ldr	r9, .L112+28
	ldr	r7, .L112+32
.L101:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L102:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L102
.L104:
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L105
	.word	.L103
	.word	.L103
.L103:
	mov	lr, pc
	bx	r7
	b	.L101
.L105:
	ldr	r3, .L112+36
	mov	lr, pc
	bx	r3
	b	.L101
.L106:
	mov	lr, pc
	bx	r9
	b	.L101
.L107:
	mov	lr, pc
	bx	r10
	b	.L101
.L108:
	mov	lr, pc
	bx	fp
	b	.L101
.L113:
	.align	2
.L112:
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
