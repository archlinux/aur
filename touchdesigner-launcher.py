#!/usr/bin/env python3
"""TouchDesigner launcher for AUR package - handles prefix setup + .toe patching."""

import os
import shutil
import subprocess
import sys
import tempfile

PREFIX = "/opt/touchdesigner"
WINE = f"{PREFIX}/wine/bin/wine64"
WINEBOOT = f"{PREFIX}/wine/bin/wineboot"
TD_DIR = f"{PREFIX}/td"
DXVK_DIR = f"{PREFIX}/dxvk"
WINETRICKS = f"{PREFIX}/winetricks"
DATA_DIR = f"{PREFIX}/data"
FIX_FILE = f"{PREFIX}/wine_ui_fixes.tox"
BACKUP_DIR = f"{PREFIX}/backups"
WINE_PREFIX = os.path.expanduser("~/.local/share/touchdesigner-linux/prefix")
DOSDEVICES = os.path.join(WINE_PREFIX, "dosdevices")
INIT_FLAG = os.path.join(WINE_PREFIX, ".td_initialized")

os.environ["WINEDLLOVERRIDES"] = "mscoree="
os.environ["WINEDEBUG"] = "fixme-all,warn-all"
os.environ["PATH"] = f"{PREFIX}/wine/bin:{os.environ.get('PATH', '')}"
os.environ["LD_LIBRARY_PATH"] = (
    f"{PREFIX}/wine/lib:{PREFIX}/wine/lib64:{os.environ.get('LD_LIBRARY_PATH', '')}"
)
os.environ["WINEPREFIX"] = WINE_PREFIX

LICENSE_DIR = f"{WINE_PREFIX}/drive_c/ProgramData/Derivative"


def backup_license():
    """Backup license files before wineboot (which may reset prefix state)."""
    if os.path.isdir(LICENSE_DIR):
        bak = f"{LICENSE_DIR}.bak"
        shutil.rmtree(bak, True)
        shutil.copytree(LICENSE_DIR, bak, symlinks=True, dirs_exist_ok=True)
        return True
    return False


def restore_license():
    """Restore license files if wineboot cleared or overwrote them."""
    bak = f"{LICENSE_DIR}.bak"
    if os.path.isdir(bak):
        shutil.rmtree(LICENSE_DIR, True)
        shutil.copytree(bak, LICENSE_DIR, symlinks=True, dirs_exist_ok=True)
        shutil.rmtree(bak, True)


def ensure_drives():
    """Ensure essential drive symlinks exist (c:, z:)."""
    os.makedirs(DOSDEVICES, exist_ok=True)

    z_path = os.path.join(DOSDEVICES, "z:")
    if not os.path.islink(z_path):
        if os.path.isdir(z_path):
            print("  Repairing z: drive (was copied as directory instead of symlink)...")
            shutil.rmtree(z_path)
        os.symlink("/", z_path)

    c_path = os.path.join(DOSDEVICES, "c:")
    if not os.path.islink(c_path):
        drive_c = os.path.join(WINE_PREFIX, "drive_c")
        if os.path.isdir(drive_c):
            os.symlink("../drive_c", c_path)
        else:
            print("Warning: drive_c not found, wineboot may fail")


def setup_prefix():
    """Copy pre-made prefix on first run, preserving symlinks."""
    system_reg = f"{WINE_PREFIX}/drive_c/windows/system.reg"
    default_prefix = f"{PREFIX}/default-prefix"
    if not os.path.isfile(system_reg) and os.path.isdir(default_prefix):
        print("TouchDesigner - Setting up...")
        os.makedirs(WINE_PREFIX, exist_ok=True)
        for item in os.listdir(default_prefix):
            if item == "dosdevices":
                continue
            src = os.path.join(default_prefix, item)
            dst = os.path.join(WINE_PREFIX, item)
            if os.path.isdir(src):
                shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True)
            else:
                shutil.copy2(src, dst)
        ensure_drives()
    else:
        ensure_drives()


def copy_programdata():
    """Copy ProgramData if present."""
    if os.path.isdir(f"{DATA_DIR}/ProgramData"):
        target = f"{WINE_PREFIX}/drive_c/ProgramData"
        os.makedirs(target, exist_ok=True)
        for item in os.listdir(f"{DATA_DIR}/ProgramData"):
            src = os.path.join(f"{DATA_DIR}/ProgramData", item)
            dst = os.path.join(target, item)
            if os.path.isdir(src):
                shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True)
            else:
                shutil.copy2(src, dst)


def wine_run(args, timeout=120):
    """Run a Wine command and return (returncode, stdout, stderr)."""
    env = os.environ.copy()
    try:
        r = subprocess.run(args, capture_output=True, timeout=timeout, env=env)
        return r.returncode, r.stdout, r.stderr
    except subprocess.TimeoutExpired:
        return -1, b"", b"TIMEOUT"


def ensure_wine_ready():
    """Initialize Wine prefix on first launch only.

    Running wineboot on every start resets certain registry settings
    (e.g. LogPixels font size). We only run it once and track
    initialization with a flag file.
    """
    if not os.path.isfile(INIT_FLAG) and os.path.isfile(WINEBOOT):
        wine_run([WINEBOOT, "-u"], timeout=30)
        open(INIT_FLAG, "w").close()


def apply_font_dpi():
    """Set LogPixels DPI for readable UI fonts in TouchDesigner.

    Wine defaults to 96 DPI which makes TD UI fonts very small on
    high-resolution displays. This sets 120 DPI (0x78) in the registry
    after wineboot so the setting persists across launches.
    """
    tmp = tempfile.mkdtemp(prefix="td_dpi_")
    reg_file = os.path.join(tmp, "dpi.reg")
    with open(reg_file, "w") as f:
        f.write(
            "REGEDIT4\n\n"
            "[HKEY_CURRENT_CONFIG\\Software\\Fonts]\n"
            '"LogPixels"=dword:00000078\n'
        )
    wine_run([WINE, "regedit", f"z:{reg_file}"], timeout=10)
    shutil.rmtree(tmp, True)


