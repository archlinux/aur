#!/bin/bash

# Internet Usage Monitor - Automated Installation Script
# Copyright (c) 2025 Yahya Zekry
# Licensed under MIT License

# set -e  # Exit on any error - disabled for debugging

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
ROCKET="🚀"

echo -e "${BLUE}${ROCKET} Internet Usage Monitor Installation${NC}"
echo -e "${BLUE}======================================${NC}"
echo -e "${GREEN}Yerba Mate: Energize your day, simplify your system!${NC}"
echo

# Function to print colored output
print_status() {
    local color=$1
    local icon=$2
    local message=$3
    echo -e "${color}${icon} ${message}${NC}"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to detect Linux distribution
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo $ID
    elif [ -f /etc/redhat-release ]; then
        echo "rhel"
    elif [ -f /etc/debian_version ]; then
        echo "debian"
    else
        echo "unknown"
    fi
}

# Function to install packages based on distribution
install_packages() {
    local distro
    distro=$(detect_distro)
    
    print_status "$BLUE" "$INFO" "Detected distribution: $distro"
    
    case $distro in
        "arch"|"garuda"|"manjaro")
            print_status "$YELLOW" "$WARNING" "Installing packages with pacman..."
            if command_exists sudo; then
                sudo pacman -S --needed --noconfirm conky bc procps-ng libnotify zenity
            else
                print_status "$RED" "$CROSS" "sudo not found. Please install packages manually:"
                echo "pacman -S conky bc procps-ng libnotify zenity"
                return 1
            fi
            ;;
        "ubuntu"|"debian"|"linuxmint")
            print_status "$YELLOW" "$WARNING" "Installing packages with apt..."
            if command_exists sudo; then
                sudo apt update
                sudo apt install -y conky bc procps libnotify-bin zenity
            else
                print_status "$RED" "$CROSS" "sudo not found. Please install packages manually:"
                echo "apt install conky bc procps libnotify-bin zenity"
                return 1
            fi
            ;;
        "fedora"|"rhel"|"centos")
            print_status "$YELLOW" "$WARNING" "Installing packages with dnf/yum..."
            if command_exists sudo; then
                if command_exists dnf; then
                    sudo dnf install -y conky bc procps-ng libnotify zenity
                elif command_exists yum; then
                    sudo yum install -y conky bc procps-ng libnotify zenity
                fi
            else
                print_status "$RED" "$CROSS" "sudo not found. Please install packages manually:"
                echo "dnf install conky bc procps-ng libnotify zenity"
                return 1
            fi
            ;;
        "opensuse"*)
            print_status "$YELLOW" "$WARNING" "Installing packages with zypper..."
            if command_exists sudo; then
                sudo zypper install -y conky bc procps libnotify-tools zenity
            else
                print_status "$RED" "$CROSS" "sudo not found. Please install packages manually:"
                echo "zypper install conky bc procps libnotify-tools zenity"
                return 1
            fi
            ;;
        *)
            print_status "$YELLOW" "$WARNING" "Unknown distribution. Please install these packages manually:"
            echo "- conky"
            echo "- bc"
            echo "- procps (or procps-ng)"
            echo "- libnotify (libnotify-bin on Debian/Ubuntu)"
            echo "- zenity (optional)"
            echo
            read -p "Continue anyway? (y/N): " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                exit 1
            fi
            ;;
    esac
}

