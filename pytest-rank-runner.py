#!/usr/bin/python
"""Run pytest with a private temp directory for each re-executed DDP rank."""

import os
import sys
from pathlib import Path

import pytest


def main() -> int:
    base = Path(os.environ["PL_PYTEST_BASETEMP"])
    base.mkdir(parents=True, exist_ok=True)
    rank = os.environ.get("LOCAL_RANK", "0")
    basetemp = base / f"rank-{rank}"
    return pytest.main([f"--basetemp={basetemp}", *sys.argv[1:]])


if __name__ == "__main__":
    raise SystemExit(main())
