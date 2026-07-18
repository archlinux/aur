#!/usr/bin/env bash

# Variables
gui=true
desktop="Open Video Downloader.desktop"
icon="Open Video Downloader.png"

# Get version
oldver=$(grep -E "^pkgver=" PKGBUILD | sed 's/pkgver="//;s/"//')
if [ $# -eq 1 ]; then
  pkgver="${1}"
else
  echo "Old version: ${oldver}"
  read -p "New version: " pkgver
fi

# Check version
if [ "${pkgver}" = "${oldver}" ] && [ -z "${FORCE_REBUILD}" ]; then
  echo >/dev/stderr "Error: same (old) version specified - update aborted"
  exit
fi

# Get variables from PKGBUILD
url=$(sed -n '/^source=(/,/)/p' PKGBUILD | grep -oE 'https?://[^"]+')
pkgname=$(grep -E "^pkgname=" PKGBUILD | sed 's/pkgname="//;s/"//')
_pkgname=$(grep -E "^_pkgname=" PKGBUILD | sed 's/_pkgname="//;s/"//')
_srcname=$(grep -E "^_srcname=" PKGBUILD | sed 's/_srcname="//;s/"//')
_srcmntr=$(grep -E "^_srcmntr=" PKGBUILD | sed 's/_srcmntr="//;s/"//')
_archive=$(grep -E "^_archive=" PKGBUILD | sed 's/_archive="//;s/"//')
pkgrel=$(grep -E "^pkgrel=" PKGBUILD | sed 's/pkgrel="//;s/"//')
aur_url="ssh://aur@aur.archlinux.org/${pkgname}.git"
if [ "${gui}" = "true" ] && [ -n "${_pkgname}" ]; then
  newdesktop="${_pkgname}.desktop"
  newicon="${_pkgname}.png"
else
  newdesktop="${package}.desktop"
  newicon="${package}.png"
fi

# Perform variable substitution
url="${url//\$\{_pkgname\}/$_pkgname}"
url="${url//\$\{_srcname\}/$_srcname}"
url="${url//\$\{_srcmntr\}/$_srcmntr}"
url="${url//\$\{pkgver\}/$pkgver}"
_archive="${_archive//\$\{_pkgname\}/$_pkgname}"
_archive="${_archive//\$\{pkgver\}/$pkgver}"
aur_url="${aur_url//\$\{_pkgname\}/$_pkgname}"
pkgname="${pkgname//\$\{_pkgname\}/$_pkgname}"

# Download archive
wget -qO ${_archive} "${url}"
# Extract icon / .desktop files if appimage
if printf '%s' "${_archive,,}" | grep -qi "appimage"; then
  chmod +x "${_archive}"
  "./${_archive}" --appimage-extract >/dev/null
  cp "squashfs-root/${desktop}" "${newdesktop}"
  cp "squashfs-root/${icon}" "${newicon}"
  sed -i "/^X-AppImage-/d;/^$/d" "${newdesktop}"
  sed -i "s/^Exec=.*/Exec=${_pkgname} %U/" "${newdesktop}"
  rm -rf $(readlink -f squashfs-root) squashfs-root
fi
# Calculate checksums
sha256bin=$(sha256sum ${_archive} | awk '{print $1}')
if [ "${gui}" = "true" ]; then
  sha256dsk=$(sha256sum ${newdesktop} | awk '{print $1}')
  sha256ico=$(sha256sum ${newicon} | awk '{print $1}')
fi
# Yoink the archive - unnecessary anymore
rm -f ${_archive}

# Update PKGBUILD with new values
sed -i -E "s/^pkgver=\"[^\"]+\"/pkgver=\"$pkgver\"/" PKGBUILD
if [ "${gui}" = "true" ]; then
  sed -i '/^sha256sums=(/,/^)/c\
sha256sums=(\
  "'"$sha256bin"'"\
  "'"$sha256dsk"'"\
  "'"$sha256ico"'"\
)' PKGBUILD
else
  sed -i -E "s/^sha256sums=\(\"[^\"]+\"\)/sha256sums=(\"$sha256bin\")/" PKGBUILD
fi
if [ "${pkgver}" != "${oldver}" ] && [ -n "${FORCE_REBUILD}" ]; then
  sed -i -E "s/^pkgrel=\"[^\"]+\"/pkgrel=\"1\"/" PKGBUILD
fi
# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Create git message with correct variable
if [ -n "$_pkgname" ]; then
  commit_msg="Updated ${pkgname//\$\{_pkgname\}/_pkgname} to ${pkgver}-${pkgrel}"
else
  commit_msg="Updated ${pkgname} to ${pkgver}-${pkgrel}"
fi

if [ -z "${NO_GIT_PUSH}" ]; then
  # In case of fire, git commit, git push, leave building
  git add .
  git commit -m "${commit_msg}"
  git remote add aur ${aur_url}
  git push origin main
  git push aur main:master
fi
