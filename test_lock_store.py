"""Exercise CrewAI's public local-lock path with the system Portalocker."""
import os
from pathlib import Path
import subprocess
import sys
import tempfile

from crewai_core.lock_store import lock


def test_named_lock_blocks_another_process_and_releases(tmp_path, monkeypatch):
    monkeypatch.delenv("REDIS_URL", raising=False)
    monkeypatch.setenv("TMPDIR", str(tmp_path))
    monkeypatch.setattr(tempfile, "tempdir", str(tmp_path))
    probe = """
import sys
from crewai_core.lock_store import lock
from portalocker.exceptions import LockException
try:
    with lock('arch-package-lock', timeout=0.1):
        acquired = True
except LockException:
    acquired = False
assert acquired == (sys.argv[1] == 'available')
"""
    def run(expected):
        result = subprocess.run(
            [sys.executable, "-c", probe, expected],
            env=os.environ.copy(), capture_output=True, text=True, timeout=15,
        )
        assert result.returncode == 0, result.stdout + result.stderr
    with lock("arch-package-lock", timeout=0.1):
        run("blocked")
    run("available")
    assert any(Path(tmp_path).glob("crewai:*.lock"))
