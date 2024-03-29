#!/bin/bash

# Function to load configuration from file
load_config() {
    source "$config_file"
}

# Check if configuration file exists
if [ ! -f "$config_file" ]; then
    perform_init
    exit 0
fi

# Load configuration
load_config

# Function to display usage information
display_usage() {
    echo "Usage: OMA [options]"
    echo "Options:"
    echo "  -u, --update              Update system"
    echo "  -i, --install              Install an Arch package"
    echo "  -s, --search              Search for an Arch package"
    echo "  -r, --remove-packages     Remove unnecessary packages"
    echo "  -c, --clear-cache         Clear package cache"
    echo "  -o, --remove-orphaned     Remove orphaned packages"
    echo "  -ds, --disable-services    Disable unnecessary services"
    echo "  -cf, --check-filesystem    Check for file system errors"
    echo "  -os, --optimize-swap       Optimize swap usage"
    echo "  -om, --optimize-mount      Optimize file system mount options"
    echo "  -cd, --check-duplicates    Check for duplicate files"
    echo "  -mr, --monitor-resources   Monitor resource usage"
    echo "  -od, --optimize-desktop    Optimize desktop environment settings"
    echo "  -m, --maintenance         Perform regular maintenance tasks"
    echo "  -h, --help                Display help message for a specific option"
}

# Function to display help message for a specific option
display_option_help() {
    case $1 in
        -u|--update)
            echo "Update system: OMA --update"
            echo "This option updates the system using selected AUR helper."
            ;;
        -i|--install)
            echo "Install an Arch package: OMA --install"
            echo "This option installs an Arch package using selected AUR helper."
            ;; 
        -s|--search)
            echo "Search an Arch package: OMA --search"
            echo "This option searches for an Arch package using selected AUR helper."
            ;; 
        -r|--remove-packages)
            echo "Remove unnecessary packages: OMA --remove-packages"
            echo "This option removes packages that are no longer needed."
            ;;
        -c|--clear-cache)
            echo "Clear package cache: OMA --clear-cache"
            echo "This option clears the package cache to free up disk space."
            ;;
        -o|--remove-orphaned)
            echo "Remove orphaned packages: OMA --remove-orphaned"
            echo "This option removes packages that were installed as dependencies but are no longer required."
            ;;
        -ds|--disable-services)
            echo "Disable unnecessary services: OMA --disable-services"
            echo "This option allows you to disable unnecessary system services."
            echo "Please enter the name of the service you'd like to disable:"
            read -p "Service name: " service_name
            sudo systemctl disable "$service_name"
            ;;
        -cf|--check-filesystem)
            echo "Check file system errors: OMA --check-filesystem"
            echo "This option checks the file system for errors and repairs them if necessary."
            echo "Please enter the file system you'd like to check (e.g., /dev/sda1):"
            read -p "File system: " filesystem
            sudo fsck "$filesystem"
            ;;
        -os|--optimize-swap)
            echo "Optimize swap usage: OMA --optimize-swap"
            echo "This option allows you to optimize swap usage by adjusting the swappiness value."
            echo "Please enter the value for vm.swappiness (0-100):"
            read -p "Swappiness value: " swappiness_value
            sudo sysctl vm.swappiness="$swappiness_value"
            ;;
        -om|--optimize-mount)
            echo "Optimize file system mount options: OMA --optimize-mount"
            echo "This option allows you to optimize file system mount options, such as disabling access time updates."
            echo "Please manually adjust the file system mount options in /etc/fstab."
            ;;
        -cd|--check-duplicates)
            echo "Check for duplicate files: OMA --check-duplicates"
            echo "This option checks for duplicate files in a specified directory and prompts for removal."
            echo "Please enter the path to the directory you'd like to check for duplicate files:"
            read -p "Directory path: " directory_path
            fdupes -rdN "$directory_path"
            ;;
        -mr|--monitor-resources)
            echo "Monitor resource usage: OMA --monitor-resources"
            echo "This option launches a resource monitoring tool (e.g., htop) to monitor system resources."
            htop
            ;;
        -od|--optimize-desktop)
            echo "Optimize desktop environment settings: OMA --optimize-desktop"
            echo "This option allows you to optimize settings specific to your desktop environment."
            echo "Please manually optimize settings specific to your desktop environment."
            ;;
        -m|--maintenance)
            echo "Perform regular maintenance tasks: OMA --maintenance"
            echo "This option performs regular maintenance tasks, such as system updates and backups."
            echo "Would you like to update the system? (y/n)"
            read -p "Choice: " update_choice
            if [[ $update_choice == "y" ]]; then
                $aur_helper -Syu --noconfirm
            fi
            ;;
        *)
            echo "Invalid option: $1"
            ;;
    esac
}

process_options(){

# Process command-line options
if [[ $# -eq 0 ]]; then
    display_usage
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            shift
            if [[ $# -gt 0 ]]; then
                display_option_help "$1"
            else
                display_usage
            fi
            exit 0
            ;;
        -u|--update)
            echo "Updating system..."
            $aur_helper -Syu --noconfirm
            shift
            ;;
        -i|--install)
            echo "Installing app..."
            read -p "Package: " package_choice
            $aur_helper -S $package_choice
            shift
            ;;
        -s|--search)
            echo "Search app..."
            read -p "Search: " package_choice
            $aur_helper -Ss $package_choice
            read -p "Do you want to install a package? (y/n): " answer_choice
            if [[ $answer_choice == "y" ]]; then
                OMA -i
            fi

            shift
            ;;
        -r|--remove-packages)
            echo "Removing unnecessary packages..."
            if $aur_helper -Qdtq >/dev/null 2>&1; then
                $aur_helper -Qdtq | $aur_helper -Rs --noconfirm -
            else
                echo "No unnecessary packages found."
            fi
            shift
            ;;
        -c|--clear-cache)
            echo "Clearing package cache..."
            $aur_helper -Scc --noconfirm
            shift
            ;;
        -o|--remove-orphaned)
            echo "Removing orphaned packages..."
            if $aur_helper -Qdtq >/dev/null 2>&1; then
                $aur_helper -Rns $($aur_helper -Qdtq) --noconfirm
            else
                echo "No orphaned packages found."
            fi
            shift
            ;;
        -ds|--disable-services)
            echo "Disabling unnecessary services..."
            display_option_help "$1"
            shift
            ;;
        -cf|--check-filesystem)
            echo "Checking file system errors..."
            display_option_help "$1"
            shift
            ;;
        -os|--optimize-swap)
            echo "Optimizing swap usage..."
            display_option_help "$1"
            shift
            ;;
        -om|--optimize-mount)
            echo "Optimizing file system mount options..."
            display_option_help "$1"
            shift
            ;;
        -cd|--check-duplicates)
            echo "Checking for duplicate files..."
            display_option_help "$1"
            shift
            ;;
        -mr|--monitor-resources)
            echo "Monitoring resource usage..."
            display_option_help "$1"
            shift
            ;;
        -od|--optimize-desktop)
            echo "Optimizing desktop environment settings..."
            display_option_help "$1"
            shift
            ;;
        -m|--maintenance)
            echo "Performing regular maintenance tasks..."
            display_option_help "$1"
            shift
            ;;
        *)
            echo "Error: Invalid option: $1"
            display_usage
            exit 1
            ;;
    esac
done

echo "Optimization complete!"
}