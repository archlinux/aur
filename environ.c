__asm__ (
	".data" "\n\t"
	".weak _environ" "\n\t"
	".globl __environ" "\n\t"
	"_environ:" "\n\t"
	"__environ:" "\n\t"
	".long 0"
);
