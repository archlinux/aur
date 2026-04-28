#!/bin/sh
set -eu

die() {
    printf '%s\n' "error: $*" >&2
    exit 1
}

need_file() {
    [ -f "$1" ] || die "missing required file: $1"
}

fetch_url() {
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$1"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -O - "$1"
    else
        die "curl or wget is required"
    fi
}

download_to() {
    url=$1
    output=$2

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL -o "$output" "$url"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -O "$output" "$url"
    else
        die "curl or wget is required"
    fi
}

sha256_file() {
    file=$1

    if command -v sha256sum >/dev/null 2>&1; then
        sha256sum "$file" | awk '{ print $1 }'
    elif command -v shasum >/dev/null 2>&1; then
        shasum -a 256 "$file" | awk '{ print $1 }'
    elif command -v openssl >/dev/null 2>&1; then
        openssl dgst -sha256 -r "$file" | awk '{ print $1 }'
    else
        die "sha256sum, shasum, or openssl is required"
    fi
}

need_file PKGBUILD
need_file .SRCINFO
need_file zen-adblocker.desktop

repo_url=$(sed -n 's/^url=["'\'']\([^"'\'']*\)["'\'']$/\1/p' PKGBUILD)
[ -n "$repo_url" ] || die "could not read GitHub URL from PKGBUILD"
repo_url=${repo_url%/}

repo_path=${repo_url#https://github.com/}
repo_path=${repo_path#http://github.com/}
repo_path=${repo_path%.git}
[ "$repo_path" != "$repo_url" ] || die "PKGBUILD url must be a GitHub repository URL"

current_version=$(sed -n 's/^pkgver=["'\'']\([^"'\'']*\)["'\'']$/\1/p' PKGBUILD)
[ -n "$current_version" ] || die "could not read pkgver from PKGBUILD"

release_json=$(fetch_url "https://api.github.com/repos/$repo_path/releases/latest")
tag=$(printf '%s\n' "$release_json" | sed -n 's/.*"tag_name"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | awk 'NR == 1 { print; exit }')
[ -n "$tag" ] || die "could not read latest release tag from GitHub"

version=${tag#v}
[ -n "$version" ] || die "latest release tag is empty"

tmpdir=$(mktemp -d "${TMPDIR:-/tmp}/zen-aur-update.XXXXXX")
trap 'rm -rf "$tmpdir"' EXIT HUP INT TERM

archive_url="$repo_url/releases/download/$tag/Zen_linux_amd64_noselfupdate.tar.gz"
icon_url="$repo_url/blob/$tag/assets/appicon.png?raw=true"
license_url="$repo_url/blob/$tag/LICENSE?raw=true"

printf 'Updating from %s to %s\n' "$current_version" "$version"

download_to "$archive_url" "$tmpdir/Zen_linux_amd64_noselfupdate.tar.gz"
download_to "$icon_url" "$tmpdir/appicon.png"
download_to "$license_url" "$tmpdir/LICENSE"
cp zen-adblocker.desktop "$tmpdir/zen-adblocker.desktop"

archive_hash=$(sha256_file "$tmpdir/Zen_linux_amd64_noselfupdate.tar.gz")
desktop_hash=$(sha256_file "$tmpdir/zen-adblocker.desktop")
icon_hash=$(sha256_file "$tmpdir/appicon.png")
license_hash=$(sha256_file "$tmpdir/LICENSE")

awk \
    -v version="$version" \
    -v repo_url="$repo_url" \
    -v archive_hash="$archive_hash" \
    -v desktop_hash="$desktop_hash" \
    -v icon_hash="$icon_hash" \
    -v license_hash="$license_hash" \
    -v sq="'" '
    BEGIN {
        skip_source = 0
        skip_hashes = 0
    }
    skip_source {
        if ($0 ~ /\)/) {
            skip_source = 0
        }
        next
    }
    skip_hashes {
        if ($0 ~ /\)/) {
            skip_hashes = 0
        }
        next
    }
    /^pkgver=/ {
        print "pkgver=\"" version "\""
        next
    }
    /^url=/ {
        print "url=\"" repo_url "\""
        next
    }
    /^source=\(/ {
        print "source=(\"Zen_linux_amd64_${pkgver}.tar.gz::" repo_url "/releases/download/v${pkgver}/Zen_linux_amd64_noselfupdate.tar.gz\""
        print "        \"${appname}.desktop\""
        print "        \"appicon.png::" repo_url "/blob/v${pkgver}/assets/appicon.png?raw=true\""
        print "        \"LICENSE::" repo_url "/blob/v${pkgver}/LICENSE?raw=true\")"
        skip_source = 1
        next
    }
    /^sha256sums=\(/ {
        print "sha256sums=(" sq archive_hash sq
        print "            " sq desktop_hash sq
        print "            " sq icon_hash sq
        print "            " sq license_hash sq ")"
        skip_hashes = 1
        next
    }
    {
        print
    }
' PKGBUILD > "$tmpdir/PKGBUILD"

awk \
    -v version="$version" \
    -v repo_url="$repo_url" \
    -v archive_hash="$archive_hash" \
    -v desktop_hash="$desktop_hash" \
    -v icon_hash="$icon_hash" \
    -v license_hash="$license_hash" '
    /^[[:space:]]*pkgver = / {
        print "\tpkgver = " version
        next
    }
    /^[[:space:]]*url = / {
        print "\turl = " repo_url
        next
    }
    /^[[:space:]]*source = Zen_linux_amd64_/ {
        print "\tsource = Zen_linux_amd64_" version ".tar.gz::" repo_url "/releases/download/v" version "/Zen_linux_amd64_noselfupdate.tar.gz"
        next
    }
    /^[[:space:]]*source = appicon\.png::/ {
        print "\tsource = appicon.png::" repo_url "/blob/v" version "/assets/appicon.png?raw=true"
        next
    }
    /^[[:space:]]*source = LICENSE::/ {
        print "\tsource = LICENSE::" repo_url "/blob/v" version "/LICENSE?raw=true"
        next
    }
    /^[[:space:]]*sha256sums = / {
        hash_count++
        if (hash_count == 1) {
            print "\tsha256sums = " archive_hash
        } else if (hash_count == 2) {
            print "\tsha256sums = " desktop_hash
        } else if (hash_count == 3) {
            print "\tsha256sums = " icon_hash
        } else if (hash_count == 4) {
            print "\tsha256sums = " license_hash
        } else {
            print
        }
        next
    }
    {
        print
    }
' .SRCINFO > "$tmpdir/.SRCINFO"

mv "$tmpdir/PKGBUILD" PKGBUILD
mv "$tmpdir/.SRCINFO" .SRCINFO
mv "$tmpdir/appicon.png" appicon.png
mv "$tmpdir/LICENSE" LICENSE

printf 'Updated PKGBUILD and .SRCINFO for %s\n' "$version"
