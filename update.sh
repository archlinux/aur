#!/bin/bash
# Update Lem AUR package with latest AppImage and publish to AUR

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOCKER_IMAGE="lem-aur-builder"
DRY_RUN=false

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

# Get the latest nightly AppImage SHA256
get_latest_release_info() {
    log_info "Fetching latest nightly-latest AppImage..." >&2

    local download_url="https://github.com/lem-project/lem/releases/download/nightly-latest/Lem-x86_64.AppImage"
    local temp_file="/tmp/lem-nightly-latest.AppImage"

    # Download the AppImage
    curl -sL -o "$temp_file" "$download_url" 2>/dev/null || {
        log_error "Failed to download nightly-latest AppImage from $download_url"
        rm -f "$temp_file"
        return 1
    }

    # Calculate SHA256
    local sha256
    sha256=$(sha256sum "$temp_file" 2>/dev/null | awk '{print $1}')

    # Get current date for version string
    local date_stamp=$(date +%Y%m%d)

    # Output ONLY version and SHA to stdout (no log messages!)
    echo "nightly.${date_stamp}|$sha256"

    # Clean up
    rm -f "$temp_file"
}

# Update PKGBUILD with new version and SHA if changed
update_pkgbuild_version() {
    local version_sha="$1"
    local new_version="${version_sha%|*}"
    local new_sha="${version_sha#*|}"

    log_info "Checking if SHA has changed..."

    # Get current SHA from PKGBUILD
    local current_sha=$(grep "^sha256sums=" "$SCRIPT_DIR/PKGBUILD" | grep -oP "(?<=\(').*(?='\))" | head -1)

    if [ "$current_sha" = "$new_sha" ]; then
        log_info "SHA unchanged: $new_sha"
        return 1  # No update needed
    fi

    log_info "New nightly build available!"
    log_info "Old SHA: $current_sha"
    log_info "New SHA: $new_sha"

    # Use awk to safely update the PKGBUILD to a temp file
    local temp_pkgbuild=$(mktemp)
    awk -v ver="$new_version" -v sha="$new_sha" '
        /^pkgver=/ { print "pkgver=" ver; next }
        /^sha256sums=/ { print "sha256sums=('"'"'" sha "'"'"')"; next }
        /^pkgrel=/ { print "pkgrel=1"; next }
        { print }
    ' "$SCRIPT_DIR/PKGBUILD" > "$temp_pkgbuild" 2>/dev/null

    # Verify the temp file was created and has content
    if [ ! -s "$temp_pkgbuild" ]; then
        log_error "Failed to update PKGBUILD"
        rm -f "$temp_pkgbuild"
        return 1
    fi

    # Replace the original with the updated version
    mv "$temp_pkgbuild" "$SCRIPT_DIR/PKGBUILD"

    log_success "Updated nightly build with new SHA"
    return 0  # Update was made
}

# Build the Docker image if needed
ensure_docker_image() {
    if ! docker image inspect "$DOCKER_IMAGE" &> /dev/null; then
        log_info "Building Docker image..."
        docker build -t "$DOCKER_IMAGE" "$SCRIPT_DIR" || {
            log_error "Failed to build Docker image"
            exit 1
        }
    fi
}

