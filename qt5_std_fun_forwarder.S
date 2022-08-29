/*
 * Define a function `name` in the Qt_5 version node (`name@Qt_5`), implemented
 * by calling the corresponding unversioned function `name` (which the linker
 * will resolve to libstdc++'s implementation).
 */
#define DEFINE_QT5_FORWARDER(name) \
    .symver local_##name, name##@Qt_5; \
    .global local_##name; \
    local_##name: \
        jmp name@PLT

DEFINE_QT5_FORWARDER(_ZNSt28__atomic_futex_unsigned_base19_M_futex_wait_untilEPjjbNSt6chrono8durationIlSt5ratioILl1ELl1EEEENS2_IlS3_ILl1ELl1000000000EEEE)
DEFINE_QT5_FORWARDER(_ZNSt28__atomic_futex_unsigned_base19_M_futex_notify_allEPj)
