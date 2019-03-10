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

DEFINE_QT5_FORWARDER(_ZNSt20bad_array_new_lengthD1Ev)
DEFINE_QT5_FORWARDER(_ZTVSt20bad_array_new_length)
DEFINE_QT5_FORWARDER(_ZTISt20bad_array_new_length)
