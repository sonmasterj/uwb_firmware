	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"nrf_drv_spi.c"
	.text
.Ltext0:
	.section	.text.__NVIC_DisableIRQ,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_DisableIRQ, %function
__NVIC_DisableIRQ:
.LFB107:
	.file 1 "C:/Users/Admin/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/CMSIS_5/CMSIS/Core/Include/core_cm4.h"
	.loc 1 1725 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI0:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 1726 6
	ldrsb	r3, [sp, #7]
	cmp	r3, #0
	blt	.L3
	.loc 1 1728 81
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r2, r3, #31
	.loc 1 1728 9
	ldr	r1, .L4
	.loc 1 1728 18
	ldrsb	r3, [sp, #7]
	.loc 1 1728 34
	lsrs	r3, r3, #5
	.loc 1 1728 60
	movs	r0, #1
	lsl	r2, r0, r2
	.loc 1 1728 43
	adds	r3, r3, #32
	str	r2, [r1, r3, lsl #2]
.LBB6:
.LBB7:
	.file 2 "C:/Users/Admin/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
	.loc 2 879 3
	.syntax unified
@ 879 "C:/Users/Admin/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE7:
.LBE6:
.LBB8:
.LBB9:
	.loc 2 868 3
	.syntax unified
@ 868 "C:/Users/Admin/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.L3:
.LBE9:
.LBE8:
	.loc 1 1732 1
	nop
	add	sp, sp, #8
.LCFI1:
	@ sp needed
	bx	lr
.L5:
	.align	2
.L4:
	.word	-536813312
.LFE107:
	.size	__NVIC_DisableIRQ, .-__NVIC_DisableIRQ
	.section	.text.nrf_spi_event_clear,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_event_clear, %function
nrf_spi_event_clear:
.LFB147:
	.file 3 "../../../nRF5_SDK_14.2.0/components/drivers_nrf/hal/nrf_spi.h"
	.loc 3 260 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI2:
	str	r0, [sp, #4]
	mov	r3, r1
	strh	r3, [sp, #2]	@ movhi
	.loc 3 261 48
	ldrh	r3, [sp, #2]
	.loc 3 261 7
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	.loc 3 261 70
	movs	r2, #0
	str	r2, [r3]
	.loc 3 263 74
	ldrh	r3, [sp, #2]
	.loc 3 263 33
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	.loc 3 263 31
	ldr	r3, [r3]
	.loc 3 263 23
	str	r3, [sp, #12]
	.loc 3 264 5
	ldr	r3, [sp, #12]
	.loc 3 266 1
	nop
	add	sp, sp, #16
.LCFI3:
	@ sp needed
	bx	lr
.LFE147:
	.size	nrf_spi_event_clear, .-nrf_spi_event_clear
	.section	.text.nrf_spi_event_check,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_event_check, %function
nrf_spi_event_check:
.LFB148:
	.loc 3 270 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI4:
	str	r0, [sp, #4]
	mov	r3, r1
	strh	r3, [sp, #2]	@ movhi
	.loc 3 271 60
	ldrh	r3, [sp, #2]
	.loc 3 271 19
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	.loc 3 271 18
	ldr	r3, [r3]
	.loc 3 271 12
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	.loc 3 272 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI5:
	@ sp needed
	bx	lr
.LFE148:
	.size	nrf_spi_event_check, .-nrf_spi_event_check
	.section	.text.nrf_spi_int_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_int_enable, %function
nrf_spi_int_enable:
.LFB150:
	.loc 3 282 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI6:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 3 283 21
	ldr	r3, [sp, #4]
	ldr	r2, [sp]
	str	r2, [r3, #772]
	.loc 3 284 1
	nop
	add	sp, sp, #8
.LCFI7:
	@ sp needed
	bx	lr
.LFE150:
	.size	nrf_spi_int_enable, .-nrf_spi_int_enable
	.section	.text.nrf_spi_int_disable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_int_disable, %function
nrf_spi_int_disable:
.LFB151:
	.loc 3 288 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI8:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 3 289 21
	ldr	r3, [sp, #4]
	ldr	r2, [sp]
	str	r2, [r3, #776]
	.loc 3 290 1
	nop
	add	sp, sp, #8
.LCFI9:
	@ sp needed
	bx	lr
.LFE151:
	.size	nrf_spi_int_disable, .-nrf_spi_int_disable
	.section	.text.nrf_spi_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_enable, %function
nrf_spi_enable:
.LFB153:
	.loc 3 299 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI10:
	str	r0, [sp, #4]
	.loc 3 300 19
	ldr	r3, [sp, #4]
	movs	r2, #1
	str	r2, [r3, #1280]
	.loc 3 301 1
	nop
	add	sp, sp, #8
.LCFI11:
	@ sp needed
	bx	lr
.LFE153:
	.size	nrf_spi_enable, .-nrf_spi_enable
	.section	.text.nrf_spi_disable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_disable, %function
nrf_spi_disable:
.LFB154:
	.loc 3 304 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI12:
	str	r0, [sp, #4]
	.loc 3 305 19
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #1280]
	.loc 3 306 1
	nop
	add	sp, sp, #8
.LCFI13:
	@ sp needed
	bx	lr
.LFE154:
	.size	nrf_spi_disable, .-nrf_spi_disable
	.section	.text.nrf_spi_pins_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_pins_set, %function
nrf_spi_pins_set:
.LFB155:
	.loc 3 312 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI14:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 3 313 21
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #8]
	str	r2, [r3, #1288]
	.loc 3 314 21
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #4]
	str	r2, [r3, #1292]
	.loc 3 315 21
	ldr	r3, [sp, #12]
	ldr	r2, [sp]
	str	r2, [r3, #1296]
	.loc 3 316 1
	nop
	add	sp, sp, #16
.LCFI15:
	@ sp needed
	bx	lr
.LFE155:
	.size	nrf_spi_pins_set, .-nrf_spi_pins_set
	.section	.text.nrf_spi_txd_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_txd_set, %function
nrf_spi_txd_set:
.LFB156:
	.loc 3 319 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI16:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 3 320 16
	ldrb	r2, [sp, #3]	@ zero_extendqisi2
	ldr	r3, [sp, #4]
	str	r2, [r3, #1308]
	.loc 3 321 1
	nop
	add	sp, sp, #8
.LCFI17:
	@ sp needed
	bx	lr
.LFE156:
	.size	nrf_spi_txd_set, .-nrf_spi_txd_set
	.section	.text.nrf_spi_rxd_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_rxd_get, %function
nrf_spi_rxd_get:
.LFB157:
	.loc 3 324 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI18:
	str	r0, [sp, #4]
	.loc 3 325 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #1304]
	uxtb	r3, r3
	.loc 3 326 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI19:
	@ sp needed
	bx	lr
.LFE157:
	.size	nrf_spi_rxd_get, .-nrf_spi_rxd_get
	.section	.text.nrf_spi_frequency_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_frequency_set, %function
nrf_spi_frequency_set:
.LFB158:
	.loc 3 330 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI20:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 3 331 22
	ldr	r2, [sp]
	ldr	r3, [sp, #4]
	str	r2, [r3, #1316]
	.loc 3 332 1
	nop
	add	sp, sp, #8
.LCFI21:
	@ sp needed
	bx	lr
.LFE158:
	.size	nrf_spi_frequency_set, .-nrf_spi_frequency_set
	.section	.text.nrf_spi_configure,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_spi_configure, %function
nrf_spi_configure:
.LFB159:
	.loc 3 337 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI22:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	mov	r3, r2
	strb	r3, [sp, #2]
	.loc 3 339 35
	ldrb	r3, [sp, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	.loc 3 338 14
	str	r3, [sp, #12]
	.loc 3 340 5
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L19
	cmp	r3, #3
	beq	.L20
	cmp	r3, #1
	bne	.L23
	.loc 3 349 16
	ldr	r3, [sp, #12]
	orr	r3, r3, #2
	str	r3, [sp, #12]
	.loc 3 351 9
	b	.L22
.L19:
	.loc 3 354 16
	ldr	r3, [sp, #12]
	orr	r3, r3, #4
	str	r3, [sp, #12]
	.loc 3 356 9
	b	.L22
.L20:
	.loc 3 359 16
	ldr	r3, [sp, #12]
	orr	r3, r3, #6
	str	r3, [sp, #12]
	.loc 3 361 9
	b	.L22
.L23:
	.loc 3 346 9
	nop
.L22:
	.loc 3 363 19
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #12]
	str	r2, [r3, #1364]
	.loc 3 364 1
	nop
	add	sp, sp, #16
.LCFI23:
	@ sp needed
	bx	lr
.LFE159:
	.size	nrf_spi_configure, .-nrf_spi_configure
	.section	.text.nrf_drv_common_irq_disable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_drv_common_irq_disable, %function
nrf_drv_common_irq_disable:
.LFB184:
	.file 4 "../../../nRF5_SDK_14.2.0/components/drivers_nrf/common/nrf_drv_common.h"
	.loc 4 302 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI24:
	sub	sp, sp, #12
.LCFI25:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 4 303 5
	ldrsb	r3, [sp, #7]
	mov	r0, r3
	bl	__NVIC_DisableIRQ
	.loc 4 304 1
	nop
	add	sp, sp, #12
.LCFI26:
	@ sp needed
	ldr	pc, [sp], #4
.LFE184:
	.size	nrf_drv_common_irq_disable, .-nrf_drv_common_irq_disable
	.section	.text.nrf_gpio_pin_port_decode,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_gpio_pin_port_decode, %function
nrf_gpio_pin_port_decode:
.LFB190:
	.file 5 "../../../nRF5_SDK_14.2.0/components/drivers_nrf/hal/nrf_gpio.h"
	.loc 5 463 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI27:
	str	r0, [sp, #4]
	.loc 5 467 12
	mov	r3, #1342177280
	.loc 5 479 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI28:
	@ sp needed
	bx	lr
.LFE190:
	.size	nrf_gpio_pin_port_decode, .-nrf_gpio_pin_port_decode
	.section	.text.nrf_gpio_cfg,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_gpio_cfg, %function
nrf_gpio_cfg:
.LFB193:
	.loc 5 511 1
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI29:
	sub	sp, sp, #20
.LCFI30:
	str	r0, [sp, #4]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r0
	strb	r3, [sp, #3]
	mov	r3, r1
	strb	r3, [sp, #2]
	mov	r3, r2
	strb	r3, [sp, #1]
	.loc 5 512 27
	add	r3, sp, #4
	mov	r0, r3
	bl	nrf_gpio_pin_port_decode
	str	r0, [sp, #12]
	.loc 5 514 47
	ldrb	r2, [sp, #3]	@ zero_extendqisi2
	.loc 5 515 35
	ldrb	r3, [sp, #2]	@ zero_extendqisi2
	.loc 5 515 51
	lsls	r3, r3, #1
	.loc 5 515 32
	orrs	r2, r2, r3
	.loc 5 516 35
	ldrb	r3, [sp, #1]	@ zero_extendqisi2
	.loc 5 516 50
	lsls	r3, r3, #2
	.loc 5 516 32
	orrs	r2, r2, r3
	.loc 5 517 35
	ldrb	r3, [sp, #24]	@ zero_extendqisi2
	.loc 5 517 51
	lsls	r3, r3, #8
	.loc 5 517 32
	orr	r1, r2, r3
	.loc 5 518 35
	ldrb	r3, [sp, #28]	@ zero_extendqisi2
	.loc 5 518 51
	lsls	r3, r3, #16
	.loc 5 514 17
	ldr	r2, [sp, #4]
	.loc 5 518 32
	orrs	r1, r1, r3
	.loc 5 514 30
	ldr	r3, [sp, #12]
	add	r2, r2, #448
	str	r1, [r3, r2, lsl #2]
	.loc 5 519 1
	nop
	add	sp, sp, #20
.LCFI31:
	@ sp needed
	ldr	pc, [sp], #4
.LFE193:
	.size	nrf_gpio_cfg, .-nrf_gpio_cfg
	.section	.text.nrf_gpio_cfg_output,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_gpio_cfg_output, %function
nrf_gpio_cfg_output:
.LFB194:
	.loc 5 523 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI32:
	sub	sp, sp, #20
.LCFI33:
	str	r0, [sp, #12]
	.loc 5 524 5
	movs	r3, #0
	str	r3, [sp, #4]
	movs	r3, #0
	str	r3, [sp]
	movs	r3, #0
	movs	r2, #1
	movs	r1, #1
	ldr	r0, [sp, #12]
	bl	nrf_gpio_cfg
	.loc 5 531 1
	nop
	add	sp, sp, #20
.LCFI34:
	@ sp needed
	ldr	pc, [sp], #4
.LFE194:
	.size	nrf_gpio_cfg_output, .-nrf_gpio_cfg_output
	.section	.text.nrf_gpio_cfg_input,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_gpio_cfg_input, %function
nrf_gpio_cfg_input:
.LFB195:
	.loc 5 535 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI35:
	sub	sp, sp, #20
.LCFI36:
	str	r0, [sp, #12]
	mov	r3, r1
	strb	r3, [sp, #11]
	.loc 5 536 5
	ldrb	r2, [sp, #11]	@ zero_extendqisi2
	movs	r3, #0
	str	r3, [sp, #4]
	movs	r3, #0
	str	r3, [sp]
	mov	r3, r2
	movs	r2, #0
	movs	r1, #0
	ldr	r0, [sp, #12]
	bl	nrf_gpio_cfg
	.loc 5 543 1
	nop
	add	sp, sp, #20
.LCFI37:
	@ sp needed
	ldr	pc, [sp], #4
.LFE195:
	.size	nrf_gpio_cfg_input, .-nrf_gpio_cfg_input
	.section	.text.nrf_gpio_pin_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_gpio_pin_set, %function
nrf_gpio_pin_set:
.LFB202:
	.loc 5 623 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI38:
	sub	sp, sp, #20
.LCFI39:
	str	r0, [sp, #4]
	.loc 5 624 27
	add	r3, sp, #4
	mov	r0, r3
	bl	nrf_gpio_pin_port_decode
	str	r0, [sp, #12]
	.loc 5 626 5
	ldr	r3, [sp, #4]
	.loc 5 626 36
	movs	r2, #1
	lsl	r3, r2, r3
	.loc 5 626 5
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	nrf_gpio_port_out_set
	.loc 5 627 1
	nop
	add	sp, sp, #20
.LCFI40:
	@ sp needed
	ldr	pc, [sp], #4
.LFE202:
	.size	nrf_gpio_pin_set, .-nrf_gpio_pin_set
	.section	.text.nrf_gpio_pin_clear,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_gpio_pin_clear, %function
nrf_gpio_pin_clear:
.LFB203:
	.loc 5 631 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI41:
	sub	sp, sp, #20
.LCFI42:
	str	r0, [sp, #4]
	.loc 5 632 27
	add	r3, sp, #4
	mov	r0, r3
	bl	nrf_gpio_pin_port_decode
	str	r0, [sp, #12]
	.loc 5 634 5
	ldr	r3, [sp, #4]
	.loc 5 634 38
	movs	r2, #1
	lsl	r3, r2, r3
	.loc 5 634 5
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	nrf_gpio_port_out_clear
	.loc 5 635 1
	nop
	add	sp, sp, #20
.LCFI43:
	@ sp needed
	ldr	pc, [sp], #4
.LFE203:
	.size	nrf_gpio_pin_clear, .-nrf_gpio_pin_clear
	.section	.text.nrf_gpio_port_out_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_gpio_port_out_set, %function
nrf_gpio_port_out_set:
.LFB216:
	.loc 5 729 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI44:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 5 730 19
	ldr	r3, [sp, #4]
	ldr	r2, [sp]
	str	r2, [r3, #1288]
	.loc 5 731 1
	nop
	add	sp, sp, #8
.LCFI45:
	@ sp needed
	bx	lr
.LFE216:
	.size	nrf_gpio_port_out_set, .-nrf_gpio_port_out_set
	.section	.text.nrf_gpio_port_out_clear,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_gpio_port_out_clear, %function
nrf_gpio_port_out_clear:
.LFB217:
	.loc 5 735 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI46:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 5 736 19
	ldr	r3, [sp, #4]
	ldr	r2, [sp]
	str	r2, [r3, #1292]
	.loc 5 737 1
	nop
	add	sp, sp, #8
.LCFI47:
	@ sp needed
	bx	lr
.LFE217:
	.size	nrf_gpio_port_out_clear, .-nrf_gpio_port_out_clear
	.section	.bss.m_cb,"aw",%nobits
	.align	2
	.type	m_cb, %object
	.size	m_cb, 36
m_cb:
	.space	36
	.section	.text.nrf_drv_spi_init,"ax",%progbits
	.align	1
	.global	nrf_drv_spi_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_drv_spi_init, %function
nrf_drv_spi_init:
.LFB222:
	.file 6 "E:\\WSC_FTSP_ver_onemess\\WSC_FTSP\\WCS_v2_systick_TDMA_demo_20_09\\WCS_v2_systick_TDMA\\nRF5_SDK_14.2.0\\components\\drivers_nrf\\spi_master\\nrf_drv_spi.c"
	.loc 6 167 1
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI48:
	sub	sp, sp, #52
.LCFI49:
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	.loc 6 169 51
	ldr	r3, [sp, #20]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	mov	r2, r3
	.loc 6 169 27
	mov	r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L46
	add	r3, r3, r2
	str	r3, [sp, #36]
	.loc 6 172 13
	ldr	r3, [sp, #36]
	ldrb	r3, [r3, #28]	@ zero_extendqisi2
	.loc 6 172 8
	cmp	r3, #0
	beq	.L35
	.loc 6 174 18
	movs	r3, #8
	str	r3, [sp, #32]
	.loc 6 178 16
	ldr	r3, [sp, #32]
	b	.L36
.L35:
	.loc 6 193 19
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #12]
	str	r2, [r3]
	.loc 6 194 21
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #8]
	str	r2, [r3, #4]
	.loc 6 203 17
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	.loc 6 203 8
	cmp	r3, #1
	bhi	.L37
	.loc 6 205 36
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 6 205 9
	mov	r0, r3
	bl	nrf_gpio_pin_clear
	b	.L38
.L37:
	.loc 6 209 34
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 6 209 9
	mov	r0, r3
	bl	nrf_gpio_pin_set
.L38:
	.loc 6 211 26
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 6 211 5
	mov	r0, r3
	movs	r3, #0
	str	r3, [sp, #4]
	movs	r3, #0
	str	r3, [sp]
	movs	r3, #0
	movs	r2, #0
	movs	r1, #1
	bl	nrf_gpio_cfg
	.loc 6 218 17
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	.loc 6 218 8
	cmp	r3, #255
	beq	.L39
	.loc 6 220 28
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	.loc 6 220 18
	str	r3, [sp, #44]
	.loc 6 221 9
	ldr	r0, [sp, #44]
	bl	nrf_gpio_pin_clear
	.loc 6 222 9
	ldr	r0, [sp, #44]
	bl	nrf_gpio_cfg_output
	b	.L40
.L39:
	.loc 6 226 18
	mov	r3, #-1
	str	r3, [sp, #44]
.L40:
	.loc 6 229 17
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 6 229 8
	cmp	r3, #255
	beq	.L41
	.loc 6 231 28
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 6 231 18
	str	r3, [sp, #40]
	.loc 6 232 9
	movs	r1, #1
	ldr	r0, [sp, #40]
	bl	nrf_gpio_cfg_input
	b	.L42
.L41:
	.loc 6 236 18
	mov	r3, #-1
	str	r3, [sp, #40]
.L42:
	.loc 6 239 17
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	.loc 6 239 8
	cmp	r3, #255
	beq	.L43
	.loc 6 241 34
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	.loc 6 241 9
	mov	r0, r3
	bl	nrf_gpio_pin_set
	.loc 6 242 37
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	.loc 6 242 9
	mov	r0, r3
	bl	nrf_gpio_cfg_output
.L43:
	.loc 6 244 20
	ldr	r3, [sp, #20]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	mov	r1, r3
	.loc 6 244 53
	ldr	r3, [sp, #16]
	ldrb	r0, [r3, #3]	@ zero_extendqisi2
	.loc 6 244 43
	ldr	r2, .L46
	mov	r3, r1
	lsls	r3, r3, #3
	add	r3, r3, r1
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #30
	mov	r2, r0
	strb	r2, [r3]
.LBB10:
	.loc 6 265 5
	ldr	r3, [sp, #20]
	ldr	r3, [r3]
	str	r3, [sp, #28]
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [sp, #40]
	ldr	r2, [sp, #44]
	ldr	r0, [sp, #28]
	bl	nrf_spi_pins_set
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #8]
	mov	r1, r3
	ldr	r0, [sp, #28]
	bl	nrf_spi_frequency_set
	ldr	r3, [sp, #16]
	ldrb	r1, [r3, #12]	@ zero_extendqisi2
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r0, [sp, #28]
	bl	nrf_spi_configure
	ldr	r3, [sp, #20]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [sp, #16]
	ldrb	r0, [r3, #5]	@ zero_extendqisi2
	ldr	r2, .L46
	mov	r3, r1
	lsls	r3, r3, #3
	add	r3, r3, r1
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #31
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [sp, #36]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L44
	.loc 6 265 5 is_stmt 0 discriminator 1
	movs	r1, #4
	ldr	r0, [sp, #28]
	bl	nrf_spi_int_enable
.L44:
	.loc 6 265 5 discriminator 3
	ldr	r0, [sp, #28]
	bl	nrf_spi_enable
.LBE10:
	.loc 6 285 13 is_stmt 1 discriminator 3
	ldr	r3, [sp, #36]
	ldr	r3, [r3]
	.loc 6 285 8 discriminator 3
	cmp	r3, #0
	beq	.L45
	.loc 6 287 9
	ldr	r3, [sp, #20]
	ldrsb	r2, [r3, #4]
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	mov	r1, r3
	mov	r0, r2
	bl	nrf_drv_common_irq_enable
.L45:
	.loc 6 290 32
	ldr	r3, [sp, #36]
	movs	r2, #0
	strb	r2, [r3, #29]
	.loc 6 291 17
	ldr	r3, [sp, #36]
	movs	r2, #1
	strb	r2, [r3, #28]
	.loc 6 295 14
	movs	r3, #0
	str	r3, [sp, #32]
	.loc 6 299 12
	ldr	r3, [sp, #32]
.L36:
	.loc 6 300 1
	mov	r0, r3
	add	sp, sp, #52
.LCFI50:
	@ sp needed
	ldr	pc, [sp], #4
.L47:
	.align	2
.L46:
	.word	m_cb
.LFE222:
	.size	nrf_drv_spi_init, .-nrf_drv_spi_init
	.section	.text.nrf_drv_spi_uninit,"ax",%progbits
	.align	1
	.global	nrf_drv_spi_uninit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_drv_spi_uninit, %function
nrf_drv_spi_uninit:
.LFB223:
	.loc 6 303 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI51:
	sub	sp, sp, #20
.LCFI52:
	str	r0, [sp, #4]
	.loc 6 304 50
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	mov	r2, r3
	.loc 6 304 27
	mov	r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L51
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 6 307 13
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 6 307 8
	cmp	r3, #0
	beq	.L49
	.loc 6 309 9
	ldr	r3, [sp, #4]
	ldrsb	r3, [r3, #4]
	mov	r0, r3
	bl	nrf_drv_common_irq_disable
.L49:
.LBB11:
	.loc 6 331 5
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	str	r3, [sp, #8]
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L50
	.loc 6 331 5 is_stmt 0 discriminator 1
	mov	r1, #-1
	ldr	r0, [sp, #8]
	bl	nrf_spi_int_disable
.L50:
	.loc 6 331 5 discriminator 3
	ldr	r0, [sp, #8]
	bl	nrf_spi_disable
.LBE11:
	.loc 6 346 17 is_stmt 1 discriminator 3
	ldr	r3, [sp, #12]
	movs	r2, #0
	strb	r2, [r3, #28]
	.loc 6 347 1 discriminator 3
	nop
	add	sp, sp, #20
.LCFI53:
	@ sp needed
	ldr	pc, [sp], #4
.L52:
	.align	2
.L51:
	.word	m_cb
.LFE223:
	.size	nrf_drv_spi_uninit, .-nrf_drv_spi_uninit
	.section	.text.nrf_drv_spi_transfer,"ax",%progbits
	.align	1
	.global	nrf_drv_spi_transfer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_drv_spi_transfer, %function
nrf_drv_spi_transfer:
.LFB224:
	.loc 6 354 1
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI54:
	sub	sp, sp, #36
.LCFI55:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	mov	r3, r2
	strb	r3, [sp, #7]
	.loc 6 356 27
	ldr	r3, [sp, #8]
	str	r3, [sp, #16]
	.loc 6 357 27
	ldr	r3, [sp]
	str	r3, [sp, #24]
	.loc 6 358 27
	ldrb	r3, [sp, #7]
	strb	r3, [sp, #20]
	.loc 6 359 27
	ldrb	r3, [sp, #40]
	strb	r3, [sp, #28]
	.loc 6 364 12
	add	r3, sp, #16
	movs	r2, #0
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	nrf_drv_spi_xfer
	mov	r3, r0
	.loc 6 365 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI56:
	@ sp needed
	ldr	pc, [sp], #4
.LFE224:
	.size	nrf_drv_spi_transfer, .-nrf_drv_spi_transfer
	.section	.text.finish_transfer,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	finish_transfer, %function
finish_transfer:
.LFB225:
	.loc 6 368 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI57:
	sub	sp, sp, #12
.LCFI58:
	str	r0, [sp, #4]
	.loc 6 370 13
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #30]	@ zero_extendqisi2
	.loc 6 370 8
	cmp	r3, #255
	beq	.L56
	.loc 6 372 30
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #30]	@ zero_extendqisi2
	.loc 6 372 9
	mov	r0, r3
	bl	nrf_gpio_pin_set
.L56:
	.loc 6 377 32
	ldr	r3, [sp, #4]
	movs	r2, #0
	strb	r2, [r3, #29]
	.loc 6 378 20
	ldr	r3, [sp, #4]
	movs	r2, #0
	strb	r2, [r3, #8]
	.loc 6 384 9
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 6 384 19
	ldr	r2, [sp, #4]
	add	r0, r2, #8
	.loc 6 384 5
	ldr	r2, [sp, #4]
	ldr	r2, [r2, #4]
	mov	r1, r2
	blx	r3
.LVL0:
	.loc 6 385 1
	nop
	add	sp, sp, #12
.LCFI59:
	@ sp needed
	ldr	pc, [sp], #4
.LFE225:
	.size	finish_transfer, .-finish_transfer
	.section	.text.transfer_byte,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	transfer_byte, %function
transfer_byte:
.LFB226:
	.loc 6 393 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI60:
	sub	sp, sp, #20
.LCFI61:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 6 396 32
	ldr	r0, [sp, #4]
	bl	nrf_spi_rxd_get
	mov	r3, r0
	.loc 6 396 22
	strb	r3, [sp, #13]
	.loc 6 397 13
	ldr	r3, [sp]
	ldrb	r2, [r3, #32]	@ zero_extendqisi2
	.loc 6 397 54
	ldr	r3, [sp]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	.loc 6 397 8
	cmp	r2, r3
	bcs	.L58
	.loc 6 399 28
	ldr	r3, [sp]
	ldr	r3, [r3, #20]
	.loc 6 399 45
	ldr	r2, [sp]
	ldrb	r2, [r2, #32]	@ zero_extendqisi2
	.loc 6 399 40
	add	r3, r3, r2
	.loc 6 399 66
	ldrb	r2, [sp, #13]
	uxtb	r2, r2
	strb	r2, [r3]
.L58:
	.loc 6 402 11
	ldr	r3, [sp]
	ldrb	r3, [r3, #32]	@ zero_extendqisi2
	.loc 6 402 5
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [sp]
	strb	r2, [r3, #32]
	.loc 6 412 31
	ldr	r3, [sp]
	ldrb	r3, [r3, #32]	@ zero_extendqisi2
	uxth	r3, r3
	.loc 6 412 14
	adds	r3, r3, #1
	strh	r3, [sp, #14]	@ movhi
	.loc 6 414 9
	ldr	r3, [sp]
	ldrb	r3, [r3, #33]	@ zero_extendqisi2
	and	r3, r3, #4
	uxtb	r3, r3
	.loc 6 414 8
	cmp	r3, #0
	beq	.L59
	.loc 6 416 45
	ldr	r3, [sp]
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	uxth	r3, r3
	.loc 6 416 12
	ldrh	r2, [sp, #14]
	cmp	r2, r3
	bcs	.L60
	.loc 6 418 43
	ldrh	r3, [sp, #14]	@ movhi
	uxtb	r2, r3
	ldr	r3, [sp]
	strb	r2, [r3, #16]
.L60:
	.loc 6 420 45
	ldr	r3, [sp]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	uxth	r3, r3
	.loc 6 420 12
	ldrh	r2, [sp, #14]
	cmp	r2, r3
	bcs	.L59
	.loc 6 422 43
	ldrh	r3, [sp, #14]	@ movhi
	uxtb	r2, r3
	ldr	r3, [sp]
	strb	r2, [r3, #24]
.L59:
	.loc 6 426 41
	ldr	r3, [sp]
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	uxth	r3, r3
	.loc 6 426 8
	ldrh	r2, [sp, #14]
	cmp	r2, r3
	bcs	.L61
	.loc 6 428 51
	ldr	r3, [sp]
	ldr	r2, [r3, #12]
	.loc 6 428 63
	ldrh	r3, [sp, #14]
	add	r3, r3, r2
	.loc 6 428 9
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	nrf_spi_txd_set
	.loc 6 429 16
	movs	r3, #1
	b	.L62
.L61:
	.loc 6 431 46
	ldr	r3, [sp]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	uxth	r3, r3
	.loc 6 431 13
	ldrh	r2, [sp, #14]
	cmp	r2, r3
	bcs	.L63
	.loc 6 433 9
	ldr	r3, [sp]
	ldrb	r3, [r3, #31]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	nrf_spi_txd_set
	.loc 6 434 16
	movs	r3, #1
	b	.L62
.L63:
	.loc 6 437 17
	ldr	r3, [sp]
	ldrb	r2, [r3, #32]	@ zero_extendqisi2
	.loc 6 437 58
	ldr	r3, [sp]
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	.loc 6 437 69
	cmp	r2, r3
	bcc	.L64
	.loc 6 438 17 discriminator 2
	ldr	r3, [sp]
	ldrb	r2, [r3, #32]	@ zero_extendqisi2
	.loc 6 438 58 discriminator 2
	ldr	r3, [sp]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	.loc 6 437 69 discriminator 2
	cmp	r2, r3
	bcs	.L65
.L64:
	.loc 6 437 69 is_stmt 0 discriminator 3
	movs	r3, #1
	b	.L66
.L65:
	.loc 6 437 69 discriminator 4
	movs	r3, #0
.L66:
	.loc 6 437 69 discriminator 6
	and	r3, r3, #1
	uxtb	r3, r3
.L62:
	.loc 6 439 1 is_stmt 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI62:
	@ sp needed
	ldr	pc, [sp], #4
.LFE226:
	.size	transfer_byte, .-transfer_byte
	.section	.text.spi_xfer,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	spi_xfer, %function
spi_xfer:
.LFB227:
	.loc 6 444 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI63:
	sub	sp, sp, #20
.LCFI64:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 6 445 29
	ldr	r3, [sp, #8]
	movs	r2, #0
	strb	r2, [r3, #32]
	.loc 6 446 5
	movs	r1, #4
	ldr	r0, [sp, #12]
	bl	nrf_spi_int_disable
	.loc 6 448 5
	mov	r1, #264
	ldr	r0, [sp, #12]
	bl	nrf_spi_event_clear
	.loc 6 454 21
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	.loc 6 453 5
	cmp	r3, #0
	beq	.L68
	.loc 6 454 51 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 6 453 5 discriminator 1
	ldrb	r3, [r3]	@ zero_extendqisi2
	b	.L69
.L68:
	.loc 6 453 5 is_stmt 0 discriminator 2
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #31]	@ zero_extendqisi2
.L69:
	.loc 6 453 5 discriminator 4
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	nrf_spi_txd_set
	.loc 6 460 20 is_stmt 1 discriminator 4
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	.loc 6 460 8 discriminator 4
	cmp	r3, #1
	bls	.L70
	.loc 6 462 43
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 6 462 56
	adds	r3, r3, #1
	.loc 6 462 9
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	nrf_spi_txd_set
	b	.L71
.L70:
	.loc 6 464 25
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	.loc 6 464 13
	cmp	r3, #1
	bls	.L71
	.loc 6 466 9
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #31]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	nrf_spi_txd_set
.L71:
	.loc 6 474 13
	ldr	r3, [sp, #8]
	ldr	r3, [r3]
	.loc 6 474 8
	cmp	r3, #0
	beq	.L76
	.loc 6 476 9
	movs	r1, #4
	ldr	r0, [sp, #12]
	bl	nrf_spi_int_enable
	.loc 6 490 1
	b	.L75
.L76:
	.loc 6 481 19
	nop
.L74:
	.loc 6 481 21 discriminator 1
	mov	r1, #264
	ldr	r0, [sp, #12]
	bl	nrf_spi_event_check
	mov	r3, r0
	.loc 6 481 20 discriminator 1
	eor	r3, r3, #1
	uxtb	r3, r3
	.loc 6 481 19 discriminator 1
	cmp	r3, #0
	bne	.L74
	.loc 6 482 13
	mov	r1, #264
	ldr	r0, [sp, #12]
	bl	nrf_spi_event_clear
	.loc 6 484 18
	ldr	r1, [sp, #8]
	ldr	r0, [sp, #12]
	bl	transfer_byte
	mov	r3, r0
	.loc 6 484 9
	cmp	r3, #0
	bne	.L76
	.loc 6 485 17
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #30]	@ zero_extendqisi2
	.loc 6 485 12
	cmp	r3, #255
	beq	.L75
	.loc 6 487 34
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #30]	@ zero_extendqisi2
	.loc 6 487 13
	mov	r0, r3
	bl	nrf_gpio_pin_set
.L75:
	.loc 6 490 1
	nop
	add	sp, sp, #20
.LCFI65:
	@ sp needed
	ldr	pc, [sp], #4
.LFE227:
	.size	spi_xfer, .-spi_xfer
	.section	.text.nrf_drv_spi_xfer,"ax",%progbits
	.align	1
	.global	nrf_drv_spi_xfer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_drv_spi_xfer, %function
nrf_drv_spi_xfer:
.LFB228:
	.loc 6 597 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI66:
	sub	sp, sp, #24
.LCFI67:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 6 598 51
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	mov	r2, r3
	.loc 6 598 27
	mov	r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L85
	add	r3, r3, r2
	str	r3, [sp, #16]
	.loc 6 603 16
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 6 605 13
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #29]
	uxtb	r3, r3
	.loc 6 605 8
	cmp	r3, #0
	beq	.L78
	.loc 6 607 18
	movs	r3, #17
	str	r3, [sp, #20]
	.loc 6 611 16
	ldr	r3, [sp, #20]
	b	.L79
.L78:
	.loc 6 615 17
	ldr	r3, [sp, #16]
	ldr	r3, [r3]
	.loc 6 615 12
	cmp	r3, #0
	beq	.L80
	.loc 6 615 38 discriminator 1
	ldr	r3, [sp, #4]
	and	r3, r3, #20
	.loc 6 615 27 discriminator 1
	cmp	r3, #0
	bne	.L80
	.loc 6 618 40
	ldr	r3, [sp, #16]
	movs	r2, #1
	strb	r2, [r3, #29]
.L80:
	.loc 6 622 25
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #8]
	add	r4, r3, #12
	mov	r3, r2
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	.loc 6 623 19
	ldr	r2, [sp, #16]
	ldrb	r3, [r2, #33]
	bfc	r3, #0, #1
	strb	r3, [r2, #33]
	.loc 6 624 19
	ldr	r2, [sp, #16]
	ldrb	r3, [r2, #33]
	bfc	r3, #1, #1
	strb	r3, [r2, #33]
	.loc 6 625 19
	ldr	r2, [sp, #16]
	ldrb	r3, [r2, #33]
	bfc	r3, #2, #1
	strb	r3, [r2, #33]
	.loc 6 627 13
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #30]	@ zero_extendqisi2
	.loc 6 627 8
	cmp	r3, #255
	beq	.L81
	.loc 6 629 32
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #30]	@ zero_extendqisi2
	.loc 6 629 9
	mov	r0, r3
	bl	nrf_gpio_pin_clear
.L81:
	.loc 6 635 5
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L82
	.loc 6 635 5 is_stmt 0 discriminator 1
	ldr	r3, [sp, #16]
	movs	r2, #0
	strb	r2, [r3, #29]
	movs	r3, #6
	str	r3, [sp, #20]
	b	.L84
.L82:
	.loc 6 635 5 discriminator 2
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	ldr	r2, [sp, #8]
	ldr	r1, [sp, #16]
	mov	r0, r3
	bl	spi_xfer
.L84:
	.loc 6 635 5 discriminator 7
	ldr	r3, [sp, #20]
.L79:
	.loc 6 651 1 is_stmt 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI68:
	@ sp needed
	pop	{r4, pc}
.L86:
	.align	2
.L85:
	.word	m_cb
.LFE228:
	.size	nrf_drv_spi_xfer, .-nrf_drv_spi_xfer
	.section	.text.nrf_drv_spi_abort,"ax",%progbits
	.align	1
	.global	nrf_drv_spi_abort
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	nrf_drv_spi_abort, %function
nrf_drv_spi_abort:
.LFB229:
	.loc 6 655 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI69:
	str	r0, [sp, #4]
	.loc 6 656 50
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	mov	r2, r3
	.loc 6 656 27
	mov	r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L88
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 6 665 5
	ldr	r2, [sp, #12]
	ldrb	r3, [r2, #33]
	orr	r3, r3, #4
	strb	r3, [r2, #33]
	.loc 6 669 1
	nop
	add	sp, sp, #16
.LCFI70:
	@ sp needed
	bx	lr
.L89:
	.align	2
.L88:
	.word	m_cb
.LFE229:
	.size	nrf_drv_spi_abort, .-nrf_drv_spi_abort
	.section	.text.irq_handler_spi,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	irq_handler_spi, %function
irq_handler_spi:
.LFB230:
	.loc 6 723 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI71:
	sub	sp, sp, #12
.LCFI72:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 6 726 5
	mov	r1, #264
	ldr	r0, [sp, #4]
	bl	nrf_spi_event_clear
	.loc 6 729 10
	ldr	r1, [sp]
	ldr	r0, [sp, #4]
	bl	transfer_byte
	mov	r3, r0
	.loc 6 729 9
	eor	r3, r3, #1
	uxtb	r3, r3
	.loc 6 729 8
	cmp	r3, #0
	beq	.L92
	.loc 6 731 9
	ldr	r0, [sp]
	bl	finish_transfer
.L92:
	.loc 6 733 1
	nop
	add	sp, sp, #12
.LCFI73:
	@ sp needed
	ldr	pc, [sp], #4
.LFE230:
	.size	irq_handler_spi, .-irq_handler_spi
	.section	.text.SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQHandler,"ax",%progbits
	.align	1
	.global	SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQHandler, %function
SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQHandler:
.LFB231:
	.loc 6 750 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI74:
	sub	sp, sp, #12
.LCFI75:
	.loc 6 751 27
	ldr	r3, .L94
	str	r3, [sp, #4]
	.loc 6 755 9
	ldr	r1, [sp, #4]
	mov	r0, #1073758208
	bl	irq_handler_spi
	.loc 6 757 1
	nop
	add	sp, sp, #12
.LCFI76:
	@ sp needed
	ldr	pc, [sp], #4
.L95:
	.align	2
.L94:
	.word	m_cb
.LFE231:
	.size	SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQHandler, .-SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQHandler
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.byte	0x4
	.4byte	.LCFI0-.LFB107
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB147
	.4byte	.LFE147-.LFB147
	.byte	0x4
	.4byte	.LCFI2-.LFB147
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB148
	.4byte	.LFE148-.LFB148
	.byte	0x4
	.4byte	.LCFI4-.LFB148
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB150
	.4byte	.LFE150-.LFB150
	.byte	0x4
	.4byte	.LCFI6-.LFB150
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB151
	.4byte	.LFE151-.LFB151
	.byte	0x4
	.4byte	.LCFI8-.LFB151
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB153
	.4byte	.LFE153-.LFB153
	.byte	0x4
	.4byte	.LCFI10-.LFB153
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB154
	.4byte	.LFE154-.LFB154
	.byte	0x4
	.4byte	.LCFI12-.LFB154
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB155
	.4byte	.LFE155-.LFB155
	.byte	0x4
	.4byte	.LCFI14-.LFB155
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB156
	.4byte	.LFE156-.LFB156
	.byte	0x4
	.4byte	.LCFI16-.LFB156
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB157
	.4byte	.LFE157-.LFB157
	.byte	0x4
	.4byte	.LCFI18-.LFB157
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB158
	.4byte	.LFE158-.LFB158
	.byte	0x4
	.4byte	.LCFI20-.LFB158
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB159
	.4byte	.LFE159-.LFB159
	.byte	0x4
	.4byte	.LCFI22-.LFB159
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB184
	.4byte	.LFE184-.LFB184
	.byte	0x4
	.4byte	.LCFI24-.LFB184
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB190
	.4byte	.LFE190-.LFB190
	.byte	0x4
	.4byte	.LCFI27-.LFB190
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB193
	.4byte	.LFE193-.LFB193
	.byte	0x4
	.4byte	.LCFI29-.LFB193
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB194
	.4byte	.LFE194-.LFB194
	.byte	0x4
	.4byte	.LCFI32-.LFB194
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB195
	.4byte	.LFE195-.LFB195
	.byte	0x4
	.4byte	.LCFI35-.LFB195
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB202
	.4byte	.LFE202-.LFB202
	.byte	0x4
	.4byte	.LCFI38-.LFB202
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB203
	.4byte	.LFE203-.LFB203
	.byte	0x4
	.4byte	.LCFI41-.LFB203
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB216
	.4byte	.LFE216-.LFB216
	.byte	0x4
	.4byte	.LCFI44-.LFB216
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB217
	.4byte	.LFE217-.LFB217
	.byte	0x4
	.4byte	.LCFI46-.LFB217
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB222
	.4byte	.LFE222-.LFB222
	.byte	0x4
	.4byte	.LCFI48-.LFB222
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB223
	.4byte	.LFE223-.LFB223
	.byte	0x4
	.4byte	.LCFI51-.LFB223
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB224
	.4byte	.LFE224-.LFB224
	.byte	0x4
	.4byte	.LCFI54-.LFB224
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB225
	.4byte	.LFE225-.LFB225
	.byte	0x4
	.4byte	.LCFI57-.LFB225
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB226
	.4byte	.LFE226-.LFB226
	.byte	0x4
	.4byte	.LCFI60-.LFB226
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB227
	.4byte	.LFE227-.LFB227
	.byte	0x4
	.4byte	.LCFI63-.LFB227
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI65-.LCFI64
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB228
	.4byte	.LFE228-.LFB228
	.byte	0x4
	.4byte	.LCFI66-.LFB228
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI68-.LCFI67
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB229
	.4byte	.LFE229-.LFB229
	.byte	0x4
	.4byte	.LCFI69-.LFB229
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB230
	.4byte	.LFE230-.LFB230
	.byte	0x4
	.4byte	.LCFI71-.LFB230
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB231
	.4byte	.LFE231-.LFB231
	.byte	0x4
	.4byte	.LCFI74-.LFB231
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI75-.LCFI74
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE60:
	.text
.Letext0:
	.file 7 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.22/include/stdint.h"
	.file 8 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.22/include/__crossworks.h"
	.file 9 "../../../nRF5_SDK_14.2.0/components/libraries/util/sdk_errors.h"
	.file 10 "C:/Users/Admin/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/nRF/CMSIS/Device/Include/nrf52.h"
	.file 11 "C:/Users/Admin/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/nRF/CMSIS/Device/Include/system_nrf52.h"
	.file 12 "../../../nRF5_SDK_14.2.0/components/libraries/util/app_util.h"
	.file 13 "E:\\WSC_FTSP_ver_onemess\\WSC_FTSP\\WCS_v2_systick_TDMA_demo_20_09\\WCS_v2_systick_TDMA\\nRF5_SDK_14.2.0\\components\\drivers_nrf\\spi_master\\nrf_drv_spi.h"
	.file 14 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.22/include/stdio.h"
	.file 15 "../../../nRF5_SDK_14.2.0/components/libraries/experimental_log/src/nrf_log_internal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1a3c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF345
	.byte	0xc
	.4byte	.LASF346
	.4byte	.LASF347
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x7
	.byte	0x30
	.byte	0x1c
	.4byte	0x42
	.uleb128 0x4
	.4byte	0x2c
	.uleb128 0x5
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x5
	.4byte	0x42
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x7
	.byte	0x36
	.byte	0x1c
	.4byte	0x61
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x7
	.byte	0x37
	.byte	0x1c
	.4byte	0x79
	.uleb128 0x4
	.4byte	0x68
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x7
	.byte	0x38
	.byte	0x1c
	.4byte	0x96
	.uleb128 0x4
	.4byte	0x80
	.uleb128 0x5
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF61
	.byte	0x8
	.byte	0x8
	.byte	0x7e
	.byte	0x8
	.4byte	0xd5
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x8
	.byte	0x7f
	.byte	0x7
	.4byte	0x79
	.byte	0
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x8
	.byte	0x80
	.byte	0x8
	.4byte	0xd5
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF13
	.uleb128 0xa
	.4byte	0x79
	.4byte	0xf5
	.uleb128 0xb
	.4byte	0xf5
	.uleb128 0xb
	.4byte	0x96
	.uleb128 0xb
	.4byte	0x107
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xfb
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x5
	.4byte	0xfb
	.uleb128 0xc
	.byte	0x4
	.4byte	0xad
	.uleb128 0xa
	.4byte	0x79
	.4byte	0x12b
	.uleb128 0xb
	.4byte	0x12b
	.uleb128 0xb
	.4byte	0x131
	.uleb128 0xb
	.4byte	0x96
	.uleb128 0xb
	.4byte	0x107
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x96
	.uleb128 0xc
	.byte	0x4
	.4byte	0x102
	.uleb128 0xd
	.byte	0x58
	.byte	0x8
	.byte	0x86
	.byte	0x9
	.4byte	0x2e1
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x8
	.byte	0x88
	.byte	0xf
	.4byte	0x131
	.byte	0
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x8
	.byte	0x89
	.byte	0xf
	.4byte	0x131
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x8
	.byte	0x8a
	.byte	0xf
	.4byte	0x131
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x8
	.byte	0x8c
	.byte	0xf
	.4byte	0x131
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x8
	.byte	0x8d
	.byte	0xf
	.4byte	0x131
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x8
	.byte	0x8e
	.byte	0xf
	.4byte	0x131
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x8
	.byte	0x8f
	.byte	0xf
	.4byte	0x131
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x8
	.byte	0x90
	.byte	0xf
	.4byte	0x131
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x8
	.byte	0x91
	.byte	0xf
	.4byte	0x131
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x8
	.byte	0x92
	.byte	0xf
	.4byte	0x131
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x8
	.byte	0x94
	.byte	0x8
	.4byte	0xfb
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x8
	.byte	0x95
	.byte	0x8
	.4byte	0xfb
	.byte	0x29
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x8
	.byte	0x96
	.byte	0x8
	.4byte	0xfb
	.byte	0x2a
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x8
	.byte	0x97
	.byte	0x8
	.4byte	0xfb
	.byte	0x2b
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x8
	.byte	0x98
	.byte	0x8
	.4byte	0xfb
	.byte	0x2c
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x8
	.byte	0x99
	.byte	0x8
	.4byte	0xfb
	.byte	0x2d
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x8
	.byte	0x9a
	.byte	0x8
	.4byte	0xfb
	.byte	0x2e
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x8
	.byte	0x9b
	.byte	0x8
	.4byte	0xfb
	.byte	0x2f
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x8
	.byte	0x9c
	.byte	0x8
	.4byte	0xfb
	.byte	0x30
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x8
	.byte	0x9d
	.byte	0x8
	.4byte	0xfb
	.byte	0x31
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x8
	.byte	0x9e
	.byte	0x8
	.4byte	0xfb
	.byte	0x32
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x8
	.byte	0x9f
	.byte	0x8
	.4byte	0xfb
	.byte	0x33
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x8
	.byte	0xa0
	.byte	0x8
	.4byte	0xfb
	.byte	0x34
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x8
	.byte	0xa1
	.byte	0x8
	.4byte	0xfb
	.byte	0x35
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x8
	.byte	0xa6
	.byte	0xf
	.4byte	0x131
	.byte	0x38
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x8
	.byte	0xa7
	.byte	0xf
	.4byte	0x131
	.byte	0x3c
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x8
	.byte	0xa8
	.byte	0xf
	.4byte	0x131
	.byte	0x40
	.uleb128 0x9
	.4byte	.LASF42
	.byte	0x8
	.byte	0xa9
	.byte	0xf
	.4byte	0x131
	.byte	0x44
	.uleb128 0x9
	.4byte	.LASF43
	.byte	0x8
	.byte	0xaa
	.byte	0xf
	.4byte	0x131
	.byte	0x48
	.uleb128 0x9
	.4byte	.LASF44
	.byte	0x8
	.byte	0xab
	.byte	0xf
	.4byte	0x131
	.byte	0x4c
	.uleb128 0x9
	.4byte	.LASF45
	.byte	0x8
	.byte	0xac
	.byte	0xf
	.4byte	0x131
	.byte	0x50
	.uleb128 0x9
	.4byte	.LASF46
	.byte	0x8
	.byte	0xad
	.byte	0xf
	.4byte	0x131
	.byte	0x54
	.byte	0
	.uleb128 0x3
	.4byte	.LASF47
	.byte	0x8
	.byte	0xae
	.byte	0x3
	.4byte	0x137
	.uleb128 0x5
	.4byte	0x2e1
	.uleb128 0xd
	.byte	0x20
	.byte	0x8
	.byte	0xc4
	.byte	0x9
	.4byte	0x364
	.uleb128 0x9
	.4byte	.LASF48
	.byte	0x8
	.byte	0xc6
	.byte	0x9
	.4byte	0x378
	.byte	0
	.uleb128 0x9
	.4byte	.LASF49
	.byte	0x8
	.byte	0xc7
	.byte	0x9
	.4byte	0x38d
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF50
	.byte	0x8
	.byte	0xc8
	.byte	0x9
	.4byte	0x38d
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF51
	.byte	0x8
	.byte	0xcb
	.byte	0x9
	.4byte	0x3a7
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF52
	.byte	0x8
	.byte	0xcc
	.byte	0xa
	.4byte	0x3bc
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF53
	.byte	0x8
	.byte	0xcd
	.byte	0xa
	.4byte	0x3bc
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF54
	.byte	0x8
	.byte	0xd0
	.byte	0x9
	.4byte	0x3c2
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF55
	.byte	0x8
	.byte	0xd1
	.byte	0x9
	.4byte	0x3c8
	.byte	0x1c
	.byte	0
	.uleb128 0xa
	.4byte	0x79
	.4byte	0x378
	.uleb128 0xb
	.4byte	0x79
	.uleb128 0xb
	.4byte	0x79
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x364
	.uleb128 0xa
	.4byte	0x79
	.4byte	0x38d
	.uleb128 0xb
	.4byte	0x79
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x37e
	.uleb128 0xa
	.4byte	0x79
	.4byte	0x3a7
	.uleb128 0xb
	.4byte	0xd5
	.uleb128 0xb
	.4byte	0x79
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x393
	.uleb128 0xa
	.4byte	0xd5
	.4byte	0x3bc
	.uleb128 0xb
	.4byte	0xd5
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x3ad
	.uleb128 0xc
	.byte	0x4
	.4byte	0xdc
	.uleb128 0xc
	.byte	0x4
	.4byte	0x10d
	.uleb128 0x3
	.4byte	.LASF56
	.byte	0x8
	.byte	0xd2
	.byte	0x3
	.4byte	0x2f2
	.uleb128 0x5
	.4byte	0x3ce
	.uleb128 0xd
	.byte	0xc
	.byte	0x8
	.byte	0xd4
	.byte	0x9
	.4byte	0x410
	.uleb128 0x9
	.4byte	.LASF57
	.byte	0x8
	.byte	0xd5
	.byte	0xf
	.4byte	0x131
	.byte	0
	.uleb128 0x9
	.4byte	.LASF58
	.byte	0x8
	.byte	0xd6
	.byte	0x25
	.4byte	0x410
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF59
	.byte	0x8
	.byte	0xd7
	.byte	0x28
	.4byte	0x416
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x2ed
	.uleb128 0xc
	.byte	0x4
	.4byte	0x3da
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x8
	.byte	0xd8
	.byte	0x3
	.4byte	0x3df
	.uleb128 0x5
	.4byte	0x41c
	.uleb128 0x8
	.4byte	.LASF62
	.byte	0x14
	.byte	0x8
	.byte	0xdc
	.byte	0x10
	.4byte	0x448
	.uleb128 0x9
	.4byte	.LASF63
	.byte	0x8
	.byte	0xdd
	.byte	0x20
	.4byte	0x448
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0x458
	.4byte	0x458
	.uleb128 0xf
	.4byte	0x96
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x428
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x8
	.2byte	0x106
	.byte	0x1a
	.4byte	0x42d
	.uleb128 0x10
	.4byte	.LASF65
	.byte	0x8
	.2byte	0x10d
	.byte	0x24
	.4byte	0x428
	.uleb128 0x10
	.4byte	.LASF66
	.byte	0x8
	.2byte	0x110
	.byte	0x2c
	.4byte	0x3da
	.uleb128 0x10
	.4byte	.LASF67
	.byte	0x8
	.2byte	0x111
	.byte	0x2c
	.4byte	0x3da
	.uleb128 0xe
	.4byte	0x49
	.4byte	0x4a2
	.uleb128 0xf
	.4byte	0x96
	.byte	0x7f
	.byte	0
	.uleb128 0x5
	.4byte	0x492
	.uleb128 0x10
	.4byte	.LASF68
	.byte	0x8
	.2byte	0x113
	.byte	0x23
	.4byte	0x4a2
	.uleb128 0xe
	.4byte	0x102
	.4byte	0x4bf
	.uleb128 0x11
	.byte	0
	.uleb128 0x5
	.4byte	0x4b4
	.uleb128 0x10
	.4byte	.LASF69
	.byte	0x8
	.2byte	0x115
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0x10
	.4byte	.LASF70
	.byte	0x8
	.2byte	0x116
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0x10
	.4byte	.LASF71
	.byte	0x8
	.2byte	0x117
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0x10
	.4byte	.LASF72
	.byte	0x8
	.2byte	0x118
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0x10
	.4byte	.LASF73
	.byte	0x8
	.2byte	0x11a
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0x10
	.4byte	.LASF74
	.byte	0x8
	.2byte	0x11b
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0x10
	.4byte	.LASF75
	.byte	0x8
	.2byte	0x11c
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x8
	.2byte	0x11d
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0x10
	.4byte	.LASF77
	.byte	0x8
	.2byte	0x11e
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x8
	.2byte	0x11f
	.byte	0x13
	.4byte	0x4bf
	.uleb128 0xa
	.4byte	0x79
	.4byte	0x555
	.uleb128 0xb
	.4byte	0x555
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x560
	.uleb128 0x12
	.4byte	.LASF234
	.uleb128 0x5
	.4byte	0x55b
	.uleb128 0x10
	.4byte	.LASF79
	.byte	0x8
	.2byte	0x135
	.byte	0xe
	.4byte	0x572
	.uleb128 0xc
	.byte	0x4
	.4byte	0x546
	.uleb128 0xa
	.4byte	0x79
	.4byte	0x587
	.uleb128 0xb
	.4byte	0x587
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x55b
	.uleb128 0x10
	.4byte	.LASF80
	.byte	0x8
	.2byte	0x136
	.byte	0xe
	.4byte	0x59a
	.uleb128 0xc
	.byte	0x4
	.4byte	0x578
	.uleb128 0x13
	.4byte	.LASF81
	.byte	0x8
	.2byte	0x14d
	.byte	0x18
	.4byte	0x5ad
	.uleb128 0xc
	.byte	0x4
	.4byte	0x5b3
	.uleb128 0xa
	.4byte	0x131
	.4byte	0x5c2
	.uleb128 0xb
	.4byte	0x79
	.byte	0
	.uleb128 0x14
	.4byte	.LASF82
	.byte	0x8
	.byte	0x8
	.2byte	0x14f
	.byte	0x10
	.4byte	0x5ed
	.uleb128 0x15
	.4byte	.LASF83
	.byte	0x8
	.2byte	0x151
	.byte	0x1c
	.4byte	0x5a0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF84
	.byte	0x8
	.2byte	0x152
	.byte	0x21
	.4byte	0x5ed
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x5c2
	.uleb128 0x13
	.4byte	.LASF85
	.byte	0x8
	.2byte	0x153
	.byte	0x3
	.4byte	0x5c2
	.uleb128 0x10
	.4byte	.LASF86
	.byte	0x8
	.2byte	0x157
	.byte	0x1f
	.4byte	0x60d
	.uleb128 0xc
	.byte	0x4
	.4byte	0x5f3
	.uleb128 0x3
	.4byte	.LASF87
	.byte	0x9
	.byte	0x9d
	.byte	0x12
	.4byte	0x80
	.uleb128 0x16
	.byte	0x5
	.byte	0x1
	.4byte	0x25
	.byte	0xa
	.byte	0x41
	.byte	0xe
	.4byte	0x748
	.uleb128 0x17
	.4byte	.LASF88
	.sleb128 -15
	.uleb128 0x17
	.4byte	.LASF89
	.sleb128 -14
	.uleb128 0x17
	.4byte	.LASF90
	.sleb128 -13
	.uleb128 0x17
	.4byte	.LASF91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF92
	.sleb128 -11
	.uleb128 0x17
	.4byte	.LASF93
	.sleb128 -10
	.uleb128 0x17
	.4byte	.LASF94
	.sleb128 -5
	.uleb128 0x17
	.4byte	.LASF95
	.sleb128 -4
	.uleb128 0x17
	.4byte	.LASF96
	.sleb128 -2
	.uleb128 0x17
	.4byte	.LASF97
	.sleb128 -1
	.uleb128 0x18
	.4byte	.LASF98
	.byte	0
	.uleb128 0x18
	.4byte	.LASF99
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF100
	.byte	0x2
	.uleb128 0x18
	.4byte	.LASF101
	.byte	0x3
	.uleb128 0x18
	.4byte	.LASF102
	.byte	0x4
	.uleb128 0x18
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF104
	.byte	0x6
	.uleb128 0x18
	.4byte	.LASF105
	.byte	0x7
	.uleb128 0x18
	.4byte	.LASF106
	.byte	0x8
	.uleb128 0x18
	.4byte	.LASF107
	.byte	0x9
	.uleb128 0x18
	.4byte	.LASF108
	.byte	0xa
	.uleb128 0x18
	.4byte	.LASF109
	.byte	0xb
	.uleb128 0x18
	.4byte	.LASF110
	.byte	0xc
	.uleb128 0x18
	.4byte	.LASF111
	.byte	0xd
	.uleb128 0x18
	.4byte	.LASF112
	.byte	0xe
	.uleb128 0x18
	.4byte	.LASF113
	.byte	0xf
	.uleb128 0x18
	.4byte	.LASF114
	.byte	0x10
	.uleb128 0x18
	.4byte	.LASF115
	.byte	0x11
	.uleb128 0x18
	.4byte	.LASF116
	.byte	0x12
	.uleb128 0x18
	.4byte	.LASF117
	.byte	0x13
	.uleb128 0x18
	.4byte	.LASF118
	.byte	0x14
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0x15
	.uleb128 0x18
	.4byte	.LASF120
	.byte	0x16
	.uleb128 0x18
	.4byte	.LASF121
	.byte	0x17
	.uleb128 0x18
	.4byte	.LASF122
	.byte	0x18
	.uleb128 0x18
	.4byte	.LASF123
	.byte	0x19
	.uleb128 0x18
	.4byte	.LASF124
	.byte	0x1a
	.uleb128 0x18
	.4byte	.LASF125
	.byte	0x1b
	.uleb128 0x18
	.4byte	.LASF126
	.byte	0x1c
	.uleb128 0x18
	.4byte	.LASF127
	.byte	0x1d
	.uleb128 0x18
	.4byte	.LASF128
	.byte	0x20
	.uleb128 0x18
	.4byte	.LASF129
	.byte	0x21
	.uleb128 0x18
	.4byte	.LASF130
	.byte	0x22
	.uleb128 0x18
	.4byte	.LASF131
	.byte	0x23
	.uleb128 0x18
	.4byte	.LASF132
	.byte	0x24
	.uleb128 0x18
	.4byte	.LASF133
	.byte	0x25
	.uleb128 0x18
	.4byte	.LASF134
	.byte	0x26
	.byte	0
	.uleb128 0x3
	.4byte	.LASF135
	.byte	0xa
	.byte	0x75
	.byte	0x3
	.4byte	0x61f
	.uleb128 0x19
	.2byte	0xe04
	.byte	0x1
	.2byte	0x196
	.byte	0x9
	.4byte	0x81e
	.uleb128 0x15
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x198
	.byte	0x12
	.4byte	0x82e
	.byte	0
	.uleb128 0x15
	.4byte	.LASF137
	.byte	0x1
	.2byte	0x199
	.byte	0x12
	.4byte	0x833
	.byte	0x20
	.uleb128 0x15
	.4byte	.LASF138
	.byte	0x1
	.2byte	0x19a
	.byte	0x12
	.4byte	0x82e
	.byte	0x80
	.uleb128 0x15
	.4byte	.LASF139
	.byte	0x1
	.2byte	0x19b
	.byte	0x12
	.4byte	0x833
	.byte	0xa0
	.uleb128 0x1a
	.4byte	.LASF140
	.byte	0x1
	.2byte	0x19c
	.byte	0x12
	.4byte	0x82e
	.2byte	0x100
	.uleb128 0x1a
	.4byte	.LASF141
	.byte	0x1
	.2byte	0x19d
	.byte	0x12
	.4byte	0x833
	.2byte	0x120
	.uleb128 0x1a
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x19e
	.byte	0x12
	.4byte	0x82e
	.2byte	0x180
	.uleb128 0x1a
	.4byte	.LASF143
	.byte	0x1
	.2byte	0x19f
	.byte	0x12
	.4byte	0x833
	.2byte	0x1a0
	.uleb128 0x1a
	.4byte	.LASF144
	.byte	0x1
	.2byte	0x1a0
	.byte	0x12
	.4byte	0x82e
	.2byte	0x200
	.uleb128 0x1a
	.4byte	.LASF145
	.byte	0x1
	.2byte	0x1a1
	.byte	0x12
	.4byte	0x843
	.2byte	0x220
	.uleb128 0x1b
	.ascii	"IP\000"
	.byte	0x1
	.2byte	0x1a2
	.byte	0x12
	.4byte	0x863
	.2byte	0x300
	.uleb128 0x1a
	.4byte	.LASF146
	.byte	0x1
	.2byte	0x1a3
	.byte	0x12
	.4byte	0x868
	.2byte	0x3f0
	.uleb128 0x1a
	.4byte	.LASF147
	.byte	0x1
	.2byte	0x1a4
	.byte	0x12
	.4byte	0x8c
	.2byte	0xe00
	.byte	0
	.uleb128 0xe
	.4byte	0x8c
	.4byte	0x82e
	.uleb128 0xf
	.4byte	0x96
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.4byte	0x81e
	.uleb128 0xe
	.4byte	0x80
	.4byte	0x843
	.uleb128 0xf
	.4byte	0x96
	.byte	0x17
	.byte	0
	.uleb128 0xe
	.4byte	0x80
	.4byte	0x853
	.uleb128 0xf
	.4byte	0x96
	.byte	0x37
	.byte	0
	.uleb128 0xe
	.4byte	0x38
	.4byte	0x863
	.uleb128 0xf
	.4byte	0x96
	.byte	0xef
	.byte	0
	.uleb128 0x4
	.4byte	0x853
	.uleb128 0xe
	.4byte	0x80
	.4byte	0x879
	.uleb128 0x1c
	.4byte	0x96
	.2byte	0x283
	.byte	0
	.uleb128 0x13
	.4byte	.LASF148
	.byte	0x1
	.2byte	0x1a5
	.byte	0x4
	.4byte	0x754
	.uleb128 0x10
	.4byte	.LASF149
	.byte	0x1
	.2byte	0x804
	.byte	0x19
	.4byte	0x74
	.uleb128 0x1d
	.4byte	.LASF150
	.byte	0xb
	.byte	0x21
	.byte	0x11
	.4byte	0x80
	.uleb128 0x1e
	.byte	0xc
	.byte	0xa
	.2byte	0x135
	.byte	0x9
	.4byte	0x8d4
	.uleb128 0x1f
	.ascii	"SCK\000"
	.byte	0xa
	.2byte	0x136
	.byte	0x12
	.4byte	0x8c
	.byte	0
	.uleb128 0x15
	.4byte	.LASF151
	.byte	0xa
	.2byte	0x137
	.byte	0x12
	.4byte	0x8c
	.byte	0x4
	.uleb128 0x15
	.4byte	.LASF152
	.byte	0xa
	.2byte	0x138
	.byte	0x12
	.4byte	0x8c
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.4byte	.LASF153
	.byte	0xa
	.2byte	0x139
	.byte	0x3
	.4byte	0x89f
	.uleb128 0xe
	.4byte	0x8c
	.4byte	0x8f1
	.uleb128 0xf
	.4byte	0x96
	.byte	0x1f
	.byte	0
	.uleb128 0x4
	.4byte	0x8e1
	.uleb128 0xe
	.4byte	0x91
	.4byte	0x906
	.uleb128 0xf
	.4byte	0x96
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.4byte	0x8f6
	.uleb128 0x4
	.4byte	0x906
	.uleb128 0xe
	.4byte	0x91
	.4byte	0x920
	.uleb128 0xf
	.4byte	0x96
	.byte	0x7c
	.byte	0
	.uleb128 0x5
	.4byte	0x910
	.uleb128 0x4
	.4byte	0x920
	.uleb128 0x19
	.2byte	0x558
	.byte	0xa
	.2byte	0x3fb
	.byte	0x9
	.4byte	0xa25
	.uleb128 0x15
	.4byte	.LASF137
	.byte	0xa
	.2byte	0x3fc
	.byte	0x12
	.4byte	0xa3a
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF154
	.byte	0xa
	.2byte	0x3fd
	.byte	0x12
	.4byte	0x8c
	.2byte	0x108
	.uleb128 0x1a
	.4byte	.LASF155
	.byte	0xa
	.2byte	0x3fe
	.byte	0x12
	.4byte	0xa54
	.2byte	0x10c
	.uleb128 0x1a
	.4byte	.LASF156
	.byte	0xa
	.2byte	0x3ff
	.byte	0x12
	.4byte	0x8c
	.2byte	0x304
	.uleb128 0x1a
	.4byte	.LASF157
	.byte	0xa
	.2byte	0x400
	.byte	0x12
	.4byte	0x8c
	.2byte	0x308
	.uleb128 0x1a
	.4byte	.LASF141
	.byte	0xa
	.2byte	0x401
	.byte	0x12
	.4byte	0x925
	.2byte	0x30c
	.uleb128 0x1a
	.4byte	.LASF158
	.byte	0xa
	.2byte	0x402
	.byte	0x12
	.4byte	0x8c
	.2byte	0x500
	.uleb128 0x1a
	.4byte	.LASF143
	.byte	0xa
	.2byte	0x403
	.byte	0x12
	.4byte	0x91
	.2byte	0x504
	.uleb128 0x1a
	.4byte	.LASF159
	.byte	0xa
	.2byte	0x404
	.byte	0x11
	.4byte	0x8d4
	.2byte	0x508
	.uleb128 0x1a
	.4byte	.LASF145
	.byte	0xa
	.2byte	0x405
	.byte	0x12
	.4byte	0x91
	.2byte	0x514
	.uleb128 0x1b
	.ascii	"RXD\000"
	.byte	0xa
	.2byte	0x406
	.byte	0x12
	.4byte	0x91
	.2byte	0x518
	.uleb128 0x1b
	.ascii	"TXD\000"
	.byte	0xa
	.2byte	0x407
	.byte	0x12
	.4byte	0x8c
	.2byte	0x51c
	.uleb128 0x1a
	.4byte	.LASF146
	.byte	0xa
	.2byte	0x408
	.byte	0x12
	.4byte	0x91
	.2byte	0x520
	.uleb128 0x1a
	.4byte	.LASF160
	.byte	0xa
	.2byte	0x409
	.byte	0x12
	.4byte	0x8c
	.2byte	0x524
	.uleb128 0x1a
	.4byte	.LASF161
	.byte	0xa
	.2byte	0x40a
	.byte	0x12
	.4byte	0x90b
	.2byte	0x528
	.uleb128 0x1a
	.4byte	.LASF162
	.byte	0xa
	.2byte	0x40b
	.byte	0x12
	.4byte	0x8c
	.2byte	0x554
	.byte	0
	.uleb128 0xe
	.4byte	0x91
	.4byte	0xa35
	.uleb128 0xf
	.4byte	0x96
	.byte	0x41
	.byte	0
	.uleb128 0x5
	.4byte	0xa25
	.uleb128 0x4
	.4byte	0xa35
	.uleb128 0xe
	.4byte	0x91
	.4byte	0xa4f
	.uleb128 0xf
	.4byte	0x96
	.byte	0x7d
	.byte	0
	.uleb128 0x5
	.4byte	0xa3f
	.uleb128 0x4
	.4byte	0xa4f
	.uleb128 0x13
	.4byte	.LASF163
	.byte	0xa
	.2byte	0x40c
	.byte	0x3
	.4byte	0x92a
	.uleb128 0x19
	.2byte	0x780
	.byte	0xa
	.2byte	0x770
	.byte	0x9
	.4byte	0xb24
	.uleb128 0x15
	.4byte	.LASF137
	.byte	0xa
	.2byte	0x771
	.byte	0x12
	.4byte	0xb3a
	.byte	0
	.uleb128 0x1b
	.ascii	"OUT\000"
	.byte	0xa
	.2byte	0x772
	.byte	0x12
	.4byte	0x8c
	.2byte	0x504
	.uleb128 0x1a
	.4byte	.LASF164
	.byte	0xa
	.2byte	0x773
	.byte	0x12
	.4byte	0x8c
	.2byte	0x508
	.uleb128 0x1a
	.4byte	.LASF165
	.byte	0xa
	.2byte	0x774
	.byte	0x12
	.4byte	0x8c
	.2byte	0x50c
	.uleb128 0x1b
	.ascii	"IN\000"
	.byte	0xa
	.2byte	0x775
	.byte	0x12
	.4byte	0x91
	.2byte	0x510
	.uleb128 0x1b
	.ascii	"DIR\000"
	.byte	0xa
	.2byte	0x776
	.byte	0x12
	.4byte	0x8c
	.2byte	0x514
	.uleb128 0x1a
	.4byte	.LASF166
	.byte	0xa
	.2byte	0x777
	.byte	0x12
	.4byte	0x8c
	.2byte	0x518
	.uleb128 0x1a
	.4byte	.LASF167
	.byte	0xa
	.2byte	0x778
	.byte	0x12
	.4byte	0x8c
	.2byte	0x51c
	.uleb128 0x1a
	.4byte	.LASF168
	.byte	0xa
	.2byte	0x779
	.byte	0x12
	.4byte	0x8c
	.2byte	0x520
	.uleb128 0x1a
	.4byte	.LASF169
	.byte	0xa
	.2byte	0x77b
	.byte	0x12
	.4byte	0x8c
	.2byte	0x524
	.uleb128 0x1a
	.4byte	.LASF155
	.byte	0xa
	.2byte	0x77c
	.byte	0x12
	.4byte	0xb54
	.2byte	0x528
	.uleb128 0x1a
	.4byte	.LASF170
	.byte	0xa
	.2byte	0x77d
	.byte	0x12
	.4byte	0x8f1
	.2byte	0x700
	.byte	0
	.uleb128 0xe
	.4byte	0x91
	.4byte	0xb35
	.uleb128 0x1c
	.4byte	0x96
	.2byte	0x140
	.byte	0
	.uleb128 0x5
	.4byte	0xb24
	.uleb128 0x4
	.4byte	0xb35
	.uleb128 0xe
	.4byte	0x91
	.4byte	0xb4f
	.uleb128 0xf
	.4byte	0x96
	.byte	0x75
	.byte	0
	.uleb128 0x5
	.4byte	0xb3f
	.uleb128 0x4
	.4byte	0xb4f
	.uleb128 0x13
	.4byte	.LASF171
	.byte	0xa
	.2byte	0x77e
	.byte	0x3
	.4byte	0xa66
	.uleb128 0x1d
	.4byte	.LASF172
	.byte	0xc
	.byte	0x4b
	.byte	0x11
	.4byte	0x80
	.uleb128 0x1d
	.4byte	.LASF173
	.byte	0xc
	.byte	0x4c
	.byte	0x11
	.4byte	0x80
	.uleb128 0xc
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x16
	.byte	0x7
	.byte	0x2
	.4byte	0x61
	.byte	0x3
	.byte	0x4b
	.byte	0x1
	.4byte	0xb9a
	.uleb128 0x20
	.4byte	.LASF174
	.2byte	0x108
	.byte	0
	.uleb128 0x3
	.4byte	.LASF175
	.byte	0x3
	.byte	0x4f
	.byte	0x3
	.4byte	0xb84
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x3
	.byte	0x55
	.byte	0x1
	.4byte	0xbbb
	.uleb128 0x18
	.4byte	.LASF176
	.byte	0x4
	.byte	0
	.uleb128 0x16
	.byte	0x5
	.byte	0x4
	.4byte	0x79
	.byte	0x3
	.byte	0x5d
	.byte	0x1
	.4byte	0xc0a
	.uleb128 0x21
	.4byte	.LASF177
	.4byte	0x2000000
	.uleb128 0x21
	.4byte	.LASF178
	.4byte	0x4000000
	.uleb128 0x21
	.4byte	.LASF179
	.4byte	0x8000000
	.uleb128 0x21
	.4byte	.LASF180
	.4byte	0x10000000
	.uleb128 0x21
	.4byte	.LASF181
	.4byte	0x20000000
	.uleb128 0x21
	.4byte	.LASF182
	.4byte	0x40000000
	.uleb128 0x17
	.4byte	.LASF183
	.sleb128 -2147483648
	.byte	0
	.uleb128 0x3
	.4byte	.LASF184
	.byte	0x3
	.byte	0x67
	.byte	0x3
	.4byte	0xbbb
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x3
	.byte	0x6d
	.byte	0x1
	.4byte	0xc3d
	.uleb128 0x18
	.4byte	.LASF185
	.byte	0
	.uleb128 0x18
	.4byte	.LASF186
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF187
	.byte	0x2
	.uleb128 0x18
	.4byte	.LASF188
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF189
	.byte	0x3
	.byte	0x72
	.byte	0x3
	.4byte	0xc16
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.4byte	0xc64
	.uleb128 0x18
	.4byte	.LASF190
	.byte	0
	.uleb128 0x18
	.4byte	.LASF191
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF192
	.byte	0x3
	.byte	0x7b
	.byte	0x3
	.4byte	0xc49
	.uleb128 0xd
	.byte	0x8
	.byte	0xd
	.byte	0x85
	.byte	0x9
	.4byte	0xcae
	.uleb128 0x9
	.4byte	.LASF193
	.byte	0xd
	.byte	0x87
	.byte	0xf
	.4byte	0xab
	.byte	0
	.uleb128 0x22
	.ascii	"irq\000"
	.byte	0xd
	.byte	0x88
	.byte	0xf
	.4byte	0x748
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF194
	.byte	0xd
	.byte	0x89
	.byte	0xf
	.4byte	0x2c
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF195
	.byte	0xd
	.byte	0x8a
	.byte	0xf
	.4byte	0xcae
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF196
	.uleb128 0x4
	.4byte	0xcae
	.uleb128 0x3
	.4byte	.LASF197
	.byte	0xd
	.byte	0x8b
	.byte	0x3
	.4byte	0xc70
	.uleb128 0x5
	.4byte	0xcba
	.uleb128 0x16
	.byte	0x5
	.byte	0x4
	.4byte	0x79
	.byte	0xd
	.byte	0xae
	.byte	0x1
	.4byte	0xd1a
	.uleb128 0x21
	.4byte	.LASF198
	.4byte	0x2000000
	.uleb128 0x21
	.4byte	.LASF199
	.4byte	0x4000000
	.uleb128 0x21
	.4byte	.LASF200
	.4byte	0x8000000
	.uleb128 0x21
	.4byte	.LASF201
	.4byte	0x10000000
	.uleb128 0x21
	.4byte	.LASF202
	.4byte	0x20000000
	.uleb128 0x21
	.4byte	.LASF203
	.4byte	0x40000000
	.uleb128 0x17
	.4byte	.LASF204
	.sleb128 -2147483648
	.byte	0
	.uleb128 0x3
	.4byte	.LASF205
	.byte	0xd
	.byte	0xb6
	.byte	0x3
	.4byte	0xccb
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0xd
	.byte	0xbc
	.byte	0x1
	.4byte	0xd4d
	.uleb128 0x18
	.4byte	.LASF206
	.byte	0
	.uleb128 0x18
	.4byte	.LASF207
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF208
	.byte	0x2
	.uleb128 0x18
	.4byte	.LASF209
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF210
	.byte	0xd
	.byte	0xc1
	.byte	0x3
	.4byte	0xd26
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0xd
	.byte	0xc7
	.byte	0x1
	.4byte	0xd74
	.uleb128 0x18
	.4byte	.LASF211
	.byte	0
	.uleb128 0x18
	.4byte	.LASF212
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF213
	.byte	0xd
	.byte	0xca
	.byte	0x3
	.4byte	0xd59
	.uleb128 0xd
	.byte	0x10
	.byte	0xd
	.byte	0xcf
	.byte	0x9
	.4byte	0xdff
	.uleb128 0x9
	.4byte	.LASF214
	.byte	0xd
	.byte	0xd1
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF215
	.byte	0xd
	.byte	0xd2
	.byte	0xd
	.4byte	0x2c
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF216
	.byte	0xd
	.byte	0xd5
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF217
	.byte	0xd
	.byte	0xd8
	.byte	0xd
	.4byte	0x2c
	.byte	0x3
	.uleb128 0x9
	.4byte	.LASF218
	.byte	0xd
	.byte	0xde
	.byte	0xd
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x22
	.ascii	"orc\000"
	.byte	0xd
	.byte	0xdf
	.byte	0xd
	.4byte	0x2c
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF219
	.byte	0xd
	.byte	0xe2
	.byte	0x1d
	.4byte	0xd1a
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF220
	.byte	0xd
	.byte	0xe3
	.byte	0x1d
	.4byte	0xd4d
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF221
	.byte	0xd
	.byte	0xe4
	.byte	0x1d
	.4byte	0xd74
	.byte	0xd
	.byte	0
	.uleb128 0x3
	.4byte	.LASF222
	.byte	0xd
	.byte	0xe5
	.byte	0x3
	.4byte	0xd80
	.uleb128 0x5
	.4byte	0xdff
	.uleb128 0x1e
	.byte	0x10
	.byte	0xd
	.2byte	0x100
	.byte	0x9
	.4byte	0xe53
	.uleb128 0x15
	.4byte	.LASF223
	.byte	0xd
	.2byte	0x102
	.byte	0x15
	.4byte	0xe53
	.byte	0
	.uleb128 0x15
	.4byte	.LASF224
	.byte	0xd
	.2byte	0x103
	.byte	0x15
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x15
	.4byte	.LASF225
	.byte	0xd
	.2byte	0x104
	.byte	0x15
	.4byte	0xb7e
	.byte	0x8
	.uleb128 0x15
	.4byte	.LASF226
	.byte	0xd
	.2byte	0x105
	.byte	0x15
	.4byte	0x2c
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x3d
	.uleb128 0x13
	.4byte	.LASF227
	.byte	0xd
	.2byte	0x106
	.byte	0x2
	.4byte	0xe10
	.uleb128 0x5
	.4byte	0xe59
	.uleb128 0x23
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0xd
	.2byte	0x12c
	.byte	0x1
	.4byte	0xe81
	.uleb128 0x18
	.4byte	.LASF228
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF229
	.byte	0xd
	.2byte	0x12e
	.byte	0x3
	.4byte	0xe6b
	.uleb128 0x24
	.byte	0x10
	.byte	0xd
	.2byte	0x133
	.byte	0x5
	.4byte	0xea6
	.uleb128 0x25
	.4byte	.LASF348
	.byte	0xd
	.2byte	0x135
	.byte	0x21
	.4byte	0xe59
	.byte	0
	.uleb128 0x1e
	.byte	0x14
	.byte	0xd
	.2byte	0x130
	.byte	0x9
	.4byte	0xecd
	.uleb128 0x15
	.4byte	.LASF230
	.byte	0xd
	.2byte	0x132
	.byte	0x1d
	.4byte	0xe81
	.byte	0
	.uleb128 0x15
	.4byte	.LASF58
	.byte	0xd
	.2byte	0x136
	.byte	0x7
	.4byte	0xe8e
	.byte	0x4
	.byte	0
	.uleb128 0x13
	.4byte	.LASF231
	.byte	0xd
	.2byte	0x137
	.byte	0x3
	.4byte	0xea6
	.uleb128 0x5
	.4byte	0xecd
	.uleb128 0x13
	.4byte	.LASF232
	.byte	0xd
	.2byte	0x13c
	.byte	0x11
	.4byte	0xeec
	.uleb128 0xc
	.byte	0x4
	.4byte	0xef2
	.uleb128 0x26
	.4byte	0xf02
	.uleb128 0xb
	.4byte	0xf02
	.uleb128 0xb
	.4byte	0xab
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xeda
	.uleb128 0x13
	.4byte	.LASF233
	.byte	0xe
	.2byte	0x317
	.byte	0x1b
	.4byte	0xf15
	.uleb128 0x12
	.4byte	.LASF235
	.uleb128 0x10
	.4byte	.LASF236
	.byte	0xe
	.2byte	0x31b
	.byte	0xe
	.4byte	0xf27
	.uleb128 0xc
	.byte	0x4
	.4byte	0xf08
	.uleb128 0x10
	.4byte	.LASF237
	.byte	0xe
	.2byte	0x31c
	.byte	0xe
	.4byte	0xf27
	.uleb128 0x10
	.4byte	.LASF238
	.byte	0xe
	.2byte	0x31d
	.byte	0xe
	.4byte	0xf27
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x4
	.byte	0x67
	.byte	0x1
	.4byte	0xf68
	.uleb128 0x18
	.4byte	.LASF239
	.byte	0
	.uleb128 0x18
	.4byte	.LASF240
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF241
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF242
	.byte	0x4
	.byte	0x6b
	.byte	0x3
	.4byte	0xf47
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x5
	.byte	0x50
	.byte	0x1
	.4byte	0xf8f
	.uleb128 0x18
	.4byte	.LASF243
	.byte	0
	.uleb128 0x18
	.4byte	.LASF244
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF245
	.byte	0x5
	.byte	0x53
	.byte	0x3
	.4byte	0xf74
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x5
	.byte	0x59
	.byte	0x1
	.4byte	0xfb6
	.uleb128 0x18
	.4byte	.LASF246
	.byte	0
	.uleb128 0x18
	.4byte	.LASF247
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF248
	.byte	0x5
	.byte	0x5c
	.byte	0x3
	.4byte	0xf9b
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x5
	.byte	0x62
	.byte	0x1
	.4byte	0xfe3
	.uleb128 0x18
	.4byte	.LASF249
	.byte	0
	.uleb128 0x18
	.4byte	.LASF250
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF251
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF252
	.byte	0x5
	.byte	0x66
	.byte	0x3
	.4byte	0xfc2
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x5
	.byte	0x6c
	.byte	0x1
	.4byte	0x102e
	.uleb128 0x18
	.4byte	.LASF253
	.byte	0
	.uleb128 0x18
	.4byte	.LASF254
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF255
	.byte	0x2
	.uleb128 0x18
	.4byte	.LASF256
	.byte	0x3
	.uleb128 0x18
	.4byte	.LASF257
	.byte	0x4
	.uleb128 0x18
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF259
	.byte	0x6
	.uleb128 0x18
	.4byte	.LASF260
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF261
	.byte	0x5
	.byte	0x75
	.byte	0x3
	.4byte	0xfef
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x5
	.byte	0x7b
	.byte	0x1
	.4byte	0x105b
	.uleb128 0x18
	.4byte	.LASF262
	.byte	0
	.uleb128 0x18
	.4byte	.LASF263
	.byte	0x3
	.uleb128 0x18
	.4byte	.LASF264
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF265
	.byte	0x5
	.byte	0x7f
	.byte	0x3
	.4byte	0x103a
	.uleb128 0x1e
	.byte	0xc
	.byte	0xf
	.2byte	0x12b
	.byte	0x9
	.4byte	0x10aa
	.uleb128 0x15
	.4byte	.LASF266
	.byte	0xf
	.2byte	0x12d
	.byte	0x12
	.4byte	0x55
	.byte	0
	.uleb128 0x15
	.4byte	.LASF267
	.byte	0xf
	.2byte	0x12e
	.byte	0x12
	.4byte	0x55
	.byte	0x2
	.uleb128 0x15
	.4byte	.LASF268
	.byte	0xf
	.2byte	0x12f
	.byte	0x12
	.4byte	0x80
	.byte	0x4
	.uleb128 0x15
	.4byte	.LASF269
	.byte	0xf
	.2byte	0x130
	.byte	0x12
	.4byte	0x80
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.4byte	.LASF270
	.byte	0xf
	.2byte	0x131
	.byte	0x3
	.4byte	0x1067
	.uleb128 0x10
	.4byte	.LASF271
	.byte	0xf
	.2byte	0x13b
	.byte	0x26
	.4byte	0x10aa
	.uleb128 0xd
	.byte	0x24
	.byte	0x6
	.byte	0x6e
	.byte	0x9
	.4byte	0x1166
	.uleb128 0x9
	.4byte	.LASF272
	.byte	0x6
	.byte	0x70
	.byte	0x1f
	.4byte	0xedf
	.byte	0
	.uleb128 0x9
	.4byte	.LASF273
	.byte	0x6
	.byte	0x71
	.byte	0x1b
	.4byte	0xab
	.byte	0x4
	.uleb128 0x22
	.ascii	"evt\000"
	.byte	0x6
	.byte	0x72
	.byte	0x1b
	.4byte	0xecd
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF274
	.byte	0x6
	.byte	0x73
	.byte	0x1b
	.4byte	0xf68
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF275
	.byte	0x6
	.byte	0x74
	.byte	0x1b
	.4byte	0xcb5
	.byte	0x1d
	.uleb128 0x9
	.4byte	.LASF217
	.byte	0x6
	.byte	0x78
	.byte	0x15
	.4byte	0x2c
	.byte	0x1e
	.uleb128 0x22
	.ascii	"orc\000"
	.byte	0x6
	.byte	0x79
	.byte	0x15
	.4byte	0x2c
	.byte	0x1f
	.uleb128 0x9
	.4byte	.LASF276
	.byte	0x6
	.byte	0x7a
	.byte	0x15
	.4byte	0x2c
	.byte	0x20
	.uleb128 0x27
	.4byte	.LASF277
	.byte	0x6
	.byte	0x81
	.byte	0xa
	.4byte	0xcae
	.byte	0x1
	.byte	0x1
	.byte	0x7
	.byte	0x21
	.uleb128 0x27
	.4byte	.LASF278
	.byte	0x6
	.byte	0x82
	.byte	0xa
	.4byte	0xcae
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.byte	0x21
	.uleb128 0x27
	.4byte	.LASF279
	.byte	0x6
	.byte	0x83
	.byte	0xa
	.4byte	0xcae
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.byte	0x21
	.byte	0
	.uleb128 0x3
	.4byte	.LASF280
	.byte	0x6
	.byte	0x84
	.byte	0x3
	.4byte	0x10c4
	.uleb128 0xe
	.4byte	0x1166
	.4byte	0x1182
	.uleb128 0xf
	.4byte	0x96
	.byte	0
	.byte	0
	.uleb128 0x28
	.4byte	.LASF281
	.byte	0x6
	.byte	0x85
	.byte	0x1c
	.4byte	0x1172
	.uleb128 0x5
	.byte	0x3
	.4byte	m_cb
	.uleb128 0x29
	.4byte	.LASF284
	.byte	0x6
	.2byte	0x2ed
	.byte	0x1
	.4byte	.LFB231
	.4byte	.LFE231-.LFB231
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11bc
	.uleb128 0x2a
	.4byte	.LASF282
	.byte	0x6
	.2byte	0x2ef
	.byte	0x1b
	.4byte	0x11bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x1166
	.uleb128 0x2b
	.4byte	.LASF290
	.byte	0x6
	.2byte	0x2d2
	.byte	0xd
	.4byte	.LFB230
	.4byte	.LFE230-.LFB230
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11fa
	.uleb128 0x2c
	.4byte	.LASF283
	.byte	0x6
	.2byte	0x2d2
	.byte	0x2c
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2c
	.4byte	.LASF282
	.byte	0x6
	.2byte	0x2d2
	.byte	0x49
	.4byte	0x11bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xa59
	.uleb128 0x2d
	.4byte	.LASF285
	.byte	0x6
	.2byte	0x28e
	.byte	0x6
	.4byte	.LFB229
	.4byte	.LFE229-.LFB229
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1238
	.uleb128 0x2c
	.4byte	.LASF286
	.byte	0x6
	.2byte	0x28e
	.byte	0x2e
	.4byte	0x1238
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2a
	.4byte	.LASF282
	.byte	0x6
	.2byte	0x290
	.byte	0x1b
	.4byte	0x11bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xcc6
	.uleb128 0x5
	.4byte	0x1238
	.uleb128 0x2e
	.4byte	.LASF295
	.byte	0x6
	.2byte	0x252
	.byte	0xc
	.4byte	0x613
	.4byte	.LFB228
	.4byte	.LFE228-.LFB228
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12b8
	.uleb128 0x2c
	.4byte	.LASF286
	.byte	0x6
	.2byte	0x252
	.byte	0x3d
	.4byte	0x123e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2c
	.4byte	.LASF287
	.byte	0x6
	.2byte	0x253
	.byte	0x3d
	.4byte	0x12b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2c
	.4byte	.LASF288
	.byte	0x6
	.2byte	0x254
	.byte	0x3d
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2a
	.4byte	.LASF282
	.byte	0x6
	.2byte	0x256
	.byte	0x1b
	.4byte	0x11bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2a
	.4byte	.LASF289
	.byte	0x6
	.2byte	0x25b
	.byte	0x10
	.4byte	0x613
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2f
	.4byte	.LASF303
	.4byte	0x12ce
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xe66
	.uleb128 0xe
	.4byte	0x102
	.4byte	0x12ce
	.uleb128 0xf
	.4byte	0x96
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.4byte	0x12be
	.uleb128 0x2b
	.4byte	.LASF291
	.byte	0x6
	.2byte	0x1b9
	.byte	0xd
	.4byte	.LFB227
	.4byte	.LFE227-.LFB227
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x131b
	.uleb128 0x2c
	.4byte	.LASF283
	.byte	0x6
	.2byte	0x1b9
	.byte	0x36
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2c
	.4byte	.LASF282
	.byte	0x6
	.2byte	0x1ba
	.byte	0x36
	.4byte	0x11bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2c
	.4byte	.LASF287
	.byte	0x6
	.2byte	0x1bb
	.byte	0x36
	.4byte	0x12b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x30
	.4byte	.LASF320
	.byte	0x6
	.2byte	0x188
	.byte	0xd
	.4byte	0xcae
	.4byte	.LFB226
	.4byte	.LFE226-.LFB226
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1377
	.uleb128 0x2c
	.4byte	.LASF283
	.byte	0x6
	.2byte	0x188
	.byte	0x2a
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2c
	.4byte	.LASF282
	.byte	0x6
	.2byte	0x188
	.byte	0x47
	.4byte	0x11bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2a
	.4byte	.LASF292
	.byte	0x6
	.2byte	0x18c
	.byte	0x16
	.4byte	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -11
	.uleb128 0x2a
	.4byte	.LASF293
	.byte	0x6
	.2byte	0x19c
	.byte	0xe
	.4byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF294
	.byte	0x6
	.2byte	0x16f
	.byte	0xd
	.4byte	.LFB225
	.4byte	.LFE225-.LFB225
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x139f
	.uleb128 0x2c
	.4byte	.LASF282
	.byte	0x6
	.2byte	0x16f
	.byte	0x33
	.4byte	0x11bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF296
	.byte	0x6
	.2byte	0x15d
	.byte	0xc
	.4byte	0x613
	.4byte	.LFB224
	.4byte	.LFE224-.LFB224
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x141b
	.uleb128 0x2c
	.4byte	.LASF286
	.byte	0x6
	.2byte	0x15d
	.byte	0x3d
	.4byte	0x123e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2c
	.4byte	.LASF223
	.byte	0x6
	.2byte	0x15e
	.byte	0x31
	.4byte	0xe53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2c
	.4byte	.LASF297
	.byte	0x6
	.2byte	0x15f
	.byte	0x31
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x2c
	.4byte	.LASF225
	.byte	0x6
	.2byte	0x160
	.byte	0x31
	.4byte	0xb7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2c
	.4byte	.LASF298
	.byte	0x6
	.2byte	0x161
	.byte	0x31
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2a
	.4byte	.LASF299
	.byte	0x6
	.2byte	0x163
	.byte	0x1d
	.4byte	0xe59
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x29
	.4byte	.LASF300
	.byte	0x6
	.2byte	0x12e
	.byte	0x6
	.4byte	.LFB223
	.4byte	.LFE223-.LFB223
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x146d
	.uleb128 0x2c
	.4byte	.LASF286
	.byte	0x6
	.2byte	0x12e
	.byte	0x35
	.4byte	0x123e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2a
	.4byte	.LASF282
	.byte	0x6
	.2byte	0x130
	.byte	0x1b
	.4byte	0x11bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x31
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x2a
	.4byte	.LASF283
	.byte	0x6
	.2byte	0x14b
	.byte	0x5
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x32
	.4byte	.LASF301
	.byte	0x6
	.byte	0xa3
	.byte	0xc
	.4byte	0x613
	.4byte	.LFB222
	.4byte	.LFE222-.LFB222
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1523
	.uleb128 0x33
	.4byte	.LASF286
	.byte	0x6
	.byte	0xa3
	.byte	0x39
	.4byte	0x123e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x33
	.4byte	.LASF302
	.byte	0x6
	.byte	0xa4
	.byte	0x3a
	.4byte	0x1523
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x33
	.4byte	.LASF272
	.byte	0x6
	.byte	0xa5
	.byte	0x37
	.4byte	0xedf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x33
	.4byte	.LASF273
	.byte	0x6
	.byte	0xa6
	.byte	0x24
	.4byte	0xab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x28
	.4byte	.LASF282
	.byte	0x6
	.byte	0xa9
	.byte	0x1b
	.4byte	0x11bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x28
	.4byte	.LASF289
	.byte	0x6
	.byte	0xaa
	.byte	0x10
	.4byte	0x613
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2f
	.4byte	.LASF303
	.4byte	0x12ce
	.uleb128 0x28
	.4byte	.LASF215
	.byte	0x6
	.byte	0xc4
	.byte	0xe
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x28
	.4byte	.LASF216
	.byte	0x6
	.byte	0xc5
	.byte	0xe
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x31
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.uleb128 0x2a
	.4byte	.LASF283
	.byte	0x6
	.2byte	0x109
	.byte	0x5
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xe0b
	.uleb128 0x34
	.4byte	.LASF304
	.byte	0x5
	.2byte	0x2de
	.byte	0x16
	.4byte	.LFB217
	.4byte	.LFE217-.LFB217
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1561
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x5
	.2byte	0x2de
	.byte	0x3e
	.4byte	0x1561
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF306
	.byte	0x5
	.2byte	0x2de
	.byte	0x4e
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xb59
	.uleb128 0x34
	.4byte	.LASF307
	.byte	0x5
	.2byte	0x2d8
	.byte	0x16
	.4byte	.LFB216
	.4byte	.LFE216-.LFB216
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x159f
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x5
	.2byte	0x2d8
	.byte	0x3c
	.4byte	0x1561
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF308
	.byte	0x5
	.2byte	0x2d8
	.byte	0x4c
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF309
	.byte	0x5
	.2byte	0x276
	.byte	0x16
	.4byte	.LFB203
	.4byte	.LFE203-.LFB203
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15d7
	.uleb128 0x2c
	.4byte	.LASF310
	.byte	0x5
	.2byte	0x276
	.byte	0x32
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x35
	.ascii	"reg\000"
	.byte	0x5
	.2byte	0x278
	.byte	0x15
	.4byte	0x1561
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF311
	.byte	0x5
	.2byte	0x26e
	.byte	0x16
	.4byte	.LFB202
	.4byte	.LFE202-.LFB202
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x160f
	.uleb128 0x2c
	.4byte	.LASF310
	.byte	0x5
	.2byte	0x26e
	.byte	0x30
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x35
	.ascii	"reg\000"
	.byte	0x5
	.2byte	0x270
	.byte	0x15
	.4byte	0x1561
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF312
	.byte	0x5
	.2byte	0x216
	.byte	0x16
	.4byte	.LFB195
	.4byte	.LFE195-.LFB195
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1647
	.uleb128 0x2c
	.4byte	.LASF310
	.byte	0x5
	.2byte	0x216
	.byte	0x32
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2c
	.4byte	.LASF313
	.byte	0x5
	.2byte	0x216
	.byte	0x52
	.4byte	0xfe3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF314
	.byte	0x5
	.2byte	0x20a
	.byte	0x16
	.4byte	.LFB194
	.4byte	.LFE194-.LFB194
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x166f
	.uleb128 0x2c
	.4byte	.LASF310
	.byte	0x5
	.2byte	0x20a
	.byte	0x33
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF315
	.byte	0x5
	.2byte	0x1f8
	.byte	0x16
	.4byte	.LFB193
	.4byte	.LFE193-.LFB193
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16f7
	.uleb128 0x2c
	.4byte	.LASF310
	.byte	0x5
	.2byte	0x1f9
	.byte	0x1a
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x36
	.ascii	"dir\000"
	.byte	0x5
	.2byte	0x1fa
	.byte	0x1a
	.4byte	0xf8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x2c
	.4byte	.LASF316
	.byte	0x5
	.2byte	0x1fb
	.byte	0x1a
	.4byte	0xfb6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x2c
	.4byte	.LASF317
	.byte	0x5
	.2byte	0x1fc
	.byte	0x1a
	.4byte	0xfe3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x2c
	.4byte	.LASF318
	.byte	0x5
	.2byte	0x1fd
	.byte	0x1a
	.4byte	0x102e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2c
	.4byte	.LASF319
	.byte	0x5
	.2byte	0x1fe
	.byte	0x1a
	.4byte	0x105b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x35
	.ascii	"reg\000"
	.byte	0x5
	.2byte	0x200
	.byte	0x15
	.4byte	0x1561
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x37
	.4byte	.LASF321
	.byte	0x5
	.2byte	0x1ce
	.byte	0x21
	.4byte	0x1561
	.4byte	.LFB190
	.4byte	.LFE190-.LFB190
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1723
	.uleb128 0x2c
	.4byte	.LASF322
	.byte	0x5
	.2byte	0x1ce
	.byte	0x45
	.4byte	0x1723
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x80
	.uleb128 0x2b
	.4byte	.LASF323
	.byte	0x4
	.2byte	0x12d
	.byte	0x16
	.4byte	.LFB184
	.4byte	.LFE184-.LFB184
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1751
	.uleb128 0x2c
	.4byte	.LASF324
	.byte	0x4
	.2byte	0x12d
	.byte	0x3b
	.4byte	0x748
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x34
	.4byte	.LASF325
	.byte	0x3
	.2byte	0x14e
	.byte	0x16
	.4byte	.LFB159
	.4byte	.LFE159-.LFB159
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17a9
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x14e
	.byte	0x37
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2c
	.4byte	.LASF326
	.byte	0x3
	.2byte	0x14f
	.byte	0x37
	.4byte	0xc3d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x2c
	.4byte	.LASF327
	.byte	0x3
	.2byte	0x150
	.byte	0x3c
	.4byte	0xc64
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x2a
	.4byte	.LASF328
	.byte	0x3
	.2byte	0x152
	.byte	0xe
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x34
	.4byte	.LASF329
	.byte	0x3
	.2byte	0x148
	.byte	0x16
	.4byte	.LFB158
	.4byte	.LFE158-.LFB158
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17e1
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x148
	.byte	0x3b
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF219
	.byte	0x3
	.2byte	0x149
	.byte	0x40
	.4byte	0xc0a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x37
	.4byte	.LASF330
	.byte	0x3
	.2byte	0x143
	.byte	0x19
	.4byte	0x2c
	.4byte	.LFB157
	.4byte	.LFE157-.LFB157
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x180d
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x143
	.byte	0x38
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x34
	.4byte	.LASF331
	.byte	0x3
	.2byte	0x13e
	.byte	0x16
	.4byte	.LFB156
	.4byte	.LFE156-.LFB156
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1845
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x13e
	.byte	0x35
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF58
	.byte	0x3
	.2byte	0x13e
	.byte	0x44
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -5
	.byte	0
	.uleb128 0x34
	.4byte	.LASF332
	.byte	0x3
	.2byte	0x134
	.byte	0x16
	.4byte	.LFB155
	.4byte	.LFE155-.LFB155
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x189d
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x134
	.byte	0x36
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF214
	.byte	0x3
	.2byte	0x135
	.byte	0x30
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x2c
	.4byte	.LASF215
	.byte	0x3
	.2byte	0x136
	.byte	0x30
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2c
	.4byte	.LASF216
	.byte	0x3
	.2byte	0x137
	.byte	0x30
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x34
	.4byte	.LASF333
	.byte	0x3
	.2byte	0x12f
	.byte	0x16
	.4byte	.LFB154
	.4byte	.LFE154-.LFB154
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18c5
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x12f
	.byte	0x35
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x34
	.4byte	.LASF334
	.byte	0x3
	.2byte	0x12a
	.byte	0x16
	.4byte	.LFB153
	.4byte	.LFE153-.LFB153
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18ed
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x12a
	.byte	0x34
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x34
	.4byte	.LASF335
	.byte	0x3
	.2byte	0x11e
	.byte	0x16
	.4byte	.LFB151
	.4byte	.LFE151-.LFB151
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1925
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x11e
	.byte	0x39
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF336
	.byte	0x3
	.2byte	0x11f
	.byte	0x33
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x34
	.4byte	.LASF337
	.byte	0x3
	.2byte	0x118
	.byte	0x16
	.4byte	.LFB150
	.4byte	.LFE150-.LFB150
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x195d
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x118
	.byte	0x38
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF336
	.byte	0x3
	.2byte	0x119
	.byte	0x32
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x37
	.4byte	.LASF338
	.byte	0x3
	.2byte	0x10c
	.byte	0x16
	.4byte	0xcae
	.4byte	.LFB148
	.4byte	.LFE148-.LFB148
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1999
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x10c
	.byte	0x39
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF339
	.byte	0x3
	.2byte	0x10d
	.byte	0x3a
	.4byte	0xb9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -6
	.byte	0
	.uleb128 0x34
	.4byte	.LASF340
	.byte	0x3
	.2byte	0x102
	.byte	0x16
	.4byte	.LFB147
	.4byte	.LFE147-.LFB147
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19e1
	.uleb128 0x2c
	.4byte	.LASF305
	.byte	0x3
	.2byte	0x102
	.byte	0x39
	.4byte	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2c
	.4byte	.LASF339
	.byte	0x3
	.2byte	0x103
	.byte	0x3a
	.4byte	0xb9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x2a
	.4byte	.LASF341
	.byte	0x3
	.2byte	0x107
	.byte	0x17
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x34
	.4byte	.LASF342
	.byte	0x1
	.2byte	0x6bc
	.byte	0x16
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a2b
	.uleb128 0x2c
	.4byte	.LASF324
	.byte	0x1
	.2byte	0x6bc
	.byte	0x32
	.4byte	0x748
	.uleb128 0x2
	.byte	0x91
	.sleb128 -1
	.uleb128 0x38
	.4byte	0x1a2b
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.byte	0x1
	.2byte	0x6c1
	.byte	0x5
	.uleb128 0x38
	.4byte	0x1a35
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.byte	0x1
	.2byte	0x6c2
	.byte	0x5
	.byte	0
	.uleb128 0x39
	.4byte	.LASF343
	.byte	0x2
	.2byte	0x36d
	.byte	0x1b
	.byte	0x3
	.uleb128 0x39
	.4byte	.LASF344
	.byte	0x2
	.2byte	0x362
	.byte	0x1b
	.byte	0x3
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x6e8
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1a40
	.4byte	0xb92
	.ascii	"NRF_SPI_EVENT_READY\000"
	.4byte	0xbb4
	.ascii	"NRF_SPI_INT_READY_MASK\000"
	.4byte	0xbc9
	.ascii	"NRF_SPI_FREQ_125K\000"
	.4byte	0xbd2
	.ascii	"NRF_SPI_FREQ_250K\000"
	.4byte	0xbdb
	.ascii	"NRF_SPI_FREQ_500K\000"
	.4byte	0xbe4
	.ascii	"NRF_SPI_FREQ_1M\000"
	.4byte	0xbed
	.ascii	"NRF_SPI_FREQ_2M\000"
	.4byte	0xbf6
	.ascii	"NRF_SPI_FREQ_4M\000"
	.4byte	0xbff
	.ascii	"NRF_SPI_FREQ_8M\000"
	.4byte	0xc24
	.ascii	"NRF_SPI_MODE_0\000"
	.4byte	0xc2a
	.ascii	"NRF_SPI_MODE_1\000"
	.4byte	0xc30
	.ascii	"NRF_SPI_MODE_2\000"
	.4byte	0xc36
	.ascii	"NRF_SPI_MODE_3\000"
	.4byte	0xc57
	.ascii	"NRF_SPI_BIT_ORDER_MSB_FIRST\000"
	.4byte	0xc5d
	.ascii	"NRF_SPI_BIT_ORDER_LSB_FIRST\000"
	.4byte	0xd34
	.ascii	"NRF_DRV_SPI_MODE_0\000"
	.4byte	0xd3a
	.ascii	"NRF_DRV_SPI_MODE_1\000"
	.4byte	0xd40
	.ascii	"NRF_DRV_SPI_MODE_2\000"
	.4byte	0xd46
	.ascii	"NRF_DRV_SPI_MODE_3\000"
	.4byte	0xe7a
	.ascii	"NRF_DRV_SPI_EVENT_DONE\000"
	.4byte	0xf55
	.ascii	"NRF_DRV_STATE_UNINITIALIZED\000"
	.4byte	0xf5b
	.ascii	"NRF_DRV_STATE_INITIALIZED\000"
	.4byte	0xf61
	.ascii	"NRF_DRV_STATE_POWERED_ON\000"
	.4byte	0xf82
	.ascii	"NRF_GPIO_PIN_DIR_INPUT\000"
	.4byte	0xf88
	.ascii	"NRF_GPIO_PIN_DIR_OUTPUT\000"
	.4byte	0xfa9
	.ascii	"NRF_GPIO_PIN_INPUT_CONNECT\000"
	.4byte	0xfaf
	.ascii	"NRF_GPIO_PIN_INPUT_DISCONNECT\000"
	.4byte	0xfd0
	.ascii	"NRF_GPIO_PIN_NOPULL\000"
	.4byte	0xfd6
	.ascii	"NRF_GPIO_PIN_PULLDOWN\000"
	.4byte	0xfdc
	.ascii	"NRF_GPIO_PIN_PULLUP\000"
	.4byte	0xffd
	.ascii	"NRF_GPIO_PIN_S0S1\000"
	.4byte	0x1003
	.ascii	"NRF_GPIO_PIN_H0S1\000"
	.4byte	0x1009
	.ascii	"NRF_GPIO_PIN_S0H1\000"
	.4byte	0x100f
	.ascii	"NRF_GPIO_PIN_H0H1\000"
	.4byte	0x1015
	.ascii	"NRF_GPIO_PIN_D0S1\000"
	.4byte	0x101b
	.ascii	"NRF_GPIO_PIN_D0H1\000"
	.4byte	0x1021
	.ascii	"NRF_GPIO_PIN_S0D1\000"
	.4byte	0x1027
	.ascii	"NRF_GPIO_PIN_H0D1\000"
	.4byte	0x1048
	.ascii	"NRF_GPIO_PIN_NOSENSE\000"
	.4byte	0x104e
	.ascii	"NRF_GPIO_PIN_SENSE_LOW\000"
	.4byte	0x1054
	.ascii	"NRF_GPIO_PIN_SENSE_HIGH\000"
	.4byte	0x1182
	.ascii	"m_cb\000"
	.4byte	0x1182
	.ascii	"m_cb\000"
	.4byte	0x1194
	.ascii	"SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQHandler\000"
	.4byte	0x11c2
	.ascii	"irq_handler_spi\000"
	.4byte	0x1200
	.ascii	"nrf_drv_spi_abort\000"
	.4byte	0x1243
	.ascii	"nrf_drv_spi_xfer\000"
	.4byte	0x12d3
	.ascii	"spi_xfer\000"
	.4byte	0x131b
	.ascii	"transfer_byte\000"
	.4byte	0x1377
	.ascii	"finish_transfer\000"
	.4byte	0x139f
	.ascii	"nrf_drv_spi_transfer\000"
	.4byte	0x141b
	.ascii	"nrf_drv_spi_uninit\000"
	.4byte	0x146d
	.ascii	"nrf_drv_spi_init\000"
	.4byte	0x1529
	.ascii	"nrf_gpio_port_out_clear\000"
	.4byte	0x1567
	.ascii	"nrf_gpio_port_out_set\000"
	.4byte	0x159f
	.ascii	"nrf_gpio_pin_clear\000"
	.4byte	0x15d7
	.ascii	"nrf_gpio_pin_set\000"
	.4byte	0x160f
	.ascii	"nrf_gpio_cfg_input\000"
	.4byte	0x1647
	.ascii	"nrf_gpio_cfg_output\000"
	.4byte	0x166f
	.ascii	"nrf_gpio_cfg\000"
	.4byte	0x16f7
	.ascii	"nrf_gpio_pin_port_decode\000"
	.4byte	0x1729
	.ascii	"nrf_drv_common_irq_disable\000"
	.4byte	0x1751
	.ascii	"nrf_spi_configure\000"
	.4byte	0x17a9
	.ascii	"nrf_spi_frequency_set\000"
	.4byte	0x17e1
	.ascii	"nrf_spi_rxd_get\000"
	.4byte	0x180d
	.ascii	"nrf_spi_txd_set\000"
	.4byte	0x1845
	.ascii	"nrf_spi_pins_set\000"
	.4byte	0x189d
	.ascii	"nrf_spi_disable\000"
	.4byte	0x18c5
	.ascii	"nrf_spi_enable\000"
	.4byte	0x18ed
	.ascii	"nrf_spi_int_disable\000"
	.4byte	0x1925
	.ascii	"nrf_spi_int_enable\000"
	.4byte	0x195d
	.ascii	"nrf_spi_event_check\000"
	.4byte	0x1999
	.ascii	"nrf_spi_event_clear\000"
	.4byte	0x19e1
	.ascii	"__NVIC_DisableIRQ\000"
	.4byte	0x1a2b
	.ascii	"__DSB\000"
	.4byte	0x1a35
	.ascii	"__ISB\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x410
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1a40
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x42
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x4e
	.ascii	"short int\000"
	.4byte	0x61
	.ascii	"short unsigned int\000"
	.4byte	0x55
	.ascii	"uint16_t\000"
	.4byte	0x79
	.ascii	"int\000"
	.4byte	0x68
	.ascii	"int32_t\000"
	.4byte	0x96
	.ascii	"unsigned int\000"
	.4byte	0x80
	.ascii	"uint32_t\000"
	.4byte	0x9d
	.ascii	"long long int\000"
	.4byte	0xa4
	.ascii	"long long unsigned int\000"
	.4byte	0xd5
	.ascii	"long int\000"
	.4byte	0xad
	.ascii	"__mbstate_s\000"
	.4byte	0xfb
	.ascii	"char\000"
	.4byte	0x2e1
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x3ce
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x41c
	.ascii	"__RAL_locale_t\000"
	.4byte	0x42d
	.ascii	"__locale_s\000"
	.4byte	0x5a0
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x5c2
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x5f3
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x613
	.ascii	"ret_code_t\000"
	.4byte	0x748
	.ascii	"IRQn_Type\000"
	.4byte	0x879
	.ascii	"NVIC_Type\000"
	.4byte	0x8d4
	.ascii	"SPI_PSEL_Type\000"
	.4byte	0xa59
	.ascii	"NRF_SPI_Type\000"
	.4byte	0xb59
	.ascii	"NRF_GPIO_Type\000"
	.4byte	0xb9a
	.ascii	"nrf_spi_event_t\000"
	.4byte	0xc0a
	.ascii	"nrf_spi_frequency_t\000"
	.4byte	0xc3d
	.ascii	"nrf_spi_mode_t\000"
	.4byte	0xc64
	.ascii	"nrf_spi_bit_order_t\000"
	.4byte	0xcae
	.ascii	"_Bool\000"
	.4byte	0xcba
	.ascii	"nrf_drv_spi_t\000"
	.4byte	0xd1a
	.ascii	"nrf_drv_spi_frequency_t\000"
	.4byte	0xd4d
	.ascii	"nrf_drv_spi_mode_t\000"
	.4byte	0xd74
	.ascii	"nrf_drv_spi_bit_order_t\000"
	.4byte	0xdff
	.ascii	"nrf_drv_spi_config_t\000"
	.4byte	0xe59
	.ascii	"nrf_drv_spi_xfer_desc_t\000"
	.4byte	0xe81
	.ascii	"nrf_drv_spi_evt_type_t\000"
	.4byte	0xecd
	.ascii	"nrf_drv_spi_evt_t\000"
	.4byte	0xedf
	.ascii	"nrf_drv_spi_evt_handler_t\000"
	.4byte	0xf08
	.ascii	"FILE\000"
	.4byte	0xf68
	.ascii	"nrf_drv_state_t\000"
	.4byte	0xf8f
	.ascii	"nrf_gpio_pin_dir_t\000"
	.4byte	0xfb6
	.ascii	"nrf_gpio_pin_input_t\000"
	.4byte	0xfe3
	.ascii	"nrf_gpio_pin_pull_t\000"
	.4byte	0x102e
	.ascii	"nrf_gpio_pin_drive_t\000"
	.4byte	0x105b
	.ascii	"nrf_gpio_pin_sense_t\000"
	.4byte	0x10aa
	.ascii	"nrf_log_module_dynamic_data_t\000"
	.4byte	0x1166
	.ascii	"spi_control_block_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x10c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.4byte	.LFB147
	.4byte	.LFE147-.LFB147
	.4byte	.LFB148
	.4byte	.LFE148-.LFB148
	.4byte	.LFB150
	.4byte	.LFE150-.LFB150
	.4byte	.LFB151
	.4byte	.LFE151-.LFB151
	.4byte	.LFB153
	.4byte	.LFE153-.LFB153
	.4byte	.LFB154
	.4byte	.LFE154-.LFB154
	.4byte	.LFB155
	.4byte	.LFE155-.LFB155
	.4byte	.LFB156
	.4byte	.LFE156-.LFB156
	.4byte	.LFB157
	.4byte	.LFE157-.LFB157
	.4byte	.LFB158
	.4byte	.LFE158-.LFB158
	.4byte	.LFB159
	.4byte	.LFE159-.LFB159
	.4byte	.LFB184
	.4byte	.LFE184-.LFB184
	.4byte	.LFB190
	.4byte	.LFE190-.LFB190
	.4byte	.LFB193
	.4byte	.LFE193-.LFB193
	.4byte	.LFB194
	.4byte	.LFE194-.LFB194
	.4byte	.LFB195
	.4byte	.LFE195-.LFB195
	.4byte	.LFB202
	.4byte	.LFE202-.LFB202
	.4byte	.LFB203
	.4byte	.LFE203-.LFB203
	.4byte	.LFB216
	.4byte	.LFE216-.LFB216
	.4byte	.LFB217
	.4byte	.LFE217-.LFB217
	.4byte	.LFB222
	.4byte	.LFE222-.LFB222
	.4byte	.LFB223
	.4byte	.LFE223-.LFB223
	.4byte	.LFB224
	.4byte	.LFE224-.LFB224
	.4byte	.LFB225
	.4byte	.LFE225-.LFB225
	.4byte	.LFB226
	.4byte	.LFE226-.LFB226
	.4byte	.LFB227
	.4byte	.LFE227-.LFB227
	.4byte	.LFB228
	.4byte	.LFE228-.LFB228
	.4byte	.LFB229
	.4byte	.LFE229-.LFB229
	.4byte	.LFB230
	.4byte	.LFE230-.LFB230
	.4byte	.LFB231
	.4byte	.LFE231-.LFB231
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB107
	.4byte	.LFE107
	.4byte	.LFB147
	.4byte	.LFE147
	.4byte	.LFB148
	.4byte	.LFE148
	.4byte	.LFB150
	.4byte	.LFE150
	.4byte	.LFB151
	.4byte	.LFE151
	.4byte	.LFB153
	.4byte	.LFE153
	.4byte	.LFB154
	.4byte	.LFE154
	.4byte	.LFB155
	.4byte	.LFE155
	.4byte	.LFB156
	.4byte	.LFE156
	.4byte	.LFB157
	.4byte	.LFE157
	.4byte	.LFB158
	.4byte	.LFE158
	.4byte	.LFB159
	.4byte	.LFE159
	.4byte	.LFB184
	.4byte	.LFE184
	.4byte	.LFB190
	.4byte	.LFE190
	.4byte	.LFB193
	.4byte	.LFE193
	.4byte	.LFB194
	.4byte	.LFE194
	.4byte	.LFB195
	.4byte	.LFE195
	.4byte	.LFB202
	.4byte	.LFE202
	.4byte	.LFB203
	.4byte	.LFE203
	.4byte	.LFB216
	.4byte	.LFE216
	.4byte	.LFB217
	.4byte	.LFE217
	.4byte	.LFB222
	.4byte	.LFE222
	.4byte	.LFB223
	.4byte	.LFE223
	.4byte	.LFB224
	.4byte	.LFE224
	.4byte	.LFB225
	.4byte	.LFE225
	.4byte	.LFB226
	.4byte	.LFE226
	.4byte	.LFB227
	.4byte	.LFE227
	.4byte	.LFB228
	.4byte	.LFE228
	.4byte	.LFB229
	.4byte	.LFE229
	.4byte	.LFB230
	.4byte	.LFE230
	.4byte	.LFB231
	.4byte	.LFE231
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF302:
	.ascii	"p_config\000"
.LASF213:
	.ascii	"nrf_drv_spi_bit_order_t\000"
.LASF139:
	.ascii	"RSERVED1\000"
.LASF285:
	.ascii	"nrf_drv_spi_abort\000"
.LASF327:
	.ascii	"spi_bit_order\000"
.LASF272:
	.ascii	"handler\000"
.LASF218:
	.ascii	"irq_priority\000"
.LASF62:
	.ascii	"__locale_s\000"
.LASF200:
	.ascii	"NRF_DRV_SPI_FREQ_500K\000"
.LASF52:
	.ascii	"__towupper\000"
.LASF56:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF335:
	.ascii	"nrf_spi_int_disable\000"
.LASF204:
	.ascii	"NRF_DRV_SPI_FREQ_8M\000"
.LASF113:
	.ascii	"CCM_AAR_IRQn\000"
.LASF6:
	.ascii	"int32_t\000"
.LASF291:
	.ascii	"spi_xfer\000"
.LASF303:
	.ascii	"__func__\000"
.LASF45:
	.ascii	"time_format\000"
.LASF73:
	.ascii	"__RAL_data_utf8_period\000"
.LASF133:
	.ascii	"I2S_IRQn\000"
.LASF102:
	.ascii	"SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQn\000"
.LASF328:
	.ascii	"config\000"
.LASF41:
	.ascii	"month_names\000"
.LASF321:
	.ascii	"nrf_gpio_pin_port_decode\000"
.LASF74:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF282:
	.ascii	"p_cb\000"
.LASF18:
	.ascii	"int_curr_symbol\000"
.LASF44:
	.ascii	"date_format\000"
.LASF157:
	.ascii	"INTENCLR\000"
.LASF259:
	.ascii	"NRF_GPIO_PIN_S0D1\000"
.LASF319:
	.ascii	"sense\000"
.LASF230:
	.ascii	"type\000"
.LASF29:
	.ascii	"n_cs_precedes\000"
.LASF50:
	.ascii	"__tolower\000"
.LASF261:
	.ascii	"nrf_gpio_pin_drive_t\000"
.LASF292:
	.ascii	"rx_data\000"
.LASF173:
	.ascii	"__StackLimit\000"
.LASF179:
	.ascii	"NRF_SPI_FREQ_500K\000"
.LASF142:
	.ascii	"ICPR\000"
.LASF25:
	.ascii	"int_frac_digits\000"
.LASF283:
	.ascii	"p_spi\000"
.LASF108:
	.ascii	"TIMER2_IRQn\000"
.LASF23:
	.ascii	"positive_sign\000"
.LASF312:
	.ascii	"nrf_gpio_cfg_input\000"
.LASF308:
	.ascii	"set_mask\000"
.LASF101:
	.ascii	"SPIM0_SPIS0_TWIM0_TWIS0_SPI0_TWI0_IRQn\000"
.LASF20:
	.ascii	"mon_decimal_point\000"
.LASF13:
	.ascii	"long int\000"
.LASF132:
	.ascii	"RTC2_IRQn\000"
.LASF293:
	.ascii	"bytes_used\000"
.LASF82:
	.ascii	"__RAL_error_decoder_s\000"
.LASF85:
	.ascii	"__RAL_error_decoder_t\000"
.LASF64:
	.ascii	"__RAL_global_locale\000"
.LASF81:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF270:
	.ascii	"nrf_log_module_dynamic_data_t\000"
.LASF223:
	.ascii	"p_tx_buffer\000"
.LASF105:
	.ascii	"SAADC_IRQn\000"
.LASF34:
	.ascii	"int_n_cs_precedes\000"
.LASF324:
	.ascii	"IRQn\000"
.LASF340:
	.ascii	"nrf_spi_event_clear\000"
.LASF97:
	.ascii	"SysTick_IRQn\000"
.LASF55:
	.ascii	"__mbtowc\000"
.LASF194:
	.ascii	"drv_inst_idx\000"
.LASF0:
	.ascii	"signed char\000"
.LASF345:
	.ascii	"GNU C99 8.3.1 20190703 (release) [gcc-8-branch revi"
	.ascii	"sion 273027] -fmessage-length=0 -mcpu=cortex-m4 -ml"
	.ascii	"ittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mt"
	.ascii	"humb -mtp=soft -munaligned-access -std=gnu99 -g2 -g"
	.ascii	"pubnames -fomit-frame-pointer -fno-dwarf2-cfi-asm -"
	.ascii	"fno-builtin -ffunction-sections -fdata-sections -fs"
	.ascii	"hort-enums -fno-common\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF103:
	.ascii	"NFCT_IRQn\000"
.LASF126:
	.ascii	"PWM0_IRQn\000"
.LASF307:
	.ascii	"nrf_gpio_port_out_set\000"
.LASF54:
	.ascii	"__wctomb\000"
.LASF279:
	.ascii	"abort\000"
.LASF255:
	.ascii	"NRF_GPIO_PIN_S0H1\000"
.LASF184:
	.ascii	"nrf_spi_frequency_t\000"
.LASF338:
	.ascii	"nrf_spi_event_check\000"
.LASF323:
	.ascii	"nrf_drv_common_irq_disable\000"
.LASF131:
	.ascii	"SPIM2_SPIS2_SPI2_IRQn\000"
.LASF137:
	.ascii	"RESERVED0\000"
.LASF155:
	.ascii	"RESERVED1\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF143:
	.ascii	"RESERVED3\000"
.LASF145:
	.ascii	"RESERVED4\000"
.LASF146:
	.ascii	"RESERVED5\000"
.LASF161:
	.ascii	"RESERVED6\000"
.LASF180:
	.ascii	"NRF_SPI_FREQ_1M\000"
.LASF30:
	.ascii	"n_sep_by_space\000"
.LASF242:
	.ascii	"nrf_drv_state_t\000"
.LASF214:
	.ascii	"sck_pin\000"
.LASF336:
	.ascii	"spi_int_mask\000"
.LASF144:
	.ascii	"IABR\000"
.LASF75:
	.ascii	"__RAL_data_utf8_space\000"
.LASF240:
	.ascii	"NRF_DRV_STATE_INITIALIZED\000"
.LASF286:
	.ascii	"p_instance\000"
.LASF195:
	.ascii	"use_easy_dma\000"
.LASF205:
	.ascii	"nrf_drv_spi_frequency_t\000"
.LASF196:
	.ascii	"_Bool\000"
.LASF267:
	.ascii	"order_idx\000"
.LASF141:
	.ascii	"RESERVED2\000"
.LASF252:
	.ascii	"nrf_gpio_pin_pull_t\000"
.LASF93:
	.ascii	"UsageFault_IRQn\000"
.LASF289:
	.ascii	"err_code\000"
.LASF14:
	.ascii	"char\000"
.LASF257:
	.ascii	"NRF_GPIO_PIN_D0S1\000"
.LASF185:
	.ascii	"NRF_SPI_MODE_0\000"
.LASF186:
	.ascii	"NRF_SPI_MODE_1\000"
.LASF187:
	.ascii	"NRF_SPI_MODE_2\000"
.LASF188:
	.ascii	"NRF_SPI_MODE_3\000"
.LASF32:
	.ascii	"n_sign_posn\000"
.LASF234:
	.ascii	"timeval\000"
.LASF330:
	.ascii	"nrf_spi_rxd_get\000"
.LASF343:
	.ascii	"__DSB\000"
.LASF72:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF344:
	.ascii	"__ISB\000"
.LASF288:
	.ascii	"flags\000"
.LASF21:
	.ascii	"mon_thousands_sep\000"
.LASF53:
	.ascii	"__towlower\000"
.LASF236:
	.ascii	"stdin\000"
.LASF333:
	.ascii	"nrf_spi_disable\000"
.LASF24:
	.ascii	"negative_sign\000"
.LASF140:
	.ascii	"ISPR\000"
.LASF33:
	.ascii	"int_p_cs_precedes\000"
.LASF298:
	.ascii	"rx_buffer_length\000"
.LASF83:
	.ascii	"decode\000"
.LASF237:
	.ascii	"stdout\000"
.LASF316:
	.ascii	"input\000"
.LASF123:
	.ascii	"SWI5_EGU5_IRQn\000"
.LASF147:
	.ascii	"STIR\000"
.LASF87:
	.ascii	"ret_code_t\000"
.LASF104:
	.ascii	"GPIOTE_IRQn\000"
.LASF342:
	.ascii	"__NVIC_DisableIRQ\000"
.LASF211:
	.ascii	"NRF_DRV_SPI_BIT_ORDER_MSB_FIRST\000"
.LASF66:
	.ascii	"__RAL_codeset_ascii\000"
.LASF217:
	.ascii	"ss_pin\000"
.LASF176:
	.ascii	"NRF_SPI_INT_READY_MASK\000"
.LASF60:
	.ascii	"__RAL_locale_t\000"
.LASF287:
	.ascii	"p_xfer_desc\000"
.LASF174:
	.ascii	"NRF_SPI_EVENT_READY\000"
.LASF156:
	.ascii	"INTENSET\000"
.LASF42:
	.ascii	"abbrev_month_names\000"
.LASF326:
	.ascii	"spi_mode\000"
.LASF322:
	.ascii	"p_pin\000"
.LASF263:
	.ascii	"NRF_GPIO_PIN_SENSE_LOW\000"
.LASF59:
	.ascii	"codeset\000"
.LASF304:
	.ascii	"nrf_gpio_port_out_clear\000"
.LASF181:
	.ascii	"NRF_SPI_FREQ_2M\000"
.LASF118:
	.ascii	"SWI0_EGU0_IRQn\000"
.LASF89:
	.ascii	"NonMaskableInt_IRQn\000"
.LASF191:
	.ascii	"NRF_SPI_BIT_ORDER_LSB_FIRST\000"
.LASF162:
	.ascii	"CONFIG\000"
.LASF12:
	.ascii	"__wchar\000"
.LASF86:
	.ascii	"__RAL_error_decoder_head\000"
.LASF306:
	.ascii	"clr_mask\000"
.LASF47:
	.ascii	"__RAL_locale_data_t\000"
.LASF91:
	.ascii	"MemoryManagement_IRQn\000"
.LASF71:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF150:
	.ascii	"SystemCoreClock\000"
.LASF122:
	.ascii	"SWI4_EGU4_IRQn\000"
.LASF152:
	.ascii	"MISO\000"
.LASF135:
	.ascii	"IRQn_Type\000"
.LASF172:
	.ascii	"__StackTop\000"
.LASF130:
	.ascii	"PWM2_IRQn\000"
.LASF314:
	.ascii	"nrf_gpio_cfg_output\000"
.LASF309:
	.ascii	"nrf_gpio_pin_clear\000"
.LASF346:
	.ascii	"E:\\WSC_FTSP_ver_onemess\\WSC_FTSP\\WCS_v2_systick_"
	.ascii	"TDMA_demo_20_09\\WCS_v2_systick_TDMA\\nRF5_SDK_14.2"
	.ascii	".0\\components\\drivers_nrf\\spi_master\\nrf_drv_sp"
	.ascii	"i.c\000"
.LASF43:
	.ascii	"am_pm_indicator\000"
.LASF28:
	.ascii	"p_sep_by_space\000"
.LASF182:
	.ascii	"NRF_SPI_FREQ_4M\000"
.LASF114:
	.ascii	"WDT_IRQn\000"
.LASF348:
	.ascii	"done\000"
.LASF166:
	.ascii	"DIRSET\000"
.LASF266:
	.ascii	"module_id\000"
.LASF36:
	.ascii	"int_n_sep_by_space\000"
.LASF226:
	.ascii	"rx_length\000"
.LASF92:
	.ascii	"BusFault_IRQn\000"
.LASF189:
	.ascii	"nrf_spi_mode_t\000"
.LASF167:
	.ascii	"DIRCLR\000"
.LASF79:
	.ascii	"__user_set_time_of_day\000"
.LASF320:
	.ascii	"transfer_byte\000"
.LASF111:
	.ascii	"RNG_IRQn\000"
.LASF107:
	.ascii	"TIMER1_IRQn\000"
.LASF9:
	.ascii	"long long int\000"
.LASF297:
	.ascii	"tx_buffer_length\000"
.LASF61:
	.ascii	"__mbstate_s\000"
.LASF159:
	.ascii	"PSEL\000"
.LASF199:
	.ascii	"NRF_DRV_SPI_FREQ_250K\000"
.LASF99:
	.ascii	"RADIO_IRQn\000"
.LASF94:
	.ascii	"SVCall_IRQn\000"
.LASF264:
	.ascii	"NRF_GPIO_PIN_SENSE_HIGH\000"
.LASF63:
	.ascii	"__category\000"
.LASF260:
	.ascii	"NRF_GPIO_PIN_H0D1\000"
.LASF115:
	.ascii	"RTC1_IRQn\000"
.LASF134:
	.ascii	"FPU_IRQn\000"
.LASF313:
	.ascii	"pull_config\000"
.LASF219:
	.ascii	"frequency\000"
.LASF46:
	.ascii	"date_time_format\000"
.LASF305:
	.ascii	"p_reg\000"
.LASF247:
	.ascii	"NRF_GPIO_PIN_INPUT_DISCONNECT\000"
.LASF106:
	.ascii	"TIMER0_IRQn\000"
.LASF284:
	.ascii	"SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQHandler\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF281:
	.ascii	"m_cb\000"
.LASF198:
	.ascii	"NRF_DRV_SPI_FREQ_125K\000"
.LASF31:
	.ascii	"p_sign_posn\000"
.LASF253:
	.ascii	"NRF_GPIO_PIN_S0S1\000"
.LASF265:
	.ascii	"nrf_gpio_pin_sense_t\000"
.LASF206:
	.ascii	"NRF_DRV_SPI_MODE_0\000"
.LASF207:
	.ascii	"NRF_DRV_SPI_MODE_1\000"
.LASF208:
	.ascii	"NRF_DRV_SPI_MODE_2\000"
.LASF209:
	.ascii	"NRF_DRV_SPI_MODE_3\000"
.LASF183:
	.ascii	"NRF_SPI_FREQ_8M\000"
.LASF80:
	.ascii	"__user_get_time_of_day\000"
.LASF178:
	.ascii	"NRF_SPI_FREQ_250K\000"
.LASF337:
	.ascii	"nrf_spi_int_enable\000"
.LASF67:
	.ascii	"__RAL_codeset_utf8\000"
.LASF222:
	.ascii	"nrf_drv_spi_config_t\000"
.LASF65:
	.ascii	"__RAL_c_locale\000"
.LASF232:
	.ascii	"nrf_drv_spi_evt_handler_t\000"
.LASF112:
	.ascii	"ECB_IRQn\000"
.LASF116:
	.ascii	"QDEC_IRQn\000"
.LASF15:
	.ascii	"decimal_point\000"
.LASF269:
	.ascii	"filter_lvls\000"
.LASF190:
	.ascii	"NRF_SPI_BIT_ORDER_MSB_FIRST\000"
.LASF235:
	.ascii	"__RAL_FILE\000"
.LASF300:
	.ascii	"nrf_drv_spi_uninit\000"
.LASF229:
	.ascii	"nrf_drv_spi_evt_type_t\000"
.LASF151:
	.ascii	"MOSI\000"
.LASF227:
	.ascii	"nrf_drv_spi_xfer_desc_t\000"
.LASF258:
	.ascii	"NRF_GPIO_PIN_D0H1\000"
.LASF317:
	.ascii	"pull\000"
.LASF197:
	.ascii	"nrf_drv_spi_t\000"
.LASF177:
	.ascii	"NRF_SPI_FREQ_125K\000"
.LASF250:
	.ascii	"NRF_GPIO_PIN_PULLDOWN\000"
.LASF245:
	.ascii	"nrf_gpio_pin_dir_t\000"
.LASF201:
	.ascii	"NRF_DRV_SPI_FREQ_1M\000"
.LASF233:
	.ascii	"FILE\000"
.LASF256:
	.ascii	"NRF_GPIO_PIN_H0H1\000"
.LASF271:
	.ascii	"m_nrf_log_spi_logs_data_dynamic\000"
.LASF125:
	.ascii	"TIMER4_IRQn\000"
.LASF294:
	.ascii	"finish_transfer\000"
.LASF249:
	.ascii	"NRF_GPIO_PIN_NOPULL\000"
.LASF76:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF239:
	.ascii	"NRF_DRV_STATE_UNINITIALIZED\000"
.LASF148:
	.ascii	"NVIC_Type\000"
.LASF48:
	.ascii	"__isctype\000"
.LASF164:
	.ascii	"OUTSET\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF165:
	.ascii	"OUTCLR\000"
.LASF35:
	.ascii	"int_p_sep_by_space\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF88:
	.ascii	"Reset_IRQn\000"
.LASF332:
	.ascii	"nrf_spi_pins_set\000"
.LASF216:
	.ascii	"miso_pin\000"
.LASF278:
	.ascii	"rx_done\000"
.LASF124:
	.ascii	"TIMER3_IRQn\000"
.LASF225:
	.ascii	"p_rx_buffer\000"
.LASF296:
	.ascii	"nrf_drv_spi_transfer\000"
.LASF127:
	.ascii	"PDM_IRQn\000"
.LASF315:
	.ascii	"nrf_gpio_cfg\000"
.LASF310:
	.ascii	"pin_number\000"
.LASF138:
	.ascii	"ICER\000"
.LASF175:
	.ascii	"nrf_spi_event_t\000"
.LASF318:
	.ascii	"drive\000"
.LASF98:
	.ascii	"POWER_CLOCK_IRQn\000"
.LASF251:
	.ascii	"NRF_GPIO_PIN_PULLUP\000"
.LASF221:
	.ascii	"bit_order\000"
.LASF170:
	.ascii	"PIN_CNF\000"
.LASF40:
	.ascii	"abbrev_day_names\000"
.LASF68:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF341:
	.ascii	"dummy\000"
.LASF16:
	.ascii	"thousands_sep\000"
.LASF299:
	.ascii	"xfer_desc\000"
.LASF295:
	.ascii	"nrf_drv_spi_xfer\000"
.LASF100:
	.ascii	"UARTE0_UART0_IRQn\000"
.LASF95:
	.ascii	"DebugMonitor_IRQn\000"
.LASF168:
	.ascii	"LATCH\000"
.LASF49:
	.ascii	"__toupper\000"
.LASF262:
	.ascii	"NRF_GPIO_PIN_NOSENSE\000"
.LASF57:
	.ascii	"name\000"
.LASF117:
	.ascii	"COMP_LPCOMP_IRQn\000"
.LASF163:
	.ascii	"NRF_SPI_Type\000"
.LASF26:
	.ascii	"frac_digits\000"
.LASF19:
	.ascii	"currency_symbol\000"
.LASF276:
	.ascii	"bytes_transferred\000"
.LASF331:
	.ascii	"nrf_spi_txd_set\000"
.LASF238:
	.ascii	"stderr\000"
.LASF2:
	.ascii	"short int\000"
.LASF220:
	.ascii	"mode\000"
.LASF277:
	.ascii	"tx_done\000"
.LASF129:
	.ascii	"PWM1_IRQn\000"
.LASF11:
	.ascii	"__state\000"
.LASF290:
	.ascii	"irq_handler_spi\000"
.LASF121:
	.ascii	"SWI3_EGU3_IRQn\000"
.LASF202:
	.ascii	"NRF_DRV_SPI_FREQ_2M\000"
.LASF22:
	.ascii	"mon_grouping\000"
.LASF325:
	.ascii	"nrf_spi_configure\000"
.LASF244:
	.ascii	"NRF_GPIO_PIN_DIR_OUTPUT\000"
.LASF158:
	.ascii	"ENABLE\000"
.LASF154:
	.ascii	"EVENTS_READY\000"
.LASF39:
	.ascii	"day_names\000"
.LASF268:
	.ascii	"filter\000"
.LASF77:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF280:
	.ascii	"spi_control_block_t\000"
.LASF169:
	.ascii	"DETECTMODE\000"
.LASF37:
	.ascii	"int_p_sign_posn\000"
.LASF149:
	.ascii	"ITM_RxBuffer\000"
.LASF246:
	.ascii	"NRF_GPIO_PIN_INPUT_CONNECT\000"
.LASF275:
	.ascii	"transfer_in_progress\000"
.LASF231:
	.ascii	"nrf_drv_spi_evt_t\000"
.LASF51:
	.ascii	"__iswctype\000"
.LASF69:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF254:
	.ascii	"NRF_GPIO_PIN_H0S1\000"
.LASF273:
	.ascii	"p_context\000"
.LASF243:
	.ascii	"NRF_GPIO_PIN_DIR_INPUT\000"
.LASF203:
	.ascii	"NRF_DRV_SPI_FREQ_4M\000"
.LASF160:
	.ascii	"FREQUENCY\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF38:
	.ascii	"int_n_sign_posn\000"
.LASF347:
	.ascii	"E:\\WSC_FTSP_ver_onemess\\WSC_FTSP\\WCS_v2_systick_"
	.ascii	"TDMA_demo_20_09\\WCS_v2_systick_TDMA\\examples\\WCS"
	.ascii	"_Tag_BLE\\SES\000"
.LASF329:
	.ascii	"nrf_spi_frequency_set\000"
.LASF241:
	.ascii	"NRF_DRV_STATE_POWERED_ON\000"
.LASF210:
	.ascii	"nrf_drv_spi_mode_t\000"
.LASF120:
	.ascii	"SWI2_EGU2_IRQn\000"
.LASF78:
	.ascii	"__RAL_data_empty_string\000"
.LASF224:
	.ascii	"tx_length\000"
.LASF109:
	.ascii	"RTC0_IRQn\000"
.LASF27:
	.ascii	"p_cs_precedes\000"
.LASF339:
	.ascii	"spi_event\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF110:
	.ascii	"TEMP_IRQn\000"
.LASF153:
	.ascii	"SPI_PSEL_Type\000"
.LASF96:
	.ascii	"PendSV_IRQn\000"
.LASF171:
	.ascii	"NRF_GPIO_Type\000"
.LASF215:
	.ascii	"mosi_pin\000"
.LASF301:
	.ascii	"nrf_drv_spi_init\000"
.LASF274:
	.ascii	"state\000"
.LASF193:
	.ascii	"p_registers\000"
.LASF192:
	.ascii	"nrf_spi_bit_order_t\000"
.LASF136:
	.ascii	"ISER\000"
.LASF17:
	.ascii	"grouping\000"
.LASF90:
	.ascii	"HardFault_IRQn\000"
.LASF311:
	.ascii	"nrf_gpio_pin_set\000"
.LASF228:
	.ascii	"NRF_DRV_SPI_EVENT_DONE\000"
.LASF84:
	.ascii	"next\000"
.LASF58:
	.ascii	"data\000"
.LASF212:
	.ascii	"NRF_DRV_SPI_BIT_ORDER_LSB_FIRST\000"
.LASF128:
	.ascii	"MWU_IRQn\000"
.LASF248:
	.ascii	"nrf_gpio_pin_input_t\000"
.LASF119:
	.ascii	"SWI1_EGU1_IRQn\000"
.LASF334:
	.ascii	"nrf_spi_enable\000"
.LASF70:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
	.ident	"GCC: (GNU) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"
