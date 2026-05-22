#!/usr/bin/env python3
"""
Generic BepInEx Linux fixer for native Unity games managed via Steam.

Runs at each Vortex launch (via vortex.sh). Scans all Steam libraries for
games that have BepInEx deployed as a Windows install (winhttp.dll hook)
on a Linux native Unity binary. For each game found:

  1. Copies /opt/Vortex/resources/libdoorstop.so to the game directory.
  2. Fixes doorstop_config.ini: backslash paths → forward slashes.
  3. Sets the LD_PRELOAD launch option in localconfig.vdf (all Steam accounts)
     if Steam is not running. Falls back to writing BEPINEX-LINUX.txt.
"""

import os
import re
import shutil
import subprocess
from pathlib import Path

LIBDOORSTOP_SRC = Path("/opt/Vortex/resources/libdoorstop.so")
STEAM_ROOT = Path.home() / ".local/share/Steam"
LAUNCH_OPT = (
    'DOORSTOP_ENABLED=1 '
    'DOORSTOP_TARGET_ASSEMBLY="BepInEx/core/BepInEx.Preloader.dll" '
    'LD_PRELOAD="./libdoorstop.so" %command%'
)


# ── Steam library discovery ─────────────────────────────────────────────────

def steam_libs() -> list[Path]:
    libs = [STEAM_ROOT / "steamapps"]
    vdf = STEAM_ROOT / "steamapps/libraryfolders.vdf"
    if vdf.exists():
        for m in re.finditer(r'"path"\s+"([^"]+)"',
                             vdf.read_text(errors="replace")):
            p = Path(m.group(1)) / "steamapps"
            if p.is_dir():
                libs.append(p)
    seen, out = set(), []
    for p in libs:
        key = str(p.resolve())
        if key not in seen:
            seen.add(key)
            out.append(p)
    return out


def appid_for(lib: Path, game_dir: Path) -> str | None:
    """Return the Steam AppID string for game_dir, found via appmanifest scan."""
    try:
        rel = game_dir.resolve().relative_to((lib / "common").resolve())
        installdir = rel.parts[0]
    except ValueError:
        return None
    for acf in lib.glob("appmanifest_*.acf"):
        try:
            txt = acf.read_text(errors="replace")
            m = re.search(r'"installdir"\s+"([^"]+)"', txt)
            if m and m.group(1) == installdir:
                mid = re.match(r"appmanifest_(\d+)\.acf", acf.name)
                return mid.group(1) if mid else None
        except OSError:
            pass
    return None


# ── Game detection ──────────────────────────────────────────────────────────

def has_linux_native_exe(game_dir: Path) -> bool:
    """True if the game root contains a Linux-native Unity executable."""
    if (game_dir / "UnityPlayer.so").is_file():
        return True
    try:
        for f in game_dir.iterdir():
            if f.suffix in (".x86_64", ".x86") and f.is_file() and os.access(f, os.X_OK):
                return True
    except OSError:
        pass
    return False


def bepinex_needs_fix(game_dir: Path) -> bool:
    """True if BepInEx is deployed for Windows on a Linux native game and needs work."""
    if not (game_dir / "BepInEx/core/BepInEx.Preloader.dll").exists():
        return False
    if not (game_dir / "winhttp.dll").exists():
        return False
    if not has_linux_native_exe(game_dir):
        return False
    # Filesystem already fixed: libdoorstop present + ini target_assembly uses forward slashes
    if (game_dir / "libdoorstop.so").exists():
        ini = game_dir / "doorstop_config.ini"
        if not ini.exists():
            return False
        content = ini.read_text(errors="replace")
        # Still needs fix if the Windows-style path is present
        if r"target_assembly=BepInEx\core\BepInEx.Preloader.dll" not in content:
            return False
    return True


# ── Filesystem fixes ────────────────────────────────────────────────────────

def apply_fs_fixes(game_dir: Path) -> list[str]:
    """Apply libdoorstop.so copy + ini path fix. Returns list of actions taken."""
    done = []

    dst = game_dir / "libdoorstop.so"
    if not dst.exists():
        if LIBDOORSTOP_SRC.exists():
            shutil.copy2(LIBDOORSTOP_SRC, dst)
            done.append("copied libdoorstop.so")
        else:
            done.append("WARN: libdoorstop.so not found at " + str(LIBDOORSTOP_SRC))

    ini = game_dir / "doorstop_config.ini"
    if ini.exists():
        content = ini.read_text(errors="replace")
        fixed = re.sub(
            r"(target_assembly\s*=\s*)BepInEx\\core\\BepInEx\.Preloader\.dll",
            r"\1BepInEx/core/BepInEx.Preloader.dll",
            content,
        )
        if fixed != content:
            ini.write_text(fixed)
            done.append("fixed doorstop_config.ini")

    return done


