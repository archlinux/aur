#!/bin/bash

# --- params ---
# target - same as rclone-bysinc@target.service
#

RCLONE_TARGET="$1"
LOCAL_PATH="$HOME/rclone-bisync/$RCLONE_TARGET"
FILE_PATTERN="$RCLONE_TARGET\_..*-local_$RCLONE_TARGET.path*.lst"

CACHE_DIR="$HOME/.cache/rclone/bisync/"
FOUND_FILES=$(find "$CACHE_DIR" -name "$FILE_PATTERN" -print)

# Check if the variable is empty (meaning no file was found).
if [ -n "$FOUND_FILES" ]; then
  # The variable is not empty, so a file was found.
  echo "Index files exist."
  echo "To regenereate run delete them first:"
  echo "rm ${FOUND_FILES[@]}"
else
  if [ ! -d "$LOCAL_PATH" ]; then
    mkdir -p "$LOCAL_PATH"
  fi
  echo "Performing initial bisync for $RCLONE_TARGET..."
  /usr/bin/rclone bisync "$RCLONE_TARGET:" "$LOCAL_PATH" \
    -MvP \
    --create-empty-src-dirs \
    --compare size,modtime,checksum \
    --conflict-resolve newer \
    --conflict-loser delete \
    --conflict-suffix sync-conflict-{DateOnly}- \
    --suffix-keep-extension \
    --resilient \
    --recover \
    --no-slow-hash \
    --drive-skip-gdocs \
    --fix-case \
    --resync
fi
