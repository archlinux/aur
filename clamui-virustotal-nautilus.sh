#!/bin/bash
# ClamUI VirusTotal Scanner - Nautilus Script
# This script is installed to ~/.local/share/nautilus/scripts/
# and provides a "Scan with VirusTotal" context menu option.
#
# Usage: Called by Nautilus file manager when selecting "Scripts > Scan with VirusTotal"
# The selected files are passed via NAUTILUS_SCRIPT_SELECTED_FILE_PATHS environment variable.

# Enable logging for debugging
LOG_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/clamui/virustotal-nautilus.log"
mkdir -p "$(dirname "$LOG_FILE")"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log "Script started"
log "NAUTILUS_SCRIPT_SELECTED_FILE_PATHS: $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"
log "Arguments: $*"

# Check if clamui is available
if ! command -v clamui &> /dev/null; then
    log "ERROR: clamui command not found in PATH"
    log "PATH: $PATH"
    # Try to notify user
    if command -v notify-send &> /dev/null; then
        notify-send "ClamUI Not Found" "Please install ClamUI to use VirusTotal scanning."
    fi
    exit 1
fi

log "clamui found at: $(command -v clamui)"

# Get selected files from Nautilus
# NAUTILUS_SCRIPT_SELECTED_FILE_PATHS contains newline-separated paths
if [[ -n "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" ]]; then
    # Convert newline-separated paths to array
    IFS=$'\n' read -d '' -r -a files <<< "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"

    log "Found ${#files[@]} files from NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"

    # Launch clamui with --virustotal flag for the first file
    # (VirusTotal only supports single file scanning)
    if [[ ${#files[@]} -gt 0 ]]; then
        log "Launching: clamui --virustotal \"${files[0]}\""
        clamui --virustotal "${files[0]}" 2>&1 | tee -a "$LOG_FILE"
        log "clamui exited with code: $?"
    else
        log "ERROR: No files in array"
    fi
else
    # Fallback: try to use positional arguments
    if [[ $# -gt 0 ]]; then
        log "Using positional argument: $1"
        log "Launching: clamui --virustotal \"$1\""
        clamui --virustotal "$1" 2>&1 | tee -a "$LOG_FILE"
        log "clamui exited with code: $?"
    else
        log "ERROR: No files provided (neither env var nor arguments)"
        if command -v notify-send &> /dev/null; then
            notify-send "ClamUI VirusTotal" "No file selected for scanning."
        fi
    fi
fi

log "Script finished"