# ── Steam launch option ─────────────────────────────────────────────────────

def steam_running() -> bool:
    try:
        return subprocess.run(["pgrep", "-x", "steam"],
                              capture_output=True).returncode == 0
    except OSError:
        return False


def _set_launch_opt_in_vdf(vdf_path: Path, appid: str) -> bool:
    """
    Set LD_PRELOAD launch option for appid in a localconfig.vdf file.
    Returns True if a change was made.
    """
    try:
        content = vdf_path.read_text(encoding="utf-8", errors="replace")
    except OSError:
        return False

    # Find the app block: "599140"\n\t*{
    app_pat = re.compile(
        r'("' + re.escape(appid) + r'"\s*\{)(.*?)(\})',
        re.DOTALL,
    )
    m = app_pat.search(content)
    if not m:
        return False  # app not in this localconfig

    header, body, footer = m.group(1), m.group(2), m.group(3)

    # Already has our launch option?
    if "libdoorstop.so" in body:
        return False

    launch_pat = re.compile(r'"LaunchOptions"\s+"([^"]*)"')
    lm = launch_pat.search(body)
    if lm:
        existing = lm.group(1)
        if existing:
            new_opts = existing + " " + LAUNCH_OPT
        else:
            new_opts = LAUNCH_OPT
        new_body = body[:lm.start()] + f'"LaunchOptions"\t\t"{new_opts}"' + body[lm.end():]
    else:
        # Insert before the closing brace — detect indentation from existing keys
        indent_m = re.search(r'^(\t+)"[^"]+"', body, re.MULTILINE)
        indent = indent_m.group(1) if indent_m else "\t\t\t\t"
        new_body = body.rstrip("\n\t ") + f'\n{indent}"LaunchOptions"\t\t"{LAUNCH_OPT}"\n'

    new_content = content[:m.start()] + header + new_body + footer + content[m.end():]

    # Backup + write
    backup = vdf_path.with_suffix(".vdf.bak")
    try:
        shutil.copy2(vdf_path, backup)
        vdf_path.write_text(new_content, encoding="utf-8")
        backup.unlink(missing_ok=True)
        return True
    except OSError:
        if backup.exists():
            shutil.copy2(backup, vdf_path)
        return False


def set_launch_option(appid: str) -> bool:
    """Try to set launch option in all Steam user configs. Returns True if set in any."""
    if steam_running():
        return False
    if not appid:
        return False

    userdata = STEAM_ROOT / "userdata"
    if not userdata.is_dir():
        return False

    ok = False
    for user_dir in userdata.iterdir():
        vdf = user_dir / "config/localconfig.vdf"
        if vdf.exists():
            if _set_launch_opt_in_vdf(vdf, appid):
                ok = True
    return ok


def write_reminder(game_dir: Path) -> None:
    """Write BEPINEX-LINUX.txt with manual setup instructions (once)."""
    txt = game_dir / "BEPINEX-LINUX.txt"
    if txt.exists():
        return
    txt.write_text(
        "BepInEx Linux Setup — vortex-linux-fix\n"
        "======================================\n\n"
        "libdoorstop.so and doorstop_config.ini have been automatically fixed.\n\n"
        "One manual step required — add this to Steam launch options for this game:\n\n"
        f"  {LAUNCH_OPT}\n\n"
        "Steam → right-click game → Properties → General → Launch Options\n\n"
        "You can delete this file once the launch option is set.\n",
        encoding="utf-8",
    )


# ── Main ────────────────────────────────────────────────────────────────────

def main() -> None:
    for lib in steam_libs():
        common = lib / "common"
        if not common.is_dir():
            continue
        try:
            entries = list(common.iterdir())
        except OSError:
            continue

        for game_dir in entries:
            if not game_dir.is_dir():
                continue
            if not bepinex_needs_fix(game_dir):
                continue

            actions = apply_fs_fixes(game_dir)
            appid = appid_for(lib, game_dir)
            launch_set = set_launch_option(appid or "")

            if not launch_set:
                write_reminder(game_dir)
                actions.append("wrote BEPINEX-LINUX.txt (set Steam launch option manually)")
            else:
                actions.append(f"set Steam launch option (appid {appid})")
                (game_dir / "BEPINEX-LINUX.txt").unlink(missing_ok=True)

            print(f"  [BepInEx Linux] {game_dir.name}:")
            for a in actions:
                print(f"    · {a}")


if __name__ == "__main__":
    main()
