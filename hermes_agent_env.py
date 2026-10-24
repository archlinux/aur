"""Environment defaults for every python of this package's venv.

hermes.pth imports this module at interpreter start. /usr/bin/hermes exports
the same values before it starts hermes; this module covers the processes
started without it. One is the gateway service unit (`hermes gateway
install`), which since v0.22.4 also runs the CLI, TUI and desktop sessions.
Another is the command `hermes --print-runtime-command` reports. A value
already set wins, an empty one included, so the launcher's exports and the
user's own stay as they are.
"""
import os
import shutil

# Root-owned /opt must not grow a PM store; Arch packages supply tools.
os.environ.setdefault("HERMES_DISABLE_LAZY_INSTALLS", "1")
os.environ.setdefault("HERMES_LAZY_INSTALL_TARGET", os.path.join(
    os.environ.get("XDG_DATA_HOME") or os.path.expanduser("~/.local/share"),
    "hermes-agent", "python"))
os.environ.setdefault("HERMES_NODE", "/usr/bin/node")

# Prefer system Chrome/Chromium, in the launcher's order.
if "AGENT_BROWSER_EXECUTABLE_PATH" not in os.environ:
    for _browser in ("google-chrome-stable", "google-chrome", "chromium"):
        _path = shutil.which(_browser)
        if _path:
            os.environ["AGENT_BROWSER_EXECUTABLE_PATH"] = _path
            break
