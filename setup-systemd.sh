#!/bin/bash
# Setup systemd timer units for automated Lem AUR updates

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SERVICE_FILE="$SCRIPT_DIR/lem-aur-update.service"
TIMER_FILE="$SCRIPT_DIR/lem-aur-update.timer"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root (required for systemd setup)
if [[ $EUID -ne 0 ]]; then
    log_error "This script must be run as root (use sudo)"
    exit 1
fi

log_info "Setting up systemd timer units for Lem AUR updates..."

# Copy service and timer files to systemd
log_info "Installing systemd units..."
cp "$SERVICE_FILE" /etc/systemd/system/lem-aur-update.service
cp "$TIMER_FILE" /etc/systemd/system/lem-aur-update.timer

# Set proper permissions
chmod 644 /etc/systemd/system/lem-aur-update.{service,timer}

log_success "Systemd units installed"

# Reload systemd daemon
log_info "Reloading systemd configuration..."
systemctl daemon-reload

log_success "Systemd configuration reloaded"

# Enable the timer
log_info "Enabling lem-aur-update.timer..."
systemctl enable lem-aur-update.timer

log_success "Timer enabled and will start on boot"

# Start the timer
log_info "Starting lem-aur-update.timer..."
systemctl start lem-aur-update.timer

log_success "Timer started"

# Show status
log_info "Checking timer status..."
systemctl status lem-aur-update.timer --no-pager

log_success "Setup complete!"

echo ""
echo "Next steps:"
echo "  1. Verify timer is running: sudo systemctl status lem-aur-update.timer"
echo "  2. Check logs: sudo journalctl -u lem-aur-update -f"
echo "  3. Test manually: /home/thomas/lem-aur-build/update.sh"
echo "  4. View next scheduled run: systemctl list-timers lem-aur-update.timer"
echo ""
