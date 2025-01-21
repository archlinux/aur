#!/bin/bash
set -e

PKGBUILD_FILE="PKGBUILD"
SRCINFO_FILE=".SRCINFO"

# Generate new checksums using makepkg
echo "Update $PKGBUILD_FILE: generating checksums."
NEW_SUMS=$(makepkg -g)

if [[ $? -ne 0 ]]; then
  echo "Error: Failed to generate checksums!"
  exit 1
fi

# Extract and format the new checksums for each architecture
SHA256SUMS_X86_64=$(echo "$NEW_SUMS" | grep sha256sums_x86_64)
SHA256SUMS_AARCH64=$(echo "$NEW_SUMS" | grep sha256sums_aarch64)

if [[ -z $SHA256SUMS_X86_64 || -z $SHA256SUMS_AARCH64 ]]; then
  echo "Error: Failed to parse checksums!"
  exit 1
fi

# Update the PKGBUILD file with the new checksums
echo "Update $PKGBUILD_FILE: updating $PKGBUILD_FILE with new checksums."
sed -i "/sha256sums_x86_64=/c\\$SHA256SUMS_X86_64" $PKGBUILD_FILE
sed -i "/sha256sums_aarch64=/c\\$SHA256SUMS_AARCH64" $PKGBUILD_FILE

if [[ $? -eq 0 ]]; then
  echo "Update $PKGBUILD_FILE: success."
else
  echo "Error: Failed to update $PKGBUILD_FILE!"
  exit 1
fi

# Update .SRCINFO file
echo "Update $SRCINFO_FILE: generating .SRCINFO."
makepkg --printsrcinfo >$SRCINFO_FILE

if [[ $? -ne 0 ]]; then
  echo "Error: Failed to update .SRCINFO!"
  exit 1
fi
echo "Update $SRCINFO_FILE: success."

# Check for common mistakes in the PKGBUILD file
echo "Validate $PKGBUILD_FILE: checking for common mistakes."
namcap PKGBUILD

if [[ $? -ne 0 ]]; then
  echo "Warning: Potential issues found in $PKGBUILD_FILE!"
  exit 1
fi
echo "Validate $PKGBUILD_FILE: success."

echo "Done!"
