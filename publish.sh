#!/bin/bash

# Exit on error
set -e

DRY_RUN=false
VERSION=""

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--dry-run) DRY_RUN=true ;;
        *) VERSION=$1 ;;
    esac
    shift
done

if [ -z "$VERSION" ]; then
    echo "Usage: $0 [-d|--dry-run] <version>"
    echo "Example: $0 6.5.11.26770"
    exit 1
fi

FULL_VER=$VERSION
PKGVER=$(echo $FULL_VER | rev | cut -d. -f2- | rev)
SUBVER=$(echo $FULL_VER | rev | cut -d. -f1 | rev)

if [ "$DRY_RUN" = true ]; then
    echo "--- DRY RUN MODE ---"
    echo "Proposed Version: $PKGVER"
    echo "Proposed Build:   $SUBVER"
    echo ""
    
    # Calculate checksum without modifying real PKGBUILD
    echo "Calculating proposed checksums (this may take a moment to download)..."
    
    # makepkg requires the file to be in the CWD
    TEMP_PKGBUILD="PKGBUILD.tmp"
    cp PKGBUILD "$TEMP_PKGBUILD"
    
    # Clean up on exit even if interrupted
    trap 'rm -f "$TEMP_PKGBUILD"' EXIT
    
    sed -i "s/^pkgver=.*/pkgver=$PKGVER/" "$TEMP_PKGBUILD"
    sed -i "s/^_subver=.*/_subver=$SUBVER/" "$TEMP_PKGBUILD"
    
    # Run makepkg -g on the temp file
    if ! NEW_SUMS=$(makepkg -g -p "$TEMP_PKGBUILD"); then
        echo ""
        echo "Error: Could not calculate checksum."
        echo "This usually means the version doesn't exist on Zoom's servers or there is a network issue."
        exit 1
    fi
    
    echo "New Checksum: $NEW_SUMS"
    echo ""
    echo "Actions that would be performed:"
    echo "1. Update PKGBUILD version and reset pkgrel."
    echo "2. Update sha512sums to the one shown above."
    echo "3. Regenerate .SRCINFO."
    echo ""
    echo "--- END DRY RUN ---"
    exit 0
fi

echo "Updating to version: $PKGVER (Build: $SUBVER)"

# Update PKGBUILD version and reset pkgrel
sed -i "s/^pkgver=.*/pkgver=$PKGVER/" PKGBUILD
sed -i "s/^_subver=.*/_subver=$SUBVER/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

# Update checksums
if command -v updpkgsums >/dev/null 2>&1; then
    echo "Updating checksums using updpkgsums..."
    updpkgsums
else
    echo "updpkgsums not found. Using makepkg -g to update checksums..."
    NEW_SUMS=$(makepkg -g)
    sed -i "s/^sha512sums=.*/$NEW_SUMS/" PKGBUILD
fi

# Regenerate .SRCINFO
echo "Regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "Success! Files updated."
echo "-----------------------------------"

# Interactive Git workflow
echo ""
read -p "Do you want to stage the changes (git add)? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Stage essential package files and the maintenance script itself
    git add PKGBUILD .SRCINFO publish.sh zoom-citrix-plugin.install .gitignore
    echo "Files staged."

    read -p "Do you want to commit the changes? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git commit -m "Update to version $FULL_VER"
        
        read -p "Do you want to push to origin? [y/N] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git push
        fi
    fi
fi

# Cleanup
echo ""
read -p "Do you want to remove temporary build folders (src/, pkg/)? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf src/ pkg/ *.rpm
    echo "Cleanup complete."
fi

echo "Done!"
