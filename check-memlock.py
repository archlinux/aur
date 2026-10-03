#!/usr/bin/env python3

import ctypes
import errno
import mmap
import sys


def main() -> int:
    page = mmap.mmap(-1, mmap.PAGESIZE, prot=mmap.PROT_READ | mmap.PROT_WRITE)
    address = ctypes.addressof(ctypes.c_char.from_buffer(page))
    libc = ctypes.CDLL(None, use_errno=True)

    if libc.mlock(ctypes.c_void_p(address), ctypes.c_size_t(mmap.PAGESIZE)) == 0:
        if libc.munlock(ctypes.c_void_p(address), ctypes.c_size_t(mmap.PAGESIZE)) != 0:
            error = ctypes.get_errno()
            print(f"munlock failed: errno={error}", file=sys.stderr)
            return 1
        return 0

    error = ctypes.get_errno()
    if error in (errno.EPERM, errno.EACCES, errno.ENOMEM):
        print(f"mlock unavailable: errno={error}", file=sys.stderr)
        return 77

    print(f"mlock probe failed unexpectedly: errno={error}", file=sys.stderr)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
