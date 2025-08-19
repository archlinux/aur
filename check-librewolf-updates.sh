#!/bin/bash

# LibreWolf HellFire AUR Package Update Checker
# Checks for new LibreWolf releases and updates PKGBUILD accordingly

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKGBUILD_PATH="$SCRIPT_DIR/PKGBUILD"
DESKTOP_FILE_PATH="$SCRIPT_DIR/librewolf.desktop"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to get the latest LibreWolf version from GitLab API
get_latest_version() {
    # Get the latest release from LibreWolf GitLab project
    local response
    response=$(curl -s "https://gitlab.com/api/v4/projects/32320088/releases" 2>/dev/null)
    
    if [[ -z "$response" || "$response" == "null" ]]; then
        log_error "Failed to fetch releases from GitLab API"
        return 1
    fi
    
    # Extract the latest version tag and convert to PKGBUILD format
    local latest_version
    latest_version=$(echo "$response" | jq -r '.[0].tag_name' 2>/dev/null | sed 's/^v//')
    
    if [[ -z "$latest_version" || "$latest_version" == "null" ]]; then
        log_error "Failed to parse version from API response"
        return 1
    fi
    
    # Convert from format like "141.0.3-1" to "141.0.3_1" for PKGBUILD compatibility
    latest_version=$(echo "$latest_version" | sed 's/-/_/')
    
    echo "$latest_version"
}

# Function to get current version from PKGBUILD
get_current_version() {
    if [[ ! -f "$PKGBUILD_PATH" ]]; then
        log_error "PKGBUILD not found at $PKGBUILD_PATH"
        return 1
    fi
    
    grep "^pkgver=" "$PKGBUILD_PATH" | cut -d= -f2 | tr -d '"'
}

# Function to update PKGBUILD with new version
update_pkgbuild() {
    local new_version="$1"
    log_info "Updating PKGBUILD to version $new_version..."
    
    # Parse version components
    local firefox_ver="${new_version%_*}"
    local librewolf_ver="${new_version#*_}"
    
    # Update version in PKGBUILD
    sed -i "s/^pkgver=.*/pkgver=$new_version/" "$PKGBUILD_PATH"
    
    # Reset pkgrel to 1 for new version
    sed -i "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD_PATH"
    
    log_success "Updated PKGBUILD version to $new_version"
    
    # Update checksums
    update_checksums
}

# Function to update checksums
update_checksums() {
    log_info "Updating checksums..."
    
    cd "$SCRIPT_DIR"
    
    # Use updpkgsums to update checksums automatically
    if command -v updpkgsums >/dev/null 2>&1; then
        updpkgsums
        log_success "Checksums updated successfully"
    else
        log_warning "updpkgsums not found. Please install pacman-contrib or update checksums manually"
        log_info "You can run: makepkg -g >> PKGBUILD"
    fi
}

# Function to commit and push to AUR
push_to_aur() {
    local new_version="$1"
    local commit_msg="Update to $new_version"
    
    log_info "Committing changes to AUR repository..."
    
    cd "$SCRIPT_DIR"
    
    # Check if we're in a git repository
    if [[ ! -d ".git" ]]; then
        log_error "Not in a git repository. Please initialize AUR repository first."
        log_info "Run: git clone ssh://aur@aur.archlinux.org/librewolf-hellfire.git"
        return 1
    fi
    
    # Add files to git
    git add PKGBUILD librewolf.desktop .SRCINFO 2>/dev/null || true
    
    # Check if there are changes to commit
    if git diff --cached --quiet; then
        log_warning "No changes to commit"
        return 0
    fi
    
    # Generate .SRCINFO
    if command -v makepkg >/dev/null 2>&1; then
        log_info "Generating .SRCINFO..."
        makepkg --printsrcinfo > .SRCINFO
        git add .SRCINFO
    else
        log_warning "makepkg not found. Please generate .SRCINFO manually"
    fi
    
    # Commit changes
    git commit -m "$commit_msg"
    
    # Push to AUR
    log_info "Pushing to AUR..."
    git push origin master
    
    log_success "Successfully pushed update to AUR!"
}

# Function to test build (optional)
test_build() {
    log_info "Testing package build..."
    
    cd "$SCRIPT_DIR"
    
    if command -v makepkg >/dev/null 2>&1; then
        # Test if PKGBUILD is valid
        makepkg --printsrcinfo > /dev/null
        log_success "PKGBUILD syntax is valid"
        
        # Optionally do a full build test (commented out as it takes time)
        # makepkg -f
    else
        log_warning "makepkg not found. Skipping build test"
    fi
}

# Main function
main() {
    log_info "LibreWolf HellFire AUR Update Checker"
    echo "======================================"
    
    # Check dependencies
    if ! command -v curl >/dev/null 2>&1; then
        log_error "curl is required but not installed"
        exit 1
    fi
    
    if ! command -v jq >/dev/null 2>&1; then
        log_error "jq is required but not installed"
        exit 1
    fi
    
    # Get versions
    local latest_version
    latest_version=$(get_latest_version)
    if [[ $? -ne 0 ]]; then
        exit 1
    fi
    
    local current_version
    current_version=$(get_current_version)
    if [[ $? -ne 0 ]]; then
        exit 1
    fi
    
    log_info "Current version: $current_version"
    log_info "Latest version:  $latest_version"
    
    # Compare versions
    if [[ "$latest_version" == "$current_version" ]]; then
        log_success "Package is up to date!"
        exit 0
    fi
    
    log_warning "New version available: $latest_version"
    
    # Ask user for confirmation unless --auto flag is used
    if [[ "$1" != "--auto" ]]; then
        echo -n "Update to version $latest_version? [y/N]: "
        read -r response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            log_info "Update cancelled by user"
            exit 0
        fi
    fi
    
    # Update package
    update_pkgbuild "$latest_version"
    test_build
    
    # Ask about pushing to AUR
    if [[ "$1" != "--auto" ]]; then
        echo -n "Push to AUR? [y/N]: "
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            push_to_aur "$latest_version"
        else
            log_info "Updated locally. Push to AUR manually when ready."
        fi
    else
        push_to_aur "$latest_version"
    fi
    
    log_success "Update process completed!"
}

# Handle command line arguments
case "${1:-}" in
    --help|-h)
        echo "LibreWolf HellFire AUR Update Checker"
        echo ""
        echo "Usage: $0 [options]"
        echo ""
        echo "Options:"
        echo "  --auto    Automatically update without prompts"
        echo "  --check   Check for updates without making changes"
        echo "  --help    Show this help message"
        exit 0
        ;;
    --check)
        latest_version=$(get_latest_version)
        current_version=$(get_current_version)
        log_info "Current version: $current_version"
        log_info "Latest version:  $latest_version"
        if [[ "$latest_version" != "$current_version" ]]; then
            log_warning "Update available: $latest_version"
            exit 1
        else
            log_success "Up to date"
            exit 0
        fi
        ;;
    *)
        main "$@"
        ;;
esac