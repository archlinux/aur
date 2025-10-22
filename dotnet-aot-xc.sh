#!/bin/bash
# .NET AOT Cross-Compile Toolchain Activator

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GRAY='\033[38;5;242m'
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

show_help() {
    echo -e "${CYAN}.NET AOT Cross-Compilation Toolchain${NC}\n"
    
    echo -e "${BLUE}USAGE:${NC}"
    echo -e "    ${GREEN}source${NC} dotnet-aot-xc ${YELLOW}<RID>${NC}"
    echo -e "    ${GREEN}dotnet-aot-xc${NC} ${YELLOW}--help${NC}\n"
    
    echo -e "${BLUE}AVAILABLE RIDs:${NC} ${GRAY}(${NC}${CYAN}https://learn.microsoft.com/en-us/dotnet/core/rid-catalog${NC}${GRAY})${NC}\n"
    echo -e "    • ${YELLOW}linux-x64${NC}          (glibc, x86_64)"
    echo -e "    • ${YELLOW}linux-arm64${NC}        (glibc, aarch64)"
    echo -e "    • ${YELLOW}linux-musl-x64${NC}     (musl, x86_64)"
    echo -e "    • ${YELLOW}linux-musl-arm64${NC}   (musl, aarch64)\n"

    echo -e "${BLUE}NOTES:${NC}"
    echo -e "    • This script must be ${YELLOW}sourced${NC}, not executed directly. Usage:"
    echo -e "      ${GREEN}source${NC} dotnet-aot-xc ${YELLOW}<RID>${NC}"
    echo -e "    • Toolchains are installed in ${YELLOW}/opt/dotnet-aot-xc/${NC}"
    echo -e "    • Environment variables (${GREEN}CC${NC}, ${GREEN}CXX${NC}, ${GREEN}AR${NC}, ${GREEN}RANLIB${NC}, ${GREEN}OBJCOPY${NC}) are set for the selected RID"
    echo -e "    • ${GREEN}PATH${NC} is updated to include the toolchain binaries\n"

    echo -e "${BLUE}MSBUILD CONFIGURATION:${NC}"
    echo -e "    Add these PropertyGroups to your ${YELLOW}.pubxml${NC} or ${YELLOW}.csproj${NC}:\n"
    
    echo -e "    ${GRAY}<Project>${NC}"
    echo -e "        ${GRAY}<PropertyGroup>${NC}"
    echo -e "            ${GRAY}<Configuration>${YELLOW}Release${GRAY}</Configuration>${NC}"
    echo -e "            ${GRAY}<PublishAot>${YELLOW}true${GRAY}</PublishAot>${NC}"
    echo -e "            ${CYAN}<!-- ... other settings ... -->${NC}"
    echo -e "        ${GRAY}</PropertyGroup>${NC}\n"
    
    echo -e "        ${CYAN}<!-- linux-arm64 -->${NC}"
    echo -e "        ${GRAY}<PropertyGroup Condition=\"'\$(RuntimeIdentifier)' == '${CYAN}linux-arm64${NC}${GRAY}'\">${NC}"
    echo -e "            ${GRAY}<PublishDir>${YELLOW}../publish/linux-arm64${GRAY}</PublishDir>${NC}"
    echo -e "            ${GRAY}<CppCompilerAndLinker>${YELLOW}aarch64-linux-gcc${GRAY}</CppCompilerAndLinker>${NC}"
    echo -e "            ${GRAY}<SysRoot>${YELLOW}/opt/dotnet-aot-xc/linux-arm64/aarch64-buildroot-linux-gnu/sysroot${GRAY}</SysRoot>${NC}"
    echo -e "            ${GRAY}<ObjCopyName>${YELLOW}aarch64-buildroot-linux-gnu-objcopy${GRAY}</ObjCopyName>${NC}"
    echo -e "        ${GRAY}</PropertyGroup>${NC}\n"
    
    echo -e "        ${CYAN}<!-- linux-musl-arm64 -->${NC}"
    echo -e "        ${GRAY}<PropertyGroup Condition=\"'\$(RuntimeIdentifier)' == '${CYAN}linux-musl-arm64${NC}${GRAY}'\">${NC}"
    echo -e "            ${GRAY}<PublishDir>${YELLOW}../publish/linux-musl-arm64${GRAY}</PublishDir>${NC}"
    echo -e "            ${GRAY}<CppCompilerAndLinker>${YELLOW}aarch64-linux-musl-gcc${GRAY}</CppCompilerAndLinker>${NC}"
    echo -e "            ${GRAY}<SysRoot>${YELLOW}/opt/dotnet-aot-xc/linux-musl-arm64/aarch64-buildroot-linux-musl/sysroot${GRAY}</SysRoot>${NC}"
    echo -e "            ${GRAY}<ObjCopyName>${YELLOW}aarch64-buildroot-linux-musl-objcopy${GRAY}</ObjCopyName>${NC}"
    echo -e "        ${GRAY}</PropertyGroup>${NC}\n"
    
    echo -e "        ${CYAN}<!-- linux-musl-x64 -->${NC}"
    echo -e "        ${GRAY}<PropertyGroup Condition=\"'\$(RuntimeIdentifier)' == '${CYAN}linux-musl-x64${NC}${GRAY}'\">${NC}"
    echo -e "            ${GRAY}<PublishDir>${YELLOW}../publish/linux-musl-x64${GRAY}</PublishDir>${NC}"
    echo -e "            ${GRAY}<CppCompilerAndLinker>${YELLOW}x86_64-linux-musl-gcc${GRAY}</CppCompilerAndLinker>${NC}"
    echo -e "            ${GRAY}<SysRoot>${YELLOW}/opt/dotnet-aot-xc/linux-musl-x64/x86_64-buildroot-linux-musl/sysroot${GRAY}</SysRoot>${NC}"
    echo -e "            ${GRAY}<ObjCopyName>${YELLOW}x86_64-buildroot-linux-musl-objcopy${GRAY}</ObjCopyName>${NC}"
    echo -e "        ${GRAY}</PropertyGroup>${NC}\n"
    
    echo -e "        ${CYAN}<!-- linux-x64 glibc -->${NC}"
    echo -e "        ${GRAY}<PropertyGroup Condition=\"'\$(RuntimeIdentifier)' == '${CYAN}linux-x64${NC}${GRAY}'\">${NC}"
    echo -e "            ${GRAY}<PublishDir>${YELLOW}../publish/linux-x64${GRAY}</PublishDir>${NC}"
    echo -e "            ${GRAY}<CppCompilerAndLinker>${YELLOW}x86_64-buildroot-linux-gnu-gcc${GRAY}</CppCompilerAndLinker>${NC}"
    echo -e "            ${GRAY}<CppLinker>${YELLOW}x86_64-buildroot-linux-gnu-ld.bfd${GRAY}</CppLinker>${NC}"
    echo -e "            ${GRAY}<SysRoot>${YELLOW}/opt/dotnet-aot-xc/linux-x64/x86_64-buildroot-linux-gnu/sysroot${GRAY}</SysRoot>${NC}"
    echo -e "            ${GRAY}<ObjCopyName>${YELLOW}x86_64-buildroot-linux-gnu-objcopy${GRAY}</ObjCopyName>${NC}"
    echo -e "        ${GRAY}</PropertyGroup>${NC}"
    echo -e "    ${GRAY}</Project>${NC}\n"

    echo -e "${BLUE}BASIC USAGE EXAMPLES:${NC}"
    echo -e "    ${CYAN}# Activate toolchain and build for linux-x64${NC}"
    echo -e "    ${GREEN}source${NC} dotnet-aot-xc ${YELLOW}linux-x64${NC}"
    echo -e "    ${GREEN}dotnet publish${NC} -p:PublishProfile=Release.pubxml -r ${YELLOW}linux-x64${NC}\n"
    
    echo -e "    ${CYAN}# Activate toolchain and build for linux-arm64${NC}"
    echo -e "    ${GREEN}source${NC} dotnet-aot-xc ${YELLOW}linux-arm64${NC}"
    echo -e "    ${GREEN}dotnet publish${NC} -p:PublishProfile=Release.pubxml -r ${YELLOW}linux-arm64${NC}\n"
    
    echo -e "    ${CYAN}# Activate toolchain and build for linux-musl-x64${NC}"
    echo -e "    ${GREEN}source${NC} dotnet-aot-xc ${YELLOW}linux-musl-x64${NC}"
    echo -e "    ${GREEN}dotnet publish${NC} -p:PublishProfile=Release.pubxml -r ${YELLOW}linux-musl-x64${NC}\n"
    
    echo -e "    ${CYAN}# Activate toolchain and build for linux-musl-arm64${NC}"
    echo -e "    ${GREEN}source${NC} dotnet-aot-xc ${YELLOW}linux-musl-arm64${NC}"
    echo -e "    ${GREEN}dotnet publish${NC} -p:PublishProfile=Release.pubxml -r ${YELLOW}linux-musl-arm64${NC}\n"
}

# Main
DOTNET_AOT_XC_ROOT="/opt/dotnet-aot-xc"

rid="$1"

if [[ "$rid" == "--help" || "$rid" == "-h" || -z "$rid" ]]; then
    show_help
    return 0 2>/dev/null || exit 0
fi

toolchain_path="$DOTNET_AOT_XC_ROOT/$rid"

if [[ ! -d "$toolchain_path" ]]; then
    print_error "Toolchain for ${YELLOW}$rid${NC} not found at ${CYAN}$toolchain_path${NC}"
    return 1 2>/dev/null || exit 1
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
        return 1 2>/dev/null || exit 1
        ;;
esac

# Success output
print_success "Activated AOT cross-compile toolchain"
print_info "RID:      ${CYAN}$rid${NC}"
print_info "Arch:     ${CYAN}$arch${NC}"
print_info "C lib:    ${CYAN}$libc${NC}"
print_info "CC:       ${GREEN}$CC${NC}"
print_info "PATH:     ${BLUE}$toolchain_path/bin${NC}"
return 0 2>/dev/null
