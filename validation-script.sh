#!/bin/bash
# libexecinfo Package Validation Script for Arch Linux

set -e

echo "=== libexecinfo Package Validation ==="
echo

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test functions
test_package_info() {
    echo -e "${YELLOW}Testing package information...${NC}"

    if pacman -Qi libexecinfo &>/dev/null; then
        echo -e "${GREEN}✓ Package is installed${NC}"
        pacman -Qi libexecinfo | head -10
    else
        echo -e "${RED}✗ Package not found${NC}"
        return 1
    fi
    echo
}

test_files() {
    echo -e "${YELLOW}Testing installed files...${NC}"

    files=(
        "/usr/lib/libexecinfo.a"
        "/usr/lib/libexecinfo.so"
        "/usr/lib/libexecinfo.so.1"
        "/usr/include/execinfo.h"
        "/usr/include/stacktraverse.h"
        "/usr/lib/pkgconfig/libexecinfo.pc"
    )

    for file in "${files[@]}"; do
        if [ -e "$file" ]; then
            echo -e "${GREEN}✓ $file${NC}"
        else
            echo -e "${RED}✗ $file (missing)${NC}"
        fi
    done
    echo
}

test_pkg_config() {
    echo -e "${YELLOW}Testing pkg-config integration...${NC}"

    if pkg-config --exists libexecinfo; then
        echo -e "${GREEN}✓ pkg-config finds libexecinfo${NC}"
        echo "CFLAGS: $(pkg-config --cflags libexecinfo)"
        echo "LIBS: $(pkg-config --libs libexecinfo)"
    else
        echo -e "${RED}✗ pkg-config integration failed${NC}"
        return 1
    fi
    echo
}

test_compilation() {
    echo -e "${YELLOW}Testing compilation...${NC}"

    # Create temporary test file
    tmp_dir=$(mktemp -d)
    cat > "$tmp_dir/test.c" << 'EOF'
#include <execinfo.h>
#include <stdio.h>

int main() {
    void *buffer[5];
    int size = backtrace(buffer, 5);
    printf("Backtrace test successful: %d frames\n", size);
    return 0;
}
EOF

    cd "$tmp_dir"
    if gcc test.c $(pkg-config --cflags --libs libexecinfo) -o test; then
        echo -e "${GREEN}✓ Compilation successful${NC}"
        if ./test; then
            echo -e "${GREEN}✓ Execution successful${NC}"
        else
            echo -e "${RED}✗ Execution failed${NC}"
        fi
    else
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi

    # Cleanup
    rm -rf "$tmp_dir"
    echo
}

# Run all tests
echo "Starting validation tests..."
echo

test_package_info
test_files
test_pkg_config
test_compilation

echo -e "${GREEN}=== Validation Complete ===${NC}"
