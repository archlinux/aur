#!/usr/bin/env python3
# Patches the Cyberpunk 2077 Vortex extension to fix Windows backslash paths
# in path_1.default.join() template literals on Linux.
# Finds the extension by searching info.json for the cp2077 game ID
# instead of hardcoding the folder name.

import json
import re
from pathlib import Path

MARKER = "// vortex-linux-fix\n"
PLUGINS_DIR = Path.home() / ".config/Vortex/plugins"
CP2077_IDS = {"game-cyberpunk2077", "cyberpunk2077"}


def fix_path_join(m):
    return "path_1.default.join(`" + m.group(1).replace("\\\\", "/") + "`)"


def find_cp2077_indexes(plugins_dir: Path):
    if not plugins_dir.exists():
        return []
    found = []
    for ext_dir in plugins_dir.iterdir():
        if not ext_dir.is_dir():
            continue
        info = ext_dir / "info.json"
        if info.exists():
            try:
                data = json.loads(info.read_text("utf-8"))
                ext_id = data.get("id", "").lower()
                ext_name = data.get("name", "").lower()
                if not (ext_id in CP2077_IDS or
                        any(k in ext_id for k in CP2077_IDS) or
                        "cyberpunk" in ext_name):
                    continue
            except Exception:
                continue
        else:
            # No info.json — fall back to folder name heuristic
            if "cyberpunk" not in ext_dir.name.lower():
                continue
        idx = ext_dir / "index.js"
        if idx.exists():
            found.append(idx)
    return found


def patch(idx: Path):
    content = idx.read_text("utf-8")
    if content.startswith(MARKER):
        return False
    patched = re.sub(
        r"path_1\.default\.join\(`([^`]*)`\)",
        fix_path_join,
        content,
    )
    if patched == content:
        return False
    idx.write_text(MARKER + patched, "utf-8")
    return True


def main():
    for idx in find_cp2077_indexes(PLUGINS_DIR):
        if patch(idx):
            print(f"[cp2077] patched backslash paths in {idx}")


if __name__ == "__main__":
    main()
