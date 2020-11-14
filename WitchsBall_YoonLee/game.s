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
	.global	drawGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	ldr	r2, .L3
	ldr	r3, [r2, #4]
	ldrb	r0, [r2]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L3+4
	lsr	r3, r3, #23
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.word	shadowOAM
	.size	drawGame, .-drawGame
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
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L7
	mov	r0, #3
	ldr	r2, .L7+4
	ldr	r1, .L7+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L7+12
	ldr	r1, .L7+16
	mov	lr, pc
	bx	r4
	mov	r5, #4
	mov	r4, #8
	mov	lr, #3
	mov	r2, #2
	mov	ip, #5
	mov	r0, #108
	mov	r1, #116
	ldr	r3, .L7+20
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #52]
	stm	r3, {r0, r1, r2}
	str	ip, [r3, #56]
	str	r2, [r3, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	DMANow
	.word	83886592
	.word	testPlayerPal
	.word	100728832
	.word	testPlayerTiles
	.word	player
	.size	initPlayer, .-initPlayer
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
	push	{r4, lr}
	bl	initPlayer
	mov	lr, #4
	mov	ip, #8
	mov	r0, #3
	mov	r2, #0
	ldr	r3, .L15
	add	r1, r3, #520
.L10:
	str	lr, [r3, #20]
	str	ip, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	str	r2, [r3, #44]
	str	r2, [r3, #32]
	stm	r3, {r0, r2}
	add	r3, r3, #52
	cmp	r3, r1
	bne	.L10
	mov	r1, #4
	mov	ip, #3
	mov	r2, #0
	ldr	r3, .L15+4
	add	r0, r3, #2880
.L11:
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #44]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L11
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	enemyPool
	.word	generalBullets
	.size	initGame, .-initGame
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #8
	mov	lr, #4
	mov	r0, #3
	mov	r2, #0
	ldr	r3, .L21
	add	r1, r3, #520
.L18:
	str	lr, [r3, #20]
	str	ip, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	str	r2, [r3, #44]
	str	r2, [r3, #32]
	stm	r3, {r0, r2}
	add	r3, r3, #52
	cmp	r3, r1
	bne	.L18
	ldr	lr, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	enemyPool
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #4
	mov	ip, #3
	mov	r2, #0
	ldr	r3, .L27
	add	r0, r3, #2880
.L24:
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #44]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L24
	bx	lr
.L28:
	.align	2
.L27:
	.word	generalBullets
	.size	initBullets, .-initBullets
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
	@ link register save eliminated.
	ldr	r3, .L34
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L30
	ldr	r2, .L34+4
	ldr	r3, [r2]
	cmp	r3, #0
	ldrgt	r1, [r2, #8]
	subgt	r3, r3, r1
	strgt	r3, [r2]
.L30:
	ldr	r3, .L34
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L31
	ldr	r3, .L34+4
	ldr	r1, [r3]
	ldr	r2, [r3, #20]
	add	r2, r1, r2
	cmp	r2, #159
	ldrle	r2, [r3, #8]
	addle	r1, r2, r1
	strle	r1, [r3]
.L31:
	ldr	r3, .L34
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L32
	ldr	r2, .L34+4
	ldr	r3, [r2, #4]
	cmp	r3, #0
	ldrgt	r1, [r2, #12]
	subgt	r3, r3, r1
	strgt	r3, [r2, #4]
.L32:
	ldr	r3, .L34
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L34+4
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #16]
	add	r2, r1, r2
	cmp	r2, #239
	ldrle	r2, [r3, #12]
	addle	r1, r2, r1
	strle	r1, [r3, #4]
	bx	lr
.L35:
	.align	2
.L34:
	.word	67109120
	.word	player
	.size	updatePlayer, .-updatePlayer
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
	@ link register save eliminated.
	b	updatePlayer
	.size	updateGame, .-updateGame
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L48
	rsb	r6, r4, r4, lsl #3
	mov	r8, #0
	mov	r5, r0
	ldr	r7, .L48+4
	sub	sp, sp, #16
	rsb	r6, r6, r6, lsl #3
	b	.L41
.L39:
	add	r4, r4, #48
	cmp	r4, r6
	beq	.L47
.L41:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L39
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r8, [r4, #44]
	add	r4, r4, #48
	strne	r8, [r5, #40]
	cmp	r4, r6
	bne	.L41
.L47:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	generalBullets
	.word	collision
	.size	updateEnemy, .-updateEnemy
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
	bx	lr
	.size	updateBullet, .-updateBullet
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
	b	drawGame
	.size	drawPlayer, .-drawPlayer
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
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L53
	mov	ip, #51
	mov	r1, #23
	add	r2, r0, #32
	str	lr, [sp, #-4]!
	ldm	r2, {r2, lr}
	ldr	r3, .L59
	add	r2, r2, lr, lsl #5
	strh	r2, [r3, #12]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L53:
	mov	r2, #512
	ldr	r3, .L59
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L60:
	.align	2
.L59:
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	enemyPatternA
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyPatternA, %function
enemyPatternA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L71
	mov	r2, #0
	mov	r3, ip
	b	.L64
.L62:
	add	r2, r2, #1
	cmp	r2, #60
	add	r3, r3, #48
	bxeq	lr
.L64:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	bne	.L62
	ldr	r1, [r3, #24]
	cmp	r1, #0
	bne	.L62
	push	{r4, r5, lr}
	mov	r4, #1
	ldr	r3, .L71+4
	ldr	r1, [r3, #16]
	add	r2, r2, r2, lsl r4
	ldr	r3, [r0, #4]
	ldr	r5, [r0, #20]
	ldr	lr, [r0]
	add	r1, r1, r1, lsr #31
	add	r0, ip, r2, lsl #4
	add	r3, r3, r1, asr r4
	ldr	r1, [r0, #16]
	add	r1, r1, r1, lsr #31
	add	lr, lr, r5
	sub	r3, r3, r1, asr r4
	str	lr, [ip, r2, lsl #4]
	str	r4, [r0, #44]
	str	r3, [r0, #4]
	pop	{r4, r5, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	generalBullets
	.word	player
	.size	enemyPatternA, .-enemyPatternA
	.align	2
	.global	enemyPatternB
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyPatternB, %function
enemyPatternB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L80
	ldr	r1, [r0, #20]
	ldr	r2, [r2, #16]
	push	{r4, r5, lr}
	ldr	r5, [r0]
	ldr	r4, [r0, #4]
	add	r1, r1, r1, lsr #31
	add	r2, r2, r2, lsr #31
	ldr	lr, .L80+4
	add	r5, r5, r1, asr #1
	add	r4, r4, r2, asr #1
.L77:
	mov	r2, #0
	ldr	r3, .L80+4
	b	.L76
.L75:
	add	r2, r2, #1
	cmp	r2, #60
	add	r3, r3, #48
	beq	.L77
.L76:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	bne	.L75
	ldr	r0, [r3, #24]
	cmp	r0, #1
	bne	.L75
	add	r2, r2, r2, lsl #1
	add	ip, lr, r2, lsl #4
	ldr	r3, [ip, #16]
	add	r3, r3, r3, lsr #31
	sub	r3, r4, r3, asr #1
	str	r5, [lr, r2, lsl #4]
	str	r0, [ip, #8]
	str	r1, [ip, #12]
	str	r0, [ip, #44]
	str	r3, [ip, #4]
	b	.L77
.L81:
	.align	2
.L80:
	.word	player
	.word	generalBullets
	.size	enemyPatternB, .-enemyPatternB
	.align	2
	.global	enemyAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyAttack, %function
enemyAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #40]
	cmp	r2, #0
	bxeq	lr
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L91
	cmp	r3, #1
	bxne	lr
	push	{r4, lr}
	bl	enemyPatternB
.L91:
	b	enemyPatternA
	.size	enemyAttack, .-enemyAttack
	.align	2
	.global	enemyPatternC
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyPatternC, %function
enemyPatternC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	enemyPatternC, .-enemyPatternC
	.align	2
	.global	enemyPatternD
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyPatternD, %function
enemyPatternD:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	enemyPatternD, .-enemyPatternD
	.comm	enemyPool,520,4
	.comm	generalBullets,2880,4
	.comm	playerBullets,144,4
	.comm	player,60,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
