#!/bin/bash

PKGBUILD_PATH="PKGBUILD"
SRCINFO_PATH=".SRCINFO"

# Check if jq is installed
if ! command -v jq &> /dev/null
then
    echo "Error: 'jq' is not installed. Please install it to run this script."
    exit 1
fi

# Get current pkgver from PKGBUILD
current_pkgver=$(grep "pkgver=" "$PKGBUILD_PATH" | cut -d'=' -f2)
if [ -z "$current_pkgver" ]; then
    echo "Error: Could not find pkgver in $PKGBUILD_PATH"
    exit 1
fi
echo "Current pkgver: $current_pkgver"

# Fetch latest release from GitHub
repo_owner="refactoringhq"
repo_name="tolaria"
github_api_url="https://api.github.com/repos/${repo_owner}/${repo_name}/releases/latest"

latest_release_info=$(curl -s "$github_api_url")
latest_tag_name=$(echo "$latest_release_info" | jq -r '.tag_name')

if [ "$latest_tag_name" == "null" ] || [ -z "$latest_tag_name" ]; then
    echo "Error: Could not fetch latest tag name from GitHub API."
    echo "API Response: $latest_release_info"
    exit 1
fi

# Extract version from tag_name (e.g., stable-v2026.4.25 -> 2026.4.25)
latest_pkgver=$(echo "$latest_tag_name" | sed 's/^stable-v//')

echo "Latest upstream pkgver: $latest_pkgver"

# Compare versions
if [[ "$latest_pkgver" == "$current_pkgver" ]]; then
    echo "PKGBUILD is already up to date. No changes needed."
    exit 0
fi

if [[ $(printf '%s\n' "$current_pkgver" "$latest_pkgver" | sort -V | head -n1) == "$latest_pkgver" ]]; then
    echo "Current pkgver ($current_pkgver) is newer than or equal to the latest upstream pkgver ($latest_pkgver)."
    echo "No update needed."
    exit 0
fi

echo "New version found: $latest_pkgver. Updating PKGBUILD..."

# Update pkgver in PKGBUILD
sed -i "s/^pkgver=.*/pkgver=$latest_pkgver/" "$PKGBUILD_PATH"

# Reset pkgrel to 1 if pkgver is updated, otherwise increment it.
current_pkgrel=$(grep "pkgrel=" "$PKGBUILD_PATH" | cut -d'=' -f2)
new_pkgrel=1 # Default to 1 for new versions

# Check if pkgver was *actually* updated in the current run (already updated in PKGBUILD)
# If new pkgver is the same as the old one (meaning only pkgrel should be incremented)
# This comparison is based on the assumption that the sed command for pkgver has already run.
# A more robust way would be to pass the old_pkgver and new_pkgver to this section.
# For simplicity, we'll assume a version update implies pkgrel reset to 1,
# and if there's no version update, this section wouldn't be reached (due to exit 0).
# However, if this script were to be expanded to handle other changes to PKGBUILD
# without a pkgver change, then an increment would be needed.
# Given the current scope (only updating for new pkgver), resetting to 1 is correct.
# If there are any other changes that don't involve a pkgver bump, they should not trigger this script.

# The current logic of the script implies that if we reach this point, there IS a new pkgver.
# Therefore, pkgrel *should* be reset to 1.
# The original script incremented pkgrel. Let's make it reset to 1.
new_pkgrel=1
sed -i "s/^pkgrel=.*/pkgrel=$new_pkgrel/" "$PKGBUILD_PATH"

# Construct new source URL and download the file
new_source_url="https://github.com/${repo_owner}/${repo_name}/releases/download/stable-v${latest_pkgver}/Tolaria_${latest_pkgver}_amd64.deb"
download_filename="Tolaria_${latest_pkgver}_amd64.deb"

echo "Downloading new source: $new_source_url"
curl -L -o "$download_filename" "$new_source_url"

if [ $? -ne 0 ]; then
    echo "Error: Failed to download $new_source_url"
    rm -f "$download_filename"
    exit 1
fi

# Calculate new sha256sum
new_sha256sum=$(sha256sum "$download_filename" | cut -d' ' -f1)
echo "New sha256sum: $new_sha256sum"

# Update sha256sums in PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=('$new_sha256sum')/" "$PKGBUILD_PATH"

# Generate .SRCINFO
echo "Generating .SRCINFO file..."
makepkg --printsrcinfo > "$SRCINFO_PATH"

if [ $? -ne 0 ]; then
    echo "Error: Failed to generate .SRCINFO. Reverting PKGBUILD changes."
    git checkout "$PKGBUILD_PATH"
    rm -f "$download_filename"
    exit 1
fi

# Commit changes
git add "$PKGBUILD_PATH" "$SRCINFO_PATH"
git commit -m "upgpkg: ${repo_name} ${latest_pkgver}-${new_pkgrel}"

if [ $? -ne 0 ]; then
    echo "Error: Failed to commit changes. Please check git status."
    rm -f "$download_filename"
    exit 1
fi

echo "Successfully updated ${repo_name} to version ${latest_pkgver}-${new_pkgrel} and committed changes."

# Clean up downloaded file
rm -f "$download_filename"
