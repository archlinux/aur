#!/usr/bin/env bash

# ─── Configuration ──────────────────────────────────────────────────
WATCH_DIR="$HOME/Downloads"
CLAMSCAN_OPTS="--infected --recursive --remove=no"
LOG_FILE="$HOME/download-guardian.log"
# ────────────────────────────────────────────────────────────────────

# Ensure required commands exist:
for cmd in inotifywait clamscan zenity notify-send freshclam; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "ERROR: '$cmd' is required but not found in PATH." >&2
    exit 1
  fi
done

# Update ClamAV database on startup:
if command -v freshclam &>/dev/null; then
  /usr/bin/freshclam --quiet
fi

# Helper: pop up a Yes/No dialog for a given path
confirm_scan() {
  local path="$1"
  zenity --question \
    --title="Download Guardian" \
    --width=350 \
    --text="New item detected:\n$path\n\nScan with Download Guardian?" \
    --ok-label="Yes, scan" \
    --cancel-label="No, skip"
  return $?
}

# Helper: send a desktop notification
# Usage: notify "Title" "Message"
notify() {
  local title="$1"
  local msg="$2"
  # -u normal sets normal urgency; -t 5000 gives 5s timeout
  notify-send -i system -a DownloadGuardian -u normal -t 5000 "$title" "$msg"
}

echo "[INFO] Download Guardian: watching $WATCH_DIR"
echo "       Logs → $LOG_FILE"

# Start watching for newly closed files and moved-in items
inotifywait -m -e close_write -e moved_to \
  --format '%w%f' "$WATCH_DIR" | while read -r NEWPATH; do

  # Skip if it no longer exists:
  [[ ! -e "$NEWPATH" ]] && continue

  # Skip zero-byte or temp files (.part, .crdownload, .tmp, etc.):
  filename=$(basename "$NEWPATH")
  if [[ "$filename" =~ \.part$ ]] \
     || [[ "$filename" =~ \.crdownload$ ]] \
     || [[ "$filename" =~ \.tmp$ ]] \
     || ([[ "$filename" =~ ^\. ]] && [[ ! -d "$NEWPATH" ]]); then
    echo "[SKIP] Temp/incomplete file: $NEWPATH" >> "$LOG_FILE"
    continue
  fi

  # Skip if it’s an empty directory
  if [[ -d "$NEWPATH" && -z "$(ls -A "$NEWPATH")" ]]; then
    echo "[SKIP] Empty directory: $NEWPATH" >> "$LOG_FILE"
    continue
  fi

  echo "[EVENT] $(date '+%Y-%m-%d %H:%M:%S') Detected: $NEWPATH" >> "$LOG_FILE"

  if confirm_scan "$NEWPATH"; then
    echo "[ACTION] Scanning: $NEWPATH" >> "$LOG_FILE"
    notify "Download Guardian" "Scanning: $(basename "$NEWPATH") …"

    # Run clamscan and capture output
    SCAN_OUTPUT=$(clamscan $CLAMSCAN_OPTS "$NEWPATH" 2>&1)
    SCAN_EXIT=$?

    # Append to log
    {
      echo "------ $(date '+%Y-%m-%d %H:%M:%S') Scan Result for: $NEWPATH ------"
      echo "$SCAN_OUTPUT"
      echo
    } >> "$LOG_FILE"

    # Determine completion notification
    if [[ $SCAN_EXIT -eq 0 ]]; then
      # No virus found
      notify "Download Guardian: Clean" "$(basename "$NEWPATH") is clean."
    elif [[ $SCAN_EXIT -eq 1 ]]; then
      # At least one virus found
      INF_LINES=$(echo "$SCAN_OUTPUT" | grep -E "FOUND$")
      [[ -z "$INF_LINES" ]] && INF_LINES="(infected, but cannot parse name)"
      notify "Download Guardian: Infected!" "$(basename "$NEWPATH") → $INF_LINES"
    else
      # Exit code >1 → clamscan error
      notify "Download Guardian: Error" "Error scanning $(basename "$NEWPATH"). Check logs."
    fi
  else
    echo "[ACTION] Skipped scanning: $NEWPATH" >> "$LOG_FILE"
  fi
done

