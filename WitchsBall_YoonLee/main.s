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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #128
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startscnPal
	.word	startscnTiles
	.word	100720640
	.word	startscnMap
	.word	hideSprites
	.word	waitForVBlank
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
	mov	r0, #4352
	mov	r1, #7168
	mov	r2, #0
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r0, .L7
	ldr	r1, .L7+4
	ldrh	r0, [r0, #48]
	ldr	r3, .L7+8
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L11
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L11+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	ldr	r4, .L20+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L20+8
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L20+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L20+16
	ldr	r1, .L20+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L20+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L13
	ldr	r3, .L20+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	pop	{r4, lr}
	b	goToStart
.L21:
	.align	2
.L20:
	.word	hideSprites
	.word	DMANow
	.word	instrscnPal
	.word	instrscnTiles
	.word	100720640
	.word	instrscnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
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
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L24
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L24+4
	mov	lr, pc
	bx	r4
	mov	r3, #144
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L24+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L24+12
	mov	r0, #3
	ldr	r1, .L24+16
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L24+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	DMANow
	.word	gamescnPal
	.word	gamescnTiles
	.word	100720640
	.word	gamescnMap
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
	ldr	r4, .L38
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L38+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L36
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
.L26:
	pop	{r4, lr}
	bx	lr
.L36:
	bl	goToGame
	ldr	r2, .L38+12
	ldr	r3, .L38+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L37:
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+20
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L38+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	initGame
	.word	flipPage
	.size	start, .-start
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+4
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L57+12
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L57+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r2, .L57+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L54
.L41:
	tst	r3, #1
	beq	.L43
	ldr	r2, .L57+24
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L55
.L43:
	tst	r3, #2
	beq	.L40
	ldr	r3, .L57+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L56
.L40:
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L57+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L55:
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L57+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L56:
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L57+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	flipPage
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
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L61+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L62:
	.align	2
.L61:
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, lr}
	ldr	r3, .L75
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #7168
	ldr	r4, .L75+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r1, .L75+8
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #96
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L75+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L75+16
	ldr	r1, .L75+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L75+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
	ldr	r2, .L75+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L73
.L64:
	tst	r3, #4
	beq	.L63
	ldr	r3, .L75+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L74
.L63:
	pop	{r4, lr}
	bx	lr
.L73:
	pop	{r4, lr}
	b	goToGame
.L74:
	pop	{r4, lr}
	b	goToStart
.L76:
	.align	2
.L75:
	.word	hideSprites
	.word	DMANow
	.word	pausescnPal
	.word	pausescnTiles
	.word	100720640
	.word	pausescnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
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
	push	{r4, lr}
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+4
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L79+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L80:
	.align	2
.L79:
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, lr}
	ldr	r3, .L88
	mov	lr, pc
	bx	r3
	ldr	r4, .L88+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L88+8
	mov	lr, pc
	bx	r4
	mov	r3, #144
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L88+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L88+16
	ldr	r1, .L88+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7168
	mov	r1, #256
	strh	r2, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	ldr	r2, .L88+24
	mov	lr, pc
	bx	r2
	ldr	r3, .L88+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
	ldr	r3, .L88+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
.L81:
	pop	{r4, lr}
	bx	lr
.L87:
	pop	{r4, lr}
	b	goToStart
.L89:
	.align	2
.L88:
	.word	hideSprites
	.word	DMANow
	.word	winscnPal
	.word	winscnTiles
	.word	100720640
	.word	winscnMap
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
	ldr	r3, .L92
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+4
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L92+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L93:
	.align	2
.L92:
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, lr}
	ldr	r3, .L101
	mov	lr, pc
	bx	r3
	ldr	r4, .L101+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L101+8
	mov	lr, pc
	bx	r4
	mov	r3, #112
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L101+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L101+16
	ldr	r1, .L101+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7168
	mov	r1, #256
	strh	r2, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	ldr	r2, .L101+24
	mov	lr, pc
	bx	r2
	ldr	r3, .L101+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L94
	ldr	r3, .L101+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L100
.L94:
	pop	{r4, lr}
	bx	lr
.L100:
	pop	{r4, lr}
	b	goToStart
.L102:
	.align	2
.L101:
	.word	hideSprites
	.word	DMANow
	.word	losescnPal
	.word	losescnTiles
	.word	100720640
	.word	losescnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L116
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #4352
	mov	r1, #7168
	mov	r2, #0
	strh	r0, [r3]	@ movhi
	ldr	r4, .L116+4
	strh	r1, [r3, #8]	@ movhi
	ldr	r7, .L116+8
	ldrh	r0, [r4, #48]
	ldr	r5, .L116+12
	ldr	r3, .L116+16
	strh	r0, [r7]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L116+20
	ldr	fp, .L116+24
	ldr	r10, .L116+28
	ldr	r9, .L116+32
	ldr	r8, .L116+36
.L104:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L105:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L105
.L107:
	.word	.L112
	.word	.L111
	.word	.L110
	.word	.L109
	.word	.L108
	.word	.L106
.L106:
	ldr	r3, .L116+40
	mov	lr, pc
	bx	r3
	b	.L104
.L108:
	ldr	r3, .L116+44
	mov	lr, pc
	bx	r3
	b	.L104
.L109:
	mov	lr, pc
	bx	r8
	b	.L104
.L110:
	mov	lr, pc
	bx	r9
	b	.L104
.L111:
	mov	lr, pc
	bx	r10
	b	.L104
.L112:
	mov	lr, pc
	bx	fp
	b	.L104
.L117:
	.align	2
.L116:
	.word	hideSprites
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	instructions
	.word	game
	.word	pause
	.word	lose
	.word	win
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
