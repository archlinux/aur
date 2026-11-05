#!/usr/bin/env python3
"""Fix: signing with 3 or more visible signatures hangs forever.

InfoCamere Sign Desktop's engine runs uvicorn with its default WebSocket
message limit of 16 MiB. A signing request carries about 7 MB per visible
signature, so with 3 or more the request is dropped (close code 1009,
"message too big") and the UI spins forever without an error.

This raises the limit by changing the one default constant in
uvicorn/config.pyc and uvicorn/main.pyc inside lib/python314.zip. uvicorn
is a BSD-licensed third-party library bundled with the app; InfoCamere's
own code is not touched. The constant is replaced at the byte level
(marshal int, same length), so any Python 3 can apply it. Every other
entry of the archive is copied unchanged.

usage: fix-ws-limit.py <path/to/python314.zip> [limit_MiB]   (default 256)
"""
import os
import sys
import zipfile

TARGETS = ("uvicorn/config.pyc", "uvicorn/main.pyc")
OLD_MIB = 16


def marshal_int(value):
    # marshal TYPE_INT ('i'), 32-bit little endian
    return b"i" + value.to_bytes(4, "little", signed=True)


def main():
    if len(sys.argv) not in (2, 3):
        sys.exit(__doc__)
    path = sys.argv[1]
    mib = int(sys.argv[2]) if len(sys.argv) == 3 else 256
    if not 16 < mib < 2048:
        sys.exit("limit must be between 17 and 2047 MiB")
    old, new = marshal_int(OLD_MIB << 20), marshal_int(mib << 20)

    src = zipfile.ZipFile(path)
    names = set(src.namelist())
    missing = [t for t in TARGETS if t not in names]
    if missing:
        sys.exit(f"not found in {path}: {', '.join(missing)}")

    tmp = path + ".tmp"
    with zipfile.ZipFile(tmp, "w") as dst:
        for info in src.infolist():
            data = src.read(info)
            if info.filename in TARGETS:
                n = data.count(old)
                if n != 1:
                    dst.close()
                    os.remove(tmp)
                    if data.count(new) == 1:
                        sys.exit(f"{info.filename}: already patched")
                    sys.exit(f"{info.filename}: expected the 16 MiB constant once, "
                             f"found {n}; this app version is not supported")
                data = data.replace(old, new)
                print(f"{info.filename}: WebSocket limit 16 MiB -> {mib} MiB")
            dst.writestr(info, data, compress_type=info.compress_type)
    src.close()
    os.replace(tmp, path)


if __name__ == "__main__":
    main()
