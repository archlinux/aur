#!/usr/bin/env python3
# Patches gamebryo-plugin-management to resolve Plugins.txt / loadorder.txt
# via the Steam Proton compatdata prefix on Linux instead of ~/AppData/Local.
#
# Uses discoveryForGame(gameMode) — already available in the same module scope —
# to get the game's install path, then scans appmanifest_*.acf across all Steam
# libraries to find the AppID dynamically. Works for any game, no hardcoded table.

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

# Generic replacement: resolves AppID via appmanifest scan against discovery.path.
# discoveryForGame() is a module-level var initialised by initGameSupport(api).
# path, require, gameSupport are all in scope from the compiled module.
NEW = (
    'function appDataPath(gameMode) {\n'
    '\tif (process.platform === \'linux\') {\n'
    '\t\tconst _fs = require(\'fs\');\n'
    '\t\ttry {\n'
    '\t\t\tconst _disc = discoveryForGame && discoveryForGame(gameMode);\n'
    '\t\t\tconst _discPath = _disc && _disc.path;\n'
    '\t\t\tif (_discPath) {\n'
    '\t\t\t\tconst _normDisc = path.normalize(_discPath);\n'
    '\t\t\t\tconst _sr = path.join(require(\'os\').homedir(), \'.steam\', \'steam\');\n'
    '\t\t\t\tconst _libs = [path.join(_sr, \'steamapps\')];\n'
    '\t\t\t\ttry {\n'
    '\t\t\t\t\tconst _vdf = _fs.readFileSync(path.join(_sr, \'steamapps\', \'libraryfolders.vdf\'), \'utf8\');\n'
    '\t\t\t\t\tfor (const _m of _vdf.matchAll(/"path"\\s+"([^"]+)"/g)) _libs.push(path.join(_m[1], \'steamapps\'));\n'
    '\t\t\t\t} catch(_e) {}\n'
    '\t\t\t\tfor (const _lib of [...new Set(_libs)]) {\n'
    '\t\t\t\t\ttry {\n'
    '\t\t\t\t\t\tfor (const _mf of _fs.readdirSync(_lib).filter(f => f.startsWith(\'appmanifest_\') && f.endsWith(\'.acf\'))) {\n'
    '\t\t\t\t\t\t\ttry {\n'
    '\t\t\t\t\t\t\t\tconst _mt = _fs.readFileSync(path.join(_lib, _mf), \'utf8\');\n'
    '\t\t\t\t\t\t\t\tconst _im = _mt.match(/"installdir"\\s+"([^"]+)"/);\n'
    '\t\t\t\t\t\t\t\tif (_im && path.normalize(path.join(_lib, \'common\', _im[1])) === _normDisc) {\n'
    '\t\t\t\t\t\t\t\t\tconst _idm = _mf.match(/appmanifest_(\\d+)\\.acf/);\n'
    '\t\t\t\t\t\t\t\t\tif (_idm) {\n'
    '\t\t\t\t\t\t\t\t\t\tconst _dp = path.join(_lib, \'compatdata\', _idm[1], \'pfx\', \'drive_c\', \'users\', \'steamuser\', \'AppData\', \'Local\');\n'
    '\t\t\t\t\t\t\t\t\t\tif (_fs.existsSync(_dp)) return path.join(_dp, gameSupport.get(gameMode, "appDataPath"));\n'
    '\t\t\t\t\t\t\t\t\t}\n'
    '\t\t\t\t\t\t\t\t}\n'
    '\t\t\t\t\t\t\t} catch(_e) {}\n'
    '\t\t\t\t\t\t}\n'
    '\t\t\t\t\t} catch(_e) {}\n'
    '\t\t\t\t}\n'
    '\t\t\t}\n'
    '\t\t} catch(_e) {}\n'
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
