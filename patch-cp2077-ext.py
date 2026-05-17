import re
from pathlib import Path

MARKER = "// vortex-linux-fix\n"
EXT_PATH = (Path.home() / ".config/Vortex/plugins"
            / "Vortex Extension Update - Cyberpunk 2077/index.js")

def fix_path_join(m):
    return "path_1.default.join(`" + m.group(1).replace("\\\\", "/") + "`)"

def main():
    if not EXT_PATH.exists():
        return
    content = EXT_PATH.read_text("utf-8")
    if content.startswith(MARKER):
        return
    patched = re.sub(r"path_1\.default\.join\(`([^`]*)`\)", fix_path_join, content)
    if patched != content:
        EXT_PATH.write_text(MARKER + patched, "utf-8")

if __name__ == "__main__":
    main()
