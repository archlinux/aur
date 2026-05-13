#!/usr/bin/env python

from __future__ import annotations

import os
import subprocess
import sys
from pathlib import Path

from codex_session_delete import launcher
from codex_session_delete.cli import wait_for_shutdown


DEFAULT_APP_DIR = Path("/usr/lib/codex-plus-plus/app")
DEFAULT_DB_PATH = Path.home() / ".codex" / "state_5.sqlite"
DEFAULT_BACKUP_DIR = Path.home() / ".codex-session-delete" / "backups"


def env_path(name: str, default: Path) -> Path:
    raw = os.environ.get(name)
    if not raw:
        return default
    return Path(raw).expanduser()


def main(argv: list[str] | None = None) -> int:
    codex_args = list(argv if argv is not None else sys.argv[1:])
    app_dir = env_path("CODEXPP_APP_DIR", DEFAULT_APP_DIR)
    db_path = env_path("CODEXPP_DB_PATH", DEFAULT_DB_PATH)
    backup_dir = env_path("CODEXPP_BACKUP_DIR", DEFAULT_BACKUP_DIR)
    debug_port = int(os.environ.get("CODEXPP_DEBUG_PORT", "9229"))
    helper_port = int(os.environ.get("CODEXPP_HELPER_PORT", "57321"))

    original_launch_codex_app = launcher.launch_codex_app

    def launch_codex_app_with_args(resolved_app_dir: Path, resolved_debug_port: int):
        if sys.platform == "linux":
            env = launcher.codex_process_environment()
            command = [
                str(launcher.build_codex_executable(resolved_app_dir)),
                *launcher.build_codex_arguments(resolved_debug_port),
                *codex_args,
            ]
            return subprocess.Popen(command, env=env)
        return original_launch_codex_app(resolved_app_dir, resolved_debug_port)

    launcher.launch_codex_app = launch_codex_app_with_args
    try:
        server, codex_proc = launcher.launch_and_inject(
            app_dir,
            db_path,
            backup_dir,
            debug_port,
            helper_port,
        )
        wait_for_shutdown(server, codex_proc)
        return 0
    finally:
        launcher.launch_codex_app = original_launch_codex_app


if __name__ == "__main__":
    raise SystemExit(main())
