#!/bin/bash
# Build script for Lem AUR package using Docker

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOCKER_IMAGE="lem-aur-builder"
CONTAINER_NAME="lem-builder-$(date +%s)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Build the Docker image
log_info "Building Docker image: $DOCKER_IMAGE"
docker build -t "$DOCKER_IMAGE" "$SCRIPT_DIR" || {
    log_error "Failed to build Docker image"
    exit 1
}

log_success "Docker image built successfully"

# Create output directory
OUTPUT_DIR="$SCRIPT_DIR/output"
mkdir -p "$OUTPUT_DIR"

# Run the build in Docker
log_info "Starting build in Docker container..."
log_info "Running makepkg for Lem..."

docker run --rm \
    --name "$CONTAINER_NAME" \
    -v "$SCRIPT_DIR/PKGBUILD:/build/PKGBUILD:ro" \
    -v "$OUTPUT_DIR:/build/output" \
    "$DOCKER_IMAGE" \
    -c "
    # Copy PKGBUILD to build directory
    cp /build/PKGBUILD .

    # Run makepkg
    makepkg -sf --noconfirm 2>&1

    # Copy built packages to output directory
    cp -v *.pkg.tar.zst /build/output/ 2>/dev/null || true

    echo 'Build complete!'
    "

# Check if packages were created
if ls "$OUTPUT_DIR"/*.pkg.tar.zst 1> /dev/null 2>&1; then
    log_success "Build completed successfully!"
    log_info "Built packages:"
    ls -lh "$OUTPUT_DIR"/*.pkg.tar.zst
else
    log_error "No packages were created. Check the build output above."
    exit 1
fi
