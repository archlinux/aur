"""Check the optional backend's real minimum, fallback, and installed JSON API."""
from importlib import metadata
import json
import os
from pathlib import Path
import subprocess
import sys

from packaging.requirements import Requirement
from packaging.version import Version
import orjson
import pystac
import pystac.stac_io as stac_io

root = Path(os.environ.get("PYSTAC_STAGED_SITE", "/usr")).resolve()
assert Path(pystac.__file__).resolve().is_relative_to(root)
assert stac_io.orjson is orjson
assert Version(metadata.version("orjson")) >= Version("3.5")
requirements = [Requirement(x) for x in metadata.requires("pystac") or []]
assert [str(x.specifier) for x in requirements if x.name == "orjson"] == [">=3.5"]

script = r'''from importlib import metadata
import sys
value=sys.argv[1];real=metadata.version;queries=[]
def version(name):
    if name.lower().replace("_","-")!="orjson":return real(name)
    queries.append(name)
    if value=="MISSING":raise metadata.PackageNotFoundError(name)
    return value
metadata.version=version
import pystac
import pystac.stac_io as stac_io
assert stac_io.orjson is not None
assert queries == [], "Optional minimum must be checked on use, not import"
io=pystac.StacIO.default();expected=sys.argv[2]=="yes"
for operation in [lambda: io.json_dumps({"answer": 42}), lambda: io.json_loads('{"answer": 42}')]:
    try:
        result=operation()
    except ImportError as error:
        assert not expected and "orjson" in str(error), str(error)
    else:
        assert expected, (value,result)
assert len(queries)==(1 if expected else 2), queries
print("OPTIONAL_GUARD_CONTROL_PASS")
'''
for version, accepted in [
    ("3.4.99", False), ("3.5.0rc1", False), ("invalid", False), ("MISSING", False),
    ("3.5", True), ("3.13.0", True), ("3.14.0.dev1", True), ("4.0.0", True),
]:
    result = subprocess.run([sys.executable, "-P", "-c", script, version,
                             "yes" if accepted else "no"],
                            text=True, capture_output=True, timeout=30, check=False)
    assert result.returncode == 0 and "OPTIONAL_GUARD_CONTROL_PASS" in result.stdout, (version, result.stdout, result.stderr)

payload = {"id": "café", "coordinates": [12.5, -4.0], "count": 42,
           "enabled": True, "missing": None}
io = pystac.StacIO.default()
encoded = io.json_dumps(payload)
assert encoded == orjson.dumps(payload, option=orjson.OPT_INDENT_2).decode("utf-8")
assert io.json_loads(encoded) == payload
try:
    io.json_loads("{")
except orjson.JSONDecodeError:
    pass
else:
    raise AssertionError("Malformed JSON was accepted")

# Explicit no-backend control. No optional metadata query is permitted here.
real_version = metadata.version
real_backend = stac_io.orjson
def no_optional_version(name):
    if name.lower().replace("_", "-") == "orjson":
        raise AssertionError("Absent optional backend queried metadata")
    return real_version(name)
try:
    stac_io.orjson = None
    metadata.version = no_optional_version
    encoded = io.json_dumps(payload)
    assert encoded == json.dumps(payload, indent=2)
    assert io.json_loads(encoded) == payload
finally:
    metadata.version = real_version
    stac_io.orjson = real_backend
print("PySTAC optional Orjson guard controls and real backend: PASS")
print("Actual Orjson distribution:", metadata.version("orjson"))
