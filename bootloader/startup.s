.text

.global _Reset
_Reset:
	b Reset_Handler /* Reset */
	b . /* Undefined */
	b . /* SWI */
	b . /* Prefetch Abort */
	b . /* Data Abort */
	b . /* reserved */
	b . /* IRQ */
	b . /* FIQ */

Reset_Handler:
	ldr sp, =stack_top
	bl c_entry

        adr r0, IRQ_Handler
	mov r1, #24
	sub r0, r0, r1
	mov r0, r0, asr #2	/* r0 = (SWI_Handler-8)/4 = offset */
	sub r1, r0, #2		/* r1 = offset - 2 */
	mov r2, #0x0ea00	/* r2 = 0xea00 */
	mov r2, r2, lsl #16	/* r2 = 0xea000000 */
	orr r1, r1, r2		/* r1 = 0xea00r1, assume lsl lower 16 bits will be zero */
        mov r3, #24
        str r1, [r3]

	mrs r1, cpsr
	bic r1, r1, #0x80
	msr cpsr_c, r1

	bl setup_timer
	b .

IRQ_Handler:
	ldr sp, =stack_top
	adr r0, text
	bl print_uart0
	mov pc, lr

instruction:
	.word 0xea00402b

text:
	.ascii "Timer!!\n\0"