# Function to check prerequisites
check_prerequisites() {
    print_status "$BLUE" "$INFO" "Checking prerequisites..."
    
    local missing_packages=()
    
    # Check essential packages
    if ! command_exists conky; then
        missing_packages+=("conky")
    fi
    
    if ! command_exists bc; then
        missing_packages+=("bc")
    fi
    
    if ! command_exists ps; then
        missing_packages+=("procps")
    fi
    
    # Check notification tools
    if ! command_exists notify-send; then
        missing_packages+=("libnotify")
    fi
    
    if [ ${#missing_packages[@]} -gt 0 ]; then
        print_status "$YELLOW" "$WARNING" "Missing packages: ${missing_packages[*]}"
        echo
        read -p "Would you like to install missing packages automatically? (Y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Nn]$ ]]; then
            print_status "$RED" "$CROSS" "Installation cancelled. Please install required packages manually."
            exit 0 # Graceful exit for workflow testing
        fi
        
        install_packages
    else
        print_status "$GREEN" "$CHECK" "All prerequisites are installed!"
    fi
}

# Function to detect existing installation
detect_existing_installation() {
    local installed_files=(
        "$HOME/internet_monitor.sh"
        "$HOME/internet_monitor_daemon.sh"
        "$HOME/conky_usage_helper.sh"
        "$HOME/.conkyrc_internet"
        "$HOME/config.sh"
    )
    
    local found_count=0
    for file in "${installed_files[@]}"; do
        if [ -f "$file" ]; then
            ((found_count++))
        fi
    done
    
    if [ $found_count -gt 0 ]; then
        return 0  # Installation found
    else
        return 1  # No installation found
    fi
}

# Function to backup existing installation
backup_existing_installation() {
    local backup_dir
    backup_dir="$HOME/.internet_monitor_install_backup_$(date +%Y%m%d_%H%M%S)"
    local files_to_backup=(
        "$HOME/internet_monitor.sh"
        "$HOME/internet_monitor_daemon.sh"
        "$HOME/conky_usage_helper.sh"
        "$HOME/.conkyrc_internet"
        "$HOME/config.sh"
    )
    
    mkdir -p "$backup_dir"
    
    local backed_up=0
    for file in "${files_to_backup[@]}"; do
        if [ -f "$file" ]; then
            cp "$file" "$backup_dir/"
            ((backed_up++))
        fi
    done
    
    if [ $backed_up -gt 0 ]; then
        print_status "$YELLOW" "$WARNING" "Backed up $backed_up existing files to $backup_dir"
        echo -e "${YELLOW}Your current installation has been backed up to: $backup_dir${NC}"
        echo
    else
        print_status "$BLUE" "$INFO" "No existing files found to backup"
    fi
}

# Helper function for sub-section separators
section_separator() {
    echo -e "${BLUE}--------------------------------------------------${NC}\n"
}

# Function to copy files
install_files() {
    print_status "$BLUE" "$INFO" "Installing files..."
    
    # Check if local files exist
    local use_system_files=0
    local required_files=("src/internet_monitor.sh" "src/conky_usage_helper.sh" "config/conkyrc_internet" "config/config.sh")
    for file in "${required_files[@]}"; do
        if [ ! -f "$file" ]; then
            use_system_files=1
            break
        fi
    done

    if [ $use_system_files -eq 0 ]; then
        print_status "$GREEN" "$CHECK" "Using local project files for installation."
    # Check if files exist
    local required_files=("src/internet_monitor.sh" "src/conky_usage_helper.sh" "config/conkyrc_internet" "config/config.sh")
    
    for file in "${required_files[@]}"; do
        if [ ! -f "$file" ]; then
            print_status "$RED" "$CROSS" "Required file not found: $file"
            print_status "$YELLOW" "$WARNING" "Make sure you're running this script from the project directory."
            exit 1
        fi
    done
    
    # Detect existing installation
    if detect_existing_installation; then
        print_status "$YELLOW" "$WARNING" "Existing installation detected!"
        echo
        echo "Installation options:"
        echo "1) Update existing installation (recommended)"
        echo "2) Fresh install (will backup current installation)"
        echo "3) Cancel installation"
        echo
        read -p "Choose an option (1-3): " install_choice
        
        case $install_choice in
            1)
                print_status "$BLUE" "$INFO" "Updating existing installation..."
                backup_existing_installation
                print_status "$GREEN" "$CHECK" "Ready to proceed with update..."
                ;;
            2)
                print_status "$BLUE" "$INFO" "Performing fresh installation..."
                backup_existing_installation
                print_status "$GREEN" "$CHECK" "Ready to proceed with fresh install..."
                ;;
            3)
                print_status "$BLUE" "$INFO" "Installation cancelled."
                exit 0
                ;;
            *)
                print_status "$YELLOW" "$WARNING" "Invalid choice. Defaulting to update..."
                backup_existing_installation
                print_status "$GREEN" "$CHECK" "Ready to proceed with update..."
                ;;
        esac
    else
        print_status "$GREEN" "$CHECK" "No existing installation found. Proceeding with fresh install."
    fi
    
    # Make scripts executable
    print_status "$BLUE" "$INFO" "Setting script permissions..."
    local exec_files=(
        "src/internet_monitor.sh"
        "src/conky_usage_helper.sh"
        "src/internet_monitor_daemon.sh"
            "install.sh"
        "uninstall.sh"
    )
    local chmod_errors=0
    for exec_file in "${exec_files[@]}"; do
        if [ -f "$exec_file" ]; then
            chmod +x "$exec_file"
            print_status "$GREEN" "$CHECK" "Made $exec_file executable"
        else
            print_status "$YELLOW" "$WARNING" "File not found for chmod: $exec_file (This might be okay if not all scripts are present in all contexts)"
            ((chmod_errors++))
        fi
    done
    if [ $chmod_errors -eq 0 ]; then
        print_status "$GREEN" "$CHECK" "All script permissions set successfully"
    else
        print_status "$YELLOW" "$WARNING" "Some files not found during chmod, check paths if this is unexpected."
    fi
    
    # Stop running processes before updating
    if detect_existing_installation; then
        print_status "$BLUE" "$INFO" "Stopping running processes for update..."
        
        # Check and stop daemon processes
        if pgrep -f "internet_monitor_daemon.sh" > /dev/null; then
            print_status "$YELLOW" "$WARNING" "Found running daemon processes, stopping..."
            pkill -f "internet_monitor_daemon.sh" 2>/dev/null || true
            sleep 1
            print_status "$GREEN" "$CHECK" "Daemon processes stopped"
        else
            print_status "$BLUE" "$INFO" "No daemon processes found"
        fi
        
        # Check and stop Conky processes
        if pgrep -f "conky.*.conkyrc_internet" > /dev/null; then
            print_status "$YELLOW" "$WARNING" "Found running Conky widget, stopping..."
            pkill -f "conky.*.conkyrc_internet" 2>/dev/null || true
            sleep 1
            print_status "$GREEN" "$CHECK" "Conky widget stopped"
        else
            print_status "$BLUE" "$INFO" "No Conky widget found"
        fi
        
        # Force remove any PID files
        if [ -f "/tmp/internet_monitor_daemon.pid" ]; then
            rm -f "/tmp/internet_monitor_daemon.pid"
            print_status "$GREEN" "$CHECK" "Removed daemon PID file"
        fi
        
        print_status "$GREEN" "$CHECK" "System ready for update"
    fi
    
    # Copy files to home directory
    print_status "$BLUE" "$INFO" "Copying updated scripts..."
    cp src/internet_monitor.sh "$HOME/"
    print_status "$GREEN" "$CHECK" "Updated internet_monitor.sh"
    
    cp src/conky_usage_helper.sh "$HOME/"
    print_status "$GREEN" "$CHECK" "Updated conky_usage_helper.sh"
    
    cp src/internet_monitor_daemon.sh "$HOME/"
    print_status "$GREEN" "$CHECK" "Updated internet_monitor_daemon.sh"
    
    cp config/conkyrc_internet "$HOME/.conkyrc_internet"
    print_status "$GREEN" "$CHECK" "Updated Conky configuration"
    
    # Handle config file specially for updates
    if [ -f "$HOME/config.sh" ] && [ "$install_choice" = "2" ]; then
        print_status "$YELLOW" "$WARNING" "Found existing config.sh"
        echo
        read -p "Do you want to keep your existing configuration? (Y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Nn]$ ]]; then
            cp config/config.sh "$HOME/"
            print_status "$GREEN" "$CHECK" "Updated configuration file"
        else
            print_status "$BLUE" "$INFO" "Kept existing configuration"
        fi
    else
        cp config/config.sh "$HOME/"
        print_status "$GREEN" "$CHECK" "Installed configuration file"
    fi
    
    # Only prompt to restore backup during fresh install
    if [ "$install_choice" = "2" ]; then
        local backup_dir
        backup_dir=$(find "$HOME" -maxdepth 1 -type d -name ".internet_monitor_backup_*" | sort | tail -n 1)
        if [ -n "$backup_dir" ]; then
            print_status "$YELLOW" "$WARNING" "Found backup directory: $backup_dir"
            read -p "Restore previous usage data and logs from backup? (Y/n): " REPLY
            local response_char="${REPLY:0:1}"
            if [[ ! "$response_char" =~ ^[Nn]$ ]]; then
                cp -r "$backup_dir/usage_data" "$HOME/" 2>/dev/null || true
                cp -r "$backup_dir/logs" "$HOME/" 2>/dev/null || true
                print_status "$GREEN" "$CHECK" "Restored usage data and logs from backup."
            else
                print_status "$BLUE" "$INFO" "Skipped restoring usage data and logs."
            fi
        fi
    fi

    print_status "$GREEN" "$CHECK" "Files installed/updated successfully"
    echo
    else
        print_status "$YELLOW" "$WARNING" "Local project files not found. Using system-installed files."
        # Use system-installed files
        if [ -f "/usr/bin/internet_monitor.sh" ]; then
            cp /usr/bin/internet_monitor.sh "$HOME/"
            print_status "$GREEN" "$CHECK" "Copied system internet_monitor.sh to home directory."
        else
            print_status "$RED" "$CROSS" "System internet_monitor.sh not found! Aborting."
            exit 1
        fi
        if [ -f "/usr/bin/conky_usage_helper.sh" ]; then
            cp /usr/bin/conky_usage_helper.sh "$HOME/"
            print_status "$GREEN" "$CHECK" "Copied system conky_usage_helper.sh to home directory."
        else
            print_status "$RED" "$CROSS" "System conky_usage_helper.sh not found! Aborting."
            exit 1
        fi
        if [ -f "/usr/bin/internet_monitor_daemon.sh" ]; then
            cp /usr/bin/internet_monitor_daemon.sh "$HOME/"
            print_status "$GREEN" "$CHECK" "Copied system internet_monitor_daemon.sh to home directory."
        else
            print_status "$RED" "$CROSS" "System internet_monitor_daemon.sh not found! Aborting."
            exit 1
        fi
        if [ -f "/usr/share/internet-usage-monitor-git/config.sh" ]; then
            cp /usr/share/internet-usage-monitor-git/config.sh "$HOME/"
            print_status "$GREEN" "$CHECK" "Copied system config.sh to home directory."
        else
            print_status "$RED" "$CROSS" "System config.sh not found! Aborting."
            exit 1
        fi
        if [ -f "/usr/share/internet-usage-monitor-git/conkyrc_internet" ]; then
            cp /usr/share/internet-usage-monitor-git/conkyrc_internet "$HOME/.conkyrc_internet"
            print_status "$GREEN" "$CHECK" "Copied system conkyrc_internet to home directory."
        else
            print_status "$RED" "$CROSS" "System conkyrc_internet not found! Aborting."
            exit 1
        fi
    fi
}

