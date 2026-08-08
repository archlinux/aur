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

DEFINE_QT5_FORWARDER(_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEcm)
DEFINE_QT5_FORWARDER(_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEmmPKc)
DEFINE_QT5_FORWARDER(_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc)
DEFINE_QT5_FORWARDER(_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv)
DEFINE_QT5_FORWARDER(_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm)
DEFINE_QT5_FORWARDER(_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEmc)
DEFINE_QT5_FORWARDER(_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm)
DEFINE_QT5_FORWARDER(_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm)
DEFINE_QT5_FORWARDER(_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev)

DEFINE_QT5_FORWARDER(_ZNSt12domain_errorC1EPKc)
DEFINE_QT5_FORWARDER(_ZNSt12length_errorC1EPKc)
DEFINE_QT5_FORWARDER(_ZNSt14overflow_errorC1EPKc)
DEFINE_QT5_FORWARDER(_ZNSt16invalid_argumentC1EPKc)
DEFINE_QT5_FORWARDER(_ZSt24__throw_out_of_range_fmtPKcz)
