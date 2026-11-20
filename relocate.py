"""Relocate known NUL-terminated paths in the pinned UniVPN Linux binaries."""
from collections import Counter
from pathlib import Path
import re
import sys

OLD = b"/usr/local/UniVPN"
NEW = b"/opt/UniVPN"
PATHS = {
    "UniVPN": Counter({b"": 1, b"/certinfo.txt": 1, b"/image": 1, b"/certificate": 1}),
    "promote/UniVPNPromoteService": Counter({b"": 2}),
    "serviceclient/UniVPNCS": Counter({b"": 3, b"/certificate": 1}),
}
PATTERN = re.compile(re.escape(OLD) + rb"([A-Za-z0-9_./-]*)\x00")

for name, expected in PATHS.items():
    path = Path(sys.argv[1]) / name
    data = path.read_bytes()
    found = Counter(match[1] for match in PATTERN.finditer(data))
    if not data.startswith(b"\x7fELF") or found != expected or data.count(OLD) != sum(expected.values()):
        raise SystemExit(f"{name}: unexpected vendor paths: {found!r}")
    path.write_bytes(PATTERN.sub(lambda m: (NEW + m[1]).ljust(len(m[0]), b"\0"), data))
