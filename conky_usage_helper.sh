#!/bin/bash

# Conky Helper Script for Internet Usage Monitor
# Extracts and formats data from usage data file

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
XDG_RUNTIME_DIR_FALLBACK="/run/user/$UID"
XDG_RUNTIME_DIR_EFFECTIVE="${XDG_RUNTIME_DIR:-$XDG_RUNTIME_DIR_FALLBACK}"
RUNTIME_DIR_EFFECTIVE="${RUNTIME_DIR:-$XDG_RUNTIME_DIR_EFFECTIVE/$APP_NAME}"

# Ensure necessary directories exist (primarily for consistency, helper mostly reads)
mkdir -p "$DATA_DIR_EFFECTIVE" "$USER_CONFIG_DIR_EFFECTIVE" "$RUNTIME_DIR_EFFECTIVE"


# Function to extract daily usage in bytes
get_daily_usage_bytes() {
    if [[ -f "$USAGE_DATA_FILE" ]]; then
        grep "daily_usage=" "$USAGE_DATA_FILE" 2>/dev/null | cut -d'=' -f2 || echo "0"
    else
        echo "0"
    fi
}

# Function to extract monthly usage in bytes
get_monthly_usage_bytes() {
    if [[ -f "$USAGE_DATA_FILE" ]]; then
        grep "monthly_usage=" "$USAGE_DATA_FILE" 2>/dev/null | cut -d'=' -f2 || echo "0"
    else
        echo "0"
    fi
}

# Function to get current date from usage file
get_current_date() {
    if [[ -f "$USAGE_DATA_FILE" ]]; then
        grep "last_date=" "$USAGE_DATA_FILE" 2>/dev/null | cut -d'"' -f2 || date '+%Y-%m-%d'
    else
        date '+%Y-%m-%d'
    fi
}

# Function to check if monitor is running
is_monitor_running() {
    # Check for both daemon and recent cron activity
    if pgrep -f "internet_monitor_daemon.sh" > /dev/null; then
        echo "true"
    elif [ -f "$USAGE_DATA_FILE" ]; then
        # Check if data file was updated recently (within last 10 minutes)
        local last_modified=$(stat -c %Y "$USAGE_DATA_FILE" 2>/dev/null || echo 0)
        local current_time=$(date +%s)
        local time_diff=$((current_time - last_modified))
        if [ $time_diff -lt 600 ]; then  # 600 seconds = 10 minutes
            echo "true"
        else
            echo "false"
        fi
    else
        echo "false"
    fi
}

# Function to convert bytes to human readable format
bytes_to_mb() {
    local bytes=$1
    # Ensure bytes is a valid number
    if [[ ! "$bytes" =~ ^[0-9]+$ ]]; then
        bytes=0
    fi
    echo "scale=2; $bytes / 1024 / 1024" | bc -l 2>/dev/null || echo "0.00"
}

bytes_to_gb() {
    local bytes=$1
    # Ensure bytes is a valid number
    if [[ ! "$bytes" =~ ^[0-9]+$ ]]; then
        bytes=0
    fi
    local result=$(echo "scale=3; $bytes / 1024 / 1024 / 1024" | bc -l 2>/dev/null)
    if [ -z "$result" ]; then # If bc produced empty output
        echo "0.000"
    else
        echo "$result"
    fi
}

# Function to get usage percentage
get_usage_percentage() {
    local usage_bytes=$(get_daily_usage_bytes)
    # Ensure usage_bytes is a valid number
    if [[ ! "$usage_bytes" =~ ^[0-9]+$ ]]; then
        usage_bytes=0
    fi
    echo "scale=1; $usage_bytes * 100 / $DAILY_LIMIT_BYTES" | bc -l 2>/dev/null || echo "0.0"
}

# Function to determine status based on usage
get_usage_status() {
    local usage_bytes=$(get_daily_usage_bytes)
    local usage_percent=$(get_usage_percentage)
    
    if (( $(echo "$usage_percent >= $CRITICAL_THRESHOLD" | bc -l 2>/dev/null || echo "0") )); then
        echo "LIMIT EXCEEDED"
    elif (( $(echo "$usage_percent >= $WARNING_THRESHOLD" | bc -l 2>/dev/null || echo "0") )); then
        echo "High Usage"
    else
        echo "Normal"
    fi
}

