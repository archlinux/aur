"""Environment defaults for every python of this package's venv.

hermes.pth imports this module at interpreter start. /usr/bin/hermes exports
the same values before it starts hermes; this module covers the processes
started without it. One is the gateway service unit, which since v0.22.4
also runs the CLI, TUI and desktop sessions. Another is the command
`hermes --print-runtime-command` reports. A value already set wins, an empty
one included, so the launcher's exports and the user's own stay as they are.
"""
import os

# Lazy installs would target the root-owned venv; the package ships the
# extras users need instead.
os.environ.setdefault("HERMES_DISABLE_LAZY_INSTALLS", "1")
os.environ.setdefault("HERMES_LAZY_INSTALL_TARGET", os.path.join(
    os.environ.get("XDG_DATA_HOME") or os.path.expanduser("~/.local/share"),
    "hermes-agent", "python"))

# The webapp bundle this package ships (`hermes webapp`, served by the
# gateway): hermes serves it as it is instead of building one into the
# root-owned tree.
os.environ.setdefault("HERMES_WEBAPP_DIST", "/opt/hermes-agent/apps/desktop/dist-webapp")
