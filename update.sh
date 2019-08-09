#! /usr/bin/env bash

current_ver=$(echo 'echo $pkgver' | cat PKGBUILD - | bash)
latest_ver=$(curl -Ls https://api.github.com/repos/FortAwesome/Font-Awesome/releases/latest | jq -r .tag_name)

echo "Potential upgrade $current_ver -> $latest_ver"

if [ "$current_ver" == "$latest_ver" ]; then
    echo "Up-to-date ($latest_ver)"
    exit
elif [ $(printf "$current_ver\n$latest_ver" | sort -Vr | head -n 1) != "$latest_ver" ]; then
    echo "Latest version on GitHub ($latest_ver) is earlier than current ($current_ver)"
    echo "Exiting in confusion"
    exit 1
fi

echo "Performing upgrade..."

# Update PKGBUILD version
sed -i "s/pkgver=.*/pkgver=$latest_ver/" PKGBUILD

# Update checksums
sed -i "s/sha256sums=.*/$(makepkg --geninteg)/" PKGBUILD

# Update srcinfo
makepkg --printsrcinfo > .SRCINFO

# Confirm that package builds
if ! makepkg -f; then
    echo "Error in makepkg; exiting"
    exit 1
fi

echo "Successfully built! Committing to Git"

# Git commit
git commit -am "Updated to $latest_ver"

echo "Pushing..."

if ! git push; then
    echo "Could not push to AUR"
    exit 1
fi

echo "Update complete"