# Function to test installation
test_installation() {
    print_status "$BLUE" "$INFO" "Testing installation..."
    
    # Test monitor script
    if "$HOME/internet_monitor.sh" >/dev/null 2>&1; then
        print_status "$GREEN" "$CHECK" "Monitor script working"
    else
        print_status "$YELLOW" "$WARNING" "Monitor script test had issues (this may be normal on first run)"
    fi
    
    # Test notifications
    if command_exists notify-send; then
        notify-send "Internet Monitor" "Installation test successful!" -t 3000 2>/dev/null || true
        print_status "$GREEN" "$CHECK" "Notification system working"
    fi
    
    # Test Conky config (without starting it)
    if [ -f "$HOME/.conkyrc_internet" ]; then
        print_status "$GREEN" "$CHECK" "Conky configuration installed"
    fi
}

# Function to detect existing autostart configuration
detect_existing_autostart() {
    # Check for existing cron job
    if crontab -l 2>/dev/null | grep -q "internet_monitor.sh"; then
        echo "cron"
        return 0
    fi
    
    # Check for systemd timer
    if systemctl --user is-enabled internet-monitor.timer >/dev/null 2>&1; then
        echo "systemd"
        return 0
    fi
    
    # Check for desktop autostart
    if [ -f "$HOME/.config/autostart/internet-monitor.desktop" ]; then
        echo "autostart"
        return 0
    fi
    
    echo "none"
    return 1
}

