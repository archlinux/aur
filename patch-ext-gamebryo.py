#!/usr/bin/env python3
# Patches gamebryo-plugin-management to resolve Plugins.txt / loadorder.txt
# via the Steam Proton compatdata prefix on Linux instead of ~/AppData/Local.
#
# appDataPath() in gamebryo-plugin-management uses %LOCALAPPDATA% (Windows) or
# falls back to ~/.config/Vortex/../Local/<game>/ (wrong on Linux).
# Fix: resolve to ~/.steam/.../compatdata/<appid>/pfx/.../AppData/Local/<game>/

import re
from pathlib import Path

MARKER = "// vortex-linux-fix-appdata\n"
PLUGINS_DIR = Path.home() / ".config/Vortex/plugins"

# Exact compiled output from rolldown (matches TypeScript source in gameSupport.ts)
OLD = (
    'function appDataPath(gameMode) {\n'
    '\tconst dataPath = gameSupport.get(gameMode, "appDataPath");\n'
    '\treturn process.env.LOCALAPPDATA !== void 0 '
    '? path.join(process.env.LOCALAPPDATA, dataPath) '
    ': path.resolve(vortex_api.util.getVortexPath("appData"), "..", "Local", dataPath);\n'
    '}'
)

NEW = (
    'function appDataPath(gameMode) {\n'
    '\tif (process.platform === \'linux\') {\n'
    '\t\tconst _sids = {skyrim:72850,skyrimse:489830,skyrimvr:611670,enderal:933480,enderalspecialedition:976620,'
    'fallout3:22370,fallout4:377160,fallout4vr:611660,falloutnv:22380,starfield:1716740,oblivion:22330};\n'
    '\t\tconst _aid = _sids[gameMode];\n'
    '\t\tif (_aid !== void 0) {\n'
    '\t\t\tconst _fs = require(\'fs\');\n'
    '\t\t\tconst _os = require(\'os\');\n'
    '\t\t\tconst _sr = path.join(_os.homedir(), \'.steam\', \'steam\');\n'
    '\t\t\tconst _libs = [path.join(_sr, \'steamapps\')];\n'
    '\t\t\ttry {\n'
    '\t\t\t\tconst _vdf = _fs.readFileSync(path.join(_sr, \'steamapps\', \'libraryfolders.vdf\'), \'utf8\');\n'
    '\t\t\t\tfor (const _m of _vdf.matchAll(/"path"\\s+"([^"]+)"/g)) _libs.push(path.join(_m[1], \'steamapps\'));\n'
    '\t\t\t} catch(_e) {}\n'
    '\t\t\tfor (const _lib of _libs) {\n'
    '\t\t\t\tconst _dp = path.join(_lib, \'compatdata\', String(_aid), \'pfx\', \'drive_c\', \'users\', \'steamuser\', \'AppData\', \'Local\');\n'
    '\t\t\t\tif (_fs.existsSync(_dp)) return path.join(_dp, gameSupport.get(gameMode, "appDataPath"));\n'
    '\t\t\t}\n'
    '\t\t}\n'
    '\t}\n'
    '\tconst dataPath = gameSupport.get(gameMode, "appDataPath");\n'
    '\treturn process.env.LOCALAPPDATA !== void 0 '
    '? path.join(process.env.LOCALAPPDATA, dataPath) '
    ': path.resolve(vortex_api.util.getVortexPath("appData"), "..", "Local", dataPath);\n'
    '}'
)


def find_extension_index(plugins_dir: Path):
    """Find index.cjs of gamebryo-plugin-management in the plugins directory."""
    if not plugins_dir.exists():
        return []
    found = []
    for ext_dir in plugins_dir.iterdir():
        if not ext_dir.is_dir():
            continue
        info = ext_dir / "info.json"
        if info.exists():
            try:
                import json
                data = json.loads(info.read_text("utf-8"))
                if data.get("id") != "gamebryo-plugin-management" and \
                   "gamebryo-plugin-management" not in data.get("name", "").lower():
                    continue
            except Exception:
                pass
        idx = ext_dir / "index.cjs"
        if idx.exists() and "appDataPath" in idx.read_text("utf-8"):
            found.append(idx)
    return found


def patch(idx: Path):
    content = idx.read_text("utf-8")
    if content.startswith(MARKER):
        return False
    if OLD not in content:
        # Compiled form may differ — skip rather than corrupt
        return False
    patched = content.replace(OLD, NEW)
    idx.write_text(MARKER + patched, "utf-8")
    return True


def main():
    for idx in find_extension_index(PLUGINS_DIR):
        if patch(idx):
            print(f"[gamebryo] patched appDataPath in {idx}")


if __name__ == "__main__":
    main()
