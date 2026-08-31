#!/usr/bin/env bash
set -euo pipefail

SHARE_DIR="/usr/share/mpv-anime-build"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/mpv"
PROG_NAME="$(basename "$0")"

show_help() {
  cat <<HELP
MPV Anime Build - Helper Tool & Launcher

Usage:
  $PROG_NAME [OPTIONS]
  $PROG_NAME [MPV_ARGUMENTS...]
  mpv-anime [MPV_ARGUMENTS...]

Options:
  -i, --install    Copy mpv-anime-build configs to $CONFIG_DIR
                   (existing configs are backed up automatically)
  -l, --link       Symlink mpv-anime-build configs to $CONFIG_DIR
                   (stays automatically updated with package upgrades)
  -s, --status     Check current mpv configuration status
  -r, --restore    Restore the most recent mpv config backup
  -h, --help       Show this help message

If launched as 'mpv-anime' or passed video files directly, it starts MPV
using the anime build profile.
HELP
}

check_status() {
  echo "==> MPV Anime Build Status:"
  echo "    System share dir: $SHARE_DIR"
  echo "    User config dir:   $CONFIG_DIR"
  if [ -d "$CONFIG_DIR" ]; then
    if [ -L "$CONFIG_DIR" ]; then
      echo "    Current state:    SYMLINKED to $(readlink "$CONFIG_DIR")"
    else
      echo "    Current state:    Installed (custom / copied)"
    fi
  else
    echo "    Current state:    Not installed in user directory"
  fi

  BACKUPS=($(ls -d "${CONFIG_DIR}.backup."* 2>/dev/null || true))
  if [ ${#BACKUPS[@]} -gt 0 ]; then
    echo "    Available backups:"
    for b in "${BACKUPS[@]}"; do
      echo "      - $b"
    done
  fi
}

backup_existing() {
  if [ -e "$CONFIG_DIR" ] || [ -L "$CONFIG_DIR" ]; then
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    BACKUP_TARGET="${CONFIG_DIR}.backup.${TIMESTAMP}"
    echo "==> Backing up existing config to $BACKUP_TARGET..."
    mv "$CONFIG_DIR" "$BACKUP_TARGET"
  fi
}

install_config() {
  backup_existing
  echo "==> Copying mpv-anime-build configuration to $CONFIG_DIR..."
  mkdir -p "$CONFIG_DIR"
  cp -r "$SHARE_DIR"/* "$CONFIG_DIR/"
  echo "==> Installation complete! You can now launch 'mpv' normally."
}

link_config() {
  backup_existing
  echo "==> Symlinking mpv-anime-build configuration to $CONFIG_DIR..."
  mkdir -p "$(dirname "$CONFIG_DIR")"
  ln -sf "$SHARE_DIR" "$CONFIG_DIR"
  echo "==> Symlink created! Your MPV config will update automatically on package upgrades."
}

restore_config() {
  LATEST_BACKUP=$(ls -d "${CONFIG_DIR}.backup."* 2>/dev/null | sort -r | head -n 1 || true)
  if [ -z "$LATEST_BACKUP" ]; then
    echo ":: Error: No backups found matching ${CONFIG_DIR}.backup.*"
    exit 1
  fi
  echo "==> Restoring from $LATEST_BACKUP..."
  rm -rf "$CONFIG_DIR"
  mv "$LATEST_BACKUP" "$CONFIG_DIR"
  echo "==> Restored successfully to $CONFIG_DIR."
}

case "${1:-}" in
  -i|--install)
    install_config
    ;;
  -l|--link)
    link_config
    ;;
  -s|--status)
    check_status
    ;;
  -r|--restore)
    restore_config
    ;;
  -h|--help)
    show_help
    ;;
  *)
    if [ "$PROG_NAME" = "mpv-anime" ] || [ $# -gt 0 ]; then
      if [ -d "$CONFIG_DIR" ]; then
        exec mpv "$@"
      else
        exec mpv --config-dir="$SHARE_DIR" "$@"
      fi
    else
      show_help
    fi
    ;;
esac
