#!/bin/bash

# Internet Usage Monitor - Uninstallation Script
# Removes all installed files and configurations

set -e # Re-enable exit on error, individual rm failures are handled in remove_files

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Emoji indicators
CHECK="✅"
CROSS="❌"
WARNING="⚠️"
INFO="ℹ️"
TRASH="🗑️"

echo -e "${BLUE}${TRASH} Internet Usage Monitor Uninstallation${NC}"
echo -e "${BLUE}=========================================${NC}"
echo

# Function to print colored output
print_status() {
    local color=$1
    local icon=$2
    local message=$3
    echo -e "${color}${icon} ${message}${NC}"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to backup user data
backup_user_data() {
    local backup_dir="$HOME/.internet_monitor_backup_$(date +%Y%m%d_%H%M%S)"
    
    if [ -f "$HOME/.internet_usage_data" ] || [ -f "$HOME/.internet_usage.log" ]; then
        mkdir -p "$backup_dir"
        
        if [ -f "$HOME/.internet_usage_data" ]; then
            cp "$HOME/.internet_usage_data" "$backup_dir/"
            print_status "$YELLOW" "$WARNING" "Backed up usage data to $backup_dir"
        fi
        
        if [ -f "$HOME/.internet_usage.log" ]; then
            cp "$HOME/.internet_usage.log" "$backup_dir/"
            print_status "$YELLOW" "$WARNING" "Backed up usage log to $backup_dir"
        fi
        
        echo -e "${YELLOW}Your usage data has been backed up to: $backup_dir${NC}"
        echo
    fi
}

# Function to search for files in common locations
find_installed_files() {
    local search_paths=(
        "$HOME"
        "/usr/local/bin"
        "/usr/bin"
        "/opt/internet-monitor"
        "/usr/share/internet-monitor"
        "$HOME/.local/bin"
        "$HOME/bin"
        "$HOME/scripts"
    )
    
    local file_patterns=(
        "internet_monitor.sh"
        "internet_monitor_daemon.sh"
        "conky_usage_helper.sh"
        ".conkyrc_internet"
        "conkyrc_internet"
        "config.sh"
    )
    
    local found_files=()
    
    print_status "$BLUE" "$INFO" "Searching for installed files..." >&2 # Redirect to stderr
    
    for path in "${search_paths[@]}"; do
        if [ -d "$path" ]; then
            for pattern in "${file_patterns[@]}"; do
                # Use find to search for files matching patterns
                while IFS= read -r -d '' file; do
                    found_files+=("$file")
                done < <(find "$path" -maxdepth 1 -name "*$pattern*" -type f -print0 2>/dev/null)
            done
        fi
    done
    
    # Also search for any file with "internet" and "monitor" in the name
    for path in "${search_paths[@]}"; do
        if [ -d "$path" ]; then
            while IFS= read -r -d '' file; do
                # Check if file contains both "internet" and "monitor" in name
                basename_file=$(basename "$file")
                if [[ "$basename_file" == *"internet"* ]] && [[ "$basename_file" == *"monitor"* ]]; then
                    found_files+=("$file")
                fi
            done < <(find "$path" -maxdepth 1 -type f -print0 2>/dev/null)
        fi
    done
    
    # Remove duplicates and print found files
    local unique_files=($(printf '%s\n' "${found_files[@]}" | sort -u))
    
    if [ ${#unique_files[@]} -gt 0 ]; then
        print_status "$YELLOW" "$WARNING" "Found ${#unique_files[@]} files to remove:" >&2 # Redirect to stderr
        for file in "${unique_files[@]}"; do
            echo "  - $file" >&2 # Redirect to stderr
        done
        echo >&2 # Redirect to stderr
    else
        print_status "$BLUE" "$INFO" "No installed files found." >&2 # Redirect to stderr
    fi
    
    # Return the array of unique files
    printf '%s\n' "${unique_files[@]}"
}

# Function to remove installed files
remove_files() {
    print_status "$BLUE" "$INFO" "Removing installed files..."
    
    # Get list of files to remove
    local files_to_remove
    mapfile -t files_to_remove < <(find_installed_files)
    
    if [ ${#files_to_remove[@]} -eq 0 ]; then
        print_status "$BLUE" "$INFO" "No files found to remove."
        return
    fi
    
    # Ask for confirmation if files are found
    if [ ${#files_to_remove[@]} -gt 0 ]; then
        echo
        read -p "Found ${#files_to_remove[@]} files. Remove all? (y/N): " REPLY
        echo
        local response_char="${REPLY:0:1}" # Get the first character
        if [[ ! "$response_char" =~ ^[Yy]$ ]]; then
            print_status "$BLUE" "$INFO" "File removal cancelled by user."
            return
        fi
    fi
    
    # Remove the files with better error handling
    local removed_count=0
    set +e # Temporarily disable exit on error for file removal
    for file in "${files_to_remove[@]}"; do
        if [ -f "$file" ]; then
            if rm -f "$file" 2>/dev/null; then
                print_status "$GREEN" "$CHECK" "Removed: $file"
                ((removed_count++))
            else
                print_status "$RED" "$CROSS" "Failed to remove: $file"
            fi
        else
            print_status "$BLUE" "$INFO" "File not found (already removed?): $file"
        fi
    done
    set -e # Re-enable exit on error
    
    if [ $removed_count -gt 0 ]; then
        print_status "$GREEN" "$CHECK" "Successfully removed $removed_count files"
    else
        print_status "$YELLOW" "$WARNING" "No files were removed"
    fi
}

# Function to remove user data
remove_user_data() {
    echo
    read -p "Do you want to remove usage data and logs? (y/N): " REPLY
    echo
    local response_char="${REPLY:0:1}" # Get the first character
    
    if [[ "$response_char" =~ ^[Yy]$ ]]; then
        if [ -f "$HOME/.internet_usage_data" ]; then
            rm -f "$HOME/.internet_usage_data"
            print_status "$GREEN" "$CHECK" "Removed usage data file"
        fi
        
        if [ -f "$HOME/.internet_usage.log" ]; then
            rm -f "$HOME/.internet_usage.log"
            print_status "$GREEN" "$CHECK" "Removed usage log file"
        fi
    else
        print_status "$BLUE" "$INFO" "Keeping usage data and logs"
    fi
}

# Function to remove cron jobs
remove_cron_jobs() {
    print_status "$BLUE" "$INFO" "Checking for cron jobs..."
    
    # Check if cron job exists
    if crontab -l 2>/dev/null | grep -q "internet_monitor.sh"; then
        # Remove cron job
        crontab -l 2>/dev/null | grep -v "internet_monitor.sh" | crontab -
        print_status "$GREEN" "$CHECK" "Removed cron job"
    else
        print_status "$BLUE" "$INFO" "No cron job found"
    fi
}

# Function to remove systemd services
remove_systemd_services() {
    print_status "$BLUE" "$INFO" "Checking for systemd services..."
    
    if [ -f "$HOME/.config/systemd/user/internet-monitor.timer" ]; then
        systemctl --user stop internet-monitor.timer 2>/dev/null || true
        systemctl --user disable internet-monitor.timer 2>/dev/null || true
        rm -f "$HOME/.config/systemd/user/internet-monitor.timer"
        print_status "$GREEN" "$CHECK" "Removed systemd timer"
    fi
    
    if [ -f "$HOME/.config/systemd/user/internet-monitor.service" ]; then
        rm -f "$HOME/.config/systemd/user/internet-monitor.service"
        print_status "$GREEN" "$CHECK" "Removed systemd service"
    fi
    
    # Reload systemd if we removed anything
    if systemctl --user list-unit-files | grep -q "internet-monitor"; then
        systemctl --user daemon-reload
        print_status "$GREEN" "$CHECK" "Reloaded systemd configuration"
    fi
}

# Function to remove autostart entries
remove_autostart_entries() {
    print_status "$BLUE" "$INFO" "Checking for autostart entries..."
    
    local autostart_files=(
        "$HOME/.config/autostart/internet-monitor.desktop"
        "$HOME/.config/autostart/internet-conky.desktop"
    )
    
    for file in "${autostart_files[@]}"; do
        if [ -f "$file" ]; then
            rm -f "$file"
            print_status "$GREEN" "$CHECK" "Removed autostart entry: $(basename "$file")"
        fi
    done
}

# Function to stop running processes
stop_processes() {
    print_status "$BLUE" "$INFO" "Stopping running processes..."
    
    # Stop daemon
    if pgrep -f "internet_monitor_daemon.sh" > /dev/null; then
        pkill -f "internet_monitor_daemon.sh"
        print_status "$GREEN" "$CHECK" "Stopped monitor daemon"
    fi
    
    # Stop Conky instances (ask user first)
    if pgrep conky > /dev/null; then
        echo
        read -p "Conky is running. Stop all Conky instances? (y/N): " REPLY
        echo
        local response_char="${REPLY:0:1}" # Get the first character
        if [[ "$response_char" =~ ^[Yy]$ ]]; then
            pkill conky
            print_status "$GREEN" "$CHECK" "Stopped Conky processes"
        else
            print_status "$BLUE" "$INFO" "Left Conky running"
        fi
    fi
    
    # Remove PID file
    if [ -f "/tmp/internet_monitor_daemon.pid" ]; then
        rm -f "/tmp/internet_monitor_daemon.pid"
        print_status "$GREEN" "$CHECK" "Removed daemon PID file"
    fi
}

# Function to show completion message
show_completion() {
    echo
    echo -e "${GREEN}=========================================${NC}"
    echo -e "${GREEN}🎉 UNINSTALLATION COMPLETE! 🎉${NC}"
    echo -e "${GREEN}=========================================${NC}"
    echo
    print_status "$GREEN" "$TRASH" "Internet Usage Monitor has been completely removed!"
    echo
    echo -e "${BLUE}✅ What was successfully removed:${NC}"
    echo "  • All monitor scripts and executables"
    echo "  • Conky configuration files"
    echo "  • Cron jobs and scheduled tasks"
    echo "  • Systemd services and timers"
    echo "  • Desktop autostart entries"
    echo "  • Running processes and PID files"
    echo "  • Configuration files"
    echo
    
    if [ -d "$HOME"/.internet_monitor_backup_* ] 2>/dev/null; then
        echo -e "${YELLOW}📦 Your usage data backups are safely stored in:${NC}"
        ls -d "$HOME"/.internet_monitor_backup_* 2>/dev/null || true
        echo
    fi
    
    echo -e "${BLUE}📝 Important Notes:${NC}"
    echo "  • The project source directory remains untouched"
    echo "  • You can reinstall anytime with: ${YELLOW}./install.sh${NC}"
    echo "  • System packages (conky, bc, etc.) were not removed"
    echo "  • Your system is now clean of Internet Usage Monitor"
    echo
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}                    🌟 THANK YOU FOR USING INTERNET USAGE MONITOR! 🌟${NC}"
    echo -e "${GREEN}                         All traces have been successfully removed.${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
}

# Slow echo function for line-by-line delay (typewriter effect)
slow_echo() {
    local line
    while IFS= read -r line; do
        echo "$line"
        sleep 0.15
    done
}

# Full-width section header with centered title
section_header() {
    local title="$1"
    local term_width=80
    if command -v tput >/dev/null 2>&1; then
        term_width=$(tput cols 2>/dev/null || echo 80)
    fi
    local line
    printf -v line '%*s' "$term_width" ''
    line=${line// /"="}
    local pad=$(( (term_width - ${#title}) / 2 ))
    echo -e "${BLUE}${line}${NC}"
    printf "%*s${BLUE}%s${NC}\n" $pad "" "$title"
    echo -e "${BLUE}${line}${NC}\n"
    sleep 1.5
}

# Helper function for sub-section separators
section_separator() {
    echo -e "${BLUE}--------------------------------------------------${NC}\n"
}

# Main uninstallation flow
main() {
    section_header "🧉 Internet Usage Monitor Uninstallation"
    echo -e "${GREEN}Yerba Mate: Energize your day, simplify your system!${NC}"
    section_separator
    # Step 1: Confirm
    section_header "[1/6] Confirm Uninstallation"
    echo -e "${YELLOW}${WARNING} This will remove Internet Usage Monitor from your system.${NC}"
    echo
    # Check if anything is actually installed using robust search
    local potential_files
    mapfile -t potential_files < <(find_installed_files)
    local has_cron=false
    if crontab -l 2>/dev/null | grep -q "internet_monitor.sh"; then
        has_cron=true
    fi
    if [ ${#potential_files[@]} -eq 0 ] && [ "$has_cron" = false ]; then
        print_status "$YELLOW" "$WARNING" "No installation found. Nothing to remove."
        exit 0
    fi
    if [ ${#potential_files[@]} -gt 0 ]; then
        print_status "$GREEN" "$CHECK" "Found installation with ${#potential_files[@]} files."
        echo -e "${BLUE}Files to be removed:${NC}"
        for file in "${potential_files[@]}"; do
            echo "- $file"
        done
    fi
    if [ "$has_cron" = true ]; then
        print_status "$GREEN" "$CHECK" "Found cron job installation."
    fi
    read -p "Are you sure you want to continue? (y/N): " REPLY
    echo
    local response_char="${REPLY:0:1}"
    if [[ ! "$response_char" =~ ^[Yy]$ ]]; then
        print_status "$BLUE" "$INFO" "Uninstallation cancelled."
        exit 0
    fi
    section_separator
    # Step 2: Backup user data
    section_header "[2/6] Backup User Data"
    backup_user_data
    section_separator
    # Step 3: Stop running processes
    section_header "[3/6] Stop Running Processes"
    stop_processes
    section_separator
    # Step 4: Remove scheduled jobs/services
    section_header "[4/6] Remove Scheduled Jobs/Services"
    remove_cron_jobs
    remove_systemd_services
    section_separator
    # Step 5: Remove autostart entries
    section_header "[5/6] Remove Autostart Entries"
    remove_autostart_entries
    section_separator
    # Step 6: Remove files and user data
    section_header "[6/6] Remove Files & User Data"
    remove_files_with_list "${potential_files[@]}"
    remove_user_data
    section_separator
    # Completion
    section_header "🎉 Uninstallation Complete"
    echo -e "${GREEN}Yerba Mate: Clean system, clear mind!${NC}"
    show_completion
}

# Remove files using a provided list, no confirmation
remove_files_with_list() {
    print_status "$BLUE" "$INFO" "Removing installed files..."
    local files_to_remove=("$@")
    if [ ${#files_to_remove[@]} -eq 0 ]; then
        print_status "$BLUE" "$INFO" "No files found to remove."
        return
    fi
    local removed_count=0
    set +e
    for file in "${files_to_remove[@]}"; do
        if [ -f "$file" ]; then
            if rm -f "$file" 2>/dev/null; then
                print_status "$GREEN" "$CHECK" "Removed: $file"
                ((removed_count++))
            else
                print_status "$RED" "$CROSS" "Failed to remove: $file"
            fi
        else
            print_status "$BLUE" "$INFO" "File not found (already removed?): $file"
        fi
    done
    set -e
    if [ $removed_count -gt 0 ]; then
        print_status "$GREEN" "$CHECK" "Successfully removed $removed_count files"
    else
        print_status "$YELLOW" "$WARNING" "No files were removed"
    fi
}

# Run main function
main "$@"
