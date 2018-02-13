#!/bin/sh
# Script to get the correct sha256sum of
# GitHub's released .tar.gz

VERSION=0.5

DOWNLOAD_SRC="https://github.com/pentix/qjournalctl/archive/v$VERSION.tar.gz"
ORIGINAL_PATH="/path/to/src/qjournalctl"
TMP_DIR="/tmp"
SHA256SUMS=$(mktemp)


# Collect SHA256 sums of files in git
cd $ORIGINAL_PATH
git ls-tree -r master --name-only | xargs sha256sum > $SHA256SUMS

# Download release version
cd $TMP_DIR
wget $DOWNLOAD_SRC > /dev/null 2>&1

# Extract...
tar xzf v$VERSION.tar.gz
cd qjournalctl-$VERSION

# ...and compare the sums
sha256sum --check < $SHA256SUMS

if [ $? -eq 0 ]
then
  HASH=$(sha256sum $TMP_DIR/v$VERSION.tar.gz)
  echo -e "\n\n[OK] $HASH"
  rm "$TMP_DIR/v$VERSION.tar.gz"
else
  echo -e "\n\n[ERROR] Problems verifying the .tar.gz contents"
  echo -e "\n\n[WARN] Did not delete $TMP_DIR/v$VERSION.tar.gz"
  exit 1
fi

