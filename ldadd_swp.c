#include <stdint.h>

__attribute__((target("no-outline-atomics")))
int32_t __aarch64_ldadd4_acq_rel(int32_t value, int32_t *ptr)
{
    return __atomic_fetch_add(ptr, value, __ATOMIC_ACQ_REL);
}

__attribute__((target("no-outline-atomics")))
int32_t __aarch64_swp4_acq_rel(int32_t value, int32_t *ptr)
{
    return __atomic_exchange_n(ptr, value, __ATOMIC_ACQ_REL);
}
