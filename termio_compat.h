/*
 * termio compatibility shim (injected via `clang++ -- -include termio_compat.h`).
 *
 * glibc >= 2.42 removed the legacy <sys/ioctl-types.h> definition of
 * `struct termio`, while LLVM's compiler-rt sanitizer size tables still use
 * `sizeof(struct termio)` for ioctl size bookkeeping.
 *
 * This replicates the historical glibc layout verbatim
 * (pre-glibc-2.42 bits/ioctl-types.h):
 *   4 x unsigned short flags + unsigned char line + unsigned char c_cc[NCC=8]
 *
 * NOTE: deliberately self-contained - do NOT include <termios.h> here.
 * It would drag glibc's baud-rate macros (B0, B110, ...) into every
 * translation unit and break e.g. llvm/lib/TableGen which uses `B0`
 * as a variable name.
 */
#ifndef CANGJIE_PKGBUILD_TERMIO_COMPAT_H
#define CANGJIE_PKGBUILD_TERMIO_COMPAT_H

#if !defined(__APPLE__)
struct termio {
    unsigned short int c_iflag;
    unsigned short int c_oflag;
    unsigned short int c_cflag;
    unsigned short int c_lflag;
    unsigned char c_line;
    unsigned char c_cc[8]; /* NCC */
};
#endif

#endif /* CANGJIE_PKGBUILD_TERMIO_COMPAT_H */
