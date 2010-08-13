volatile unsigned int * const UART0DR = (unsigned int *)0x101f1000;
#define TIMER0 0x101e2000
volatile unsigned int * const Timer1Load = (unsigned int*)(TIMER0 + 0);
volatile unsigned int * const Timer1Control = (unsigned int*)(TIMER0 + 0x08);

volatile unsigned int * const PIC_IntEnable = (unsigned int*)0x10140010;

void __aeabi_unwind_cpp_pr0() {}
void __aeabi_unwind_cpp_pr1() {}

void print_uart0(const char *s) {
	while(*s != '\0') {
		*UART0DR = (unsigned int)(*s);
		s++;
	}
}

void c_entry() {
	print_uart0("Hello world!\n");
}

void setup_timer()
{
	*Timer1Control = 0x42;
	*PIC_IntEnable = 0x010;
	*Timer1Load = 0x80b0;
	*Timer1Control = 0xe2;
}

