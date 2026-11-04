/* C half of ns4jmp; see ns4jmp.S. */

#include <signal.h>
#include <stddef.h>

struct ns4_jmp_buf {
	int regs[6];
	int mask_was_saved;
	sigset_t saved_mask;
};

__attribute__((visibility("hidden"), noreturn))
void ns4jmp_restore(struct ns4_jmp_buf *env, int val);

__attribute__((visibility("hidden")))
void ns4jmp_save_mask(struct ns4_jmp_buf *env, int savemask)
{
	env->mask_was_saved =
		savemask && sigprocmask(SIG_BLOCK, NULL, &env->saved_mask) == 0;
}

static void __attribute__((noreturn))
ns4_longjmp(struct ns4_jmp_buf *env, int val)
{
	if (env->mask_was_saved)
		sigprocmask(SIG_SETMASK, &env->saved_mask, NULL);
	ns4jmp_restore(env, val);
}

void longjmp(struct ns4_jmp_buf *env, int val) __attribute__((alias("ns4_longjmp")));
void _longjmp(struct ns4_jmp_buf *env, int val) __attribute__((alias("ns4_longjmp")));
void siglongjmp(struct ns4_jmp_buf *env, int val) __attribute__((alias("ns4_longjmp")));
void __longjmp_chk(struct ns4_jmp_buf *env, int val) __attribute__((alias("ns4_longjmp")));
