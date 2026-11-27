#!/usr/bin/env python3
"""Adjust the official Linux application for system Electron."""

import json
import re
import sys
from pathlib import Path

root = Path(sys.argv[1])
package = json.loads((root / "package.json").read_text())
if package["version"] != sys.argv[2]:
    sys.exit("The application version does not match pkgver.")
if package["devDependencies"]["electron"].split(".")[0] != "45":
    sys.exit("Check the Electron dependency and launcher for this release.")

# These entries are in app.asar/.webpack/main. Resources are beside app.asar.
resources = 'require("node:path").resolve(__dirname, "../../..")'
main = root / ".webpack/main/index.js"
if "process.resourcesPath" not in main.read_text():
    sys.exit("The main entry no longer uses process.resourcesPath. Check the patch.")
for entry in (root / ".webpack/main").glob("*.js"):
    text = entry.read_text()
    entry.write_text(text.replace("process.resourcesPath", resources))

# The audio helper belongs to Notion, not to the system Electron directory.
audio = root / "node_modules/@notionhq/desktop-native/linux/audioProxy.js"
text = audio.read_text()
original = 'path.dirname(process.execPath)'
if text.count(original) != 1:
    sys.exit("The audio helper path changed. Check the patch.")
audio.write_text(text.replace(original, 'path.resolve(__dirname, "../../../../..")'))

# Electron adds the archive to argv. Exclude it from Markdown file handling.
text, count = re.subn(
    r'"\.exe"!==([A-Za-z_$][\w$]*)',
    r'".exe"!==\1&&".asar"!==\1',
    main.read_text(),
)
if count != 1:
    sys.exit("The file argument filter changed. Check the patch.")
main.write_text(text)
