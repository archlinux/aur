#!/bin/bash

VERSION="1.0.0 (SysBoost)" 
LOG_FILE="$HOME/.sysboost.log"


log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

is_docker() {
    [[ -f /.dockerenv ]]
}

show_help() {
    cat << EOF
Linux System Optimizer - 


Usage:
  sysboost --clean              Clean junk files
  sysboost --optimize-ram       Optimize RAM
  sysboost --optimize-cpu       Optimize CPU
  sysboost --schedule enable    Enable scheduled optimization
  sysboost --schedule disable   Disable scheduled optimization
  sysboost --uninstall          Remove sysboost and clean up
  sysboost --version            Show version
  sysboost --help               Show this help message
EOF
}

clean_junk() {
    log "Cleaning junk files..."
    if command -v pacman &>/dev/null; then
        sudo pacman -Sc --noconfirm
    elif command -v apt &>/dev/null; then
        sudo apt autoremove -y && sudo apt clean
    elif command -v dnf &>/dev/null; then
        sudo dnf autoremove -y && sudo dnf clean all
    elif command -v zypper &>/dev/null; then
        sudo zypper clean --all
    else
        log "No supported package manager found."
    fi
    if command -v journalctl &>/dev/null; then
        sudo journalctl --vacuum-time=7d
    else
        log "Skipping journal cleanup (journalctl not found)"
    fi
    log "Junk cleanup completed."
}

optimize_ram() {
    log "Optimizing RAM..."
    if is_docker; then
        log "Skipping RAM optimization (Docker detected)"
        return
    fi
    echo 3 | sudo tee /proc/sys/vm/drop_caches
    if swapon --summary | grep -q "swap"; then
        sudo swapoff -a && sudo swapon -a
    else
        log "No swap found, skipping."
    fi
    log "RAM optimization completed."
}

optimize_cpu() {
    log "Optimizing CPU..."
    if is_docker; then
        log "Skipping CPU optimization (Docker detected)"
        return
    fi
    if command -v systemctl &>/dev/null; then
        for service in bluetooth.service cups.service avahi-daemon.service ModemManager.service; do
            if systemctl is-active --quiet "$service"; then
                sudo systemctl stop "$service"
                log "Stopped $service"
            fi
        done
    else
        log "Skipping CPU optimization (systemctl not found)"
    fi
    log "CPU optimization completed."
}

enable_schedule() {
    log "Enabling scheduled optimization..."
    if is_docker; then
        log "Skipping scheduled optimization (Docker detected)"
        return
    fi
    (crontab -l 2>/dev/null; echo "0 3 * * * /usr/bin/linuxboot --clean") | crontab -
    log "Scheduled optimization enabled (Runs daily at 3 AM)."
}

disable_schedule() {
    log "Disabling scheduled optimization..."
    if is_docker; then
        log "Skipping scheduled optimization (Docker detected)"
        return
    fi
    crontab -l 2>/dev/null | grep -v '/usr/bin/linuxboot' | crontab -
    log "Scheduled optimization disabled."
}

uninstall() {
    log "Uninstalling Linuxboot..."
    sudo rm -f /usr/bin/linuxboot
    sudo rm -f "$LOG_FILE"
    crontab -l 2>/dev/null | grep -v '/usr/bin/linuxboot' | crontab -
    log "Linuxboot has been uninstalled."
}

case "$1" in
    --clean) clean_junk ;;
    --optimize-ram) optimize_ram ;;
    --optimize-cpu) optimize_cpu ;;
    --schedule)
        case "$2" in
            enable) enable_schedule ;;
            disable) disable_schedule ;;
            *) echo "Invalid schedule option. Use 'enable' or 'disable'." ;;
        esac
        ;;
    --uninstall) uninstall ;;
    --version) echo "Linux System Optimizer v$VERSION" ;;
    --help) show_help ;;
    *)
        echo "Invalid option. Use --help for usage."
        exit 1
        ;;
esac
