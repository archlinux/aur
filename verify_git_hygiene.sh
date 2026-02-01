#!/bin/bash

echo "=== Git Hygiene Verification Guard ==="
echo ""

# Color codes
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

FAIL=0

# Check 1: Verify src/ folder is not tracked
echo "Check 1: Verifying src/ folder is NOT tracked..."
SRC_TRACKED=$(git ls-files src/ 2>/dev/null | wc -l)
if [ "$SRC_TRACKED" -gt 0 ]; then
    echo -e "${RED}✗ FAILED: src/ folder has $SRC_TRACKED tracked files${NC}"
    git ls-files src/
    FAIL=1
else
    echo -e "${GREEN}✓ PASSED: src/ folder is clean (no tracked files)${NC}"
fi
echo ""

# Check 2: Verify pkg/ folder is not tracked
echo "Check 2: Verifying pkg/ folder is NOT tracked..."
PKG_TRACKED=$(git ls-files pkg/ 2>/dev/null | wc -l)
if [ "$PKG_TRACKED" -gt 0 ]; then
    echo -e "${RED}✗ FAILED: pkg/ folder has $PKG_TRACKED tracked files${NC}"
    git ls-files pkg/
    FAIL=1
else
    echo -e "${GREEN}✓ PASSED: pkg/ folder is clean (no tracked files)${NC}"
fi
echo ""

# Check 3: Check staged changes size
echo "Check 3: Reviewing staged changes size..."
echo "Staged changes:"
git diff --cached --stat
echo ""

# Check 4: Verify no binary files are staged
echo "Check 4: Verifying NO binary extensions are staged..."
BINARY_STAGED=$(git diff --cached --name-only | grep -E "\.(AppImage|zst|tar\.gz)$" | wc -l)
if [ "$BINARY_STAGED" -gt 0 ]; then
    echo -e "${RED}✗ FAILED: Binary files are staged!${NC}"
    git diff --cached --name-only | grep -E "\.(AppImage|zst|tar\.gz)$"
    FAIL=1
else
    echo -e "${GREEN}✓ PASSED: No binary extensions staged${NC}"
fi
echo ""

# Final result
echo "=== Verification Summary ==="
if [ "$FAIL" -eq 0 ]; then
    echo -e "${GREEN}✓ All hygiene checks PASSED${NC}"
    echo "Repository is ready for commit."
    exit 0
else
    echo -e "${RED}✗ Some hygiene checks FAILED${NC}"
    echo "Please fix the issues before committing."
    exit 1
fi
