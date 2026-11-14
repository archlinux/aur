#!/usr/bin/env python3
"""Exercise the installed guard. Synthetic versions do not prove provider functionality."""
import importlib.metadata as metadata
import json
import os
from pathlib import Path
import subprocess
import sys

from packaging.requirements import Requirement

site = Path(sys.argv[1]).resolve()
dist = metadata.distribution("lerobot")
assert Path(dist.locate_file("lerobot/__init__.py")).resolve().is_relative_to(site)
requirements = [Requirement(item) for item in dist.requires or []]
hub = [item for item in requirements if item.name.lower().replace("_", "-") == "huggingface-hub"]
assert len(hub) == 1
expected = Requirement("huggingface-hub>=1.31.0,<3.0.0")
assert hub[0].specifier == expected.specifier
actual = metadata.version("huggingface-hub")
assert expected.specifier.contains(actual, prereleases=True), actual
child = r'''import importlib.metadata as metadata
import json
from pathlib import Path
import sys
mode, value, site = sys.argv[1:]
original_version = metadata.version
if mode != "actual":
    def selected_version(name):
        if name.lower().replace("_", "-") == "huggingface-hub":
            if mode == "missing":
                raise metadata.PackageNotFoundError(name)
            return value
        return original_version(name)
    metadata.version = selected_version
try:
    import lerobot
except ImportError as error:
    assert "LeRobot requires" in str(error), repr(error)
    print(json.dumps({"accepted": False, "error": str(error)}))
else:
    assert Path(lerobot.__file__).resolve().is_relative_to(Path(site))
    print(json.dumps({"accepted": True, "module": lerobot.__file__}))
'''
cases = [("actual", actual, True), ("version", "1.30.9", False),
         ("version", "1.31.0.dev0", False), ("version", "1.31.0", True),
         ("version", "2.5.0.dev0", True), ("version", "2.99.0", True),
         ("version", "3.0.0.dev0", False), ("version", "3.0.0", False),
         ("version", "invalid", False), ("missing", "", False)]
rows = []
for mode, value, accepted in cases:
    run = subprocess.run([sys.executable, "-c", child, mode, value, str(site)],
                         check=True, capture_output=True, text=True, env=os.environ.copy())
    result = json.loads(run.stdout)
    assert result["accepted"] is accepted, (mode, value, result)
    rows.append({"mode": mode, "version": value, **result})
print(json.dumps({"status": "LEROBOT_INSTALLED_HUB_GUARD_PASS", "actual_hub": actual,
                  "requirement": str(hub[0]), "cases": rows,
                  "scope": "Installed import and semantic guard only, no alternate provider functionality"}))
