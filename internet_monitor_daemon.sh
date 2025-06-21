#!/bin/bash

# Internet Usage Monitor Daemon
# Runs the main monitor script continuously in a loop
# Use this for continuous monitoring instead of cron jobs

# Load configuration
APP_NAME="internet-usage-monitor-git" # Should be defined or sourced from config.sh if it sets it globally
XDG_CONFIG_HOME_FALLBACK="$HOME/.config"
XDG_CONFIG_HOME_EFFECTIVE="${XDG_CONFIG_HOME:-$XDG_CONFIG_HOME_FALLBACK}"

DEFAULT_CONFIG_DIR_BASE="/usr/share" # Base for system-wide defaults
USER_CONFIG_DIR_EFFECTIVE="$XDG_CONFIG_HOME_EFFECTIVE/$APP_NAME"

USER_CONFIG_FILE="$USER_CONFIG_DIR_EFFECTIVE/config.sh"
DEFAULT_CONFIG_FILE="$DEFAULT_CONFIG_DIR_BASE/$APP_NAME/config.sh"

if [ -f "$USER_CONFIG_FILE" ]; then
    source "$USER_CONFIG_FILE"
elif [ -f "$DEFAULT_CONFIG_FILE" ]; then
    source "$DEFAULT_CONFIG_FILE"
else
    echo "Error: Configuration file not found in $USER_CONFIG_FILE or $DEFAULT_CONFIG_FILE" >&2
    # Attempt to source config.sh from SCRIPT_DIR as a last resort for non-AUR execution
    SCRIPT_DIR_CONFIG_FALLBACK="$(dirname "${BASH_SOURCE[0]}")/config.sh"
    if [ -f "$SCRIPT_DIR_CONFIG_FALLBACK" ]; then
        source "$SCRIPT_DIR_CONFIG_FALLBACK"
        echo "Warning: Using config.sh from script directory $SCRIPT_DIR_CONFIG_FALLBACK as fallback." >&2
    else
        SCRIPT_DIR_PROJECT_CONFIG_FALLBACK="$(dirname "${BASH_SOURCE[0]}")/../config/config.sh"
        if [ -f "$SCRIPT_DIR_PROJECT_CONFIG_FALLBACK" ]; then
            source "$SCRIPT_DIR_PROJECT_CONFIG_FALLBACK"
            echo "Warning: Using config.sh from project directory $SCRIPT_DIR_PROJECT_CONFIG_FALLBACK as fallback." >&2
        else
             echo "Error: Fallback config.sh also not found at $SCRIPT_DIR_CONFIG_FALLBACK or $SCRIPT_DIR_PROJECT_CONFIG_FALLBACK" >&2
             exit 1
        fi
    fi
fi

# Ensure XDG directories are defined (they should be by config.sh)
# Fallbacks for DATA_DIR, CONFIG_DIR, RUNTIME_DIR if not set by config.sh (defensive)
XDG_DATA_HOME_FALLBACK="$HOME/.local/share"
XDG_DATA_HOME_EFFECTIVE="${XDG_DATA_HOME:-$XDG_DATA_HOME_FALLBACK}"
DATA_DIR_EFFECTIVE="${DATA_DIR:-$XDG_DATA_HOME_EFFECTIVE/$APP_NAME}"

# CONFIG_DIR is already USER_CONFIG_DIR_EFFECTIVE
# RUNTIME_DIR needs a fallback if not set by config.sh
XDG_RUNTIME_DIR_FALLBACK="/run/user/$UID" # Default XDG runtime dir
XDG_RUNTIME_DIR_EFFECTIVE="${XDG_RUNTIME_DIR:-$XDG_RUNTIME_DIR_FALLBACK}"
RUNTIME_DIR_EFFECTIVE="${RUNTIME_DIR:-$XDG_RUNTIME_DIR_EFFECTIVE/$APP_NAME}" # App specific runtime dir

# Ensure necessary directories exist
mkdir -p "$DATA_DIR_EFFECTIVE" "$USER_CONFIG_DIR_EFFECTIVE" "$RUNTIME_DIR_EFFECTIVE"


# Function to log daemon messages
log_daemon() {
    echo "$(date '+%Y-%m-%d %H:%M:%S'): [DAEMON] $1" >> "$LOG_FILE"
}

# Function to handle cleanup on exit
cleanup() {
    log_daemon "Daemon stopping (PID: $$)"
    exit 0
}

# Set up signal handlers
trap cleanup SIGTERM SIGINT

# Check if daemon is already running
# DAEMON_PID_FILE is now defined using RUNTIME_DIR_EFFECTIVE
DAEMON_PID_FILE="$RUNTIME_DIR_EFFECTIVE/daemon.pid"

if [ -f "$DAEMON_PID_FILE" ]; then
    EXISTING_PID=$(cat "$DAEMON_PID_FILE")
    if ps -p "$EXISTING_PID" > /dev/null 2>&1; then
        echo "Error: Internet monitor daemon is already running (PID: $EXISTING_PID)"
        echo "To stop it, run: kill $EXISTING_PID"
        exit 1
    else
        # Stale PID file, remove it
        rm -f "$DAEMON_PID_FILE"
    fi
fi

# Create PID file
echo $$ > "$DAEMON_PID_FILE"

# Function to remove PID file on exit
remove_pid_file() {
    rm -f "$DAEMON_PID_FILE"
}
trap remove_pid_file EXIT

log_daemon "Starting daemon (PID: $$)"
echo "Internet Usage Monitor Daemon started (PID: $$)"
echo "Checking usage every $DAEMON_UPDATE_INTERVAL seconds"
echo "Log file: $LOG_FILE"
echo "Data file: $USAGE_DATA_FILE"
echo "Press Ctrl+C to stop"

# Main daemon loop
while true; do
    # Run the main monitor script (it will be in /usr/bin after AUR installation)
    internet_monitor.sh
    
    # Check if we should exit
    if [ ! -f "$DAEMON_PID_FILE" ]; then
        log_daemon "PID file removed, exiting daemon"
        break
    fi
    
    # Sleep for the configured interval
    sleep "$DAEMON_UPDATE_INTERVAL"
done

log_daemon "Daemon stopped"