def patch_toe(toe_path):
    """Patch a .toe file with wine_ui_fixes.tox."""
    toe_expand = f"{TD_DIR}/bin/toeexpand.exe"
    toe_collapse = f"{TD_DIR}/bin/toecollapse.exe"

    if not all(os.path.isfile(f) for f in [toe_expand, toe_collapse, FIX_FILE]):
        print(
            f"  Patching: missing tools (expand={os.path.isfile(toe_expand)}, "
            f"collapse={os.path.isfile(toe_collapse)}, fix={os.path.isfile(FIX_FILE)})"
        )
        return

    toe_dir = toe_path + ".dir"
    toe_toc = toe_path + ".toc"

    shutil.rmtree(toe_dir, True)
    shutil.rmtree(toe_toc, True)
    os.remove(toe_toc) if os.path.isfile(toe_toc) else None

    print(f"  Patching: {toe_path}")

    tmp = tempfile.mkdtemp(prefix="td_patch_")
    fix_src = os.path.join(tmp, "fix.tox")
    shutil.copy2(FIX_FILE, fix_src)

    rc, _, _ = wine_run([WINE, toe_expand, "z:" + fix_src])
    if rc == -1:
        print("  TIMEOUT expanding fix.tox")
        shutil.rmtree(tmp, True)
        return

    fix_toc_path = fix_src + ".toc"
    fix_entries = []
    if os.path.isfile(fix_toc_path):
        with open(fix_toc_path) as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith("#") and line != ".build":
                    fix_entries.append(line)

    fix_dir = fix_src + ".dir"

    rc, _, _ = wine_run([WINE, toe_expand, "z:" + toe_path])
    if rc == -1:
        print("  TIMEOUT expanding target .toe")
        shutil.rmtree(tmp, True)
        return

    needs_patch = not os.path.isdir(os.path.join(toe_dir, "wine_ui_fixes"))
    shutil.rmtree(toe_dir, True)
    shutil.rmtree(toe_toc, True)

    if not needs_patch:
        print("  Already patched, skipping.")
        shutil.rmtree(tmp, True)
        return

    rc, _, _ = wine_run([WINE, toe_expand, "z:" + toe_path])
    if rc == -1 or not os.path.isdir(toe_dir):
        print("  Failed to expand target .toe")
        shutil.rmtree(tmp, True)
        return

    os.makedirs(BACKUP_DIR, exist_ok=True)
    shutil.copy2(
        toe_path, os.path.join(BACKUP_DIR, os.path.basename(toe_path) + ".bak")
    )

    if os.path.isdir(fix_dir):
        for f in os.listdir(fix_dir):
            src = os.path.join(fix_dir, f)
            dst = os.path.join(toe_dir, f)
            if os.path.isdir(src):
                shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True)
            else:
                shutil.copy2(src, dst)

    if fix_entries:
        with open(toe_toc, "a") as f:
            for entry in fix_entries:
                f.write(entry + "\n")

    rc, _, _ = wine_run([WINE, toe_collapse, "z:" + toe_path])
    if rc == -1:
        print("  TIMEOUT collapsing .toe (partial state may remain)")

    shutil.rmtree(toe_dir, True)
    shutil.rmtree(toe_toc, True)
    shutil.rmtree(tmp, True)

    new_size = os.path.getsize(toe_path)
    print(f"  Patched OK ({new_size} bytes)")


def find_td_exe():
    """Find TouchDesigner.exe in the install dir."""
    for path in [f"{TD_DIR}/bin/TouchDesigner.exe", f"{TD_DIR}/TouchDesigner.exe"]:
        if os.path.isfile(path):
            return path
    for root, dirs, files in os.walk(TD_DIR):
        for f in files:
            if f.lower() == "touchdesigner.exe":
                return os.path.join(root, f)
    return None


def resolve_path(path):
    """Resolve a path that may be a file:// URI or Wine path."""
    if not path:
        return None
    if path.startswith("file://"):
        from urllib.parse import unquote
        path = unquote(path[7:])
    if len(path) > 2 and path[1:3] in (":/", ":\\"):
        path = path[2:]
    return os.path.realpath(path) if os.path.isfile(path) else path


def main():
    if "--help" in sys.argv or "-h" in sys.argv or "--h" in sys.argv:
        print("Usage: touchdesigner [.toe file]")
        print()
        print("Launch TouchDesigner (Wine) on Linux.")
        print()
        print("Positional:")
        print("  .toe file        Open a project file")
        print()
        print("Options:")
        print("  --exe <path>     Use a specific TouchDesigner.exe")
        print("  --help, -h       Show this help")
        sys.exit(0)

    setup_prefix()
    copy_programdata()
    had_license = backup_license()
    ensure_wine_ready()
    apply_font_dpi()
    if had_license:
        restore_license()

    input_path = resolve_path(sys.argv[1] if len(sys.argv) > 1 else None)
    if (
        input_path
        and os.path.isfile(input_path)
        and input_path.lower().endswith(".toe")
    ):
        patch_toe(input_path)

    td_exe = find_td_exe()
    if not td_exe:
        print("Error: TouchDesigner not found")
        sys.exit(1)

    args = [WINE, td_exe]
    if input_path:
        args.append("z:" + input_path)

    os.execve(WINE, args, os.environ)


if __name__ == "__main__":
    main()
