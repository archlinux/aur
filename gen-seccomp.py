#!/usr/bin/python
"""Generate an x86-64 seccomp filter; abort on unsupported rules."""

import errno
import os
import platform
import sys
import tempfile

import seccomp

if platform.machine() != "x86_64":
    raise SystemExit("This package currently supports x86_64 only.")

if len(sys.argv) != 2:
    raise SystemExit(f"Usage: {sys.argv[0]} OUTPUT")

output = os.path.abspath(sys.argv[1])
directory = os.path.dirname(output)
os.makedirs(directory, exist_ok=True)

policy = seccomp.SyscallFilter(defaction=seccomp.ALLOW)
policy.add_arch(seccomp.Arch.X86)
policy.add_arch(seccomp.Arch.X32)

denied = """
ptrace process_vm_readv process_vm_writev
bpf perf_event_open userfaultfd
io_uring_setup io_uring_enter io_uring_register
keyctl add_key request_key
kexec_load kexec_file_load
init_module finit_module delete_module
mount umount2 pivot_root move_mount open_tree fsopen fsmount fsconfig fspick
open_by_handle_at name_to_handle_at
swapon swapoff reboot acct quotactl syslog
iopl ioperm
chown fchown lchown fchownat chown32 fchown32 lchown32
""".split()

for syscall in denied:
    try:
        policy.add_rule(seccomp.ERRNO(errno.EPERM), syscall)
    except Exception as error:
        raise SystemExit(
            f"Cannot install required seccomp rule for {syscall}: {error}"
        ) from error

fd, temporary = tempfile.mkstemp(prefix=".seccomp-", dir=directory)
try:
    with os.fdopen(fd, "wb") as stream:
        policy.export_bpf(stream)
    os.chmod(temporary, 0o644)
    os.replace(temporary, output)
finally:
    if os.path.exists(temporary):
        os.unlink(temporary)

print(f"Wrote {output}; {len(denied)} required deny rules added.")