# Function to handle existing Conky setups
handle_existing_conky() {
    print_status "$BLUE" "$INFO" "🔍 Checking for existing Conky configurations..."
    
    # Check for running Conky processes (excluding our own widget)
    local other_conky_pids
    other_conky_pids=$(pgrep -f "conky" | grep -v "conky.*.conkyrc_internet" || true)

    if [ -n "$other_conky_pids" ]; then
        print_status "$YELLOW" "$WARNING" "Found other Conky processes (PIDs: $other_conky_pids)"
        echo
        echo -e "${YELLOW}⚠️  IMPORTANT: Multiple Conky widgets can cause conflicts!${NC}"
        echo "The existing Conky widgets might interfere with the Internet Usage Monitor widget."
        echo
        read -p "Do you want to stop other Conky processes now? (Y/n): " REPLY
        local response_char="${REPLY:0:1}"
        if [[ ! "$response_char" =~ ^[Nn]$ ]]; then
            pkill -f "conky" | grep -v "conky.*.conkyrc_internet" || true
            print_status "$GREEN" "$CHECK" "Stopped other Conky processes"
            sleep 1 # Give time for processes to terminate
        else
            print_status "$BLUE" "$INFO" "Keeping other Conky processes running (may cause widget conflicts)"
        fi
    else
        print_status "$GREEN" "$CHECK" "No other Conky processes currently running"
    fi
    echo

    # Check for default/existing Conky configuration files
    local other_conky_configs=()
    local default_conky_found=false
    
    if [ -f "$HOME/.conkyrc" ] && ! cmp -s "$HOME/.conkyrc" "$HOME/.conkyrc_internet" 2>/dev/null; then
        other_conky_configs+=("$HOME/.conkyrc")
        default_conky_found=true
    fi
    
    if [ -f "$HOME/.config/conky/conky.conf" ] && ! cmp -s "$HOME/.config/conky/conky.conf" "$HOME/.conkyrc_internet" 2>/dev/null; then
         # Avoid adding if it's a symlink to our own config, or if it's the same file (though path is different)
        if ! [ -L "$HOME/.config/conky/conky.conf" ] || [ "$(readlink -f "$HOME/.config/conky/conky.conf")" != "$(readlink -f "$HOME/.conkyrc_internet")" ]; then
            other_conky_configs+=("$HOME/.config/conky/conky.conf")
        fi
    fi

    if [ ${#other_conky_configs[@]} -gt 0 ]; then
        if [ "$default_conky_found" = true ]; then
            print_status "$YELLOW" "$WARNING" "Found default Conky configuration files that may conflict:"
        else
            print_status "$YELLOW" "$WARNING" "Found existing Conky configuration files:"
        fi
        
        for cfg in "${other_conky_configs[@]}"; do
            echo "  - $cfg"
        done
        echo
        
        if [ "$default_conky_found" = true ]; then
            echo -e "${YELLOW}🗑️  The default Conky widget may interfere with the Internet Usage Monitor.${NC}"
            echo "Would you like to backup and remove these configurations to prevent conflicts?"
        else
            echo -e "${YELLOW}⚠️  These configurations may cause widget conflicts.${NC}"
            echo "Would you like to backup and rename them to prevent conflicts?"
        fi
        echo
        
        read -p "Backup and remove conflicting Conky configurations? (Y/n): " REPLY
        local response_char="${REPLY:0:1}"
        if [[ ! "$response_char" =~ ^[Nn]$ ]]; then
            for cfg in "${other_conky_configs[@]}"; do
                local backup_name="${cfg}.backup_by_ium_$(date +%Y%m%d_%H%M%S)"
                mv "$cfg" "$backup_name"
                print_status "$GREEN" "$CHECK" "Backed up and removed: $cfg → $(basename "$backup_name")"
            done
            echo
            print_status "$GREEN" "$CHECK" "✨ Default/conflicting Conky configurations have been safely backed up!"
            print_status "$BLUE" "$INFO" "Your Internet Usage Monitor widget will now have a clean slate."
        else
            print_status "$BLUE" "$INFO" "Keeping existing Conky configurations (may cause widget overlaps)"
        fi
    else
        print_status "$GREEN" "$CHECK" "No conflicting Conky configurations found"
    fi
    echo

    # Offer to create an empty ~/.conkyrc to suppress system default widget
    if [ ! -f "$HOME/.conkyrc" ]; then
        echo
        print_status "$YELLOW" "$WARNING" "If Conky is started without a config, it will use the system default at /usr/share/doc/conky/conky.conf."
        echo "This can cause the default widget to appear unexpectedly."
        read -p "Would you like to create an empty ~/.conkyrc to suppress the default widget? (Y/n): " REPLY
        response_char="${REPLY:0:1}"
        if [[ ! "$response_char" =~ ^[Nn]$ ]]; then
            touch "$HOME/.conkyrc"
            print_status "$GREEN" "$CHECK" "Created empty ~/.conkyrc to block the system default widget."
        else
            print_status "$BLUE" "$INFO" "No ~/.conkyrc will be created. The system default widget may appear if Conky is started without a config."
        fi
        echo
    fi
}

# Function to setup autostart options
setup_autostart() {
    local existing_autostart=$(detect_existing_autostart)
    
    if [ "$existing_autostart" != "none" ]; then
        print_status "$GREEN" "$CHECK" "Found existing autostart configuration: $existing_autostart"
        echo
        read -p "Keep existing autostart configuration? (Y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Nn]$ ]]; then
            print_status "$BLUE" "$INFO" "Proceeding with new autostart setup..."
        else
            print_status "$BLUE" "$INFO" "Keeping existing $existing_autostart configuration"
            return 0
        fi
    fi
    
    echo
    print_status "$BLUE" "$INFO" "Autostart Setup Options:"
    echo "1) Cron job (every 5 minutes) - Recommended for reliability and lower resource usage"
    echo "2) Systemd user service - More precise timing but higher complexity"
    echo "3) Skip autostart setup"
    echo
    read -p "Choose an option (1-3): " choice
    
    case $choice in
        1)
            print_status "$YELLOW" "$WARNING" "Setting up cron job..."
            (crontab -l 2>/dev/null | grep -v "internet_monitor.sh"; echo "*/5 * * * * $HOME/internet_monitor.sh") | crontab -
            print_status "$GREEN" "$CHECK" "Cron job added (runs every 5 minutes)"
            ;;
        2)
            print_status "$YELLOW" "$WARNING" "Setting up systemd user service..."
            mkdir -p "$HOME/.config/systemd/user"
            cat > "$HOME/.config/systemd/user/internet-monitor.service" << EOF
[Unit]
Description=Internet Usage Monitor
After=network.target

[Service]
Type=oneshot
ExecStart=%h/internet_monitor.sh

[Install]
WantedBy=default.target
EOF
            cat > "$HOME/.config/systemd/user/internet-monitor.timer" << EOF
[Unit]
Description=Run Internet Monitor every 5 minutes
Requires=internet-monitor.service

[Timer]
OnCalendar=*:0/5
Persistent=true

[Install]
WantedBy=timers.target
EOF
            systemctl --user daemon-reload
            systemctl --user enable internet-monitor.timer
            systemctl --user start internet-monitor.timer
            print_status "$GREEN" "$CHECK" "Systemd timer created and started"
            ;;
        3)
            print_status "$BLUE" "$INFO" "Skipping autostart setup"
            ;;
        *)
            print_status "$YELLOW" "$WARNING" "Invalid choice, skipping autostart setup"
            ;;
    esac
    # Always create Conky autostart entry unless skipping autostart
    if [ "$choice" = "1" ] || [ "$choice" = "2" ]; then
        mkdir -p "$HOME/.config/autostart"
        cat > "$HOME/.config/autostart/internet-conky.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Internet Usage Conky
