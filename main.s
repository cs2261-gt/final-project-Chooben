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
	@ link register save eliminated.
	mov	r3, #0
	mov	r0, #67108864
	ldr	r1, .L3
	ldr	r2, .L3+4
	strh	r3, [r0]	@ movhi
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L4:
	.align	2
.L3:
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
	ldr	r1, .L6
	ldr	r2, .L6+4
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L7:
	.align	2
.L6:
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
	ldr	r4, .L15
	ldr	r3, [r4]
	ldr	r2, .L15+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L15+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L8
	ldr	r3, .L15+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
.L8:
	pop	{r4, lr}
	bx	lr
.L14:
	ldr	r0, [r4]
	ldr	r3, .L15+16
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L15+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L16:
	.align	2
.L15:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.size	start, .-start
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
	push	{r7, lr}
	mov	r7, #4
	ldr	r9, .L29
	ldr	r4, .L29+4
	ldr	r2, [r9]
	ldrh	r3, [r4]
	ldr	r8, .L29+8
	ldr	r6, .L29+12
	ldr	r10, .L29+16
	ldr	r5, .L29+20
.L21:
	strh	r3, [r8]	@ movhi
	ldrh	r1, [r5, #48]
	cmp	r2, #0
	mov	r0, r3
	strh	r1, [r4]	@ movhi
	mov	r3, r1
	beq	.L19
	cmp	r2, #1
	bne	.L21
	tst	r0, #8
	beq	.L23
	tst	r1, #8
	moveq	r2, #2
	streq	r2, [r9]
.L23:
	ldr	r2, [r10, #16]
	cmp	r2, #0
	moveq	r2, #4
	streq	r7, [r9]
	ldrne	r2, [r9]
	b	.L21
.L19:
	mov	lr, pc
	bx	r6
	ldr	r2, [r9]
	ldrh	r3, [r4]
	b	.L21
.L30:
	.align	2
.L29:
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	player
	.word	67109120
	.size	main, .-main
	.text
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
	ldr	r3, .L32
	str	r2, [r3]
	bx	lr
.L33:
	.align	2
.L32:
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
	@ link register save eliminated.
	ldr	r3, .L40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L35
	ldr	r3, .L40+4
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #2
	ldreq	r3, .L40+8
	streq	r2, [r3]
.L35:
	ldr	r3, .L40+12
	ldr	r3, [r3, #16]
	cmp	r3, #0
	moveq	r2, #4
	ldreq	r3, .L40+8
	streq	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	player
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
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L43
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
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
	@ link register save eliminated.
	bx	lr
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
	ldr	r3, .L47
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L51
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
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
	bx	lr
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
