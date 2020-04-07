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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #67108864
	mov	r4, #0
	ldr	r3, .L4
	strh	r4, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+4
	ldr	r3, .L4+8
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	initGame
	.word	seed
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L7
	ldr	r2, .L7+4
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L8:
	.align	2
.L7:
	.word	seed
	.word	state
	.size	goToStart, .-goToStart
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
	ldr	r4, .L16
	ldr	r3, [r4]
	ldr	r2, .L16+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
.L9:
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r0, [r4]
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.size	start, .-start
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
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L19
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r4, .L29
	mov	lr, pc
	bx	r4
	ldr	r3, .L29+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
	ldr	r3, .L29+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
.L22:
	ldr	r3, .L29+12
	ldr	r3, [r3, #16]
	cmp	r3, #0
	moveq	r2, #4
	ldreq	r3, .L29+16
	pop	{r4, lr}
	streq	r2, [r3]
	bx	lr
.L28:
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L29+16
	str	r2, [r3]
	b	.L22
.L30:
	.align	2
.L29:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	player
	.word	state
	.size	game, .-game
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
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L33+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
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
	ldr	r3, .L45
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L36
	ldr	r2, .L45+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L36
	mov	r2, #1
	ldr	r3, .L45+12
	str	r2, [r3]
.L35:
	pop	{r4, lr}
	bx	lr
.L36:
	tst	r3, #4
	beq	.L35
	ldr	r3, .L45+8
	ldrh	r3, [r3]
	ands	r3, r3, #4
	ldreq	r1, .L45+16
	ldreq	r2, .L45+12
	streq	r3, [r1]
	streq	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	seed
	.size	pause, .-pause
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
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L48
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
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
	ldr	r3, .L56
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
	ldr	r3, .L56+8
	ldrh	r3, [r3]
	ands	r3, r3, #8
	ldreq	r1, .L56+12
	ldreq	r2, .L56+16
	streq	r3, [r1]
	streq	r3, [r2]
.L50:
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	state
	.size	win, .-win
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
	mov	r2, #67108864
	mov	r4, #0
	ldr	r3, .L69
	strh	r4, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L69+4
	ldr	r3, .L69+8
	mov	r2, r4
	str	r4, [r6]
	str	r4, [r3]
	ldr	fp, .L69+12
	ldr	r5, .L69+16
	ldr	r10, .L69+20
	ldr	r9, .L69+24
	ldr	r8, .L69+28
	ldr	r7, .L69+32
	ldr	r4, .L69+36
.L59:
	ldrh	r3, [fp]
.L60:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L60
.L62:
	.word	.L65
	.word	.L64
	.word	.L63
	.word	.L61
	.word	.L61
.L61:
	mov	lr, pc
	bx	r7
.L66:
	ldr	r2, [r6]
	b	.L59
.L63:
	mov	lr, pc
	bx	r8
	b	.L66
.L64:
	mov	lr, pc
	bx	r9
	b	.L66
.L65:
	mov	lr, pc
	bx	r10
	b	.L66
.L70:
	.align	2
.L69:
	.word	initGame
	.word	state
	.word	seed
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L72
	str	r2, [r3]
	bx	lr
.L73:
	.align	2
.L72:
	.word	state
	.size	goToLose, .-goToLose
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
