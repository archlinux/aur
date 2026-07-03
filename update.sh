#!/bin/bash
# Update linux-lts515 to a new kernel point-release.
#
# Usage: ./update.sh <new-pkgver>   (e.g. ./update.sh 5.15.210)
#
# What this does, and why:
# - kernel.org sometimes has the git tag (so nvchecker reports an update)
#   before the release tarball is actually published; this script downloads
#   for real via makepkg -do to tell the two apart.
# - updpkgsums must NOT be used here: this PKGBUILD's sha256sums array has
#   bespoke logic (see the "fail if upstream's .config changes" block) that
#   swaps in sha256sums_pentium4/i686/i486 only when the *main* config's
#   checksum matches a hardcoded literal duplicated in two places. A blind
#   updpkgsums run doesn't know about that and would desync it. Checksums
#   are computed by hand with sha256sum instead.
# - config/config.i686/config.i486/config.pentium4 need to be reconciled
#   against the new kernel version with `make olddefconfig`, run inside each
#   architecture's real archbuild chroot (not the host) so the toolchain
#   (gcc/binutils) versions embedded in the config, and any Kconfig option
#   whose availability depends on toolchain capability, match what will
#   actually build the package.
#
# The script edits PKGBUILD/.SRCINFO/config* in place and leaves the diff
# for review. It does not build the package and it never runs git commit.

set -uo pipefail

NEWVER="${1:?Usage: $0 <new-pkgver>}"
cd "$(dirname "$0")" || exit 1

OLDVER=$(grep '^pkgver=' PKGBUILD | cut -f2 -d=)
if [ "$OLDVER" = "$NEWVER" ]; then
  echo "Already at $NEWVER, nothing to do."
  exit 0
fi

echo "=== Bumping pkgver: $OLDVER -> $NEWVER ==="
sed -i "s/^pkgver=.*/pkgver=$NEWVER/" PKGBUILD

echo "=== Downloading new sources (checksum will still say old version, that's expected) ==="
makepkg -do --skippgpcheck
# don't fail the script here: the checksum check is expected to fail until we update it below

TARBALL="linux-${NEWVER}.tar.xz"
if [ ! -s "$TARBALL" ]; then
  echo "ERROR: $TARBALL was not downloaded (likely a real 404 - kernel.org hasn't published it yet)."
  echo "Reverting pkgver bump."
  sed -i "s/^pkgver=.*/pkgver=$OLDVER/" PKGBUILD
  rm -f "$TARBALL" "linux-${NEWVER}.tar.sign"
  exit 1
fi

NEWSUM=$(sha256sum "$TARBALL" | cut -d' ' -f1)
OLDSUM=$(grep "^sha256sums=(" PKGBUILD | grep -oE '[0-9a-f]{64}')
echo "=== Updating main tarball checksum: $OLDSUM -> $NEWSUM ==="
sed -i "0,/^sha256sums=('[0-9a-f]*'/s//sha256sums=('$NEWSUM'/" PKGBUILD

echo "=== Reconciling configs against $NEWVER in each arch's chroot (make olddefconfig) ==="
declare -A ARCH_CONFIG=(
  [x86_64]=config
  [i686]=config.i686
  [i486]=config.i486
  [pentium4]=config.pentium4
)
user="$(id -un)"

for arch in x86_64 i686 i486 pentium4; do
  echo "--- $arch ---"
  sudo "extra-${arch}-build" -- -- --nobuild --skippgpcheck
  builtsrc="/var/lib/archbuild/extra-${arch}/${user}/build/linux-lts515/src/linux-${NEWVER}/.config"
  if [ ! -f "$builtsrc" ]; then
    echo "ERROR: expected reconciled config not found at $builtsrc"
    exit 1
  fi
  cfgfile="${ARCH_CONFIG[$arch]}"
  sudo cp "$builtsrc" "${cfgfile}.new"
  sudo chown "$(id -un):$(id -gn)" "${cfgfile}.new"
  echo "--- diff for $cfgfile ---"
  diff -u "$cfgfile" "${cfgfile}.new"
  mv "${cfgfile}.new" "$cfgfile"
done

# clean up leftover build/log artifacts from the --nobuild runs
rm -f ./*-prepare.log PKGBUILD-namcap.log "linux-${NEWVER}.tar.xz" "linux-${NEWVER}.tar.sign"
rm -rf ./src

echo "=== Updating config checksums in PKGBUILD ==="
OLDCFGSUM=$(grep -F 'sha256sums[${i}]' PKGBUILD | grep -oE '[0-9a-f]{64}')
NEWCFGSUM=$(sha256sum config | cut -d' ' -f1)
echo "config: $OLDCFGSUM -> $NEWCFGSUM"
sed -i "s/${OLDCFGSUM}/${NEWCFGSUM}/g" PKGBUILD   # replaces both occurrences (main array + literal check)

NEWSUM_I686=$(sha256sum config.i686 | cut -d' ' -f1)
NEWSUM_I486=$(sha256sum config.i486 | cut -d' ' -f1)
NEWSUM_P4=$(sha256sum config.pentium4 | cut -d' ' -f1)
sed -i "s/sha256sums_pentium4=('[0-9a-f]*')/sha256sums_pentium4=('${NEWSUM_P4}')/" PKGBUILD
sed -i "s/sha256sums_i686=('[0-9a-f]*')/sha256sums_i686=('${NEWSUM_I686}')/" PKGBUILD
sed -i "s/sha256sums_i486=('[0-9a-f]*')/sha256sums_i486=('${NEWSUM_I486}')/" PKGBUILD

echo "=== Regenerating .SRCINFO ==="
makepkg --printsrcinfo > .SRCINFO

echo "=== Done. Review with: git diff -- PKGBUILD .SRCINFO config config.i686 config.i486 config.pentium4 ==="
echo "=== Then test-build each arch: sudo extra-<arch>-build ==="