Exec=conky -c $HOME/.conkyrc_internet
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF
        print_status "$GREEN" "$CHECK" "Conky autostart entry created"
    fi
}

# Function to show completion message and auto-start everything
show_completion_and_auto_start() {
    echo
    print_status "$GREEN" "$ROCKET" "Installation completed successfully!"
    echo -e "${GREEN}Yerba Mate: Enjoy balanced internet usage, like a perfectly brewed mate!${NC}"
    echo
    echo -e "${BLUE}Configuration:${NC}"
    echo "- Edit daily limit in both scripts (default: 2GB)"
    echo "- Widget position: ~/.conkyrc_internet"
    echo "- View logs: ~/.internet_usage.log"
    echo
    echo -e "${BLUE}Documentation:${NC}"
    echo "- Full README: $(pwd)/README.md"
    echo "- GitHub: https://github.com/Yahya-Zekry/internet-usage-monitor"
    echo
    print_status "$BLUE" "$INFO" "🚀 Auto-starting Internet Usage Monitor..."
    echo
    # 1. Start the monitoring daemon
    print_status "$GREEN" "1." "Starting monitor daemon:"
    if [ -f "$HOME/internet_monitor_daemon.sh" ]; then
        # Stop any existing daemon first
        if pgrep -f "internet_monitor_daemon.sh" > /dev/null; then
            pkill -f "internet_monitor_daemon.sh"
            sleep 1
        fi
        # Start the daemon in background
        "$HOME/internet_monitor_daemon.sh" start >/dev/null 2>&1 &
        sleep 3
        if pgrep -f "internet_monitor_daemon.sh" > /dev/null; then
            print_status "$GREEN" "$CHECK" "Monitor daemon started successfully in background"
        else
            print_status "$YELLOW" "$WARNING" "Monitor daemon may not have started properly"
        fi
    else
        print_status "$YELLOW" "$WARNING" "Monitor daemon script not found"
    fi
    echo
    # 2. Test the monitor script
    print_status "$GREEN" "2." "Testing monitor script (current usage):"
    if "$HOME/internet_monitor.sh" usage; then
        print_status "$GREEN" "$CHECK" "Monitor script working correctly"
    else
        print_status "$YELLOW" "$WARNING" "Monitor script had an issue (may be normal on first run)"
    fi
    echo
    # 3. Start Conky widget
    print_status "$GREEN" "3." "Starting Conky widget:"
    if [ "$CI" != "true" ] && [ -n "$DISPLAY" ]; then
        # Only kill Conky if it's running with our config
        if pgrep -f "conky.*.conkyrc_internet" > /dev/null; then
            print_status "$BLUE" "$INFO" "Stopping existing Conky widget (using our config)..."
            pkill -f "conky.*.conkyrc_internet"
            sleep 1
        fi
        print_status "$BLUE" "$INFO" "Validating Conky setup..."
        if [ -f "$HOME/conky_usage_helper.sh" ] && [ -x "$HOME/conky_usage_helper.sh" ]; then
            print_status "$GREEN" "$CHECK" "Conky helper script is ready"
        else
            print_status "$YELLOW" "$WARNING" "Conky helper script missing or not executable"
        fi
        # Create a temporary launcher script for this session
        local launcher="$HOME/.start_conky_once.sh"
        echo "#!/bin/bash" > "$launcher"
        echo "conky -c \"$HOME/.conkyrc_internet\" &" >> "$launcher"
        chmod +x "$launcher"
        nohup bash "$launcher" >/dev/null 2>&1 &
        # Remove the launcher after a short delay
        (sleep 3 && rm -f "$launcher") &
        print_status "$GREEN" "$CHECK" "Conky widget started for this session. It will also autostart on next login."
    else
        print_status "$BLUE" "$INFO" "Skipping Conky start (no display environment detected)"
        echo "          You can start it manually in a GUI session: nohup conky -c ~/.conkyrc_internet >/dev/null 2>&1 & disown"
    fi
    echo
    # 4. Test notification system
    print_status "$GREEN" "4." "Testing notification system:"
    if command_exists notify-send; then
        if notify-send "Internet Usage Monitor" "🎉 Installation completed! Your internet usage is now being monitored." -t 5000 2>/dev/null; then
            print_status "$GREEN" "$CHECK" "Notification system working! You should see a notification on your desktop."
        else
            print_status "$YELLOW" "$WARNING" "Notification command executed but may not be visible in headless/SSH environment"
        fi
    else
        print_status "$YELLOW" "$WARNING" "notify-send not available"
    fi
    echo
    # 5. Show current usage log
    print_status "$GREEN" "5." "Current usage status:"
    if [ -f "$HOME/.internet_usage.log" ]; then
        echo -e "${BLUE}Last few log entries:${NC}"
        tail -5 "$HOME/.internet_usage.log" | sed 's/^/   /'
    else
        print_status "$BLUE" "$INFO" "Log file will be created on next monitoring cycle"
    fi
    echo
    # 6. Final status summary
    echo -e "${GREEN}=========================================${NC}"
    echo -e "${GREEN}🎉 INTERNET USAGE MONITOR IS NOW RUNNING! 🎉${NC}"
    echo -e "${GREEN}=========================================${NC}"
    echo
    print_status "$GREEN" "$CHECK" "✨ Everything is now active and monitoring your internet usage!"
    echo
    echo -e "${BLUE}What's running:${NC}"
    echo "• 📊 Monitor daemon - tracking your usage automatically"
    echo "• 📱 Conky widget - showing real-time usage on desktop"
    echo "• ⏰ Scheduled monitoring - will continue after restart"
    echo "• 📝 Usage logging - saving data to ~/.internet_usage.log"
    echo
    echo -e "${BLUE}Manual commands (if needed):${NC}"
    echo "• Check usage: ${YELLOW}$HOME/internet_monitor.sh usage${NC}"
    echo "• Restart widget: ${YELLOW}conky -c ~/.conkyrc_internet &${NC}"
    echo "• View logs: ${YELLOW}tail -f ~/.internet_usage.log${NC}"
    echo "• Stop daemon: ${YELLOW}$HOME/internet_monitor_daemon.sh stop${NC}"
    echo
    print_status "$GREEN" "$ROCKET" "Enjoy monitoring your internet usage!"
}

