#!/bin/bash

# Reset
git fetch --prune
git reset --hard origin/master

# Store old version before update
OLD_VERSION=$(grep -m1 "^pkgver=" PKGBUILD | cut -d'=' -f2)

# Update PKGBUILD with latest upstream version
pkgctl version upgrade

# Get new version after update
NEW_VERSION=$(grep -m1 "^pkgver=" PKGBUILD | cut -d'=' -f2)

# Check if version actually changed
if [ "$OLD_VERSION" = "$NEW_VERSION" ]; then
    echo "already up to date"
    exit 0
fi

# Regenerate .SRCINFO and check for errors
if ! makepkg --printsrcinfo > .SRCINFO; then
    echo "Error: Failed to regenerate .SRCINFO"
    git checkout -- PKGBUILD .SRCINFO
    exit 1
fi

# Stage both files
git add PKGBUILD .SRCINFO
# Build only: installing would conflict with the from-source package
makepkg -f

# Commit the changes
git commit -m "update to $NEW_VERSION" || {
	read -p "Unlock GPG key..."
	git commit -m "update to $NEW_VERSION"
}

# Verify both files were modified in the commit
if ! git show --stat | grep -q "PKGBUILD" || ! git show --stat | grep -q ".SRCINFO"; then
    echo "Error: Both PKGBUILD and .SRCINFO should be modified in the commit"
    git reset HEAD~1
    exit 1
fi

echo "Successfully committed update to $NEW_VERSION"
