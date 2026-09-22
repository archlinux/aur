"""Run pytest with Python 3.13's POSIX multiprocessing semantics."""

import multiprocessing as mp
import sys

import pytest


if __name__ == "__main__":
    mp.set_start_method("fork")
    raise SystemExit(pytest.main(sys.argv[1:]))
