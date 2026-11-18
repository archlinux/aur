#!/usr/bin/env python3
"""Run the real Xvfb integration suite using local socketpair IPC only."""
import os
from pathlib import Path
import shlex
import socket
import subprocess
import tempfile
import time

with tempfile.TemporaryDirectory(prefix="sbxkb-test-") as temporary:
    library = str(Path(temporary) / "transport.so")
    subprocess.run(shlex.split(os.environ.get("CC", "cc")) + [
        "-shared", "-fPIC", "-o", library, "tests/socket_transport.c", "-ldl"
    ], check=True)
    server_socket, client_socket = socket.socketpair(socket.AF_UNIX, socket.SOCK_DGRAM)
    with server_socket, client_socket, open(Path(temporary) / "xvfb.log", "w+") as log:
        environment = os.environ.copy()
        environment.update(LD_PRELOAD=library, DISPLAY=":177")
        server_environment = environment.copy()
        server_environment.update(SBXKB_TEST_SERVER="1", SBXKB_TEST_BROKER=str(server_socket.fileno()))
        server = subprocess.Popen([
            "Xvfb", ":177", "-screen", "0", "640x480x24", "-nolisten", "tcp",
            "-nolisten", "local", "-ac"
        ], env=server_environment, pass_fds=(server_socket.fileno(),), stdout=log, stderr=log)
        try:
            time.sleep(0.3)
            if server.poll() is not None:
                log.seek(0)
                raise RuntimeError(log.read()[-4000:])
            environment["SBXKB_TEST_BROKER"] = str(client_socket.fileno())
            # The C test execs sbxkb and setxkbmap, which also use this IPC peer.
            os.set_inheritable(client_socket.fileno(), True)
            subprocess.run(["./tests/test_sbxkb"], env=environment,
                           pass_fds=(client_socket.fileno(),), timeout=30, check=True)
        finally:
            server.terminate()
            server.wait(timeout=5)
    subprocess.run(["./sbxkb", "--help"], stdout=subprocess.DEVNULL, check=True)
    subprocess.run(["./sbxkb", "--version"], check=True)
    for args in (["./sbxkb"], ["./sbxkb", "--icons-dir"]):
        result = subprocess.run(args, env={**os.environ, "DISPLAY": ""}, capture_output=True)
        assert result.returncode != 0, args
