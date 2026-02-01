#!/bin/bash
# Git Hygiene Verification Guard
# Updated: Explicitly allows lmstudio.png, verifies exclusion of src/ and pkg/ from history and staged index

echo "=== Git Hygiene Verification Guard ==="
echo ""

# Color codes
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

FAIL=0

# Check 1: Verify lmstudio.png is NOT ignored (explicitly allowed)
echo "Check 1: Verifying lmstudio.png is tracked/allowed..."
if git ls-files lmstudio.png 2>/dev/null | grep -q "lmstudio.png"; then
    echo -e "${GREEN}✓ PASSED: lmstudio.png is tracked${NC}"
elif ! git check-ignore lmstudio.png 2>/dev/null; then
    echo -e "${GREEN}✓ PASSED: lmstudio.png is not ignored${NC}"
else
    echo -e "${YELLOW}⚠ WARNING: lmstudio.png appears to be in .gitignore${NC}"
fi
echo ""

# Check 2: Verify src/ folder is NOT in git history
echo "Check 2: Verifying src/ folder is NOT in git history..."
SRC_IN_HISTORY=$(git log --all --full-history --name-only --format="" -- 'src/' 2>/dev/null | wc -l)
if [ "$SRC_IN_HISTORY" -gt 0 ]; then
    echo -e "${RED}✗ FAILED: src/ folder found in git history${NC}"
    FAIL=1
else
    echo -e "${GREEN}✓ PASSED: src/ folder is clean from history${NC}"
fi
echo ""

# Check 3: Verify pkg/ folder is NOT in git history
echo "Check 3: Verifying pkg/ folder is NOT in git history..."
PKG_IN_HISTORY=$(git log --all --full-history --name-only --format="" -- 'pkg/' 2>/dev/null | wc -l)
if [ "$PKG_IN_HISTORY" -gt 0 ]; then
    echo -e "${RED}✗ FAILED: pkg/ folder found in git history${NC}"
    FAIL=1
else
    echo -e "${GREEN}✓ PASSED: pkg/ folder is clean from history${NC}"
fi
echo ""

# Check 4: Verify src/ folder is NOT in staged index
echo "Check 4: Verifying src/ folder is NOT in staged index..."
SRC_STAGED=$(git diff --cached --name-only -- 'src/' 2>/dev/null | wc -l)
if [ "$SRC_STAGED" -gt 0 ]; then
    echo -e "${RED}✗ FAILED: src/ folder has staged files${NC}"
    git diff --cached --name-only -- 'src/'
    FAIL=1
else
    echo -e "${GREEN}✓ PASSED: src/ folder is clean from staged index${NC}"
fi
echo ""

# Check 5: Verify pkg/ folder is NOT in staged index
echo "Check 5: Verifying pkg/ folder is NOT in staged index..."
PKG_STAGED=$(git diff --cached --name-only -- 'pkg/' 2>/dev/null | wc -l)
if [ "$PKG_STAGED" -gt 0 ]; then
    echo -e "${RED}✗ FAILED: pkg/ folder has staged files${NC}"
    git diff --cached --name-only -- 'pkg/'
    FAIL=1
else
    echo -e "${GREEN}✓ PASSED: pkg/ folder is clean from staged index${NC}"
fi
echo ""

# Check 6: Verify no AppImages or packages are staged
echo "Check 6: Verifying NO binary extensions are staged..."
BINARY_STAGED=$(git diff --cached --name-only | grep -E "\.(AppImage|zst|tar\.gz)$" | wc -l)
if [ "$BINARY_STAGED" -gt 0 ]; then
    echo -e "${RED}✗ FAILED: Binary files are staged!${NC}"
    git diff --cached --name-only | grep -E "\.(AppImage|zst|tar\.gz)$"
    FAIL=1
else
    echo -e "${GREEN}✓ PASSED: No binary extensions staged${NC}"
fi
echo ""

# Check 7: Review staged changes
echo "Check 7: Reviewing staged changes summary..."
git diff --cached --stat
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