# Generate .SRCINFO using Docker
generate_srcinfo() {
    log_info "Generating .SRCINFO using Docker..."

    ensure_docker_image

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

# Validate the package builds successfully
validate_package() {
    log_info "Validating package build..."

    ensure_docker_image

    # Create a temporary build directory
    local temp_build="/tmp/lem-build-test-$$"
    mkdir -p "$temp_build"

    # Copy PKGBUILD and .SRCINFO to temp directory
    cp "$SCRIPT_DIR/PKGBUILD" "$temp_build/"
    cp "$SCRIPT_DIR/.SRCINFO" "$temp_build/"

    # Build the package in Docker
    log_info "Building package in Docker (this may take a minute)..."
    docker run --rm \
        -v "$temp_build:/build" \
        "$DOCKER_IMAGE" \
        -c "cd /build && makepkg -sf --noconfirm 2>&1" > /tmp/build-output-$$.log 2>&1 || {
        log_error "Package build failed!"
        cat /tmp/build-output-$$.log
        rm -rf "$temp_build" /tmp/build-output-$$.log
        return 1
    }

    # Check if package file was created (exclude debug package)
    local pkg_file=$(ls "$temp_build"/lem-editor-nightly*.pkg.tar.zst 2>/dev/null | grep -v debug | head -1)
    if [ -z "$pkg_file" ]; then
        log_error "Package file not found after build"
        cat /tmp/build-output-$$.log
        rm -rf "$temp_build" /tmp/build-output-$$.log
        return 1
    fi

    log_success "Package built successfully: $(basename $pkg_file)"

    # Test installation on a fresh Arch container without build dependencies
    log_info "Testing package installation on fresh Arch image..."

    local install_test_log="/tmp/install-test-$$.log"
    if ! docker run --rm \
        -v "$pkg_file:/tmp/lem-editor.pkg.tar.zst:ro" \
        -v "$SCRIPT_DIR/test-install.sh:/test-install.sh:ro" \
        archlinux:latest \
        bash /test-install.sh > "$install_test_log" 2>&1; then
        log_error "Package installation or execution failed!"
        log_error "Test output:"
        cat "$install_test_log" | sed 's/^/  /'
        rm -rf "$temp_build" "$install_test_log" /tmp/build-output-$$.log
        return 1
    fi

    log_success "Package installed and tested successfully"

    # Clean up
    rm -rf "$temp_build" "$install_test_log" /tmp/build-output-$$.log

    return 0
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

# Print usage
usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Options:
  --dry-run       Test the update without committing or pushing to AUR
  --test-build    Build locally and test the binary (no push)
  --help          Show this help message

Examples:
  $0              # Full update with push to AUR
  $0 --dry-run    # Check for updates (no commit/push)
  $0 --test-build # Build locally and test binary
EOF
}

# Main workflow
main() {
    # Parse arguments
    local test_build=false
    while [[ $# -gt 0 ]]; do
        case $1 in
            --dry-run)
                DRY_RUN=true
                log_info "DRY RUN MODE - no changes will be pushed"
                shift
                ;;
            --test-build)
                test_build=true
                log_info "TEST BUILD MODE - building locally without pushing"
                shift
                ;;
            --help)
                usage
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done

    # If test-build mode, just build and test locally
    if [ "$test_build" = true ]; then
        log_info "Building package locally..."
        ensure_docker_image
        validate_package
        log_success "Package built successfully!"
        log_info "Run: makepkg -sf to rebuild locally"
        exit 0
    fi

    log_info "Starting Lem AUR package update workflow..."

    check_tools
    verify_git_setup

    # Get the latest release info (version and SHA)
    local release_info
    release_info=$(get_latest_release_info)

    if [ -z "$release_info" ]; then
        log_error "Could not fetch latest release information"
        exit 1
    fi

    local version="${release_info%|*}"
    log_info "Latest stable release: v$version"

    # Check if SHA changed and update PKGBUILD if needed
    local sha_changed=false
    if update_pkgbuild_version "$release_info"; then
        sha_changed=true

        # Generate .SRCINFO
        generate_srcinfo

        # Validate the package before committing
        if ! validate_package; then
            log_error "Package validation failed - aborting update"
            log_error "Fix the issues in PKGBUILD and try again"
            exit 1
        fi
    else
        log_info "No new nightly build available"
    fi

    # Commit and push
    if [ "$DRY_RUN" = true ]; then
        log_warn "DRY RUN: Skipping commit and push"
        log_info "Changes would be committed and pushed to AUR"
        log_success "Dry run completed successfully!"
        exit 0
    fi

    # Commit any changes (if there are any)
    commit_changes || log_info "No new changes to commit"

    # Always push, even if no new changes (there might be old commits ahead of AUR)
    if push_to_aur; then
        log_success "Update workflow completed successfully!"
        log_info "Changes published to AUR"
    else
        log_warn "Update workflow completed, but AUR push skipped or failed"
        log_warn "You may need to push manually or configure AUR remote"
    fi
}

main "$@"
