"""Check the installed semantic Hub guard without replacing the real provider."""
from importlib.metadata import version
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import sys

import diffusers
import huggingface_hub
from diffusers.dependency_versions_table import deps
from packaging.requirements import Requirement
from packaging.version import Version

requirement = Requirement(deps["huggingface-hub"])
assert requirement.name == "huggingface-hub"
assert {str(item) for item in requirement.specifier} == {">=1.32.0", "<3.0"}
actual = version("huggingface-hub")
assert Version(actual) == Version(huggingface_hub.__version__)
assert requirement.specifier.contains(actual, prereleases=True)
origin = Path(diffusers.__file__).resolve()
if os.environ.get("TEST_ROOT"):
    assert origin.is_relative_to(Path(os.environ["TEST_ROOT"]).resolve())

# These subprocesses exercise the installed guard before any Hub import.
# The real provider is unchanged. These are negative metadata checks, not
# compatibility tests of old or future Hub releases.
rejected = ("1.31.99", "1.32.0.dev0", "3.0.0.dev0", "3.0.0")
for simulated in rejected:
    code = r"""
import importlib.abc
import importlib.metadata
import sys
real_version = importlib.metadata.version
def version(name):
    return SIMULATED if name == 'huggingface-hub' else real_version(name)
importlib.metadata.version = version
class NoHubImport(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        if fullname == 'huggingface_hub' or fullname.startswith('huggingface_hub.'):
            raise AssertionError('Hub was imported before its semantic guard')
sys.meta_path.insert(0, NoHubImport())
try:
    import diffusers.utils
except ImportError as error:
    assert 'diffusers requires huggingface-hub' in str(error), str(error)
    assert SIMULATED in str(error), str(error)
else:
    raise AssertionError('Installed guard accepted out-of-range Hub metadata')
""".replace("SIMULATED", repr(simulated))
    subprocess.run([sys.executable, "-P", "-c", code], check=True)
print("PASS: installed Diffusers preserves the upstream semantic Hub interval before imports",
      json.dumps({"actual_hub_version": actual, "requirement": str(requirement),
                  "diffusers_origin": str(origin), "negative_metadata_cases": rejected,
                  "scope": "Actual provider version plus negative installed guard checks. Moving-provider functionality requires its separate real workflow."}, sort_keys=True))