case "$1" in
    "date")
        get_current_date
        ;;
    "usage")
        usage_bytes=$(get_daily_usage_bytes)
        usage_gb=$(bytes_to_gb $usage_bytes)
        printf "%.2f GB" $usage_gb
        ;;
    "usage_mb")
        usage_bytes=$(get_daily_usage_bytes)
        usage_mb=$(bytes_to_mb $usage_bytes)
        printf "%.2f MB" $usage_mb
        ;;
    "limit")
        printf "%.2f GB" $DAILY_LIMIT_GB
        ;;
    "remaining")
        usage_bytes=$(get_daily_usage_bytes) # Removed local
        
        # Ensure variables are treated as integers for arithmetic
        if [[ "${DAILY_LIMIT_BYTES}" =~ ^[0-9]+$ ]] && [[ "${usage_bytes}" =~ ^[0-9]+$ ]]; then
            remaining_bytes=$((DAILY_LIMIT_BYTES - usage_bytes))
        else
            remaining_bytes=0
        fi
        
        if [[ $remaining_bytes -lt 0 ]]; then
            remaining_bytes=0
        fi
        
        remaining_gb=$(bytes_to_gb $remaining_bytes) # Removed local
        
        printf "%.2f GB" "$remaining_gb" # Added quotes around $remaining_gb for printf robustness
        ;;
    "remaining_mb")
        usage_bytes=$(get_daily_usage_bytes)
        remaining_bytes=$((DAILY_LIMIT_BYTES - usage_bytes))
        if [[ $remaining_bytes -lt 0 ]]; then
            remaining_bytes=0
        fi
        remaining_mb=$(bytes_to_mb $remaining_bytes)
        printf "%.2f MB" $remaining_mb
        ;;
    "percentage")
        usage_percent=$(get_usage_percentage)
        printf "%.1f%%" $usage_percent
        ;;
    "progress_bar"|"bar_percent")
        usage_percent=$(get_usage_percentage)
        # Ensure percentage doesn't exceed 100 for the bar
        if (( $(echo "$usage_percent > 100" | bc -l 2>/dev/null || echo "0") )); then
            usage_percent=100
        fi
        printf "%.0f" $usage_percent
        ;;
    "status")
        get_usage_status
        ;;
    "monitor_status")
        if [[ $(is_monitor_running) == "true" ]]; then
            echo "Running"
        else
            echo "Stopped"
        fi
        ;;
    "interface")
        if [[ -f "$USAGE_DATA_FILE" ]]; then
            grep "current_interface=" "$USAGE_DATA_FILE" 2>/dev/null | cut -d'"' -f2 || echo "Unknown"
        else
            echo "Unknown"
        fi
        ;;
    "config_limit")
        echo "$DAILY_LIMIT_GB GB"
        ;;
    "warning_threshold")
        echo "$WARNING_THRESHOLD%"
        ;;
    "critical_threshold")
        echo "$CRITICAL_THRESHOLD%"
        ;;
    "monthly_usage_gb")
        m_usage_bytes=$(get_monthly_usage_bytes) # Removed local
        m_usage_gb=$(bytes_to_gb $m_usage_bytes) # Removed local
        printf "%.2f GB" "$m_usage_gb"
        ;;
    *)
        echo "Usage: $0 {date|usage|usage_mb|limit|remaining|remaining_mb|percentage|progress_bar|bar_percent|status|monitor_status|interface|config_limit|warning_threshold|critical_threshold|monthly_usage_gb}"
        echo ""
        echo "Data display options:"
        echo "  date              - Current date from usage file"
        echo "  usage             - Current usage in GB"
        echo "  usage_mb          - Current usage in MB"
        echo "  limit             - Daily limit in GB"
        echo "  remaining         - Remaining data in GB"
        echo "  remaining_mb      - Remaining data in MB"
        echo "  percentage        - Usage percentage"
        echo "  progress_bar      - Progress bar percentage (0-100)"
        echo "  status            - Usage status (Normal/High Usage/LIMIT EXCEEDED)"
        echo ""
        echo "System status options:"
        echo "  monitor_status    - Monitor running status"
        echo "  interface         - Current network interface"
        echo "  monthly_usage_gb  - Current monthly usage in GB"
        echo ""
        echo "Configuration options:"
        echo "  config_limit      - Configured daily limit"
        echo "  warning_threshold - Warning threshold percentage"
        echo "  critical_threshold- Critical threshold percentage"
        exit 1
        ;;
esac
