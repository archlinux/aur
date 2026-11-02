# SPDX-FileCopyrightText: 2025 Bernát Gábor and contributors
# SPDX-License-Identifier: MIT
"""Private Linux cache lock for filelock 4.0.10.

The open/ownership rules are adapted from filelock 4.2.1, PR #835:
https://github.com/tox-dev/filelock/pull/835
Only this consumer uses the backport. System filelock is never modified.
"""

from __future__ import annotations

import errno
import fcntl
import os
import stat
from pathlib import Path

import filelock
from packaging.version import Version


class _LegacyRuntimeCacheFileLock(filelock.UnixFileLock):
    """Use filelock's context/timeout API with a non-destructive backend.

    A cache lock must be a regular file. It is never truncated or unlinked,
    and only its creator may apply an explicit mode. Unsupported flock
    filesystems fail closed instead of switching to the old soft-lock code.
    """

    def __init__(self, lock_file: str, **kwargs: object) -> None:
        # A working-directory change must not retarget a pending acquisition.
        super().__init__(os.path.abspath(lock_file), **kwargs)

    def _acquire(self) -> None:
        Path(self.lock_file).parent.mkdir(parents=True, exist_ok=True)
        flags = os.O_RDWR | os.O_NONBLOCK | os.O_NOFOLLOW | os.O_CLOEXEC
        created = False
        try:
            fd = os.open(
                self.lock_file, flags | os.O_CREAT | os.O_EXCL, self._open_mode()
            )
            created = True
        except FileExistsError:
            try:
                fd = os.open(self.lock_file, flags)
            except (FileNotFoundError, BlockingIOError):
                return  # A removed path or a breaking lease is contention.
        except (FileNotFoundError, BlockingIOError):
            return

        keep = False
        try:
            self._mark_descriptor_pending(fd)
            opened = os.fstat(fd)
            if not stat.S_ISREG(opened.st_mode):
                raise OSError(errno.EINVAL, "Cache lock must be a regular file")
            if created:
                self._apply_explicit_mode(fd)
            try:
                fcntl.flock(fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except OSError as error:
                if error.errno in (errno.EACCES, errno.EAGAIN, errno.EWOULDBLOCK):
                    return
                raise
            current = os.stat(self.lock_file, follow_symlinks=False)
            if (opened.st_dev, opened.st_ino) != (current.st_dev, current.st_ino):
                return  # Never report a hold on a replaced pathname.
            self._mark_descriptor_owned(fd, (opened.st_dev, opened.st_ino))
            keep = True
        finally:
            if not keep:
                self._mark_descriptor_released()
                os.close(fd)


# Use upstream's implementation when the fixed public package is available.
RuntimeCacheFileLock = (
    filelock.FileLock
    if Version(filelock.__version__) >= Version("4.2.1")
    else _LegacyRuntimeCacheFileLock
)