# Function to restore user data from backup
restore_user_data_from_backup() {
    local latest_backup
    latest_backup=$(ls -1dt "$HOME"/.internet_monitor_backup_* 2>/dev/null | head -n 1)
    if [ -n "$latest_backup" ]; then
        print_status "$YELLOW" "$WARNING" "Found backup directory: $latest_backup"
        echo
        read -p "Restore previous usage data and logs from backup? (Y/n): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Nn]$ ]]; then
            local restored=0
            for file in ".internet_usage.log" ".internet_usage_data"; do
                if [ -f "$latest_backup/$file" ] && [ ! -f "$HOME/$file" ]; then
                    cp "$latest_backup/$file" "$HOME/"
                    print_status "$GREEN" "$CHECK" "Restored $file from backup."
                    restored=1
                fi
            done
            if [ $restored -eq 0 ]; then
                print_status "$BLUE" "$INFO" "No files needed to be restored (already present)."
            fi
        else
            print_status "$BLUE" "$INFO" "Skipped restoring user data from backup."
        fi
    fi
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

# Main installation flow
main() {
    section_header "🚀 Internet Usage Monitor Installation"
    section_separator
    # Check if running as root
    if [ "$EUID" -eq 0 ]; then
        print_status "$RED" "$CROSS" "Please don't run this script as root!"
        exit 1
    fi
    # Check if in correct directory
    if [ ! -f "install.sh" ]; then
        print_status "$RED" "$CROSS" "Please run this script from the project directory."
        exit 1
    fi
    section_header "[1/6] Checking prerequisites"
    check_prerequisites
    section_separator
    section_header "[2/6] Installing files"
    install_files
    # Only restore backup if user chose fresh install (option 2)
    if [ "$install_choice" = "2" ]; then
        restore_user_data_from_backup
    fi
    section_separator
    section_header "[3/6] Testing installation"
    test_installation
    section_separator
    section_header "[4/6] Checking for existing Conky configurations"
    handle_existing_conky # Call the new function
    section_separator
    section_header "[5/6] Autostart Setup Options"
    setup_autostart
    section_separator
    section_header "[6/6] Finalizing & Auto-Starting Everything"
    show_completion_and_auto_start # Auto-start everything after installation
}

# Run main function
main "$@"
