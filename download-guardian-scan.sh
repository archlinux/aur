#!/usr/bin/env bash

# ─── Configuration ─────────────────────────────────────────────────
WATCH_DIR="$HOME/Downloads"
CLAMSCAN_OPTS="--infected --recursive --remove=no"

LOG_FILE="$HOME/clamav_notifier.log"
# ────────────────────────────────────────────────────────────────────

# Ensure ClamAV database is up to date on startup:
if command -v freshclam &>/dev/null; then
  /usr/bin/freshclam --quiet
fi

# Helper: pop up a Yes/No dialog for a given path
confirm_scan() {
  local path="$1"
  zenity --question \
    --title="ClamAV Scan" \
    --width=350 \
    --text="New item detected:\n$path\n\nScan with ClamAV?" \
    --ok-label="Yes, scan" \
    --cancel-label="No, skip"
  return $?
}

# Helper: send a desktop notification
# Usage: notify "Title" "Message"
notify() {
  local title="$1"
  local msg="$2"
  # -u normal sets normal urgency; -t 5000 gives 5s timeout (adjust as needed)
  notify-send -i system -a DownloadGuardian -u normal -t 5000 "$title" "$msg"
}

echo "[INFO] ClamAV Notifier: watching $WATCH_DIR"
echo "       Logs -> $LOG_FILE"

# Start watching for newly closed files and moved-in items
inotifywait -m -e close_write -e moved_to --format '%w%f' "$WATCH_DIR" | while read -r NEWPATH; do
  # Skip if not a regular file or directory
  [[ ! -e "$NEWPATH" ]] && continue

  # Optional: ignore zero-byte or temp files
  [[ ! -s "$NEWPATH" ]] && continue

  echo "[EVENT] $(date '+%Y-%m-%d %H:%M:%S') Detected: $NEWPATH" >> "$LOG_FILE"

  if confirm_scan "$NEWPATH"; then
    echo "[ACTION] Scanning: $NEWPATH" >> "$LOG_FILE"
    notify "ClamAV Scanner" "Scanning: $(basename "$NEWPATH") …"

    # Run clamscan and capture output
    SCAN_OUTPUT=$(clamscan $CLAMSCAN_OPTS "$NEWPATH" 2>&1)
    SCAN_EXIT=$?

    # Append to log
    {
      echo "------ $(date '+%Y-%m-%d %H:%M:%S') Scan Result for: $NEWPATH ------"
      echo "$SCAN_OUTPUT"
      echo
    } >> "$LOG_FILE"

    # Determine notification based on exit code
    if [[ $SCAN_EXIT -eq 0 ]]; then
      # No virus found
      notify "ClamAV: Clean" "$(basename "$NEWPATH") is clean."
    elif [[ $SCAN_EXIT -eq 1 ]]; then
      # At least one virus found
      # Extract the infected-line from SCAN_OUTPUT, if any
      # clamscan prints lines like: /path/to/file: MalwareName FOUND
      # Grab all lines ending with “FOUND”
      INF_LINES=$(echo "$SCAN_OUTPUT" | grep -E "FOUND$")
      if [[ -z "$INF_LINES" ]]; then
        INF_LINES="(infected, but cannot parse name)"
      fi
      notify "ClamAV: Infected!" "$(basename "$NEWPATH") → $INF_LINES"
    else
      # Exit code >1 → clamscan error
      notify "ClamAV: Error" "Error scanning $(basename "$NEWPATH"). Check logs."
    fi
  else
    echo "[ACTION] Skipped scanning: $NEWPATH" >> "$LOG_FILE"
  fi
done

