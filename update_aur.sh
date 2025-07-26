#!/bin/bash

# AUR Package Update Script
# Automates the process of updating AUR packages

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# Usage information
usage() {
    cat << EOF
Usage: $0 <new_version>

This script automates the AUR package update process.

Arguments:
    new_version    The new version to update to

Example:
    $0 1.2.3

The script will:
1. Update pkgver in PKGBUILD
2. Reset pkgrel to 1
3. Update checksums with updpkgsums
4. Regenerate .SRCINFO
5. Test build the package
6. Show changes and ask for confirmation
7. Commit and push to AUR

EOF
}

# Check if we're in an AUR git repository
validate_aur_repo() {
    if [[ ! -d .git ]]; then
        error "Not in a git repository"
        exit 1
    fi

    if [[ ! -f PKGBUILD ]]; then
        error "PKGBUILD not found in current directory"
        exit 1
    fi

    local remote_url=$(git remote get-url origin 2>/dev/null || echo "")
    if [[ ! "$remote_url" =~ aur\.archlinux\.org ]]; then
        warning "This doesn't appear to be an AUR repository"
        read -p "Continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Update pkgver in PKGBUILD
update_pkgver() {
    local new_version="$1"
    log "Updating pkgver to $new_version"

    if ! grep -q "^pkgver=" PKGBUILD; then
        error "pkgver not found in PKGBUILD"
        exit 1
    fi

    sed -i "s/^pkgver=.*/pkgver=$new_version/" PKGBUILD
    sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
}

# Update checksums
update_checksums() {
    log "Updating checksums with updpkgsums"
    if command -v updpkgsums >/dev/null 2>&1; then
        updpkgsums
    else
        error "updpkgsums not found. Please install pkgbuild-introspection"
        exit 1
    fi
}

# Regenerate .SRCINFO
regenerate_srcinfo() {
    log "Regenerating .SRCINFO"
    makepkg --printsrcinfo > .SRCINFO
}

# Test build
test_build() {
    log "Testing package build"
    makepkg -sr --noconfirm
}

# Show changes
show_changes() {
    info "Changes made:"
    git diff --color=always
}

# Cleanup function
cleanup() {
    if [[ -f *.pkg.tar.* ]]; then
        log "Cleaning up built packages"
        rm -f *.pkg.tar.*
    fi
}

# Trap for cleanup on exit
trap cleanup EXIT

# Ask for confirmation
confirm() {
    local message="$1"
    read -p "$message (y/N): " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

# Commit changes
commit_changes() {
    local version="$1"
    local commit_message="Update to version $version"

    git add PKGBUILD .SRCINFO
    git commit -m "$commit_message"
    log "Changes committed with message: '$commit_message'"
}

# Push to AUR
push_to_aur() {
    log "Pushing changes to AUR"
    git push origin master
}

# Main function
main() {
    # Check arguments
    if [[ $# -ne 1 ]]; then
        usage
        exit 1
    fi

    local new_version="$1"

    # Validate version format (basic check)
    if [[ ! "$new_version" =~ ^[0-9]+(\.[0-9]+)*([a-zA-Z0-9._-]*)?$ ]]; then
        error "Invalid version format: $new_version"
        exit 1
    fi

    log "Starting AUR package update to version $new_version"

    # Validate environment
    validate_aur_repo

    # Check for uncommitted changes
    if [[ -n $(git status --porcelain) ]]; then
        warning "You have uncommitted changes"
        if ! confirm "Continue anyway?"; then
            exit 1
        fi
    fi

    # Update package
    update_pkgver "$new_version"
    update_checksums
    regenerate_srcinfo

    # Test build
    if confirm "Test build the package?"; then
        test_build
        log "Package built successfully"
    fi

    # Show changes
    show_changes

    # Confirm changes
    if ! confirm "Commit these changes?"; then
        log "Update cancelled"
        exit 1
    fi

    # Commit
    commit_changes "$new_version"

    # Push to AUR
    if confirm "Push changes to AUR?"; then
        push_to_aur
        log "Package successfully updated to version $new_version"
    else
        info "Changes committed locally but not pushed to AUR"
        info "Run 'git push origin master' when ready to publish"
    fi
}

# Run main function with all arguments
main "$@"