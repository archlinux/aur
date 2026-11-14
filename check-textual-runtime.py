"""Exercise the shipped semantic guard and real installed checkpoint TUI."""
import asyncio
from importlib import metadata
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile

import crewai_cli
from crewai_cli.checkpoint_tui import CheckpointTUI
from textual.widgets import TabPane, Tree

root = Path(os.environ.get("CREWAI_CLI_STAGED_ROOT", "/usr")).resolve()
assert Path(crewai_cli.__file__).resolve().is_relative_to(root)
# Each control imports the real shipped guard in a fresh interpreter. Only the
# installed-version lookup is varied, never the provider module or TUI objects.
script = r'''from importlib import metadata
import json,sys
overrides=json.loads(sys.argv[1]);real=metadata.version
def version(name):
    key=name.lower().replace("_","-")
    if key not in overrides:return real(name)
    value=overrides[key]
    if value is None:raise metadata.PackageNotFoundError(name)
    return value
metadata.version=version
try:
    import crewai_cli
except ImportError as error:
    assert "textual" not in sys.modules, "Guard ran after provider import"
    print(str(error));raise SystemExit(7)
print("GUARD_ACCEPTED")
'''
cases = [
    ({"textual": "7.4.99"}, False),
    ({"textual": "7.5.0rc1"}, False),
    ({"textual": "not-a-version"}, False),
    ({"textual": None}, False),
    ({"textual": "7.5.0"}, True),
    ({"textual": "8.2.8"}, True),
    ({"textual": "8.3.0.dev1"}, True),
    ({"rich": "0.0.0"}, False),
    ({"markdown-it-py": None}, False),
]
for overrides, accepted in cases:
    result = subprocess.run([sys.executable, "-P", "-c", script, json.dumps(overrides)],
                            text=True, capture_output=True, timeout=30, check=False)
    assert result.returncode == (0 if accepted else 7), (overrides, result.stdout, result.stderr)
    if accepted:
        assert "GUARD_ACCEPTED" in result.stdout
    else:
        assert "requires" in result.stdout or "missing or invalid" in result.stdout

async def exercise(location):
    app = CheckpointTUI(location=location)
    async with app.run_test(size=(100, 35)) as pilot:
        tree = app.query_one("#tree-panel", Tree)
        assert len(tree.root.children) == 0
        assert len(app.query(TabPane)) == 3
        await pilot.press("r")
        await pilot.pause()
        assert len(tree.root.children) == 0
        assert app.query_one("#detail-tabs") is not None
        await pilot.press("q")

with tempfile.TemporaryDirectory() as directory:
    asyncio.run(exercise(directory))
print("Installed CrewAI CLI Textual semantic guard and checkpoint TUI: PASS")
print("Actual Textual distribution:", metadata.version("textual"))
