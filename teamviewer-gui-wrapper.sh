#!/bin/bash
# TeamViewer GUI Sandboxed Wrapper using bubblewrap

show_help() {
  cat << "EOF"
Usage: teamviewer-sandboxed [teamviewer-args...]

To add custom bind mounts, set TEAMVIEWER_EXTRA_BINDS:
  TEAMVIEWER_EXTRA_BINDS="--bind /path/to/dir /path/to/dir --ro-bind /other /other" teamviewer-sandboxed

Or create a wrapper:
  #!/bin/bash
  export TEAMVIEWER_EXTRA_BINDS="--bind $HOME/Downloads $HOME/Downloads"
  exec teamviewer-sandboxed "$@"
EOF
}

if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
  show_help
  exit 0
fi

# Check if bwrap has setuid bit
if [[ ! -u /usr/bin/bwrap ]]; then
  cat << "EOF" >&2
WARNING: /usr/bin/bwrap is not setuid!
Without setuid, bwrap will create a user namespace which breaks TeamViewer's
ability to communicate with the daemon.

Run: sudo chmod u+s /usr/bin/bwrap

Attempting to continue anyway, but TeamViewer will likely fail to connect...
EOF
  sleep 2
fi

# Ensure required directories exist
mkdir -p \
  "$HOME/.config/teamviewer" \
  "$HOME/.cache" \
  "$HOME/.local/share/teamviewer15"

# Build bwrap command with optional extra binds
bwrap_args=(
  --ro-bind / /
  --dev-bind /dev /dev
  --tmpfs /tmp
  --tmpfs "$HOME"
  --bind "$HOME/.config/teamviewer" "$HOME/.config/teamviewer"
  --bind "$HOME/.cache" "$HOME/.cache"
  --bind "$HOME/.local/share/teamviewer15" "$HOME/.local/share/teamviewer15"
  --proc /proc
  --bind /run/user/"$(id -u)" /run/user/"$(id -u)"
  --ro-bind /run/dbus /run/dbus
  --die-with-parent
  --new-session
)

# Add extra binds from environment variable if set
if [ -n "$TEAMVIEWER_EXTRA_BINDS" ]; then
  # shellcheck disable=SC2086
  bwrap_args+=($TEAMVIEWER_EXTRA_BINDS)
fi

exec bwrap "${bwrap_args[@]}" /usr/bin/teamviewer-unwrapped "$@"
