#!/bin/bash

CI_MODE=false
VERSION_OVERRIDE=""

# Parse arguments: first non-option is version, --ci enables CI mode
for arg in "$@"; do
  case "$arg" in
    --ci)
      CI_MODE=true
      ;;
    *)
      if [ -z "$VERSION_OVERRIDE" ]; then
        VERSION_OVERRIDE="$arg"
      fi
      ;;
  esac
done

if [ "$CI_MODE" = true ]; then
  echo "Running in CI mode - will skip commit operations"
fi

latest_version="${VERSION_OVERRIDE:-latest}"
nwjs_ffmpeg_version=""

if [ "$latest_version" = "latest" ]; then
  if ! command -v jq >/dev/null 2>&1; then
    echo "Error: jq is required to parse the opera-versions API response."
    echo "Install it with 'pacman -S jq' or similar and retry."
    exit 1
  fi

  json=$(curl -fsSL "https://api.modlabs.cc/opera-versions") || {
    echo "Error: failed to fetch latest Opera version metadata."
    exit 1
  }

  latest_version=$(printf '%s\n' "$json" | jq -r '.data.latest // empty')
  nwjs_ffmpeg_version=$(printf '%s\n' "$json" | jq -r '.data.nwjs_ffmpeg_version // empty')
  chromium_version=$(printf '%s\n' "$json" | jq -r '.data.chromium // empty')
  nwjs_chromium_version=$(printf '%s\n' "$json" | jq -r '.data.nwjs_chromium // empty')

  if [ -z "$latest_version" ] || [ -z "$nwjs_ffmpeg_version" ]; then
    echo "Error: opera-versions API did not return expected fields."
    exit 1
  fi

  echo "Latest Opera Version:      v${latest_version}"
  [ -n "$chromium_version" ] && echo "Chromium Version:           v${chromium_version}"
  echo "nwjs-ffmpeg Version:       v${nwjs_ffmpeg_version}"
  [ -n "$nwjs_chromium_version" ] && echo "nwjs-ffmpeg Chromium base: v${nwjs_chromium_version}"
else
  echo "Using version override: v${latest_version}"
  echo "Note: nwjs_ffmpeg_version will not be auto-updated when using a manual version override."
fi

# Backup the original PKGBUILD
cp ./PKGBUILD ./PKGBUILD.bak

# Update the PKGBUILD with the latest version
sed -i "s/^pkgver=.*$/pkgver=${latest_version}/" ./PKGBUILD

# If we have a mapped nwjs_ffmpeg_version (latest case), update it as well
if [ -n "$nwjs_ffmpeg_version" ]; then
  sed -i "s/^nwjs_ffmpeg_version=.*/nwjs_ffmpeg_version=${nwjs_ffmpeg_version}/" ./PKGBUILD
fi

# Check if the version URL returns 404
url="https://get.geo.opera.com/ftp/pub/opera/desktop/${latest_version}/linux/opera-stable_${latest_version}_amd64.deb"
response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

if [ "$response" -eq 404 ]; then
  echo "The URL for version ${latest_version} (${url}) returned a 404 error. Aborting update."
  # Restore the original PKGBUILD
  mv ./PKGBUILD.bak ./PKGBUILD
  exit 1
fi

# Remove the backup PKGBUILD if the URL is valid
rm ./PKGBUILD.bak

# Check for changes in the PKGBUILD
if ! git diff --quiet HEAD PKGBUILD; then
  # Check if pacman-contrib is installed
  if pacman -Qi pacman-contrib > /dev/null 2>&1; then
    updpkgsums
  else
    echo "Install pacman-contrib with 'pacman -S pacman-contrib'"
    exit 1
  fi

  # Generate .SRCINFO
  makepkg --printsrcinfo > .SRCINFO

  # Install the package
  makepkg -si

  # Commit the changes
  if [ "$CI_MODE" = false ]; then
    # Only commit if not in CI mode
    git add PKGBUILD .SRCINFO
    git commit -m "Updated version to ${latest_version}"
  else
    echo "Skipping commit in CI mode"
  fi
else
  echo "No updates found!"
fi
