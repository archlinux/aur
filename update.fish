#!/usr/bin/env fish
# Check upstream for a new release and bump the AUR package.

set -l repo Ataraxy-Labs/weave
set -l pkgbuild (status dirname)/PKGBUILD
set -l srcinfo  (status dirname)/.SRCINFO

cd (status dirname); or exit 1

# 1) Check GitHub for the latest release tag.
set -l latest (curl -fsSL "https://api.github.com/repos/$repo/releases/latest" \
    | string match -rg '"tag_name":\s*"v?([^"]+)"')

if test -z "$latest"
    echo "Failed to fetch latest release from $repo" >&2
    exit 1
end

set -l current (string match -rg '^pkgver=(.+)$' < $pkgbuild)

echo "Current: $current"
echo "Latest:  $latest"

if test "$current" = "$latest"
    echo "Already up to date."
    exit 0
end

# 2) Download tarball and compute sha256.
set -l tarball "weave-merge-$latest.tar.gz"
set -l url "https://github.com/$repo/archive/refs/tags/v$latest.tar.gz"

echo "Downloading $url"
curl -fsSL -o $tarball $url; or begin
    echo "Download failed" >&2
    exit 1
end

set -l sha (sha256sum $tarball | string split ' ')[1]
echo "sha256: $sha"

# 3) Update PKGBUILD (bump pkgver, reset pkgrel, replace checksum).
sed -i \
    -e "s/^pkgver=.*/pkgver=$latest/" \
    -e "s/^pkgrel=.*/pkgrel=1/" \
    -e "s/^sha256sums=.*/sha256sums=('$sha')/" \
    $pkgbuild

# 4) Run makepkg to verify the build.
makepkg -f; or begin
    echo "makepkg failed" >&2
    exit 1
end

# 5) Check for binaries upstream builds that we don't package.
#    weave-certify is an internal batch verifier, intentionally not shipped.
set -l ignored weave-certify
set -l packaged (string match -rag 'target/release/([^"\s]+)' < $pkgbuild)
set -l unpackaged
for bin in (find src/weave-$latest/target/release -maxdepth 1 -type f -executable -printf '%f\n')
    contains -- $bin $packaged $ignored; or set -a unpackaged $bin
end

if test (count $unpackaged) -gt 0
    echo "New binaries not in PKGBUILD: $unpackaged" >&2
    echo "Add them to package() (or to the ignore list here), then commit manually." >&2
    makepkg --printsrcinfo > $srcinfo
    exit 1
end

# 6) Regenerate .SRCINFO.
makepkg --printsrcinfo > $srcinfo

# 7) Commit the bump.
git add PKGBUILD .SRCINFO
git commit -m "weave-merge $latest"

echo "Bumped to $latest."
