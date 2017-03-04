#!/bin/bash

set -e
cd "$(dirname "$0")"

repo='KELiON/cerebro'
echo "Updating $repo"

git clean -fdx
git pull

newver=$(curl -s -N "https://github.com/$repo/releases.atom" | grep -m 1 -o '/releases/.*' | sed -e 's/\/releases\/tag\/\(.*\)"\/>/\1/');
oldver=$(grep -a 'pkgver=' PKGBUILD | sed 's/pkgver=//g')

oldpure=$(echo "$oldver" | sed -e 's/\.//g;s/-//g')
newpure=$(echo "$newver" | sed -e 's/\.//g;s/-//g')

echo "Comparing $oldpure and $newpure."
if [ "$newpure" -le "$oldpure" ]; then
  echo 'Nothing to upgrade.'
  exit 0
fi


echo "Upgrading: $oldver -> $newver"

# Update files
sed -i "s/^pkgver.*/pkgver=$newver/" PKGBUILD
sed -i 's/^pkgrel.*/pkgrel=1/' PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Make sure package can build
makepkg --cleanbuild

# Cleanup install files
find . -name '*.tar.gz' -exec rm {} \;
rm -rf src pkg

# Install the package
pkg=$(find . -name '*.pkg.tar.xz')
expect <<EOF
  set send_slow {1 .1}
  proc send {ignore arg} {
    sleep .1
    exp_send -s -- \$arg
  }
  set timeout 120
  spawn sudo pacman -U $pkg
  expect {
    -exact " are in conflict. Remove " { send -- "y\r"; exp_continue }
    -exact "installation? \[Y/n\]" { send -- "y\r"; exp_continue }
  }
EOF

# Push changes
git add PKGBUILD
git add .SRCINFO
git commit -m 'Bump version'
git push

echo "Update completed."
