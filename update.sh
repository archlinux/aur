#!/bin/bash
# Update Lem AUR package with latest nightly release and publish to AUR

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
    local required_tools=("git" "curl" "docker")
    for tool in "${required_tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            log_error "Required tool '$tool' not found"
            exit 1
        fi
    done
}

# Get the latest Lem release tag
get_latest_release() {
    log_info "Fetching latest Lem release..."
    curl -s "https://api.github.com/repos/lem-project/lem/releases" | \
        jq -r '.[] | select(.assets | length > 0) | .tag_name' | \
        head -1
}

# Update PKGBUILD with new version
update_pkgbuild() {
    local release_tag="$1"

    # For nightly builds, just increment pkgrel on the same date
    # For future stable releases, update version as needed
    log_info "Checking if PKGBUILD needs updating..."

    # Update pkgrel (increment patch version)
    local current_pkgrel=$(grep "^pkgrel=" "$SCRIPT_DIR/PKGBUILD" | cut -d= -f2)
    local new_pkgrel=$((current_pkgrel + 1))

    sed -i "s/^pkgrel=.*/pkgrel=$new_pkgrel/" "$SCRIPT_DIR/PKGBUILD"

    log_success "Updated pkgrel to $new_pkgrel"
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
        -v "$SCRIPT_DIR/PKGBUILD:/build/PKGBUILD:ro" \
        -v "$SCRIPT_DIR/.SRCINFO:/build/.SRCINFO" \
        "$DOCKER_IMAGE" \
        -c "
            cp /build/PKGBUILD .
            cp /build/.SRCINFO . 2>/dev/null || true
            makepkg --printsrcinfo > .SRCINFO
            cp .SRCINFO /build/.SRCINFO
        " || {
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
    if ! git diff --quiet PKGBUILD .SRCINFO 2>/dev/null; then
        git add PKGBUILD .SRCINFO

        local commit_msg="Update Lem package"
        # Check git status for exact changes
        if git diff --cached PKGBUILD | grep -q "pkgrel"; then
            commit_msg="Bump pkgrel for latest release"
        fi

        git commit -m "$commit_msg" || {
            log_warn "No changes to commit or commit failed"
        }

        log_success "Changes committed"
    else
        log_info "No changes to commit"
    fi
}

# Push to AUR
push_to_aur() {
    log_info "Pushing to AUR..."

    cd "$SCRIPT_DIR"

    # Check if AUR remote exists
    if ! git remote get-url aur &> /dev/null; then
        log_warn "AUR remote not configured. Set up with:"
        echo "    git remote add aur ssh://aur@aur.archlinux.org/lem.git"
        log_warn "Skipping push to AUR"
        return 1
    fi

    git push aur main || {
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

    local latest_release
    latest_release=$(get_latest_release)

    if [ -z "$latest_release" ]; then
        log_error "Could not determine latest release"
        exit 1
    fi

    log_info "Latest release: $latest_release"

    # Update PKGBUILD
    update_pkgbuild "$latest_release"

    # Generate .SRCINFO
    generate_srcinfo

    # Commit and push
    commit_changes

    if push_to_aur; then
        log_success "Update workflow completed successfully!"
        log_info "Changes published to AUR"
    else
        log_warn "Update workflow completed, but AUR push skipped or failed"
        log_warn "You may need to push manually or configure AUR remote"
    fi
}

main "$@"
