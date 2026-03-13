#!/bin/env bash
set -eo pipefail

PKGNAME=plex-htpc

snap_res="$(curl "https://api.snapcraft.io/v2/snaps/info/${PKGNAME}" \
  -H 'Snap-Device-Series: 16' -L)"

snap_id="$(echo "$snap_res" | jq -r '."snap-id"')"
stable_channel="$(echo "$snap_res" | jq -e '."channel-map"[] | select(.channel.name == "stable")')"

new_revision="$(echo "$stable_channel" | jq -r '.revision')"
new_version="$(echo "$stable_channel" | jq -r '.version')"
new_download="$(echo "$stable_channel" | jq -r '.download.url')"

if [[ ! -f "${snap_id}_${new_revision}.snap" ]]; then
  wget "$new_download"
fi

snap_mount_dir=$(mktemp -d)
trap "sudo umount '$snap_mount_dir' 2>/dev/null || true; rmdir '$snap_mount_dir'" EXIT

sudo mount -t squashfs "${snap_id}_${new_revision}.snap" "$snap_mount_dir"

full_version="$new_version"
pkg_hash=""

if [[ -f "$snap_mount_dir/snap/manifest.yaml" ]]; then
  manifest_version=$(grep "^version:" "$snap_mount_dir/snap/manifest.yaml" | cut -d: -f2 | tr -d ' ')
  if [[ -n "$manifest_version" ]]; then
    full_version="$manifest_version"
  fi
fi

plex_binary=""
if [[ -f "$snap_mount_dir/bin/Plex" ]]; then
  plex_binary="$snap_mount_dir/bin/Plex"
elif [[ -f "$snap_mount_dir/Plex" ]]; then
  plex_binary="$snap_mount_dir/Plex"
fi

if [[ -n "$plex_binary" ]]; then
  version_hash_string=$(strings "$plex_binary" | grep -E '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+-[a-f0-9]{8}' | head -1 || true)

  if [[ -n "$version_hash_string" ]]; then
    if [[ $version_hash_string =~ ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)-([a-f0-9]{8}) ]]; then
      full_version="${BASH_REMATCH[1]}"
      pkg_hash="${BASH_REMATCH[2]}"
    fi
  else
    version_from_binary=$(strings "$plex_binary" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -1 || true)
    if [[ -n "$version_from_binary" && "$version_from_binary" != "127.0.0.1" ]]; then
      full_version="$version_from_binary"
    fi
  fi
fi

if [[ -z "$pkg_hash" && -d "$snap_mount_dir" ]]; then
  for file in $(find "$snap_mount_dir" -name "*-*" -type f 2>/dev/null | head -10); do
    filename=$(basename "$file")
    if [[ $filename =~ -([a-f0-9]{8})- ]]; then
      pkg_hash="${BASH_REMATCH[1]}"
      break
    fi
  done

  if [[ -z "$pkg_hash" ]]; then
    version_files=$(find "$snap_mount_dir" -name "version*" -o -name "*version*" -o -name "*.json" 2>/dev/null | head -10)
    for vfile in $version_files; do
      if [[ -f "$vfile" ]]; then
        content=$(cat "$vfile" 2>/dev/null || true)
        hash_match=$(echo "$content" | grep -oE '[a-f0-9]{8}' | head -1 || true)
        if [[ -n "$hash_match" ]]; then
          pkg_hash="$hash_match"
          break
        fi
      fi
    done
  fi
fi

if [[ -z "$pkg_hash" ]]; then
  current_hash=$(grep "^_pkghash=" PKGBUILD | cut -d= -f2)
  pkg_hash="$current_hash"
fi

sudo umount "$snap_mount_dir"

if [[ -z "$full_version" ]]; then
  full_version="$new_version"
fi
if [[ -z "$pkg_hash" ]]; then
  current_hash=$(grep "^_pkghash=" PKGBUILD | cut -d= -f2)
  pkg_hash="$current_hash"
fi

echo "Version: $full_version"
echo "Hash: $pkg_hash"
echo "Snap revision: $new_revision"

sed -i "s|^\(pkgver=\).*|\\1$full_version|g" PKGBUILD
sed -i "s|^\(_pkghash=\).*|\\1$pkg_hash|g" PKGBUILD
sed -i "s|^\(_snaprev=\).*|\\1$new_revision|g" PKGBUILD
sed -i "s|^\(pkgrel=\).*|\\11|g" PKGBUILD

updpkgsums
makepkg --printsrcinfo >.SRCINFO
git diff

read -r -p "Continue (Y/n)?" choice
case "$choice" in
y | Y | "") echo "commiting..." ;;
n | N) exit 1 ;;
*) exit 1 ;;
esac

git add PKGBUILD .SRCINFO
git commit -m "Update $PKGNAME to version $full_version"
