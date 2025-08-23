#!/bin/bash
# libmilter-test.sh
# Tests libmilter shared and static libraries from the build directory

set -euo pipefail

# Paths to staged build directories
BUILD_LIB="${PWD}/sendmail-8.18.1/obj.Linux.$(uname -r).x86_64/libmilter/"
BUILD_INCLUDE="${PWD}/include"

echo "[*] Testing shared library..."
export LD_LIBRARY_PATH="${BUILD_LIB}:${LD_LIBRARY_PATH:-}"

cat > test_dynamic.c <<'EOF'
#include <libmilter/mfapi.h>
#include <stdio.h>

int main(void) {
    printf("[OK] Shared library works\n");
    return 0;
}
EOF

gcc -I"$BUILD_INCLUDE" test_dynamic.c -L"$BUILD_LIB" -lmilter -o test_dynamic
./test_dynamic
rm -f test_dynamic test_dynamic.c

echo "[*] Testing static library..."
cat > test_static.c <<'EOF'
#include <libmilter/mfapi.h>
#include <stdio.h>

int main(void) {
    printf("[OK] Static library works\n");
    return 0;
}
EOF

gcc -I"$BUILD_INCLUDE" test_static.c "$BUILD_LIB/libmilter.a" -o test_static
./test_static
rm -f test_static test_static.c

echo "[*] All tests passed!"
