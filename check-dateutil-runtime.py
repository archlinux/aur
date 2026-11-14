"""Check the real shipped minimum guard and actual Dateutil-backed timestamp API."""
from datetime import datetime, timedelta, timezone
from importlib import metadata
import os
from pathlib import Path
import subprocess
import sys

import pystac
from pystac.utils import datetime_to_str, str_to_datetime

root = Path(os.environ.get("PYSTAC_STAGED_SITE", "/usr")).resolve()
assert Path(pystac.__file__).resolve().is_relative_to(root)
script = r'''from importlib import metadata
import sys
value=sys.argv[1];real=metadata.version
def version(name):
    if name.lower().replace("_","-")!="python-dateutil":return real(name)
    if value=="MISSING":raise metadata.PackageNotFoundError(name)
    return value
metadata.version=version
try:
    import pystac
except ImportError as error:
    assert "dateutil" not in sys.modules, "Guard ran after provider import"
    print(str(error));raise SystemExit(7)
print("GUARD_ACCEPTED")
'''
for version, accepted in [
    ("2.6.99", False), ("2.7.0rc1", False), ("invalid", False), ("MISSING", False),
    ("2.7.0", True), ("2.9.0.post0", True), ("4.0.0", True), ("4.1.0.dev1", True),
]:
    result = subprocess.run([sys.executable, "-P", "-c", script, version],
                            text=True, capture_output=True, timeout=30, check=False)
    assert result.returncode == (0 if accepted else 7), (version, result.stdout, result.stderr)
    assert ("GUARD_ACCEPTED" in result.stdout) == accepted

samples = [
    ("2026-11-10T12:30:45Z", datetime(2026, 11, 10, 12, 30, 45, tzinfo=timezone.utc)),
    ("2026-11-10T12:30:45.123456+02:30", datetime(2026, 11, 10, 12, 30, 45, 123456, tzinfo=timezone(timedelta(hours=2, minutes=30)))),
    ("2024-02-29T00:00:00-05:00", datetime(2024, 2, 29, tzinfo=timezone(timedelta(hours=-5)))),
]
for text, expected in samples:
    parsed = str_to_datetime(text)
    assert parsed == expected and parsed.utcoffset() == expected.utcoffset()
    assert str_to_datetime(datetime_to_str(parsed)) == expected
try:
    str_to_datetime("2026-13-40T25:00:00Z")
except ValueError:
    pass
else:
    raise AssertionError("Invalid timestamp accepted")
print("Installed PySTAC Dateutil semantic guard and timestamp parsing: PASS")
print("Actual Dateutil distribution:", metadata.version("python-dateutil"))
