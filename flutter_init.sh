#!/usr/bin/env -S bash -c "echo 'Do not run this script directly.'"

# Configures the environment to use flutter
# via a unionfs overlay for standard users
# or /opt/flutter for flutter group members.

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  echo "$0 should not be executed directly."
  exit 1
fi

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

APP_DIR="/opt/flutter"
SAVE_DIR="$XDG_CACHE_HOME/flutter_local"
MOUNT_DIR="$XDG_CACHE_HOME/flutter_sdk"

if [ ! -e "$APP_DIR" ]; then
  echo "/opt/flutter not found."
  return 1
fi

VERSION_FILE=".dart_tool/version"

_check_version() {
  local VERSION_SOURCE="$APP_DIR/$VERSION_FILE"
  local VERSION_CACHE="$SAVE_DIR/.dart_tool/version_cache"

  if [ ! -f "$VERSION_SOURCE" ]; then
    echo "Flutter version file not found: $VERSION_SOURCE"
    return 1
  fi

  if [ ! -f "$VERSION_CACHE" ]; then
    install -D "$VERSION_SOURCE" "$VERSION_CACHE" || return 1
    return 0
  fi

  if ! cmp -s "$VERSION_SOURCE" "$VERSION_CACHE"; then
    echo "Flutter SDK cache is out of sync!"

    if mountpoint -q "$MOUNT_DIR"; then
      echo "Unmounting stale Flutter overlay..."
      fusermount -u "$MOUNT_DIR" || {
        echo "Failed to unmount $MOUNT_DIR"
        return 1
      }
    fi

    echo "Please manually remove:"
    echo "  $SAVE_DIR"
    echo "  $MOUNT_DIR"
    return 1
  fi

  return 0
}

_unionfs() {
  if mountpoint -q "$MOUNT_DIR"; then
    return 0
  fi

  mkdir -p "$SAVE_DIR" "$MOUNT_DIR" || return 1

  local _unionfs_opts=(
    -o cow
    -o uid="$(id -u)"
    -o gid="$(id -g)"
    "$SAVE_DIR=RW:$APP_DIR=RO"
    "$MOUNT_DIR"
  )

  if ! unionfs "${_unionfs_opts[@]}" > /dev/null 2>&1; then
    echo "unionfs failed to mount"
    return 1
  fi
}

if whoami | grep -q -E 'builder|builduser|main-builder'; then
  export FLUTTER_ROOT="$APP_DIR"
elif grep -q flutter <<< $(groups); then
  export FLUTTER_ROOT="$APP_DIR"
elif _check_version && _unionfs; then
  if mountpoint -q "$MOUNT_DIR" && [ -d "$MOUNT_DIR/bin" ]; then
    export FLUTTER_ROOT="$MOUNT_DIR"
  fi
fi

if [ -n "$FLUTTER_ROOT" ] && ! grep -q "$FLUTTER_ROOT" <<< "$PATH"; then
  export PATH="$FLUTTER_ROOT/bin:$PATH"
fi
