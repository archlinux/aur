#!/bin/bash
# Update Lem AUR package with latest AppImage and publish to AUR

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOCKER_IMAGE="lem-aur-builder"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
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

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# Check for required tools
check_tools() {
    local required_tools=("git" "curl" "docker" "sha256sum")
    for tool in "${required_tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            log_error "Required tool '$tool' not found"
            exit 1
        fi
    done
}

# Get the latest AppImage SHA256
get_latest_sha() {
    log_info "Fetching latest AppImage and calculating SHA256..."

    local appimage_url="https://github.com/lem-project/lem/releases/download/nightly-latest/Lem-x86_64.AppImage"
    local temp_file="/tmp/lem-appimage-latest.AppImage"

    # Download the AppImage
    curl -sL -o "$temp_file" "$appimage_url" || {
        log_error "Failed to download AppImage"
        return 1
    }

    # Calculate SHA256
    sha256sum "$temp_file" | awk '{print $1}'

    # Clean up
    rm -f "$temp_file"
}

# Update PKGBUILD with new SHA if changed
update_pkgbuild_sha() {
    local new_sha="$1"

    log_info "Checking if SHA has changed..."

    # Get current SHA from PKGBUILD
    local current_sha=$(grep "^sha256sums=" "$SCRIPT_DIR/PKGBUILD" | grep -oP "(?<=\(').*(?='\))" | head -1)

    if [ "$current_sha" = "SKIP" ] || [ -z "$current_sha" ]; then
        current_sha="(empty/SKIP)"
    fi

    if [ "$current_sha" = "$new_sha" ]; then
        log_info "SHA unchanged: $new_sha"
        return 1  # No update needed
    fi

    log_info "SHA changed!"
    log_info "Old SHA: $current_sha"
    log_info "New SHA: $new_sha"

    # Update the SHA in PKGBUILD (use | as delimiter to avoid issues with SHA content)
    sed -i "s|^sha256sums=.*|sha256sums=('$new_sha')|" "$SCRIPT_DIR/PKGBUILD"

    # Update pkgrel (increment patch version)
    local current_pkgrel=$(grep "^pkgrel=" "$SCRIPT_DIR/PKGBUILD" | cut -d= -f2)
    local new_pkgrel=$((current_pkgrel + 1))
    sed -i "s/^pkgrel=.*/pkgrel=$new_pkgrel/" "$SCRIPT_DIR/PKGBUILD"

    log_success "Updated SHA and pkgrel to $new_pkgrel"
    return 0  # Update was made
}

# Generate .SRCINFO using Docker
generate_srcinfo() {
    log_info "Generating .SRCINFO using Docker..."

    # Build the Docker image if needed
    if ! docker image inspect "$DOCKER_IMAGE" &> /dev/null; then
        log_info "Building Docker image..."
        docker build -t "$DOCKER_IMAGE" "$SCRIPT_DIR" || {
            log_error "Failed to build Docker image"
            exit 1
        }
    fi

    # Run makepkg --printsrcinfo in Docker
    docker run --rm \
        -v "$SCRIPT_DIR:/build" \
        "$DOCKER_IMAGE" \
        -c "cd /build && makepkg --printsrcinfo > .SRCINFO" || {
        log_error "Failed to generate .SRCINFO"
        exit 1
    }

    log_success ".SRCINFO generated"
}

# Verify git is set up
verify_git_setup() {
    if ! git -C "$SCRIPT_DIR" rev-parse --git-dir > /dev/null 2>&1; then
        log_error "Not a git repository"
        exit 1
    fi

    # Check if we have commit identity
    if ! git -C "$SCRIPT_DIR" config user.name &> /dev/null; then
        log_warn "Git user not configured. Set with:"
        echo "    git config user.name 'Your Name'"
        echo "    git config user.email 'your-email@example.com'"
        exit 1
    fi
}

# Commit changes
commit_changes() {
    log_info "Committing changes..."

    cd "$SCRIPT_DIR"

    # Check if there are changes to commit
    if git diff --quiet PKGBUILD .SRCINFO 2>/dev/null; then
        log_info "No changes to commit"
        return 1
    fi

    git add PKGBUILD .SRCINFO

    local commit_msg="Update Lem package to latest AppImage"
    # Check git status for exact changes
    if git diff --cached PKGBUILD | grep -q "sha256sums"; then
        commit_msg="Update Lem AppImage to latest nightly build"
    fi

    git commit -m "$commit_msg" || {
        log_warn "Commit failed"
        return 1
    }

    log_success "Changes committed"
    return 0
}

# Push to AUR
push_to_aur() {
    log_info "Pushing to AUR..."

    cd "$SCRIPT_DIR"

    # Check if AUR remote exists
    if ! git remote get-url aur &> /dev/null; then
        log_warn "AUR remote not configured. Set up with:"
        echo "    git remote add aur ssh://aur@aur.archlinux.org/lem-editor.git"
        log_warn "Skipping push to AUR"
        return 1
    fi

    # AUR requires master branch
    git push aur main:master || {
        log_error "Failed to push to AUR"
        return 1
    }

    log_success "Pushed to AUR"
    return 0
}

# Main workflow
main() {
    log_info "Starting Lem AUR package update workflow..."

    check_tools
    verify_git_setup

    # Get the latest SHA
    local latest_sha
    latest_sha=$(get_latest_sha)

    if [ -z "$latest_sha" ]; then
        log_error "Could not download AppImage or calculate SHA"
        exit 1
    fi

    log_info "Latest AppImage SHA: $latest_sha"

    # Check if SHA changed and update PKGBUILD if needed
    if ! update_pkgbuild_sha "$latest_sha"; then
        log_success "No updates needed - package is already up-to-date"
        exit 0
    fi

    # Generate .SRCINFO
    generate_srcinfo

    # Commit and push
    if ! commit_changes; then
        log_warn "No changes to commit"
        exit 0
    fi

    if push_to_aur; then
        log_success "Update workflow completed successfully!"
        log_info "Changes published to AUR"
    else
        log_warn "Update workflow completed, but AUR push skipped or failed"
        log_warn "You may need to push manually or configure AUR remote"
    fi
}

main "$@"
