#!/usr/bin/env python3
"""Make OsTypeUtil.getOsType() report "windows" in DevEco's sdk-core jar.

Huawei's remote SDK manager returns no emulator images for osType "linux"
(their own Linux CLI emulator hardcodes "windows" for the same reason).
Only the sdk-core copy of OsTypeUtil is touched: the sdk-* loaders and
SdkSettings use it, while lib/hwlib.jar's own copy is used by the update
checker and the project-template renderer and must keep reporting "linux".

The constant-pool indices are resolved from the class itself rather than
hardcoded, and both ldc (0x12) and ldc_w (0x13) are handled, so a shift in
the pool cannot silently patch the wrong constant. Exits non-zero when the
expected shape is not found.

The images the server returns are x86_64 QEMU guests, so the patch is
skipped when the emulator binary in the same tree is not x86_64.

Usage: patch-emulator-list.py <jar|root-dir> ...
"""

import glob
import os
import shutil
import struct
import sys
import zipfile

TARGET_CLASS = "com/huawei/deveco/sdkmanager/core/util/OsTypeUtil.class"
FROM, TO = b"linux", b"windows"


def read_pool(d):
    """index -> (tag, payload) for a class file's constant pool."""
    if d[:4] != b"\xca\xfe\xba\xbe":
        raise ValueError("not a class file")
    count = struct.unpack(">H", d[8:10])[0]
    entries, i, p = {}, 1, 10
    while i < count:
        tag = d[p]
        if tag == 1:
            ln = struct.unpack(">H", d[p + 1:p + 3])[0]
            entries[i] = (tag, d[p + 3:p + 3 + ln])
            p += 3 + ln
        elif tag in (7, 8, 16, 19, 20):
            entries[i] = (tag, struct.unpack(">H", d[p + 1:p + 3])[0])
            p += 3
        elif tag == 15:
            entries[i] = (tag, d[p + 1:p + 4])
            p += 4
        elif tag in (3, 4):
            entries[i] = (tag, d[p + 1:p + 5])
            p += 5
        elif tag in (5, 6):
            entries[i] = (tag, d[p + 1:p + 9])
            p += 9
            i += 1
        elif tag in (9, 10, 11, 12, 17, 18):
            entries[i] = (tag, d[p + 1:p + 5])
            p += 5
        else:
            raise ValueError("unknown constant pool tag %d at offset %d" % (tag, p))
        i += 1
    return entries


def string_index(entries, text):
    """Constant-pool index of the java.lang.String constant `text`."""
    for idx, (tag, payload) in entries.items():
        if tag == 8:
            target = entries.get(payload)
            if target and target[0] == 1 and target[1] == text:
                return idx
    return None


def ldc_patterns(idx):
    """`ldc <idx>` / `ldc_w <idx>` immediately followed by areturn."""
    return [
        bytes([0x12, idx, 0xB0]),
        bytes([0x13, (idx >> 8) & 0xFF, idx & 0xFF, 0xB0]),
    ]


def patch_class(data):
    """Returns (patched data, status) where status is one of patched/already/none."""
    entries = read_pool(data)
    src, dst = string_index(entries, FROM), string_index(entries, TO)
    if src is None or dst is None:
        raise ValueError('constant pool has no "linux"/"windows" string')

    old, new = ldc_patterns(src), ldc_patterns(dst)
    for o, n in zip(old, new):
        if data.count(o) or data.count(n):
            if data.count(o) == 0:
                return data, "already"
            if data.count(o) != 1:
                raise ValueError("%d candidates for the linux return" % data.count(o))
            data = data.replace(o, n, 1)
            if data.count(o) != 0:
                raise ValueError("replacement did not take effect")
            return data, "patched"
    return data, "none"


def emulator_arch(root):
    """ELF machine of <root>/tools/emulator/Emulator: 'x86_64', other, or None."""
    path = os.path.join(root, "tools", "emulator", "Emulator")
    if not os.path.isfile(path):
        return None
    with open(path, "rb") as fh:
        head = fh.read(20)
    if len(head) < 20 or head[:4] != b"\x7fELF":
        return "unknown"
    machine = struct.unpack("<H" if head[5] == 1 else ">H", head[18:20])[0]
    return "x86_64" if machine == 62 else "machine %d" % machine


def patch_jar(jar):
    tmp = jar + ".tmp"
    try:
        with zipfile.ZipFile(jar) as zin:
            if TARGET_CLASS not in zin.namelist():
                return "no-class"
            out = []
            status = "no-class"
            for item in zin.infolist():
                data = zin.read(item.filename)
                if item.filename == TARGET_CLASS:
                    data, status = patch_class(data)
                out.append((item, data))
        if status != "patched":
            return status
        with zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED) as zout:
            for item, data in out:
                zout.writestr(item, data)
        shutil.copymode(jar, tmp)
        shutil.move(tmp, jar)
        return status
    finally:
        if os.path.exists(tmp):
            os.remove(tmp)


def main(argv):
    if len(argv) < 2:
        print(__doc__.strip().splitlines()[0], file=sys.stderr)
        print("usage: %s <jar|root-dir> ..." % argv[0], file=sys.stderr)
        return 2

    jars, failed = [], False
    for arg in argv[1:]:
        if os.path.isdir(arg):
            arch = emulator_arch(arg)
            if arch not in (None, "x86_64"):
                # The cloud list is x86_64 QEMU images; on another host arch
                # they could be listed but never booted, so leave the IDE
                # reporting the truth.
                print("skipped %s: emulator binary is %s, not x86_64" % (arg, arch))
                continue
            found = sorted(glob.glob(os.path.join(arg, "plugins", "openharmony", "lib", "sdk-core-*.jar")))
            if not found:
                print("error: no sdk-core-*.jar under %s" % arg, file=sys.stderr)
                failed = True
            jars += found
        elif os.path.isfile(arg):
            jars.append(arg)
        else:
            print("error: %s does not exist" % arg, file=sys.stderr)
            failed = True

    for jar in jars:
        try:
            status = patch_jar(jar)
        except (ValueError, zipfile.BadZipFile) as exc:
            print("error: %s: %s" % (os.path.basename(jar), exc), file=sys.stderr)
            failed = True
            continue
        if status == "patched":
            print("patched %s" % os.path.basename(jar))
        elif status == "already":
            print("already patched %s" % os.path.basename(jar))
        else:
            print("error: %s: %s not found or unrecognised" % (
                os.path.basename(jar), TARGET_CLASS), file=sys.stderr)
            failed = True

    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
