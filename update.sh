#!/bin/bash

set -e

if [ ! -f ./PKGBUILD ] && [ ! -f ./.SRCINFO ]; then
  echo "PKGBUILD & .SRCINFO not found in CWD... script is probably not being executed inside the repo"
  exit 1
fi

JAESVE_LATEST=$(git ls-remote --tags git://github.com/bazaah/jaesve.git \
  | sort -r -t '/' -k 3 -V \
  | awk '{print $2}' \
  | grep -E '[0-9]$' \
  | head -n1 \
  | awk -F '/' '{print $NF}'
)
PKG_LATEST=$(grep -oP "(\d+\.)+\d+(-[\d\w\.\-]+)?" ./PKGBUILD)

echo "Latest jaesve tag: $JAESVE_LATEST, Latest PKG version: $PKG_LATEST, comparing..."

LATEST=$(echo ${JAESVE_LATEST},${PKG_LATEST} | tr , "\n" | sort -rV | head -n1)

echo "Using $LATEST as the latest version"

if [ "$PKG_LATEST" = "$LATEST"  ]; then
  (
    echo "No change in version, Incrementing PKG release..."
    current=$(grep -oP "pkgrel\s*=\s*(\d+)" ./PKGBUILD | grep -oP "\d+")
    next=$current
    let "next++"

    for file in $(find . -maxdepth 1 -type f -name 'PKGBUILD' -or -name '.SRCINFO'); do
      sed -i -E "s/(pkgrel\s*=\s*).*/\1$next/" $file
    done

    git commit --all --message "$LATEST release $current => $next"
  )
else
  (
    echo "Version changed, updating PKG version & setting PKG release to 1..."

    for file in $(find . -maxdepth 1 -type f -name 'PKGBUILD' -or -name '.SRCINFO'); do
      sed -i -E "s/(pkgver\s*=\s*).*/\1${LATEST}/" ./PKGBUILD
      sed -i -E "s/(pkgrel\s*=\s*).*/\11/" ./PKGBUILD
    done

    git commit --all --message "$LATEST"
  )
fi

git diff --color --minimal --unified=0  @^ | cat

echo "AUR PKG update successful, repo is ready to be pushed"

