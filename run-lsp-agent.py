#!/usr/bin/env python3
"""Drive pkl-lsp JAR with native-image-agent to capture reachability metadata.

Exercises: kotlin-reflect component discovery, tree-sitter FFM parsing,
Gson deserialization, lsp4j Proxy dispatch, ServiceLoader SPI.
"""

import json
import subprocess
import sys
import time


def send(proc, msg):
    body = json.dumps(msg)
    header = f"Content-Length: {len(body)}\r\n\r\n"
    proc.stdin.write((header + body).encode())
    proc.stdin.flush()


def recv(proc, timeout=10):
    try:
        header = b""
        deadline = time.time() + timeout
        while b"\r\n\r\n" not in header:
            if time.time() > deadline:
                return None
            chunk = proc.stdout.read(1)
            if not chunk:
                return None
            header += chunk
        cl = 0
        for line in header.decode(errors="replace").split("\r\n"):
            if line.lower().startswith("content-length:"):
                cl = int(line.split(":")[1].strip())
        if cl == 0:
            return None
        body = b""
        while len(body) < cl:
            chunk = proc.stdout.read(cl - len(body))
            if not chunk:
                break
            body += chunk
        return json.loads(body)
    except Exception:
        return None


def main():
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <pkl-lsp-jar>", file=sys.stderr)
        sys.exit(1)

    jar_path = sys.argv[1]

    proc = subprocess.Popen(
        [
            "java",
            "-agentlib:native-image-agent=config-output-dir=META-INF/native-image",
            "-jar",
            jar_path,
        ],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
    )

    # Phase 1: initialize — triggers kotlin-reflect component discovery
    send(
        proc,
        {
            "jsonrpc": "2.0",
            "id": 1,
            "method": "initialize",
            "params": {
                "processId": None,
                "rootUri": "file:///tmp/pkl-lsp-agent",
                "capabilities": {
                    "workspace": {"workspaceFolders": True},
                },
            },
        },
    )
    resp = recv(proc)
    if resp is None:
        print(
            "ERROR: no response to initialize — server may have crashed",
            file=sys.stderr,
        )
        proc.kill()
        proc.wait()
        sys.exit(1)
    time.sleep(2)

    # Phase 2: initialized — triggers service registration, Index.init()
    send(proc, {"jsonrpc": "2.0", "method": "initialized", "params": {}})
    time.sleep(3)

    # Phase 3: didOpen — triggers tree-sitter FFM parsing
    send(
        proc,
        {
            "jsonrpc": "2.0",
            "method": "textDocument/didOpen",
            "params": {
                "textDocument": {
                    "uri": "file:///tmp/pkl-lsp-agent/test.pkl",
                    "languageId": "pkl",
                    "version": 1,
                    "text": 'amends "pkl:Config"\nname = "test"\n',
                }
            },
        },
    )
    time.sleep(4)

    # Phase 4: completion — exercises lsp4j, Gson (server responds with type info)
    send(
        proc,
        {
            "jsonrpc": "2.0",
            "id": 3,
            "method": "textDocument/completion",
            "params": {
                "textDocument": {"uri": "file:///tmp/pkl-lsp-agent/test.pkl"},
                "position": {"line": 1, "character": 7},
            },
        },
    )
    recv(proc)
    time.sleep(2)

    # Phase 5: shutdown — clean teardown
    send(proc, {"jsonrpc": "2.0", "id": 2, "method": "shutdown"})
    recv(proc)
    time.sleep(1)

    send(proc, {"jsonrpc": "2.0", "method": "exit"})
    time.sleep(0.5)

    try:
        proc.wait(timeout=15)
    except subprocess.TimeoutExpired:
        proc.kill()
        proc.wait()


if __name__ == "__main__":
    main()
