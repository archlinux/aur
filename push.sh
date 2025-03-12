#!/usr/bin/env bash

# Get version
oldver=$(grep "pkgver=" PKGBUILD | sed 's/pkgver="//;s/"//')
if [ $# -eq 1 ]; then
  pkgver="${1}"
else
  echo "Old version: ${oldver}"
  read -p "New version: " pkgver
fi
# Check version
if [ "${pkgver}" = "${oldver}" ]; then
  echo >/dev/stderr "Error: same (old) version specified - update aborted"
  exit 1
fi

# Get variables from PKGBUILD
url=$(grep "source=" PKGBUILD | sed 's/source=("//;s/")//')
pkgname=$(grep "_pkgname=" PKGBUILD | sed 's/_pkgname="//;s/"//')
pkgrel=$(grep "pkgrel=" PKGBUILD | sed 's/pkgrel="//;s/"//')
aur_url=$(grep "pkgname=" PKGBUILD | tail -n 1 | sed 's/pkgname="//;s/"//')
# Perform variable substitution
archive_url="${url//\$\{_pkgname\}/$pkgname}"
archive_url="${archive_url//\$\{pkgver\}/$pkgver}"
aur_url="ssh://aur@aur.archlinux.org/${aur_url//\$\{_pkgname\}/$pkgname}.git"

# Download archive
wget -O ${pkgname}.tar.gz "${archive_url}"
# Calculate checksums
sha1sum=$(sha1sum ${pkgname}.tar.gz | awk '{print $1}')
sha256sum=$(sha256sum ${pkgname}.tar.gz | awk '{print $1}')
md5sum=$(md5sum ${pkgname}.tar.gz | awk '{print $1}')
# Yoink the archive - unnecessary anymore
rm -f ${pkgname}.tar.gz

# Update PKGBUILD with new values
sed -i -E "s/^pkgver=\"[^\"]+\"/pkgver=\"$pkgver\"/" PKGBUILD
sed -i -E "s/^sha1sums=\(\"[^\"]+\"\)/sha1sums=(\"$sha1sum\")/" PKGBUILD
sed -i -E "s/^sha256sums=\(\"[^\"]+\"\)/sha256sums=(\"$sha256sum\")/" PKGBUILD
sed -i -E "s/^md5sums=\(\"[^\"]+\"\)/md5sums=(\"$md5sum\")/" PKGBUILD

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# In case of fire, git commit, git push, leave building
git add .
git commit -m "Updated ${pkgname} to ${pkgver}-${pkgrel}"
git remote add aur ${aur_url}
git push origin main
git push aur main:master
