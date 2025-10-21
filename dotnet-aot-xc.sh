#!/bin/bash
# .NET AOT Cross-Compile Toolchain Activator

# Colors
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Helper Functions
print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_info() {
    echo -e "${CYAN}[i]${NC} $1"
}

# Main
DOTNET_AOT_XC_ROOT="/opt/dotnet-aot-xc"

rid="$1"

if [[ -z "$rid" ]]; then
    print_error "No RID specified"
    echo ""
    echo -e "${BLUE}Usage:${NC} dotnet-aot-xc <RID>"
    echo ""
    echo -e "${CYAN}Available RIDs:${NC}"
    echo "  • linux-x64          (glibc, x86_64)"
    echo "  • linux-arm64        (glibc, aarch64)"
    echo "  • linux-musl-x64     (musl, x86_64)"
    echo "  • linux-musl-arm64   (musl, aarch64)"
    exit 1
fi

toolchain_path="$DOTNET_AOT_XC_ROOT/$rid"

if [[ ! -d "$toolchain_path" ]]; then
    print_error "Toolchain for ${YELLOW}$rid${NC} not found at ${CYAN}$toolchain_path${NC}"
    exit 1
fi

# Export PATH
export PATH="$toolchain_path/bin:$PATH"

# Set compiler variables based on RID
case "$rid" in
    linux-arm64)
        export CC="aarch64-buildroot-linux-gnu-gcc"
        export CXX="aarch64-buildroot-linux-gnu-g++"
        export AR="aarch64-buildroot-linux-gnu-ar"
        export RANLIB="aarch64-buildroot-linux-gnu-ranlib"
        export OBJCOPY="aarch64-buildroot-linux-gnu-objcopy"
        libc="glibc"
        arch="aarch64"
        ;;
    linux-musl-arm64)
        export CC="aarch64-buildroot-linux-musl-gcc"
        export CXX="aarch64-buildroot-linux-musl-g++"
        export AR="aarch64-buildroot-linux-musl-ar"
        export RANLIB="aarch64-buildroot-linux-musl-ranlib"
        export OBJCOPY="aarch64-buildroot-linux-musl-objcopy"
        libc="musl"
        arch="aarch64"
        ;;
    linux-x64)
        export CC="x86_64-buildroot-linux-gnu-gcc"
        export CXX="x86_64-buildroot-linux-gnu-g++"
        export AR="x86_64-buildroot-linux-gnu-ar"
        export RANLIB="x86_64-buildroot-linux-gnu-ranlib"
        export OBJCOPY="x86_64-buildroot-linux-gnu-objcopy"
        libc="glibc"
        arch="x86_64"
        ;;
    linux-musl-x64)
        export CC="x86_64-buildroot-linux-musl-gcc"
        export CXX="x86_64-buildroot-linux-musl-g++"
        export AR="x86_64-buildroot-linux-musl-ar"
        export RANLIB="x86_64-buildroot-linux-musl-ranlib"
        export OBJCOPY="x86_64-buildroot-linux-musl-objcopy"
        libc="musl"
        arch="x86_64"
        ;;
    *)
        print_error "Unknown RID: ${YELLOW}$rid${NC}"
        exit 1
        ;;
esac

# Success output
print_success "Activated AOT cross-compile toolchain"
print_info "RID:      ${CYAN}$rid${NC}"
print_info "Arch:     ${CYAN}$arch${NC}"
print_info "C lib:    ${CYAN}$libc${NC}"
print_info "CC:       ${GREEN}$CC${NC}"
print_info "PATH:     ${BLUE}$toolchain_path/bin${NC}"
