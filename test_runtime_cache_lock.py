"""Security regressions for the installed RuntimeCache consumer lock."""

import errno
import json
import os
import stat
import subprocess
import sys
from types import SimpleNamespace

import pytest
from torch_tensorrt.runtime._runtime_cache import RuntimeCache
from torch_tensorrt.runtime._runtime_cache_lock import RuntimeCacheFileLock


def _operation(tmp_path, action):
    path = tmp_path / "cache"
    path.write_bytes(b"cache bytes")
    loaded = []
    stub = SimpleNamespace(
        path=str(path),
        load_from_stream=lambda stream: loaded.append(stream.read()),
        save_to_stream=lambda stream: stream.write(b"new cache bytes"),
    )
    getattr(RuntimeCache, action)(stub)
    if action == "load":
        assert loaded == [b"cache bytes"]
    else:
        assert path.read_bytes() == b"new cache bytes"


@pytest.mark.parametrize("action", ["load", "save"])
def test_existing_lock_content_and_mode_survive_runtime_cache(tmp_path, action):
    lock = tmp_path / "cache.lock"
    lock.write_bytes(b"preexisting data must survive")
    lock.chmod(0o640)
    _operation(tmp_path, action)
    assert lock.read_bytes() == b"preexisting data must survive"
    assert stat.S_IMODE(lock.stat().st_mode) == 0o640


@pytest.mark.parametrize("action", ["load", "save"])
def test_lock_symlink_never_changes_its_target(tmp_path, action):
    victim = tmp_path / "victim"
    victim.write_bytes(b"unrelated data")
    victim.chmod(0o640)
    (tmp_path / "cache.lock").symlink_to(victim)
    with pytest.raises(OSError) as error:
        _operation(tmp_path, action)
    assert error.value.errno == errno.ELOOP
    assert victim.read_bytes() == b"unrelated data"
    assert stat.S_IMODE(victim.stat().st_mode) == 0o640


def test_existing_hardlink_and_explicit_mode_are_non_destructive(tmp_path):
    victim = tmp_path / "victim"
    victim.write_bytes(b"hardlink data")
    victim.chmod(0o640)
    lock = tmp_path / "cache.lock"
    os.link(victim, lock)
    with RuntimeCacheFileLock(str(lock), mode=0o600).acquire(timeout=0.2):
        assert victim.read_bytes() == b"hardlink data"
        assert stat.S_IMODE(victim.stat().st_mode) == 0o640
    assert lock.read_bytes() == victim.read_bytes() == b"hardlink data"
    assert stat.S_IMODE(victim.stat().st_mode) == 0o640


_CHILD = """
import json,sys,time
from filelock import Timeout
from torch_tensorrt.runtime._runtime_cache_lock import RuntimeCacheFileLock
start=time.monotonic()
try:
    with RuntimeCacheFileLock(sys.argv[1]).acquire(timeout=0.2):
        result='acquired'
except Timeout:
    result='timeout'
except OSError as error:
    result='error:'+str(error.errno)
print(json.dumps({'result':result,'elapsed':time.monotonic()-start}))
"""


def _child(path):
    child = subprocess.run(
        [sys.executable, "-P", "-c", _CHILD, str(path)],
        text=True, capture_output=True, check=True, timeout=30,
    )
    return json.loads(child.stdout.splitlines()[-1])


def test_fifo_is_rejected_without_waiting_for_a_peer(tmp_path):
    path = tmp_path / "fifo"
    os.mkfifo(path, 0o600)
    result = _child(path)
    # The private backport rejects non-regular files. Fixed upstream filelock
    # may lock a FIFO, but must neither wait for a peer nor change its type.
    assert result["result"] in ("error:" + str(errno.EINVAL), "acquired")
    assert result["elapsed"] < 2.0
    assert stat.S_ISFIFO(path.lstat().st_mode)


def test_process_mutual_exclusion_timeout_and_release(tmp_path):
    path = tmp_path / "cache.lock"
    lock = RuntimeCacheFileLock(str(path))
    with lock.acquire(timeout=0.2):
        result = _child(path)
        assert result["result"] == "timeout"
        assert 0.15 <= result["elapsed"] < 2.0
        assert lock.is_locked
    assert not lock.is_locked
    assert _child(path)["result"] == "acquired"


def test_exception_releases_lock_and_new_file_gets_explicit_mode(tmp_path):
    path = tmp_path / "cache.lock"
    lock = RuntimeCacheFileLock(str(path), mode=0o600)
    with pytest.raises(ValueError, match="deliberate"):
        with lock.acquire(timeout=0.2):
            assert stat.S_IMODE(path.stat().st_mode) == 0o600
            raise ValueError("deliberate")
    assert not lock.is_locked
    assert _child(path)["result"] == "acquired"
