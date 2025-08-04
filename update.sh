#!/bin/bash
# Update script for gnome-meta PKGBUILD
# This script updates the depends array to match the current 'gnome' package group

set -e

PKGBUILD_FILE="PKGBUILD"
TEMP_DIR=$(mktemp -d)
CURRENT_DEPENDS_FILE="$TEMP_DIR/current_depends"
NEW_DEPENDS_FILE="$TEMP_DIR/new_depends"

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "Getting current 'gnome' package group..."
# Get packages in gnome group and sort them
paru -Sg gnome | cut -d' ' -f2 | sort > "$NEW_DEPENDS_FILE"

echo "Extracting current depends from PKGBUILD..."
# Extract current depends from PKGBUILD (between 'depends=(' and ')')
sed -n '/^depends=(/,/^)/p' "$PKGBUILD_FILE" | \
    grep -v '^depends=(' | \
    grep -v '^)' | \
    sed 's/^[[:space:]]*//' | \
    sed 's/[[:space:]]*$//' | \
    sort > "$CURRENT_DEPENDS_FILE"

echo "Comparing package lists..."
if diff -q "$CURRENT_DEPENDS_FILE" "$NEW_DEPENDS_FILE" > /dev/null; then
    echo "No changes detected in the gnome package group."
    exit 0
fi

echo "Changes detected! Here's the diff:"
echo "======================================="
diff -u "$CURRENT_DEPENDS_FILE" "$NEW_DEPENDS_FILE" || true
echo "======================================="

echo
read -p "Do you want to update the PKGBUILD? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Update cancelled."
    exit 0
fi

echo "Updating PKGBUILD..."

# Create new depends array in a temporary file
echo "depends=(" > "$TEMP_DIR/new_depends_array"
while IFS= read -r pkg; do
    echo "  $pkg" >> "$TEMP_DIR/new_depends_array"
done < "$NEW_DEPENDS_FILE"
echo ")" >> "$TEMP_DIR/new_depends_array"

# Replace the depends array in the PKGBUILD
awk '
/^depends=\(/ { 
    in_depends=1
    system("cat '"$TEMP_DIR/new_depends_array"'")
    next
}
/^\)/ && in_depends {
    in_depends=0
    next
}
!in_depends { print }
' "$PKGBUILD_FILE" > "$TEMP_DIR/PKGBUILD.new"

# Replace the original file
mv "$TEMP_DIR/PKGBUILD.new" "$PKGBUILD_FILE"

echo "PKGBUILD updated successfully!"

echo "Make sure to update the pkgver or pkgrel and run"
echo "makepkg --printsrcinfo > .SRCINFO"
